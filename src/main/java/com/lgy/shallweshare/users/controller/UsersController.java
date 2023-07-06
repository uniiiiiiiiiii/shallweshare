package com.lgy.shallweshare.users.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lgy.shallweshare.users.dto.KakaoDTO;
import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.service.UsersService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/users")
public class UsersController {

	@Autowired
	private UsersService usersService;

	@Autowired
	private HttpSession session;

	@RequestMapping("main")
	public String home() {
		return "main";
	}

	// 로그인 페이지로 이동
	@RequestMapping("/userSignIn")
	public String login() {
		log.info("@# userSignIn");
		return "users/userSignIn";
	}

//		일반 로그인 (아이디 비밀번호 중복검사)
	@RequestMapping("/userSignIn_yn")
	public String login_yn(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@# userSignIn_yn");
		ArrayList<UsersDto> dtos = usersService.signIn(param);
		HttpSession session = request.getSession();

		if (dtos.isEmpty()) {
			return "redirect:userSignIn";

		} else {
			if (param.get("u_pwd").equals(dtos.get(0).getU_pwd())) {
				session.setAttribute("u_id", dtos.get(0).getU_id());
				session.setAttribute("u_sns_id", param.get("u_sns_id"));

				return "redirect:../shop/list";

			} else {
				return "/userSignIn";
			}
		}
	}

//		마이페이지
	@RequestMapping("/mypage")
	public String myPage(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		HttpSession session = request.getSession();
		param.put("u_id", String.valueOf(session.getAttribute("u_id")));
		ArrayList<UsersDto> dtos = usersService.userSearch(param);
		model.addAttribute("usersInfo", dtos);
		return "/users/mypage";
	}

//		로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		log.info("@#logout session" + session);
		usersService.logout(session);
		return "redirect:/users/main";
	}

//	    일반 회원가입 페이지로 이동
	@RequestMapping("/userSignUp")
	public String register() {
		log.info("@# userSignUp");
		return "/users/userSignUp";
	}

//		일반 회원가입 로직
	@RequestMapping("/signUpOk")
	public String registerOk(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@# signUpOk");
		usersService.signUp(param);
//			return "redirect:/users/main";
//			return "/users/main";
		log.info("@#회원가입 로직 Referer" + request.getHeader("Referer"));
		return "redirect:/users/userSignIn";
	}

//		아이디 중복 체크
	@RequestMapping("/idChk")
	public @ResponseBody String idChk(@RequestParam("u_sns_id") String u_sns_id) {
		log.info("@# idChk 1");

		String result = "Y";
		int flag = usersService.idChk(u_sns_id);

		if (flag == 1) {
			result = "N";
		}
		log.info("@# idChk 2");
		return result;
	}

	

//		일반 유저 탈퇴
	@RequestMapping("/userDel")
	public String userDel(HttpServletRequest request, @RequestParam HashMap<String, String> param) {
		HttpSession session = request.getSession();
		param.put("u_id", String.valueOf(session.getAttribute("u_id")));
		usersService.logout(session);
		usersService.userDel(param);
		return "redirect:/users/main";
	}

	// 카카오 로그인
//		토큰값을 넣어서 유저정보 확인: 회원가입 되어있으면 로그인 성공 페이지 / 가입 X면 추가 회원가입 페이지
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model,
			HttpServletRequest request) throws Exception {
		System.out.println("code:" + code);
		String access_Token = usersService.getAccessToken(code);
		log.info(access_Token);

//	        유저 정보 받아와서 가입까지 
		KakaoDTO userInfo = usersService.getUserInfo(access_Token);
		log.info("@@@@@@@@@@카카오 로그인@@@@@@@@@@@userInfo" + userInfo);

//	        폰번호 x: 처음 가입 => u_id를 가지고 추가 가입 페이지로 이동
		if (userInfo.getU_phoneNum() == null) {
			model.addAttribute("u_id", userInfo.getU_id());
			return "/users/kakaoSignUp";

		} else {
			session.invalidate();
			session.setAttribute("u_id", userInfo.getU_id());
			session.setAttribute("access_Token", access_Token);
			return "redirect:../shop/list";
		}
	}

	@RequestMapping("/kakaoSignUp")
	public String kakaoSignUp() {
		log.info("@# kakaoSignUp");
		return "/users/kakaoSignUpOk";
	}

//		카카오 추가 회원가입
	@RequestMapping(value = "/kakaoSignUpOk")
	public String kakaoregisterOk(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@# kakaoSignUpOk");
		usersService.kakaoSignUp(param);
		return "redirect:/users/userSignIn";
	}

	// 수정 페이지
	@RequestMapping("/kakaoUserModify_go")
	public String kakaoUserModify_go(HttpServletRequest request, @RequestParam HashMap<String, String> param,
			Model model) {
		HttpSession session = request.getSession();
		String u_id = String.valueOf(session.getAttribute("u_id"));
		if (u_id != null) {
			param.put("u_id", u_id);
			ArrayList<KakaoDTO> dtos = usersService.kakaoUserSearch(param);
			model.addAttribute("usersInfo", dtos);
		}
		return "mypage/userModify";
	}

//		회원 정보 수정 메소드
	@RequestMapping("/kakaoUserModify")
	public String kakaoUserModify(HttpServletRequest request, @RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# kakaoUserModify");
		HttpSession session = request.getSession();
		String u_id = String.valueOf(session.getAttribute("u_id"));
		if (u_id != null) {
			param.put("u_id", u_id);
			ArrayList<KakaoDTO> dtos = usersService.kakaoUserSearch(param);
			log.info("@# kakaoUserModify-kakaoUserSearch-" + param);
			model.addAttribute("usersInfo", dtos);
			log.info("@# kakaoUserModify-addAttribute");
			usersService.kakaoUserModify(param);
		}
		return "redirect:mypage/userModify";
	}

//		카카오 로그아웃
	@RequestMapping(value = "/kakaologout")
	public String kakaologout(HttpSession session) {
		usersService.kakaologout((String) session.getAttribute("access_Token"));
		session.invalidate();
		return "redirect:/users/main";
	}

//		카카오 회원 탈퇴 (연결 끊기)
	@RequestMapping(value = "/kakaounlink")
	public String unlink(HttpSession session, HashMap<String, String> param) {
		param.put("u_id", String.valueOf(session.getAttribute("u_id")));
		usersService.kakaounlink((String) session.getAttribute("access_Token"), param);
		System.out.println("kakaounlink@@@@@@@@@@===>" + ((String) session.getAttribute("access_Token")));
		usersService.userDel(param);
		session.invalidate();
		return "redirect:/users/main";

	}

}

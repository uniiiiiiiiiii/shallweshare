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
				session.setAttribute("u_nickname", dtos.get(0).getU_nickname());
				session.setAttribute("u_sns_id", param.get("u_sns_id"));
				
				return "redirect:../shop/list";

			} else {
				return "/userSignIn";
			}
		}
	}

//		로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		log.info("@#logout session" + session);
		usersService.logout(session);
		return "redirect:/shop/list";
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
	@RequestMapping("idChk")
	public @ResponseBody int idChk(@RequestParam("u_sns_id") String u_sns_id) {
		return usersService.idChk(u_sns_id);
	}
	
//	닉네임 중복 체크
	@RequestMapping("nickChk")
	public @ResponseBody int nickChk(@RequestParam("u_nickname") String u_nickname){
		return usersService.nickChk(u_nickname);
	}
	
////	회원수정에서 닉네임 중복 체크
//	@RequestMapping("nickModifyChk")
//	public @ResponseBody int nickModifyChk(HttpServletRequest request, @RequestParam HashMap<String, String> param){
//		HttpSession session = request.getSession();
//		param.put("u_id", String.valueOf(session.getAttribute("u_id")));
//		return usersService.nickModifyChk(param);
//	}
	
//		일반 유저 탈퇴
	@RequestMapping("/userDel")
	public String userDel(HttpServletRequest request, @RequestParam HashMap<String, String> param) {
		HttpSession session = request.getSession();
		param.put("u_id", String.valueOf(session.getAttribute("u_id")));
		usersService.logout(session);
		usersService.userDel(param);
		return "redirect:/shop/list";
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
			session.setAttribute("u_nickname", userInfo.getU_nickname());
			session.setAttribute("access_Token", access_Token);
			return "redirect:../shop/list";
		}
	}

//		카카오 추가 회원가입
	@RequestMapping(value = "/kakaoSignUpOk")
	public String kakaoregisterOk(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		log.info("@# kakaoSignUpOk");
		usersService.kakaoSignUp(param);
		return "redirect:/users/userSignIn";
	}

//		카카오 로그아웃
	@RequestMapping(value = "/kakaologout")
	public String kakaologout(HttpSession session) {
		usersService.kakaologout((String) session.getAttribute("access_Token"));
		session.invalidate();
		return "redirect:/shop/list";
	}

//		카카오 회원 탈퇴 (연결 끊기)
	@RequestMapping(value = "/kakaounlink")
	public String unlink(HttpSession session, HashMap<String, String> param) {
		param.put("u_id", String.valueOf(session.getAttribute("u_id")));
		usersService.kakaounlink((String) session.getAttribute("access_Token"), param);
		System.out.println("kakaounlink@@@@@@@@@@===>" + ((String) session.getAttribute("access_Token")));
		usersService.userDel(param);
		session.invalidate();
		return "redirect:/shop/list";
	}

}

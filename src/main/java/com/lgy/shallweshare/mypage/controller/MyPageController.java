package com.lgy.shallweshare.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.shallweshare.admin.dto.ReportDto;
import com.lgy.shallweshare.mypage.dto.ApplicationPartyDto;
import com.lgy.shallweshare.mypage.service.MyPageService;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.service.PartyService;
import com.lgy.shallweshare.review.dto.ReviewDto;
import com.lgy.shallweshare.users.dto.KakaoDTO;
import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.service.UsersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("mypage")
public class MyPageController {
	@Autowired
	private MyPageService mService;

	@Autowired
	private UsersService usersService;

	@Autowired
	private PartyService partyService;

	/** u_id 넣는 메소드 **/
	private void paramPutU_id(HttpServletRequest request, HashMap<String, String> param) {
		HttpSession session = request.getSession();
		String u_id = String.valueOf(session.getAttribute("u_id"));
		param.put("u_id", u_id);
	}

	@RequestMapping("/")
	public String main() {
		return "redirect:userModify";
	}

//	=============== 회원 정보 수정 페이지 ===============
	@RequestMapping("/userModify")
	public String kakaoUserModify_go(HttpServletRequest request, @RequestParam HashMap<String, String> param,
			Model model) {
		if (request.getSession().getAttribute("u_id") != null) {
			paramPutU_id(request, param);
			if (param.get("access_token") != null) {
				ArrayList<KakaoDTO> dtos = usersService.kakaoUserSearch(param);
				model.addAttribute("usersInfo", dtos);
			} else {
				UsersDto dtos = usersService.getUserInfo(Integer.parseInt(param.get("u_id")));
				model.addAttribute("usersInfo", dtos);
			}

		}
		return "mypage/userModify";
	}

//	=============== 회원 정보 수정 메소드 ===============
	@RequestMapping("/userModify_process")
	public String userModify(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: userModify");
		if (request.getSession().getAttribute("u_id") != null) {
			paramPutU_id(request, param);
			UsersDto user = usersService.getUserInfo(Integer.parseInt(param.get("u_id")));
			model.addAttribute("usersInfo", user);
			if (user.getU_login_platform().equals("KAKAO")) {
				usersService.kakaoUserModify(param);
			} else {
				usersService.userModify(param);
			}
		}
		return "redirect:userModify";
	}

//	=============== 내 파티 보기 ===============
	@RequestMapping("my_partyList")
	public String my_partyList(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		if (request.getSession().getAttribute("u_id") != null) {
			log.info("@# Controller: my_partyList");
			paramPutU_id(request, param);
			
			ArrayList<PartyDto> myPartyList = mService.getMyPartyList(param);
			model.addAttribute("myPartyList", myPartyList);

			ArrayList<ApplicationPartyDto> myApplicationList = mService.getMyApplicationList(param);
			model.addAttribute("myApplicationList", myApplicationList);
		}
		return "mypage/my_partyList";
	}

//	=============== 내 신고내역 보기 ===============
	@RequestMapping("my_reportList")
	public String my_reportList(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: my_reportList");
		if (request.getSession().getAttribute("u_id") != null) {
			paramPutU_id(request, param);
			ArrayList<ReportDto> myReportList = mService.getMyReportList(param);
			model.addAttribute("myReportList", myReportList);
		}
		return "mypage/my_reportList";
	}

//	=============== 회원 탈퇴 페이지===============
	@RequestMapping("withdrawal")
	public String withdrawal(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: withdrawal");
		if (request.getSession().getAttribute("u_id") != null) {
			paramPutU_id(request, param);

			// 유저 정보 가져오기
			UsersDto user = usersService.getUserInfo(Integer.parseInt(param.get("u_id").toString()));
			model.addAttribute("user", user);

		}
		return "mypage/withdrawal";
	}

//	=============== 회원 탈퇴 메소드 ===============
	@RequestMapping("withdrawal_process")
	public String withdrawal_process(HttpServletRequest request, @RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# Controller: withdrawal_process");
		if (request.getSession().getAttribute("u_id") != null) {
			paramPutU_id(request, param);
			HttpSession session = request.getSession();
			UsersDto user = usersService.getUserInfo(Integer.parseInt(param.get("u_id").toString()));

			if (user.getU_login_platform().equals("KAKAO")) {
				usersService.kakaounlink((String) session.getAttribute("access_Token"), param);
			}
			usersService.userDel(param);
			session.invalidate();

		}
		return "redirect:../shop/list";
	}

//	=============== 작성 가능한 리뷰 ===============
	@RequestMapping("writable-reviews")
	public String writable_reviews(HttpServletRequest request, @RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# Controller: writable-reviews");
		if (request.getSession().getAttribute("u_id") != null) {
			paramPutU_id(request, param);
			ArrayList<ApplicationPartyDto> writableList = mService.getWritableApplicationList(param);
			model.addAttribute("writableApplicationList", writableList);
		}
		return "mypage/writable-reviews";

	}

//	=============== 작성한 리뷰 ===============
	@RequestMapping("written-reviews")
	public String written_reviews(HttpServletRequest request, @RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# Controller: written-reviews");
		if (request.getSession().getAttribute("u_id") != null) {
			paramPutU_id(request, param);
			
			ArrayList<ReviewDto> writtenReviewList = mService.getWrittenReviewList(param);
			model.addAttribute("written", writtenReviewList);

			ArrayList<PartyDto> partyInfo = new ArrayList<PartyDto>();
			for (int i = 0; i < writtenReviewList.size(); i++) {
				partyInfo.add(partyService.getPartyInfo(writtenReviewList.get(i).getP_id()));
			}

			model.addAttribute("partyInfo", partyInfo);
		}
		return "mypage/written-reviews";

	}

}

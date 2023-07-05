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
	private UsersService uService;
	
	@Autowired
	private PartyService partyService;

//	=============== 내 파티 보기 ===============
	@RequestMapping("my_partyList")
	public String my_partyList(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: ");
		log.info("@# Controller: my_partyList");

		ArrayList<PartyDto> myPartyList = mService.getMyPartyList(param);
		model.addAttribute("myPartyList", myPartyList);

		ArrayList<ApplicationPartyDto> myApplicationList = mService.getMyApplicationList(param);
		model.addAttribute("myApplicationList", myApplicationList);

		return "mypage/my_partyList";
	}

//	=============== 회원 정보 수정 페이지===============
	@RequestMapping("edit_profile")
	public String edit_profile(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: edit_profile");
		if (!param.get("u_id").equals(null)) {
			UsersDto user = uService.getUserInfo(Integer.parseInt(param.get("u_id").toString()));
			model.addAttribute("user", user);
		}
		return "mypage/edit_profile";
	}

//	=============== 게시글 수정 메소드===============
	@RequestMapping("edit_profileProcess")
	public String edit_profileProcess(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: edit_profileProcess");
		uService.editProfile(param);
		return "redirect:edit_profile?u_id=" + param.get("u_id");
	}

//	=============== 내 신고내역 보기 ===============
	@RequestMapping("my_reportList")
	public String my_reportList(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: my_reportList");

		ArrayList<ReportDto> myReportList = mService.getMyReportList(param);
		model.addAttribute("myReportList", myReportList);
		return "mypage/my_reportList";
	}

//	=============== 회원 탈퇴 페이지===============
	@RequestMapping("withdrawal")
	public String withdrawal(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: withdrawal");
		if (!param.get("u_id").equals(null)) {
			// 유저 정보 가져오기
			UsersDto user = uService.getUserInfo(Integer.parseInt(param.get("u_id").toString()));
			model.addAttribute("user", user);
		}
		return "mypage/withdrawal";
	}

//	=============== 회원 탈퇴 진행===============
	@RequestMapping("withdrawal_process")
	public String withdrawal_process(HttpServletRequest request, @RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# Controller: withdrawal_process");
		if (!param.get("u_id").equals(null)) {
			mService.withdrawal_process(param);

			// 세션 지우기
			HttpSession session = request.getSession();
			session.invalidate();
		}
		return "redirect:../shop/list";
	}
	
//	=============== 작성 가능한 리뷰 ===============
	@RequestMapping("writable-reviews")
	public String writable_reviews( @RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# Controller: writable-reviews");
		
		ArrayList<ApplicationPartyDto> writableList = mService.getWritableApplicationList(param);
		model.addAttribute("writableApplicationList",writableList);
		return "mypage/writable-reviews";
		
	}
	
//	=============== 작성한 리뷰 ===============
	@RequestMapping("written-reviews")
	public String written_reviews( @RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# Controller: written-reviews");
		
		ArrayList<ReviewDto> writtenReviewList = mService.getWrittenReviewList(param);
		model.addAttribute("written",writtenReviewList);
		
		ArrayList<PartyDto> partyInfo = new ArrayList<PartyDto>();
		for (int i = 0; i < writtenReviewList.size(); i++) {
			partyInfo.add(partyService.getPartyInfo(writtenReviewList.get(i).getP_id()));
		}
		
		model.addAttribute("partyInfo",partyInfo);
		return "mypage/written-reviews";
		
	}
}

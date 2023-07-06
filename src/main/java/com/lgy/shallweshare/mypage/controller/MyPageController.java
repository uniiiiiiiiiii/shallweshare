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
	private void paramPutU_id(HttpServletRequest request,HashMap<String, String> param) {
		HttpSession session = request.getSession();
		String u_id = String.valueOf(session.getAttribute("u_id"));
		param.put("u_id",u_id);
	}
	
//	=============== 내 파티 보기 ===============
	@RequestMapping("my_partyList")
	public String my_partyList(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: my_partyList");
		paramPutU_id(request, param);
		ArrayList<PartyDto> myPartyList = mService.getMyPartyList(param);
		model.addAttribute("myPartyList", myPartyList);

		ArrayList<ApplicationPartyDto> myApplicationList = mService.getMyApplicationList(param);
		model.addAttribute("myApplicationList", myApplicationList);

		return "mypage/my_partyList";
	}

	// 회원 수정 페이지 
		@RequestMapping("/userModify_page")
		public String userModify_page(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
			log.info("@# Controller: edit_profile");
			paramPutU_id(request, param);
			ArrayList<UsersDto> dtos = usersService.userSearch(param);
			log.info(""+ dtos);
			model.addAttribute("usersInfo", dtos);

			return "mypage/userModify";
		}
//			일반 회원정보 수정
		@RequestMapping("/userModify")
		public String userModify(HttpServletRequest request, @RequestParam HashMap<String, String> param) {
			paramPutU_id(request, param);
			ArrayList<UsersDto> dtos = usersService.userSearch(param);
			usersService.userModify(param);

			return "redirect:/mypage/userModify_page";
		}
//		카카오 회원 정보 수정
		@RequestMapping("/kakaoUserModify")
		public String kakaoUserModify(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
			log.info("@# kakaoUserModify");
			HttpSession session = request.getSession();
			param.put("u_id",String.valueOf(session.getAttribute("u_id")));
			
			ArrayList<KakaoDTO> dtos = usersService.kakaoUserSearch(param);
			log.info("@# kakaoUserModify-kakaoUserSearch-"+param);
			model.addAttribute("usersInfo", dtos);
			log.info("@# kakaoUserModify-addAttribute");
			usersService.kakaoUserModify(param);
			return "redirect:mypage/kakaoUserModify_page";
		}
	
//	=============== 게시글 수정 메소드===============
	@RequestMapping("edit_profileProcess")
	public String edit_profileProcess(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: edit_profileProcess");
		paramPutU_id(request, param);
		usersService.editProfile(param);
		return "redirect:edit_profile?u_id=" + param.get("u_id");
	}
	

//	=============== 내 신고내역 보기 ===============
	@RequestMapping("my_reportList")
	public String my_reportList(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: my_reportList");
		paramPutU_id(request, param);
		ArrayList<ReportDto> myReportList = mService.getMyReportList(param);
		model.addAttribute("myReportList", myReportList);
		return "mypage/my_reportList";
	}

//	=============== 회원 탈퇴 페이지===============
	@RequestMapping("withdrawal")
	public String withdrawal(HttpServletRequest request,@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: withdrawal");
		paramPutU_id(request, param);
		if (!param.get("u_id").equals(null)) {
			// 유저 정보 가져오기
			UsersDto user = usersService.getUserInfo(Integer.parseInt(param.get("u_id").toString()));
			model.addAttribute("user", user);
		}
		return "mypage/withdrawal";
	}

//	=============== 회원 탈퇴 진행===============
	@RequestMapping("withdrawal_process")
	public String withdrawal_process(HttpServletRequest request, @RequestParam HashMap<String, String> param) {
		log.info("@# Controller: withdrawal_process");
		paramPutU_id(request, param);
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
	public String writable_reviews( HttpServletRequest request,@RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# Controller: writable-reviews");
		paramPutU_id(request, param);
		ArrayList<ApplicationPartyDto> writableList = mService.getWritableApplicationList(param);
		model.addAttribute("writableApplicationList",writableList);
		return "mypage/writable-reviews";
		
	}
	
//	=============== 작성한 리뷰 ===============
	@RequestMapping("written-reviews")
	public String written_reviews( HttpServletRequest request,@RequestParam HashMap<String, String> param,
			Model model) {
		log.info("@# Controller: written-reviews");
		paramPutU_id(request, param);
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

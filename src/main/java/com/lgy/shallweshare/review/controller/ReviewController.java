package com.lgy.shallweshare.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.shallweshare.mypage.service.MyPageService;
import com.lgy.shallweshare.party.controller.PartyController;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.service.PartyService;
import com.lgy.shallweshare.review.dto.Criteria;
import com.lgy.shallweshare.review.dto.PageDTO;
import com.lgy.shallweshare.review.dto.ReviewDto;
import com.lgy.shallweshare.review.service.ReviewService;
import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.service.UsersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private UsersService usersService;

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private PartyService partyService;
	
	/** 리뷰 쓰기 페이지 **/
	@RequestMapping("review/write")
	public String write_view(@RequestParam HashMap<String, String> param,Model model) {
		log.info("@# Controller:review/write");
		int u_id = partyService.getPartyInfo(param).getU_id();
		UsersDto master = usersService.getUserInfo(u_id);
		model.addAttribute("master",master);
		
		PartyDto party = partyService.getPartyInfo(param);
		model.addAttribute("party",party);
		return "review/reviewWrite_view";
	}

	/** 리뷰 쓰기 로직 **/
	@RequestMapping("review/write_process")
	public String write(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		log.info("@# Controller: reviewWrite");
		reviewService.reviewWrite(param);
		myPageService.updateReviewAvailability(param);
		log.info(param.get("review_satisfy"));
		if(param.get("review_satisfy").equals("T")){
			reviewService.updateTemperatureUp(param);
		}else if(param.get("review_satisfy").equals("F")){
			reviewService.updateTemperatureDown(param);
		}
		return "redirect:../mypage/writable-reviews?u_id="+session.getAttribute("u_id");
	}

	/******************* 리뷰 수정 페이지 ***************************/
	@RequestMapping("review/modify")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		ReviewDto dto = reviewService.getReviewInfo(param.get("review_id"));
		model.addAttribute("review", dto);
		
		
		UsersDto master  = usersService.getUserInfo(Integer.parseInt(dto.getReview_u_id()));
		model.addAttribute("master",master);
		PartyDto party = partyService.getPartyInfo(dto.getP_id());
		model.addAttribute("party",party);
		return "review/reviewModifyView";
	}

	/******************* 리뷰 수정 로직 ***************************/
	@RequestMapping("review/modify_process")
	public String modify(@RequestParam HashMap<String, String> param,HttpServletRequest request) {
		log.info("@@@###modify start");
		ReviewDto originalReview =  reviewService.getReviewInfo(param.get("review_id"));
		log.info(originalReview.getReview_satisfy());
		log.info(param.get("review_satisfy"));
		HttpSession session = request.getSession();
		reviewService.reviewModify(param);
		
		if(!originalReview.getReview_satisfy().equals(param.get("review_satisfy"))){
			if(param.get("review_satisfy").equals("T")){
				reviewService.updateTemperatureUp(param);
			}else if(param.get("review_satisfy").equals("F")){
				reviewService.updateTemperatureDown(param);
			}
		}
		return "redirect:../mypage/written-reviews?u_id="+session.getAttribute("u_id");
	}

	/******************* 리뷰 삭제 페이지 ***************************/
	@RequestMapping("review/delete_process")
	public String delete(@RequestParam HashMap<String, String> param,HttpServletRequest request) {
		log.info("@@@###delete");
		HttpSession session = request.getSession();
		reviewService.reviewDelete(param);
		return "redirect:../mypage/written-reviews?u_id="+session.getAttribute("u_id");
	}

	/** 개별 리뷰 페이지 **/
	@RequestMapping("review/review_list")
	public String myReview(@RequestParam HashMap<String, String> param, HttpSession session, Model model) {
		UsersDto usersdto = usersService.getUserInfo(Integer.parseInt(param.get("u_id")));
		model.addAttribute("users", usersdto);
		
		ArrayList<ReviewDto> list = reviewService.getPersonalReviewList(param);
		model.addAttribute("list", list);
		
		return "review/review_list";
	}
	
	@RequestMapping("review/party_list")
	public String reviewview(@RequestParam  HashMap<String, String> param, HttpSession session, Model model) {
		UsersDto usersdto = usersService.getUserInfo(Integer.parseInt(param.get("u_id")));
		model.addAttribute("users", usersdto);
		
		ArrayList<PartyDto> partyList =  new ArrayList<PartyDto>();
		partyList= myPageService.getMyPartyList(param);
		model.addAttribute("party",partyList);
		return "review/party_list";
	}
}

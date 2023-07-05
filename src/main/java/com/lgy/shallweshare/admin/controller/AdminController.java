package com.lgy.shallweshare.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.shallweshare.admin.dto.Criteria;
import com.lgy.shallweshare.admin.dto.PageDTO;
import com.lgy.shallweshare.admin.dto.ReportDto;
import com.lgy.shallweshare.admin.service.AdminService;
import com.lgy.shallweshare.users.dto.UsersDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping("/adUserInfo")
	public String ulist(Criteria cri, Model model) {
		log.info("@# ad_user");
		log.info("@# cri ====>"+cri);

		model.addAttribute("ulist", service.uList(cri));
		int total = service.userTotalCount();
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "admin/adUserInfo";
	}

	@RequestMapping("/adReport")
	public String rlist(Criteria cri, Model model) {
		log.info("@# ad_report");
		
		model.addAttribute("rlist", service.rList(cri));
		int total = service.reportTotalCount();
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "admin/adReport";
	}
	
	@RequestMapping("/modify")
	public String modify(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("@@@@@@####### modify");
		
		service.modify(param);
		log.info(""+param);
//		log.info(param.get("url"));
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:adUserInfo";
//		return "redirect:"+param.get("url");
	}

	@RequestMapping("/searchModify")
	public String searchModify(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@@@@@@####### searchModify");
		
		service.modify(param);
		log.info(""+param);
//		log.info(param.get("url"));
		
		int pageSize = 10; // 페이지당 게시물 수
        int startIndex = (Integer.parseInt(param.get("currentPage")) - 1) * pageSize;
        List<UsersDto> searchResult = service.userSearchResult(param, startIndex, pageSize);

		
		model.addAttribute("searchResult", searchResult);
		model.addAttribute("totalCount", param.get("totalCount"));
		model.addAttribute("totalPages", param.get("totalPages"));
		model.addAttribute("currentPage", param.get("currentPage"));
        model.addAttribute("u_name", param.get("u_name"));
        model.addAttribute("prev", param.get("prev"));
        model.addAttribute("next", param.get("next"));
        model.addAttribute("startPage", param.get("startPage"));
        model.addAttribute("endPage", param.get("endPage"));		
        
		return "admin/searchUserInfo";
//		return "redirect:"+param.get("url");
	}
	
	@RequestMapping("/uSearchList")
	public String uSearchList(@RequestParam HashMap<String, String> param, @RequestParam(value = "page", defaultValue = "1") int page,
            Model model) {
		log.info("usearchList ==> "+param);
		
		int pageSize = 10; // 페이지당 게시물 수
        int totalCount = service.userSearchResultCount(param); // 검색 결과 총 게시물 수

        // 총 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

     // 현재 페이지 범위 검사
        if (page < 1) {
            page = 1;
        } else if (page > totalPages) {
            page = totalPages;
        }
        
     // 페이징 처리에 필요한 시작 인덱스 계산
        int startIndex = (page - 1) * pageSize;

        // 검색 결과 가져오기
        List<UsersDto> searchResult = service.userSearchResult(param, startIndex, pageSize);
        log.info(""+searchResult.size());
        model.addAttribute("searchResult", searchResult);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("u_name", param.get("u_name"));

    	int startPage;//시작페이지: 1, 11
    	int endPage;//끝페이지: 10, 20
    	boolean prev, next;
    	int total = totalCount;
    	
		endPage = (int)(Math.ceil(page / 10.0)) * 10;
//		ex> 3페이지=3/10->0.3 -> 1 * 10 =10(끝페이지)
//		ex> 11페이지=11/10->1.1 -> 2 * 10 =20(끝페이지)
		
		startPage = endPage - 9;
//		ex> 10 - 9 = 1페이지
//		ex> 20 - 9 = 11페이지
		
		int realEnd = (int)(Math.ceil((total*1.0) / 10));
//		ex>total: 70, 현재 페이지: 3 -> endPage: 10 => 70*1.0 / 10 => 7페이지
//		ex>total: 300, 현재 페이지: 3 -> endPage: 10 => 300*1.0 / 10 => 30페이지
		
		if (realEnd <= endPage) {
			endPage=realEnd;
		}
//		ex>7페이지 <= 10페이지 : endPage: 7페이지
//		ex>30페이지 <= 10페이지 : endPage: 10페이지
		
		prev = startPage > 1;
//		1페이지보다 크면 존재 -> 참이고 아님  거짓으로 없음
		
		next = endPage < realEnd;
//		ex>10페이지 < 30페이지
		
		prev = startPage > 1;
//		1페이지보다 크면 존재 -> 참이고 아님  거짓으로 없음
		
		next = endPage < realEnd;		
		
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
		
		return "admin/searchUserInfo";
	}
	
	@RequestMapping("/rSearchList")
	public String rSearchList(@RequestParam HashMap<String, String> param, @RequestParam(value = "page", defaultValue = "1") int page,
			Model model) {
		log.info("rsearchList ==> "+param);
		
		int pageSize = 10; // 페이지당 게시물 수
		int totalCount = service.reportSearchResultCount(param); // 검색 결과 총 게시물 수
		
		// 총 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		
		// 현재 페이지 범위 검사
		if (page < 1) {
			page = 1;
		} else if (page > totalPages) {
			page = totalPages;
		}
		
		// 페이징 처리에 필요한 시작 인덱스 계산
		int startIndex = (page - 1) * pageSize;
		
		// 검색 결과 가져오기
		List<ReportDto> searchResult = service.reportSearchResult(param, startIndex, pageSize);
		
		model.addAttribute("searchResult", searchResult);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		model.addAttribute("report_search", param.get("report_search"));


    	int startPage;//시작페이지: 1, 11
    	int endPage;//끝페이지: 10, 20
    	boolean prev, next;
    	int total = totalCount;
    	
		endPage = (int)(Math.ceil(page / 10.0)) * 10;
//		ex> 3페이지=3/10->0.3 -> 1 * 10 =10(끝페이지)
//		ex> 11페이지=11/10->1.1 -> 2 * 10 =20(끝페이지)
		
		startPage = endPage - 9;
//		ex> 10 - 9 = 1페이지
//		ex> 20 - 9 = 11페이지
		
		int realEnd = (int)(Math.ceil((total*1.0) / 10));
//		ex>total: 70, 현재 페이지: 3 -> endPage: 10 => 70*1.0 / 10 => 7페이지
//		ex>total: 300, 현재 페이지: 3 -> endPage: 10 => 300*1.0 / 10 => 30페이지
		
		if (realEnd <= endPage) {
			endPage=realEnd;
		}
//		ex>7페이지 <= 10페이지 : endPage: 7페이지
//		ex>30페이지 <= 10페이지 : endPage: 10페이지
		
		prev = startPage > 1;
//		1페이지보다 크면 존재 -> 참이고 아님  거짓으로 없음
		
		next = endPage < realEnd;
//		ex>10페이지 < 30페이지
		
		prev = startPage > 1;
//		1페이지보다 크면 존재 -> 참이고 아님  거짓으로 없음
		
		next = endPage < realEnd;		
		
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        
		return "admin/searchReportInfo";
	}
	
	@RequestMapping("/admain")
	public String admain() {
		return "admin/admain";
	}
	
	@RequestMapping("/user_view")
	public String user_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@@@@@@####### user_view");
		
		UsersDto dto = service.user_view(param);
		model.addAttribute("users_view", dto);
		
		return "admin/user_view";
	}

	@RequestMapping("/report_view")
	public String report_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@@@@@@####### report_view");
		
		ReportDto dto = service.report_view(param);
		model.addAttribute("report_view", dto);
		
		return "admin/report_view";
	}
}
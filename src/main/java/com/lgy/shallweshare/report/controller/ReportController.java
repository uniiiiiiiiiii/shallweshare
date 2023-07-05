package com.lgy.shallweshare.report.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.service.PartyService;
import com.lgy.shallweshare.report.service.ReportService;
import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.service.UsersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("report")
public class ReportController {
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private PartyService PartyService;
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/write_process")
	public String write(@RequestParam HashMap<String, String> param,HttpServletRequest request) {
		HttpSession session = request.getSession();
		log.info("@# write");
		
		reportService.reportWrite(param);
		
		return "redirect:../mypage/my_reportList?u_id="+session.getAttribute("u_id");
	}

	@RequestMapping("/write")
	public String write_view(@RequestParam HashMap<String,String> param,Model model) {
		log.info("@# write_view");
		log.info(param.get("report_u_id"));
		if(param.get("p_id")!= null) {
			PartyDto partyDto = PartyService.getPartyInfo(param);
			model.addAttribute("party",partyDto);
		}
		if(param.get("report_u_id")!= null) {
			UsersDto usersDto = usersService.getUserInfo(Integer.parseInt(param.get("report_u_id")));
			model.addAttribute("user",usersDto);
		}
		return "report/reportWriteView";
	}
}

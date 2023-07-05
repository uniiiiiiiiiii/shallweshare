package com.lgy.shallweshare.party.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.shallweshare.party.dto.ApplicationDto;
import com.lgy.shallweshare.party.dto.Criteria;
import com.lgy.shallweshare.party.dto.PageDTO;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.dto.Party_boardUsersDto;
import com.lgy.shallweshare.party.service.PartyService;
import com.lgy.shallweshare.party.service.Party_BoardService;
import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.service.UsersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class partyController {
	@Autowired
	private PartyService pService;
	@Autowired
	private UsersService userService;

	@Autowired
	private Party_BoardService p_boardService;

	@RequestMapping("/shop/party_page")
	public String content_view(HttpServletRequest request, @RequestParam HashMap<String, String> param, Model model) {
		// 임시 로그인 세션
		HttpSession session = request.getSession();
		session.setAttribute("u_id", 100);

		log.info("@# Controller: party_page");
		// 파티 정보 가져오기
		PartyDto party = pService.getPartyInfo(param);
		model.addAttribute("party", party);

		// 파티장 정보 가져오기
		UsersDto master = userService.getUserInfo(party.getU_id());
		model.addAttribute("master", master);

		// 참여자 정보 가져오기
		ArrayList<ApplicationDto> a_list = pService.getParticipantList(param);
		ArrayList<UsersDto> participant_list = new ArrayList<UsersDto>();
		for (int i = 0; i < a_list.size(); i++) {
			participant_list.add(userService.getUserInfo(a_list.get(i).getU_id()));
		}
		model.addAttribute("participant_list", participant_list);

		log.info("@# Controller: party_page ==>" + party);
		model.addAttribute("pageMaker", param);

		return "shop/party_page";
	}

//	=============== 파티 가입 후 페이지 ===============
	@RequestMapping("shop/party_page_joined")
	public String party_page_joined(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: party_page_joined");
		// 파티 정보 가져오기
		PartyDto party = pService.getPartyInfo(param);
		model.addAttribute("party", party);

		// 파티장 정보 가져오기
		UsersDto master = userService.getUserInfo(party.getU_id());
		model.addAttribute("master", master);

		// 참여자 정보 가져오기
		ArrayList<ApplicationDto> a_list = pService.getParticipantList(param);
		ArrayList<UsersDto> participant_list = new ArrayList<UsersDto>();
		for (int i = 0; i < a_list.size(); i++) {
			participant_list.add(userService.getUserInfo(a_list.get(i).getU_id()));
		}
		model.addAttribute("participant_list", participant_list);

		log.info("@# Controller: party_page ==>" + party);

		// 파티 게시판 가져오기
		ArrayList<Party_boardUsersDto> chatList = p_boardService.getChattingList(param);
		model.addAttribute("chatList", chatList);

		return "shop/party_page_joined";
	}

//	=============== 파티 생성 페이지 ===============
	@RequestMapping("shop/party_create")
	public String partyCreate(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: party_create");

		return "shop/party_create";
	}

//	=============== 파티 생성 메소드 ===============
	@RequestMapping("shop/party_createProcess")
	public String partyCreateProcess(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: party_createProcess");
		pService.createParty(param);
		return "redirect:list";
	}
	
//	=============== 파티 삭제 메소드 ===============
	@RequestMapping("shop/party_delete")
	public String party_delete(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("@# delete");
		log.info("@# delete  param=="+param);
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("Amount", cri.getAmount());
		
		pService.party_delete(param);
		
		return "redirect:list";
	}
	
//	=============== 파티 수정 페이지 ===============
	@RequestMapping("shop/party_modify")
	public String party_modify(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("@#@#@#@#@# party_modify");
		PartyDto dto=pService.getPartyInfo(param);
		UsersDto master = userService.getUserInfo(dto.getU_id());
		model.addAttribute("master", master);
		
		model.addAttribute("party", dto);
		
		log.info("party_modify   cri==="+cri.getAmount());
		log.info("party_modify   cri==="+cri.getPageNum());
		model.addAttribute("cri", cri);
		return "shop/party_modify";
	}
	
//	=============== 파티 수정 메소드 ===============	
	@RequestMapping("shop/party_modifyCheck")
	public String party_modifyCheck(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,Model model) {
		log.info("@# modify");
		
		log.info("@# modify cri=="+cri);
		log.info("@# modify param=="+param);
		pService.party_modify(param);
		model.addAttribute("cri", cri);
		
//		return "redirect:party_page";
		return "redirect:list";
	}
	
//	=============== 채팅 입력 메소드 ===============
	@RequestMapping("shop/insertChat")
	public String insertChat(@RequestParam HashMap<String, String> param) {
		log.info("@# Controller: insertChat");
		p_boardService.insertChat(param);
		return "redirect:party_page_joined?p_id=" + param.get("p_id");
	}


//	=============== 리스트 페이징 ===============
	@RequestMapping("shop/list")
	public String party_list(@RequestParam HashMap<String, String> param,HttpServletResponse response,Criteria cri, Model model
							,RedirectAttributes rttr,HttpSession session) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		
		log.info("@@@@@@####### list");
		log.info("@# cri ====>"+cri);
		
		model.addAttribute("getParty_list", pService.getParty_list(cri));
		int total = pService.getTotalCount();
		log.info("@# total ====>"+total);
		
//		rttr.addAttribute("user", dto);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "shop/list";
	}
	
	@RequestMapping("shop/listNetflix")
	public String party_listNetflix(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listNetflix");
		log.info("@# cri ====>"+cri);
		
		
		model.addAttribute("getParty_list", pService.getParty_listNetflix(cri));
		int total = pService.getNetflixCount();
		log.info("@# total ====>"+total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "shop/listNetflix";
	}
	
	@RequestMapping("shop/listWavve")
	public String party_listWavve(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listWavve");
		log.info("@# cri ====>"+cri);
		
		
		model.addAttribute("getParty_list", pService.getParty_listWavve(cri));
		int total = pService.getWavveCount();
		log.info("@# total ====>"+total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "shop/listWavve";
	}
	
	@RequestMapping("shop/listTving")
	public String party_listtving(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listTving");
		log.info("@# cri ====>"+cri);
		model.addAttribute("getParty_list", pService.getParty_listTving(cri));
		int total = pService.getTivingCount();
		log.info("@# total ====>"+total);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "shop/listTving";
	}
	
	@RequestMapping("shop/listDisney")
	public String party_listDisney(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listDisney");
		log.info("@# cri ====>"+cri);
		model.addAttribute("getParty_list", pService.getParty_listDisney(cri));
		int total = pService.getDisneyCount();
		log.info("@# total ====>"+total);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "shop/listDisney";
	}
	
	@RequestMapping("shop/listWatcha")
	public String party_listWatcha(HttpServletResponse response,Criteria cri, Model model) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies
		log.info("@@@@@@####### listWatcha");
		log.info("@# cri ====>"+cri);
		model.addAttribute("getParty_list", pService.getParty_listWatcha(cri));
		int total = pService.getWatchaCount();
		log.info("@# total ====>"+total);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "shop/listWatcha";
	}
	

}

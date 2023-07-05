package com.lgy.shallweshare.party.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.party.dto.ApplicationDto;
import com.lgy.shallweshare.party.dto.Criteria;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.dto.Party_boardDto;

public interface PartyDao {
	public PartyDto getPartyInfo(HashMap<String, String> param);
	public PartyDto getPartyInfo(String p_id);
	public ArrayList<Party_boardDto> getParty_board(HashMap<String,String> param);
	public void application_process(HashMap<String, String> param);
	public ArrayList<ApplicationDto> getParticipantList(HashMap<String, String> param); 	
	public void createParty(HashMap<String, String> param);
	
	
	public ArrayList<PartyDto> getParty_list();
	public ArrayList<PartyDto> getParty_listNetfliex();
	public ArrayList<PartyDto> getParty_listWavve();
	public ArrayList<PartyDto> getParty_listTving();
	public ArrayList<PartyDto> getParty_listDisney();
	public ArrayList<PartyDto> getParty_listWatcha();

	
//	Criteria 객체를 이용해서 페이징 처리
	public ArrayList<PartyDto> listWithPaging(Criteria cri);
	public ArrayList<PartyDto> netflixPaging(Criteria cri);
	public ArrayList<PartyDto> wavvePaging(Criteria cri);
	public ArrayList<PartyDto> tvingPaging(Criteria cri);
	public ArrayList<PartyDto> disneyPaging(Criteria cri);
	public ArrayList<PartyDto> watchaPaging(Criteria cri);
	public int getTotalCount();
	public int getNetflixCount();
	public int getWavveCount();
	public int getTivingCount();
	public int getDisneyCount();
	public int getWatchaCount();
	
	
	public PartyDto content_view(HashMap<String, String> param);
	public void party_delete(HashMap<String, String> param);
	public void party_modify(HashMap<String, String> param);
}

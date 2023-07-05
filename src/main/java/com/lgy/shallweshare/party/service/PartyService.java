package com.lgy.shallweshare.party.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.party.dto.ApplicationDto;
import com.lgy.shallweshare.party.dto.Criteria;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.dto.Party_boardDto;

public interface PartyService {
	public PartyDto getPartyInfo(HashMap<String, String> param);
	public PartyDto getPartyInfo(String p_id);
	public ArrayList<Party_boardDto> getParty_board(HashMap<String, String> param);
	public void application_process(HashMap<String, String> param);
	public ArrayList<ApplicationDto> getParticipantList(HashMap<String, String> param);
	public void createParty(HashMap<String, String> param);


	//리스트
	public ArrayList<PartyDto> getParty_list();
	public ArrayList<PartyDto> getParty_listNetflix();
	public ArrayList<PartyDto> getParty_listWavve();
	public ArrayList<PartyDto> getParty_listTving();
	public ArrayList<PartyDto> getParty_listDisney();
	public ArrayList<PartyDto> getParty_listWatcha();
	//페이징
	public ArrayList<PartyDto> getParty_list(Criteria cri);
	public ArrayList<PartyDto> getParty_listNetflix(Criteria cri);
	public ArrayList<PartyDto> getParty_listWavve(Criteria cri);
	public ArrayList<PartyDto> getParty_listTving(Criteria cri);
	public ArrayList<PartyDto> getParty_listDisney(Criteria cri);
	public ArrayList<PartyDto> getParty_listWatcha(Criteria cri);
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

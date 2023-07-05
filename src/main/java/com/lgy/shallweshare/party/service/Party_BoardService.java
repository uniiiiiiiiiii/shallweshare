package com.lgy.shallweshare.party.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.party.dto.Party_boardUsersDto;

public interface Party_BoardService {
	public ArrayList<Party_boardUsersDto> getChattingList(HashMap<String, String> param);
	public void insertChat(HashMap<String, String> param);
}

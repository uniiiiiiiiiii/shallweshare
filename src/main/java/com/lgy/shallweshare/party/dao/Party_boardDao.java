package com.lgy.shallweshare.party.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.party.dto.Party_boardUsersDto;

/*
 * 파티 게시글 Dao
 */
public interface Party_boardDao {
	public ArrayList<Party_boardUsersDto> getChattingList(HashMap<String, String> param);
	public void insertChat(HashMap<String, String> param);
}

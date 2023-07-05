package com.lgy.shallweshare.party.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.party.dao.Party_boardDao;
import com.lgy.shallweshare.party.dto.Party_boardUsersDto;

@Service("Party_BoardService")
public class Party_BoardServiceImpl implements Party_BoardService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<Party_boardUsersDto> getChattingList(HashMap<String, String> param) {
		Party_boardDao dao = sqlSession.getMapper(Party_boardDao.class);
		ArrayList<Party_boardUsersDto> chatList = dao.getChattingList(param);
		return chatList;
	}
	@Override
	public void insertChat(HashMap<String, String> param) {
		Party_boardDao dao = sqlSession.getMapper(Party_boardDao.class);
		dao.insertChat(param);
	}
}

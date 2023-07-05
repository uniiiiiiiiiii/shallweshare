package com.lgy.shallweshare.users.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.users.dao.UsersDao;
import com.lgy.shallweshare.users.dto.UsersDto;

import lombok.extern.slf4j.Slf4j;
@Service("UsersService")
@Slf4j
public class UsersServiceImpl implements UsersService{

	@Autowired
	private SqlSession sqlSession;
	
//	=============== 유저 정보 받아오기(개인) ===============
	@Override
	public UsersDto getUserInfo(int u_id) {
		log.info("@# Service: getUserInfo");
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		UsersDto user = dao.getUserInfo(u_id);
		
		return user;
	}

	@Override
	public void editProfile(HashMap<String, String> param) {
		log.info("@# Service: editProfile");
		UsersDao dao  = sqlSession.getMapper(UsersDao.class);
		dao.editProfile(param);
	}
}

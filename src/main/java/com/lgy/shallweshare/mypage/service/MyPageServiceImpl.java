package com.lgy.shallweshare.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.admin.dto.ReportDto;
import com.lgy.shallweshare.mypage.dao.MyPageDao;
import com.lgy.shallweshare.mypage.dto.ApplicationPartyDto;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.review.dto.ReviewDto;

import lombok.extern.slf4j.Slf4j;

@Service("MyPageService")
@Slf4j
public class MyPageServiceImpl implements MyPageService {
	@Autowired
    private	SqlSession sqlSession;
	
	@Override
	public ArrayList<PartyDto> getMyPartyList(HashMap<String, String> param) {
		log.info("@# Service: getMyPartyList");
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.getMyPartyList(param);
	}

	@Override
	public ArrayList<ApplicationPartyDto> getMyApplicationList(HashMap<String, String> param) {
		log.info("@# Service: getMyApplicationList");
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.getMyApplicationList(param);
	}
	
	@Override
	public ArrayList<ReportDto> getMyReportList(HashMap<String, String> param) {
		log.info("@# Service: getMyApplicationList");
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.getMyReportList(param);
	}
	
	@Override
	public ArrayList<ApplicationPartyDto> getWritableApplicationList(HashMap<String, String> param) {
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.getWritableApplicationList(param);
	}
	@Override
	public ArrayList<ReviewDto> getWrittenReviewList(HashMap<String, String> param) {
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		return dao.getWrittenReviewList(param);
	}
	@Override
	public void updateReviewAvailability(HashMap<String, String> param) {
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);	
		dao.updateReviewAvailability(param);
	}
	@Override
	public void withdrawal_process(HashMap<String, String> param) {
		log.info("@# Service: withdrawal_process");
		MyPageDao dao = sqlSession.getMapper(MyPageDao.class);
		dao.withdrawal_process(param);
	}
}

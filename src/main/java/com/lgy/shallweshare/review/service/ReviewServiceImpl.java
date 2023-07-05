package com.lgy.shallweshare.review.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.review.dao.ReviewDao;
import com.lgy.shallweshare.review.dto.Criteria;
import com.lgy.shallweshare.review.dto.ReviewDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reviewWrite(HashMap<String, String> param) {
		log.info("@# ReviewServiceImpl.write() start");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.reviewWrite(param);
		log.info("@# ReviewServiceImpl.write() end");
	}

	@Override
	public ReviewDto getReviewInfo(String review_id) {
		log.info("@# ReviewServiceImpl.contentView() start");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		ReviewDto dto = dao.getReviewInfo(review_id);
		log.info("@# ReviewServiceImpl.contentView() end");
		return dto;
	}

	@Override
	public void reviewModify(HashMap<String, String> param) {
		log.info("@# ReviewServiceImpl.modify() start");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.reviewModify(param);
	}

	@Override
	public void reviewDelete(HashMap<String, String> param) {
		log.info("@# ReviewServiceImpl.delete() start");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.reviewDelete(param);
		log.info("@# ReviewServiceImpl.delete() end");
	}

	@Override
	public ArrayList<ReviewDto> getPersonalReviewList(HashMap<String, String>param) {
		log.info("@# list 시작한다");
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		return dao.getPersonalReviewList(param);
	}
	
	@Override
	public void updateTemperatureDown(HashMap<String, String> param) {
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.updateTemperatureDown(param);
	}
	@Override
	public void updateTemperatureUp(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);
		dao.updateTemperatureUp(param);
	}
}

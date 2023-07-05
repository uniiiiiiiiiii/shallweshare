package com.lgy.shallweshare.report.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.report.dao.ReportDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ReportService")
public class ReportServiceImpl implements ReportService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reportWrite(HashMap<String, String> param) {
		log.info("@# reportServiceImpl.write() start");
		
		ReportDao dao = sqlSession.getMapper(ReportDao.class);
		dao.reportWrite(param);
		
		log.info("@# reportServiceImpl.write() end");
	}
	

}

package com.lgy.shallweshare.report.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.admin.dao.AdminDao;
import com.lgy.shallweshare.report.dto.ReportDto;
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
	
	@Override
	public void reportModify(HashMap<String, String> param) {
		ReportDao dao = sqlSession.getMapper(ReportDao.class);
		dao.reportModify(param);
	}
	
	@Override
	public void reportDelete(HashMap<String, String> param) {
		ReportDao dao = sqlSession.getMapper(ReportDao.class);
		dao.reportDelete(param);
	}
	
	@Override
	public ReportDto report_view(HashMap<String, String> param) {
		ReportDao dao = sqlSession.getMapper(ReportDao.class);
		
		ReportDto dto = dao.report_view(param);
		return dto;
	}
}

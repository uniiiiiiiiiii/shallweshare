package com.lgy.shallweshare.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.admin.dao.AdminDao;
import com.lgy.shallweshare.admin.dto.Criteria;
import com.lgy.shallweshare.admin.dto.ReportDto;
import com.lgy.shallweshare.users.dto.UsersDto;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<UsersDto> uList(Criteria cri) {
		AdminDao dao  = sqlSession.getMapper(AdminDao.class);
		
		return dao.userListPaging(cri);
	}

	@Override
	public ArrayList<ReportDto> rList(Criteria cri) {
		AdminDao dao  = sqlSession.getMapper(AdminDao.class);
//		ArrayList<reportDto> rlist = dao.rList(cri);
		
		return dao.reportListPaging(cri);
	}
	
	public void modify(HashMap<String, String> param) {
		AdminDao dao  = sqlSession.getMapper(AdminDao.class);
		dao.modify(param);
	}

	@Override
	public int userTotalCount() {
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		return dao.userTotalCount();
	}

	@Override
	public int reportTotalCount() {
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		return dao.reportTotalCount();
	}

	@Override
	public UsersDto user_view(HashMap<String, String> param) {
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		
		UsersDto dto = dao.user_view(param);
		return dto;
	}

	@Override
	public ReportDto report_view(HashMap<String, String> param) {
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		
		ReportDto dto = dao.report_view(param);
		return dto;
	}

	@Override
	public int userSearchResultCount(HashMap<String, String> param) {
		   AdminDao dao = sqlSession.getMapper(AdminDao.class);
	       int count = 0;
	       ArrayList<UsersDto> dtolist = dao.uSearchList();
	       for (UsersDto UsersDto : dtolist) {
	            if (UsersDto.getU_name().contains(param.get("u_name")) || UsersDto.getU_nickname().contains(param.get("u_name"))) {
	                count++;
	            }
	        }
	        return count;
	}

	@Override
	public List<UsersDto> userSearchResult(HashMap<String, String> param, int startIndex, int pageSize) {
		 List<UsersDto> result = new ArrayList<UsersDto>();
		 AdminDao dao = sqlSession.getMapper(AdminDao.class);
		 ArrayList<UsersDto> dtolist = dao.uSearchList();
	        int count = 0;

	        for (UsersDto UsersDto : dtolist) {
	            if (UsersDto.getU_name().contains(param.get("u_name")) || UsersDto.getU_name().contains(param.get("u_name"))) {
	                if (count >= startIndex && count < startIndex + pageSize) {
	                    result.add(UsersDto);
	                }
	                count++;
	            }
	        }
	        return result;
	}

	@Override
	public int reportSearchResultCount(HashMap<String, String> param) {
		   AdminDao dao = sqlSession.getMapper(AdminDao.class);
	       int count = 0;
	       ArrayList<ReportDto> dtolist = dao.rSearchList();
	        for (ReportDto reportDto : dtolist) {
	            if (reportDto.getReport_title().contains(param.get("report_search")) || reportDto.getReport_category().contains(param.get("report_search"))) {
	                count++;
	            }
	        }
	        return count;
	}

	@Override
	public List<ReportDto> reportSearchResult(HashMap<String, String> param, int startIndex, int pageSize) {
		 List<ReportDto> result = new ArrayList<ReportDto>();
		 AdminDao dao = sqlSession.getMapper(AdminDao.class);
		 ArrayList<ReportDto> dtolist = dao.rSearchList();
	        int count = 0;

	        for (ReportDto reportDto : dtolist) {
	            if (reportDto.getReport_title().contains(param.get("report_search")) || reportDto.getReport_category().contains(param.get("report_search"))) {
	                if (count >= startIndex && count < startIndex + pageSize) {
	                    result.add(reportDto);
	                }
	                count++;
	            }
	        }
	        return result;
	}
}

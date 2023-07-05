package com.lgy.shallweshare.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.lgy.shallweshare.admin.dto.Criteria;
import com.lgy.shallweshare.admin.dto.ReportDto;
import com.lgy.shallweshare.users.dto.UsersDto;

public interface AdminService {
	public ArrayList<UsersDto> uList(Criteria cri);
	public ArrayList<ReportDto> rList(Criteria cri);
//	public ArrayList<reportDto> rSearchList(HashMap<String, String> param, Criteria cri);
	public void modify(HashMap<String, String> param);
	public UsersDto user_view(HashMap<String, String> param);
	public ReportDto report_view(HashMap<String, String> param);
	public int userSearchResultCount(HashMap<String, String> param);
	public List<UsersDto> userSearchResult(HashMap<String, String> param, int startIndex, int pageSize);
	public int reportSearchResultCount(HashMap<String, String> param);
	public List<ReportDto> reportSearchResult(HashMap<String, String> param, int startIndex, int pageSize);
	public int userTotalCount();
	public int reportTotalCount();
}
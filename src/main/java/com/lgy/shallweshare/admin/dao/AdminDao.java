package com.lgy.shallweshare.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.admin.dto.Criteria;
import com.lgy.shallweshare.admin.dto.ReportDto;
import com.lgy.shallweshare.users.dto.UsersDto;

public interface AdminDao {
	public ArrayList<UsersDto> uList(Criteria cri);
	public ArrayList<UsersDto> uSearchList();
	public ArrayList<ReportDto> rList(Criteria cri);
	public ArrayList<ReportDto> rSearchList();
	public ArrayList<UsersDto> userListPaging(Criteria cri);
	public ArrayList<ReportDto> reportListPaging(Criteria cri);
	public void modify(HashMap<String, String> param);
	public UsersDto user_view(HashMap<String, String> param);
	public ReportDto report_view(HashMap<String, String> param);
	public int userTotalCount();
	public int reportTotalCount();
}

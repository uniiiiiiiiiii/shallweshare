package com.lgy.shallweshare.report.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.report.dto.ReportDto;

public interface ReportDao {
	public void reportWrite(HashMap<String, String> param); //신고 작성
}

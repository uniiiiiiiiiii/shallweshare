package com.lgy.shallweshare.report.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.report.dto.ReportDto;

public interface ReportDao {
	public void reportWrite(HashMap<String, String> param); //신고 작성
	public ReportDto report_view(HashMap<String, String> param);
	public void reportModify(HashMap<String, String> param); //신고수정
	public void reportDelete(HashMap<String, String> param); //신고 삭제
}

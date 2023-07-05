package com.lgy.shallweshare.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.admin.dto.ReportDto;
import com.lgy.shallweshare.mypage.dto.ApplicationPartyDto;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.review.dto.ReviewDto;

public interface MyPageService {

	public ArrayList<PartyDto> getMyPartyList(HashMap<String, String> param);
	public ArrayList<ApplicationPartyDto> getMyApplicationList(HashMap<String, String> param);
	public ArrayList<ReportDto> getMyReportList(HashMap<String, String> param);
	
	public ArrayList<ApplicationPartyDto> getWritableApplicationList(HashMap<String, String> param);
	public void updateReviewAvailability(HashMap<String, String> param);
	public ArrayList<ReviewDto> getWrittenReviewList(HashMap<String, String> param);
	
	public void withdrawal_process(HashMap<String, String> param);
}

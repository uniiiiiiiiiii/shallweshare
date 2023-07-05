package com.lgy.shallweshare.report.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportDto {
	private int report_id; //신고번호
	private int u_id; //신고자
	private int report_u_id; //피신고자
	private int p_id; //신고 파티 번호
	private String report_category; //신고 사유
	private String report_title; //신고 제목
	private String report_content; //자세한 사유
	private Date report_created; //신고 접수일
}


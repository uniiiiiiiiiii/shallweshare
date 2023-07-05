package com.lgy.shallweshare.admin.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportDto {
	private int report_id;
	private int u_id;
	private int report_u_id;
	private int p_id;
	private String report_category;
	private String report_title;
	private String report_content;
	private Date report_created;
}

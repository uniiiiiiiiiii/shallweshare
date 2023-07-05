package com.lgy.shallweshare.review.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {
	private String review_id;
	private String p_id;
	private String u_id;
	private String a_id;
	private String review_satisfy;
	private String review_u_id;
	private String review_content;
	private Date review_created;
}

package com.lgy.shallweshare.review.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewCntDto {
	private int review_id;
	private int p_id;
	private int u_id;
	private String review_satisfy;
	private int review_u_id;
	private String review_content;
	private Date review_created;
	private int reviewCnt;
}

package com.lgy.shallweshare.mypage.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApplicationPartyDto {
	  private int a_id;
	  private int u_id;
	  private int p_id;
	  private String p_title;
	  private int a_price;
	  private String a_created;
	  private String a_payment;
	  private String a_completed;
}

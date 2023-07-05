package com.lgy.shallweshare.party.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApplicationDto {
	  private int a_id;
	  private int u_id;
	  private int p_id;
	  private int a_price;
	  private Date a_created;
	  private String a_payment;
	  private String a_completed;
}

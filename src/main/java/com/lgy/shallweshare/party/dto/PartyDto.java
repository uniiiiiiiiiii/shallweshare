package com.lgy.shallweshare.party.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PartyDto {
	  private int p_id;
	  private int u_id;
	  private String p_title; 
	  private String p_platform;
	  private int p_max; 
	  private Date p_finish_date;
	  private int p_price;
	  private String p_content; 
	  private String p_adult;
	  private String p_platform_id;
	  private String p_platform_password;
	  private String p_adult_password;
	  private Date p_created; 
	  private String p_deleted; 
	  private int memberCount;
}

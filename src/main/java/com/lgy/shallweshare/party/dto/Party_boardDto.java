package com.lgy.shallweshare.party.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Party_boardDto {
	  private int p_board_id;
	  private int p_id;
	  private int u_id;
	  private String p_board_content;
	  private String p_board_created;
}

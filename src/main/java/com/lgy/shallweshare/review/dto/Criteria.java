package com.lgy.shallweshare.review.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Criteria {
private int PageNum;
private int amount;

public Criteria() {
	this(1,3);
}
// test commit
// github desktop
}

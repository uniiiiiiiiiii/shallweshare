package com.lgy.shallweshare.users.service;

import java.util.HashMap;

import com.lgy.shallweshare.users.dto.UsersDto;

public interface UsersService {
	public UsersDto getUserInfo(int u_id);
	public void editProfile(HashMap<String, String> param);
}

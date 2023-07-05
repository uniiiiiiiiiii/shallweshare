package com.lgy.shallweshare.users.dao;

import java.util.HashMap;

import com.lgy.shallweshare.users.dto.UsersDto;

public interface UsersDao {
	public UsersDto getUserInfo(int u_id);
	public void editProfile(HashMap<String, String> param);
}

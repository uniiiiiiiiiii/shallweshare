package com.lgy.shallweshare.users.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.users.dto.KakaoDTO;
import com.lgy.shallweshare.users.dto.UsersDto;

public interface UsersDao {
	public UsersDto getUserInfo(int u_id);
	public void editProfile(HashMap<String, String> param);

	public ArrayList<UsersDto> signIn(HashMap<String, String> param);
//	public void logout(HttpSession session);
//	public void logout(HashMap<String, String> param);
	public void signUp( HashMap<String, String> param);
	public int idChk(String u_sns_id);
    
	public ArrayList<UsersDto> userSearch(HashMap<String, String> param);
    public void userModify(HashMap<String, String> param);
    public void userDel(HashMap<String, String> param);
    
    
//	kakao
	public String getAccessToken(String authorize_code);
	public KakaoDTO getUserInfo(String access_Token);
	public void kakaoSignUp(HashMap<String, String> param);
	
	public ArrayList<KakaoDTO> kakaoUserSearch(HashMap<String, String> param);
	public void kakaoUserModify(HashMap<String, String> param);
	
	public void getAccess_Token(HashMap<String, String> param);
    
}

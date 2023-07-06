package com.lgy.shallweshare.users.kakao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lgy.shallweshare.users.dto.KakaoDTO;

@Repository
public class MemberRepository {
	// mapper를 호출하기 위한 클래스 주입.
		@Autowired
		private SqlSessionTemplate sql;
		
		// 카카오 로그인
		public void kakaoinsert(HashMap<String, Object> userInfo) {
			sql.insert("kakaoInsert",userInfo);
		}

		// 카카오 정보 확인
			public KakaoDTO findkakao(HashMap<String, Object> userInfo) {
			System.out.println("nickname:"+userInfo.get("nickname"));
			System.out.println("email:"+userInfo.get("email"));
			System.out.println("gender:"+userInfo.get("gender"));
			return sql.selectOne("findKakao", userInfo);
		}
		
		
		public ArrayList<KakaoDTO> kakaoUserSelect(HashMap<String, String> param){
			return sql.selectOne("selectKakao", param);
			
		}
		public void kakaoSignUp(HashMap<String, String> param) {
			sql.update("kakaoSignUp", param);
		}
		
		public void kakaoUserModify(HashMap<String, String> param) {
			sql.update("kakaoUserModify",param);
		}

}

if(session_u_id==null){
   	 	alert("로그인이 필요합니다.");
    	history.back();
}else if(session_u_id!=r_u_id){
		alert("해당 유저만 볼 수 있습니다.");
    	history.back();
}
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<% 
	String r_u_id = request.getParameter("u_id");
	String session_u_id = String.valueOf(session.getAttribute("u_id"));
%>
<script>
	if(<%=session_u_id%>==null){
	 	alert("로그인이 필요합니다.");
		history.back();
	}else if(<%=session_u_id%>!=<%=r_u_id%>){
		alert("해당 유저만 볼 수 있습니다.");
		history.back();
	}
</script>
</head>
<body>
<div class="sidebar">
		<ul>
			<li><a href="edit_profile?u_id=<%=session_u_id%>">회원 수정하기</a></li>
			<li><a href="my_partyList?u_id=<%=session_u_id%>">내 파티 보기</a></li>
			<li><a href="my_reportList?u_id=<%=session_u_id%>">내 신고내역</a></li>
			<li><a href="writable-reviews?u_id=<%=session_u_id%>">작성 가능 후기</a></li>
			<li><a href="written-reviews?u_id=<%=session_u_id%>">적은 후기 보기</a></li>
			<li><a href="withdrawal?u_id=<%=session_u_id%>">회원 탈퇴</a></li>
		</ul>
	</div>
</body>
</html>
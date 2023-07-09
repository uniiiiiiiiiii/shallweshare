<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<% 
	String session_u_id = String.valueOf(session.getAttribute("u_id"));
%>
<script>
	if(<%=session_u_id%>==null){
	 	alert("로그인이 필요합니다.");
		history.back();
	}
</script>
</head>
<body>
<div class="sidebar">
		<ul>
			<li><a href="userModify">회원정보수정</a>
			<li><a href="my_partyList">내 파티 보기</a></li>
			<li><a href="my_reportList">내 신고내역</a></li>
			<li><a href="writable-reviews">작성 가능 후기</a></li>
			<li><a href="written-reviews">적은 후기 보기</a></li>
			<li><a href="withdrawal">회원 탈퇴</a></li>
		</ul>
	</div>
</body>
</html>
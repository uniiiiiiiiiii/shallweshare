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
<style>@import'../resources/css/mypage/mypage_table.css'</style>
</head>
<%@include file="../header.jsp"%>

<body>
<!-- 간격 주기 위해서 씀 -->
<div class="tq"></div>
<div class="tq"></div>

	<div class="sidebar">
		<ul>
			<li><a class="mypagelist_a"
				href="userModify?u_id=<%=session_u_id%>">회원 수정하기</a></li>
			
			<li><a class="mypagelist_b"
				href="my_partyList?u_id=<%=session_u_id%>">내 파티 보기</a></li>
			
			<li><a class="mypagelist_c"
				href="my_reportList?u_id=<%=session_u_id%>">내 신고내역</a></li>
		
			<li><a class="mypagelist_d"
				href="writable-reviews?u_id=<%=session_u_id%>">작성 가능 후기</a></li>
		
			<li><a class="mypagelist_e"
				href="written-reviews?u_id=<%=session_u_id%>">적은 후기 보기</a></li>
		
			<li><a class="mypagelist_f"
				href="withdrawal?u_id=<%=session_u_id%>">회원 탈퇴</a></li>
		</ul>
	</div>
<%@include file="../footer.jsp"%>
</body>
</html>
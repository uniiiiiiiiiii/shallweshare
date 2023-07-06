<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 이 페이지에서  u_login_platform에 따라 각 기능들을 분기처리 할 것이다.-->
<!-- 일반/카카오  회원탈퇴, 회원수정, 로그아웃 -->


u_id: ${u_id}

<c:forEach var="info" items="${usersInfo}">
<c:choose>  

	<c:when test="${info.u_login_platform == 'KAKAO'}">
		<a href="/logout">로그아웃</a>
		<a href="/kakaoUserModify_go">회원정보수정</a>
		<a href="#">회원탈퇴</a>
	</c:when>
	
	<c:otherwise>
		<a href="/logout">로그아웃</a>
		<a href="/userModify_go">회원정보수정</a>
		<a href="#">회원탈퇴</a>
	</c:otherwise> 
	
</c:choose>

</c:forEach>








</body>
</html>
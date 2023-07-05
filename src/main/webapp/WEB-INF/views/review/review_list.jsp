<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원닉네임</h3>
	<table width="500" border="1">
		<tr>
			<td>회원 닉네임</td>
			<td>${users.u_nickname}</td>
		</tr>
		<tr>
			<td>회원 아이디</td>
			<td>${users.u_id}</td>
		</tr>
		<tr>
			<td>회원 온도</td>
			<td>${users.u_temperature}</td>
		</tr>
	</table>
	<br/>
	<input type="button" class="moveReview_list" value="작성한 리뷰 보기"
		onclick="location.href = 'review_list?u_id=${users.u_id}'">
	<input type="button" class="movweParty_list" value="가입한 파티 목록 보기"
		onclick="location.href = 'party_list?u_id=${users.u_id}'" />
	<input type="button" value="신고하기"
		onclick="location.href = '../report/write?report_u_id=${users.u_id}'" />
	<br/>
		<table width="500" border="1">
		<h3>받은 후기</h3>
		<c:forEach items="${list}" var="ReviewDto">
			<tr>
				<td width="100">후기번호</td>
				<td>${ReviewDto.review_id}</td>
			</tr>
			<tr>
				<td>작성자 아이디</td>
				<td>${ReviewDto.u_id}</td>
			</tr>
			<tr>
				<td>만족도</td>
				<td>${ReviewDto.review_satisfy}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${ReviewDto.review_content}</td>
			</tr>
			<tr>
				<td>작성시간</td>
				<td>${ReviewDto.review_created}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>

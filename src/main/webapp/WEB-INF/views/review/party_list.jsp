<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<br />
	<input type="button" class="moveReview_list" value="작성한 리뷰 보기"
		onclick="location.href = 'review_list?u_id=${users.u_id}'">
	<input type="button" class="moveParty_list" value="가입한 파티 목록 보기"
		onclick="location.href = 'party_list?u_id=${users.u_id}'" />
	<input type="button" value="신고하기"
		onclick="location.href = '../report/write?report_u_id=${users.u_id}'" />
	<br />
	<h3>만든 파티</h3>
	<c:forEach items="${party}" var="party" varStatus="i">
		<table width="500" border="1">
			<tr>
				<td>파티 번호</td>
				<td>${party.p_id}</td>
			</tr>
			<tr>
				<td>파티 플랫폼</td>
				<td>${party.p_platform}</td>
			</tr>
			<tr>
				<td>파티 제목</td>
				<td><a href="../shop/party_page?p_id=${party.p_id}">${party.p_title}</a></td>
			</tr>
			<tr>
				<td>파티 생성 시간</td>
				<td><fmt:formatDate value="${party.p_created}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td>파티 인원</td>
				<td>${party.p_max}</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>
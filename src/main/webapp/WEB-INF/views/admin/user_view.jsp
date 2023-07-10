<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import '../resources/css/table.css';
</style>
</head>
<script>
function goBack() {
  window.close();
}
</script>
<body>
	<input type="hidden" name="u_id" value="${users_view.u_id}">
		<h3>번호</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_id}</td>
		</tr>
	</table>
		<h3>등급</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_role}</td>
		</tr>
	</table>
		<h3>성별</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_gender}</td>
		</tr>
	</table>
		<h3>닉네임</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_nickname}</td>
		</tr>
	</table>
		<h3>이름</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_name}</td>
		</tr>
	</table>
		<h3>전화번호</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_phoneNum}</td>
		</tr>
	</table>
		<h3>이메일</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_email}</td>
		</tr>
	</table>
		<h3>계좌번호</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_bank_account}</td>
		</tr>
	</table>
		<h3>매너온도</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_temperature}</td>
		</tr>
	</table>
		<h3>로그인 플랫폼</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_login_platform}</td>
		</tr>
	</table>
		<h3>플랫폼 아이디</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_sns_id}</td>
		</tr>
	</table>
		<h3>제재 유무</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_authentication}</td>
		</tr>
	</table>
		<h3>생성일자</h3>
	<table width="500" border="1">
		<tr>
			<td>${users_view.u_created}</td>
		</tr>
		<caption align="bottom">
			<br>
			<input type="button" value="닫 기" onclick="goBack()">
		</caption>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function goBack() {
  window.close();
}
</script>
<body>
	<table width="500" border="1">
			<input type="hidden" name="u_id" value="${users_view.u_id}">
			<tr>
				<td>번호</td>
				<td>${users_view.u_id}</td>
			</tr>
			<tr>
				<td>등급</td>
				<td>${users_view.u_role}</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${users_view.u_gender}</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${users_view.u_nickname}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${users_view.u_name}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${users_view.u_phoneNum}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${users_view.u_email}</td>
			</tr>
			<tr>
				<td>생일</td>
				<td>${users_view.u_birth}</td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<td>${users_view.u_bank_account}</td>
			</tr>
			<tr>
				<td>매너온도</td>
				<td>${users_view.u_temperature}</td>
			</tr>
			<tr>
				<td>로그인 플랫폼</td>
				<td>${users_view.u_login_platform}</td>
			</tr>
			<tr>
				<td>플랫폼 아이디</td>
				<td>${users_view.u_sns_id}</td>
			</tr>
			<tr>
				<td>제재유무</td>
				<td>${users_view.u_authentication}</td>
			</tr>
			<tr>
				<td>생성일자</td>
				<td>${users_view.u_created}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="닫 기" onclick="goBack()">
				</td>
			</tr>
	</table>
</body>
</html>
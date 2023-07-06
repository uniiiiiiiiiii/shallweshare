<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.loginDiv{
		margin: auto;
	}
	
</style>
</head>
<body>
	<div class="loginDiv">
		<h1>로그인 페이지 입니다.</h1>
		<table border="1" align="center">
			<form method="post" action="userSignIn_yn">
				<tr height="30">
					<td width="100">사용자ID</td>
					<td width="100"><input type="text" name="u_sns_id"></td>
				</tr>
				<tr height="30">
					<td width="100">비밀번호</td>
					<td width="100"><input type="password" name="u_pwd"></td>
				</tr>
				<tr height="30">
					<td colspan="2" align="center"><input type="submit"
						value="로그인"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!-- 					controller 에 register 찾아감 -->
						<a href="userSignUp">회원가입</a></td>
				</tr>
			</form>
		</table>
		<div class="wrap">
			<div class="title">카카오 로그인</div>
			<a class="kakao"
				href="https://kauth.kakao.com/oauth/authorize?client_id=97b3eb27ba108e2e3f48aa5cbed11254&redirect_uri=http://localhost:8181/shallweshare/users/kakaoLogin&response_type=code">

				<img
				src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_large_narrow.png"
				style="height: 60px">
			</a>
		</div>
	</div>
</body>
</html>
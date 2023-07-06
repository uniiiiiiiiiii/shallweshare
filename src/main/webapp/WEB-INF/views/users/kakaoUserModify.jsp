<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	 	<script type="text/javascript">
</script> 
</head>
<body>

<table border="1" align="center">
		<form method="post" action="kakaoUserModify" name="regform">
			<tr height="50">
				<td colspan="2">
					<h1>회원수정</h1>
				</td>
			</tr>
			
			<tr height="30">
				<td width="80">이름</td>
				<td>
					<input type="text" size="20" name="u_name" value="${usersInfo.u_name}" required>
				</td>
			</tr>
			<tr height="30">
				<td width="80">닉네임</td>
				<td>
					<input type="text" size="20" name="u_nickname"  value="${usersInfo.u_nickname}" readonly="readonly" required>
				</td>
			</tr>

			<tr height="30">
				<td width="80">폰번호</td>
				<td>
					<input type="text" size="12" name="u_phoneNum" value="${usersInfo.u_phoneNum }" required placeholder="'-'를 제외한 번호만 입력해주세요.">
				</td>
			</tr>
			
			<tr height="30">
				<td width="80">
					성별
				</td>
				<td>
					<input type="text" size="1" name="u_gender" value="${usersInfo.u_gender }" readonly="readonly">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					이메일
				</td>
				<td>
					<input type="text" size="20" name="u_email" value="${usersInfo.u_email }" readonly="readonly">
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					계좌번호
				</td>
				<td>
					<input type="text" size="20" name="u_bank_account" value="${ usersInfo.u_bank_account}">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
<!-- 					<input type="button" onclick="signUpCheck()" value="가입하기"> -->
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</form>
	</table>

</body>
</html>
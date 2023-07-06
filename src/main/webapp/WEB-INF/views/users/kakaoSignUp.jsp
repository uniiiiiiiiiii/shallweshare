<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" align="center">
		<form method="post" action="kakaoSignUpOk" name="regform">
			<tr height="50">
				<td colspan="2">
					<h1>회원가입</h1>
				</td>
			</tr>
			<tr height="30">
				<td width="80">이름</td>
				<td>
					<input type="text" size="20" name="u_name" placeholder="이름을 적어주세요." required>
				</td>
			</tr>


			<tr height="30">
				<td width="80">폰번호</td>
				<td>
					<input type="text" size="12" name="u_phoneNum" required placeholder="'-'를 제외한 번호만 입력해주세요.">
				</td>
			</tr>
			
			
			
			<tr height="30">
				<td width="80">
					계좌번호
				</td>
				<td>
					<input type="text" size="20" name="u_bank_account">
				</td>
			</tr>
			<input type ='hidden' name='u_id' value="${u_id}">
			
			<tr>
				<td colspan="2">
					<input type="submit" value="가입하기">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
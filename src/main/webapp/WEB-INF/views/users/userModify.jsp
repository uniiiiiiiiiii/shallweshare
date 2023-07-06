<%@page import="com.lgy.shallweshare.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShallweShare - 회원가입</title>
<script type="text/javascript">
</script> 
</head>
<body>
	<c:forEach var="info" items="${usersInfo}">
		<table border="1" align="center">
			<form method="post" action="userModify" name="regform">
				<tr height="50">
					<td colspan="2">
						<h1>회원수정</h1>
					</td>
				</tr>
				<tr height="30">
					<td width="80">아이디</td>
					<td><input type="text" size="20" name="u_sns_id"
						value="${info.u_sns_id}" readonly="readonly"></td>
				</tr>

				<tr height="30">
					<td width="80">비밀번호</td>
					<td><input type="password" size="20" name="u_pwd"
						value="${info.u_pwd}" required></td>
				</tr>
				<tr height="30">
					<td width="80">이름</td>
					<td><input type="text" size="20" name="u_name"
						value="${info.u_name}" required></td>
				</tr>
				<tr height="30">
					<td width="80">닉네임</td>
					<td><input type="text" size="20" name="u_nickname"
						value="${info.u_nickname}" required></td>
				</tr>

				<tr height="30">
					<td width="80">폰번호</td>
					<td><input type="text" size="12" name="u_phoneNum" required
						value="${info.u_phoneNum}" placeholder="'-'를 제외한 번호만 입력해주세요.">
					</td>
				</tr>

				<tr height="30">
					<td width="80">성별</td>
					<td><input type="text" size="1" name="u_gender"
						value="${info.u_gender }" readonly="readonly"></td>
				</tr>
				<tr height="30">
					<td width="80">이메일</td>
					<td><input type="text" size="20" name="u_email"
						value="${info.u_email}"></td>
				</tr>
				<tr height="30">
					<td width="80">계좌번호</td>
					<td><input type="text" size="20" name="u_bank_account"
						value="${ info.u_bank_account}"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="수정하기"></td>
				</tr>
			</form>
		</table>
	</c:forEach>
</body>
</html>
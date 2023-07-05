<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lgy.shallweshare.users.dao.UsersDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 탈퇴</h1>
	
	<% 
        String userId = (String) session.getAttribute("userId");
    %>

    <p>정말로 회원 탈퇴하시겠습니까?</p>
    <p>회원 탈퇴 시 모든 데이터가 삭제되며, 복구할 수 없습니다.</p>

    <form action="mypageDeleteProcess.jsp" method="POST">
        <table>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" id="password" name="password"></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" id="passwordConfirm" name="passwordConfirm"></td>
            </tr>
        </table>
        <input type="submit" value="탈퇴">
    </form>
</body>
</html>
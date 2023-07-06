<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String login = request.getParameter("pageChange");
    login= "users/userSignIn.jsp";
    
    String mypage = request.getParameter("pageChange");
    mypage= "users/userSignIn_ok.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>테스트용 메인 페이지 입니다.</h1>
세션에 u_id값이 없으면 로그인 링크가 뜨고
세션에 u_id값이 있으면 마이페이지 링크가 뜹니다.
<br>

<% if(session.getAttribute("u_id") == null){ %>

<%--  <jsp:include page="<%= login %>"></jsp:include> --%>
  <a href="userSignIn">로그인</a>
<% }else{%>
<%--   <jsp:include page="<%= mypage %>"></jsp:include> --%>
  <a href="mypage">마이페이지</a>
  <% }%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div_page ul {
	display: flex;
	list-style: none;
}
</style>
</head>
<body>
<%@ include file="mypageList.jsp" %>
	<h1>작성 가능한 리뷰</h1>
	<table width="500" border="1">
		<tr>
			<td>주문 번호</td>
			<td>파티 제목</td>
			<td>결제 정보</td>
			<td>후기 작성</td>
		</tr>
		<c:forEach items="${writableApplicationList}" var="writable">
			<form method="post" action="../review/write">
			
			<input type="hidden" name="a_id" value="${writable.a_id}"> 
			<input type="hidden" name="p_id" value="${writable.p_id}"> 
			<input type="hidden" name="u_id" value=<%=session.getAttribute("u_id")%>>
			<tr>
				<td>${writable.a_id}</td>
				<td>${writable.p_title}</td>
				<td>${writable.a_payment}<br /> ${writable.a_price}
				</td>
				<td><input type="submit" value="리뷰 작성"></td>
			</tr>
			</form>
		</c:forEach>
	</table>
</body>
</html>
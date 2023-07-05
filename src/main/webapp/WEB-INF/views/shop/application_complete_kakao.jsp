<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>신청 완료~</h1>
	<p>신청 파티: ${party.p_title}</p>
	<p><input type="button" value="파티 상세로 이동" onclick="javascript:window.location='party_page_joined?p_id=${party.p_id}'"></p>
</body>
</html>
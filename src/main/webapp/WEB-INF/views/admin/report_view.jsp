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
	<input type="hidden" name="u_id" value="${report_view.u_id}">
		<h3>신고 번호</h3>
	<table width="500" border="1">
		<tr>
			<td>${report_view.report_id}</td>
		</tr>
	</table>
		<h3>신고자</h3>
	<table width="500" border="1">
		<tr>
			<td>${report_view.u_id}</td>
		</tr>
	</table>
		<h3>피신고자</h3>
	<table width="500" border="1">
		<tr>
			<td>${report_view.report_u_id}</td>
		</tr>
	</table>
		<h3>파티 번호</h3>
	<table width="500" border="1">
		<tr>
			<td>${report_view.p_id}</td>
		</tr>
	</table>
		<h3>신고 사유</h3>
	<table width="500" border="1">
		<tr>
			<td>${report_view.report_category}</td>
		</tr>
	</table>
		<h3>제 목</h3>
	<table width="500" border="1">
		<tr>
			<td>${report_view.report_title}</td>
		</tr>
	</table>
		<h3>내 용</h3>
	<table width="500" border="1">
		<tr>
			<td>${report_view.report_content}</td>
		</tr>
	</table>
		<h3>신고 날짜</h3>
	<table width="500" border="1">
		<tr>
			<td>${report_view.report_created}</td>
		</tr>
	<caption align="bottom">
		<br>
		<input type="button" value="닫 기" onclick="goBack()">
	</caption>
	</table>

</body>
</html>
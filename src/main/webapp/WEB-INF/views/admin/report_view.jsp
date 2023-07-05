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
			<input type="hidden" name="u_id" value="${report_view.u_id}">
			<tr>
				<td>신고번호</td>
				<td>${report_view.report_id}</td>
			</tr>
			<tr>
				<td>신고자</td>
				<td>${report_view.u_id}</td>
			</tr>
			<tr>
				<td>피신고자</td>
				<td>${report_view.report_u_id}</td>
			</tr>
			<tr>
				<td>파티번호</td>
				<td>${report_view.p_id}</td>
			</tr>
			<tr>
				<td>신고사유</td>
				<td>${report_view.report_category}</td>
			</tr>			
			<tr>
				<td>제목</td>
				<td>${report_view.report_title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${report_view.report_content}</td>
			</tr>
			<tr>
				<td>신고날짜</td>
				<td>${report_view.report_created}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="닫 기" onclick="goBack()">
				</td>
			</tr>
	</table>
</body>
</html>
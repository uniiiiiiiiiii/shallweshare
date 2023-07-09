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
			<tr>
				<td>신고번호</td>
				<td>${report.report_id}</td>
			</tr>
			<tr>
				<td>피신고자</td>
				<td>${report.report_u_id}</td>
			</tr>
			<tr>
				<td>파티번호</td>
				<td>${report.p_id}</td>
			</tr>
			<tr>
				<td>신고사유</td>
				<td>${report.report_category}</td>
			</tr>			
			<tr>
				<td>제목</td>
				<td>${report.report_title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${report.report_content}</td>
			</tr>
			<tr>
				<td>신고날짜</td>
				<td>${report.report_created}</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정하기" onclick="javascript: location.href='reportModifyView?report_id=${report.report_id}'">
					<input type="button" value="닫 기" onclick="goBack()">
					<input type="button" value="삭제하기" onclick="deleteCheck()">
				</td>
			</tr>
	</table>
</body>
</html>
<script type="text/javascript">
function deleteCheck() {
	var result = confirm('삭제하시겠습니까? 삭제하면 다시 되돌릴 수 없습니다.');

	if (result) {
		window.location = 'reportDelete?report_id=${report.report_id}';
		alert('삭제되었습니다.');
		window.opener.location.reload();
		window.close();
	} else {
		//no
	}
}
</script>
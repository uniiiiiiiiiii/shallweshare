<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShallWeShare - 내 파티 보기</title>
<style>
#content-container {
	padding: 20px;
}
</style>

</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<section>
		<div class=" d-flex flex-row" id="sidebar-container">
			<%@ include file="mypageList.jsp"%>
			<div id="content-container">
				<h2>내 신고내역</h2>
				<table width="700" border="1">
					<tr>
						<th>신고 번호</th>
						<th>신고 카테고리</th>

						<th>신고 제목</th>
						<th>생성 시간</th>
					</tr>
					<c:forEach items="${myReportList}" var="myReportList" varStatus="i">
						<tr>
							<td>${myReportList.report_id}</td>

							<td>${myReportList.report_category}</a></td>
							<td><a
								href="../report/report_view?report_id=${myReportList.report_id}"
								onclick="window.open(this.href, '_blank', 'width=620, height=950'); return false;">${myReportList.report_title}</a></td>

							<td><fmt:formatDate value="${myReportList.report_created}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>
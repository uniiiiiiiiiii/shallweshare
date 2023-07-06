<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판(관리자)</title>
	<style type="text/css">
		.report_page{
			display: flex;
			list-style: none;
			justify-content: center;
			margin-top: 16px;
			margin-left: 40px;
		}
	</style>
</head>
<body>
	<h1 align="center">신고글 조회</h1>
	<div style="float: right; margin-right: 48">
	<form method="post" action="rSearchList">
		<input name="report_search" type="text" placeholder="제목이나 사유를 입력">&nbsp;&nbsp;
		<input type="submit" value="검색">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">	
	</form>
	</div>
	<br><br>
	<div style="width: 700px; margin: 0 auto;">
	<table width = "700px" border = "1">
		<tr>
			<td>번호</td>
			<td>파티번호</td>
			<td>신고자</td>
			<td>피신고자</td>
			<td>신고사유</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		<c:forEach items="${searchResult}" var = "dto">
			<tr>
				<td>${dto.report_id}</td>
				<td>${dto.p_id}</td>
				<td>${dto.u_id}</td>
				<td>${dto.report_u_id}</td>
				<td>${dto.report_category}</td>
				<td>
					<a href="report_view?report_id=${dto.report_id}" onclick="window.open(this.href, '_blank', 'width=775, height=395'); return false;">${dto.report_title}</a>
				</td>
				<td><fmt:formatDate value="${dto.report_created}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	</table>
	
    <c:if test="${searchResult == null || empty searchResult}">
        <p>검색결과가 없습니다.</p>
    </c:if>
    <div class="report_page">
        <c:choose>
            <c:when test="${totalPages > 1}">
            	<c:if test="${prev}">
						<c:url value="rSearchList" var="pageUrl" >
			<!-- 				시작페이지 -1 하면 이전의 10개 페이지 표시 -->
						<c:param name="report_search" value="${report_search}" />
                        <c:param name="page" value="${startPage-1}" />
						</c:url>
								<a href="${pageUrl}">
									[Prev]
								</a>
						&nbsp;
				</c:if>    
                <c:forEach var="pageNumber" begin="${startPage}" end="${endPage}" step="1">
                    <c:url value="rSearchList" var="pageUrl" >
                        <c:param name="report_search" value="${report_search}" />
                        <c:param name="page" value="${pageNumber}" />
                    </c:url>
                    <a href="${pageUrl}" ${currentPage == pageNumber ? "style='background-color:yellow'":""}>[${pageNumber}]</a>
					&nbsp;
                </c:forEach>
				<c:if test="${next}">
					<c:url value="rSearchList" var="pageUrl" >
							<c:param name="report_search" value="${report_search}" />
		                    <c:param name="page" value="${endPage+1}" />
		<!-- 				끝페이지 +1 하면 이후의 10개 페이지 표시 -->
					</c:url>        					
							<a href="${pageUrl}">
								[Next]
							</a>
				</c:if>
            </c:when>
            <c:otherwise>
                <p>Page 1 of 1</p>
            </c:otherwise>
        </c:choose>
			
    </div>
</body>
</html>
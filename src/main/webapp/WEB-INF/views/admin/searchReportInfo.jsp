<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="../resources/css/admin.css"/>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판(관리자)</title>
</head>
<body>
	<table width = "90%" border = "3" align="center">
		<div style="float: right; margin-right: 48">
			<caption id="cap-top">	
				<form method="post" action="rSearchList">
					<input name="report_search" type="text" placeholder="제목이나 사유를 입력">&nbsp;&nbsp;
					<input type="submit" value="검색">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">	
				</form>
			</caption>
		</div>
		<div style="width: 700px; margin: 0 auto;">
			<tr align="center" class="main-table">
				<td>번호</td>
				<td>파티번호</td>
				<td>신고자</td>
				<td>피신고자</td>
				<td>신고사유</td>
				<td>제목</td>
				<td>날짜</td>
			</tr>
			<c:forEach items="${searchResult}" var = "dto" varStatus="status">
				<tr class="${status.count % 2 == 0 ? 'users-table' : 'odd-row'}">
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
		</div>
    <c:if test="${searchResult == null || empty searchResult}">
        <p>검색결과가 없습니다.</p>
    </c:if>
    <caption id="cap-bottom">
	    <div class="report_page">
		    <ul>
		        <c:choose>
		            <c:when test="${totalPages > 1}">
		            	<c:if test="${prev}">
							<li class="paginate_button">
								<c:url value="rSearchList" var="pageUrl" >
					<!-- 				시작페이지 -1 하면 이전의 10개 페이지 표시 -->
								<c:param name="report_search" value="${report_search}" />
		                        <c:param name="page" value="${startPage-1}" />
								</c:url>
								<a href="${pageUrl}">
									[Prev]
								</a>
								&nbsp;
							</li>
						</c:if>    
		                <c:forEach var="pageNumber" begin="${startPage}" end="${endPage}" step="1">
		                	<li>
			                    <c:url value="rSearchList" var="pageUrl" >
			                        <c:param name="report_search" value="${report_search}" />
			                        <c:param name="page" value="${pageNumber}" />
			                    </c:url>
			                    <a href="${pageUrl}" ${currentPage == pageNumber ? "style='font-weight: 900; font-size: larger; color:#FFC147;'":""}>
			                    	[${pageNumber}]
			                    </a>
		                    </li>
							&nbsp;
		                </c:forEach>
						<c:if test="${next}">
							<li class="paginate_button">
								<c:url value="rSearchList" var="pageUrl" >
										<c:param name="report_search" value="${report_search}" />
					                    <c:param name="page" value="${endPage+1}" />
					<!-- 				끝페이지 +1 하면 이후의 10개 페이지 표시 -->
								</c:url>        					
										<a href="${pageUrl}"> [Next] </a>
							</li>
						</c:if>
		            </c:when>
		            <c:otherwise>
		                <p>Page 1 of 1</p>
		            </c:otherwise>
		        </c:choose>
			</ul>
	    </div>
	</caption>
</table>
</body>
</html>
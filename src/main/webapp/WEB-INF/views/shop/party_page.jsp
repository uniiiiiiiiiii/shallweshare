<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="include/modifyDeleteCheck.jsp"%>
	<table width="500" border="1">
		<form method="post" action="*">
			<input type="submit" value="목록" formaction="list">
			<c:if test="${sessionScope.u_id eq party_u_id}">
				<input type="button" value="삭제" onclick="deleteCheck()">
				<input type="button" value="수정" onclick="modifyCheck()">
			</c:if>
			<input type="button" value="신고하기"
				onclick="javascript:window.location='../report/write?p_id=${party.p_id}'">

			<input type="hidden" name="pageNum" value="${pageMaker.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.amount }">
		<tr>
			<td>파티 번호</td>
			<td>${party.p_id}</td>
		</tr>
		<tr>
			<td>파티장</td>
			<c:choose>
				<c:when test="${master.u_nickname ne null }">
					<td><a href="../review/review_list?u_id=${master.u_id}">${master.u_nickname}</a></td>
				</c:when>
				<c:otherwise>
					<td>탈퇴한 회원</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<c:forEach items="${participant_list}" var="pp_list" varStatus="i">
			<tr>
				<td>참가자 ${i.index}</td>
				<c:choose>
					<c:when test="${empty pp_list.u_nickname }">
						<td>탈퇴한 회원</td>
					</c:when>
					<c:otherwise>
						<td><a href="../review/review_list?u_id=${pp_list.u_id}">${pp_list.u_nickname}</a></td>
					</c:otherwise>

				</c:choose>
			</tr>
		</c:forEach>
		<tr>
			<td>파티 플랫폼</td>
			<td>${party.p_platform}</td>
		</tr>
		<tr>
			<td>파티 기간</td>
			<td>
				<fmt:formatDate value="${party.p_finish_date}" pattern="yyyy.MM.dd. HH:mm" />까지
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${party.p_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="20" cols="60" readonly="readonly">${party.p_content}</textarea>
			</td>
		</tr>
		<c:choose>
			<c:when test="${ fn:length(participant_list)+1 < party.p_max}">
				<input type="button" value="신청하기"
					onclick="javascript:window.location='application?p_id=${party.p_id}'">
			</c:when>

			<c:otherwise>
				<h2>파티 모집이 완료되었습니다.</h2>
			</c:otherwise>
		</c:choose>


		</form>
	</table>
</body>
</html>



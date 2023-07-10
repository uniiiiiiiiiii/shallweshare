<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${party.p_title}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shop/chatRoom.css" />
</head>
<body>
	<%@ include file="include/modifyDeleteCheck.jsp" %>
	<table width="500" border="1">
		<form method="post" action="*" >
		<c:if test="${sessionScope.u_id eq party_u_id}">
		<input type="button" value="삭제" onclick="deleteCheck()">
		<input type="button" value="수정" onclick="modifyCheck()">
		</c:if>
		<input type="button" value="신고하기"
				onclick="javascript:window.location='../report/write?p_id=${party.p_id}'">
		</form>

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
			<td><fmt:formatDate value="${party.p_finish_date}"
					pattern="yyyy-MM-dd" />까지 ${finish_date-toDay}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${party.p_title}</td>
		</tr>
		<tr>
			<td>파티 플랫폼 아이디</td>
			<td>${party.p_platform_id}</td>
		</tr>
		<tr>
			<td>파티 플랫폼 비밀번호</td>
			<td>${party.p_platform_password}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${party.p_content}</td>
		</tr>
	</table>
	
	<br />
	<div id="chatWrap">
		<div id="chatHeader">채팅방</div>
		<div id="chatLog">
			<c:forEach items="${chatList}" var="chats" varStatus="i">
				<c:choose>
					<c:when test="${chats.u_id eq sessionScope.u_id}">
						<div class="myMsg">
							<span class="msg">${chats.p_board_content}</span> <span
								class="msgCreated"> ${chats.p_board_created} </span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="anotherMsg">
						<c:choose>
						<c:when test="${empty chats.u_nickname}">
							<span class="anotherName">탈퇴한 회원</span> 
						</c:when>
						<c:otherwise>
							<span class="anotherName">${chats.u_nickname}</span> 
						</c:otherwise>
						</c:choose>
							<span class="msg">${chats.p_board_content}</span> <span
								class="msgCreated"> ${chats.p_board_created} </span>
						</div>

					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<form id="chatForm" method="post" action="insertChat">
			<input type="hidden" name="p_id" value="${party.p_id}"> <input
				type="hidden" name="u_id" value=<%=session.getAttribute("u_id")%>>
			<input type="text" autocomplete="off" size="30" id="message"
				placeholder="메시지를 입력하세요" name="p_board_content"> <input
				type="submit" value="보내기">
		</form>
	</div>
</body>
</html>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$("#chatLog").scrollTop($("#chatLog")[0].scrollHeight);
</script>
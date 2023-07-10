<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${party.p_max-fn:length(participant_list)}" var="a" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShallweShare - ${party.p_title}</title>
<script src="party_page.js"></script>
<link href="../resources/css/shop/party_page.css" rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shop/chatRoom.css" />

<script>
	$("#chatLog").scrollTop($("#chatLog")[0].scrollHeight);
</script>
</head>
<body>
	<%@ include file="include/modifyDeleteCheck.jsp"%>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<section>
		<div class="width-container">
			<div class="item-row-pTitle">
				<div class="icon">
					<img src="../resources/img/shop/${party.p_platform}Icon.png"
						Icon.png" alt>
				</div>

				<div class="platform-title">
					<span class="text">${party.p_platform}</span>
					<div class="p_title">
						<strong>${party.p_title}</strong>
					</div>
					<!-- end of item-row-pTitle  -->
				</div>
			</div>
			<div class="item-row-master">
				<div style="display: inline-block;">
					<strong>파티장 </strong>
				</div>
				<div class="masterIcon">
					<img src="../resources/img/shop/userIcon.png" alt>
				</div>
				<c:choose>
					<c:when test="${master.u_nickname ne null }">
						<span><a id="userLink"
							href="../review/review_list?u_id=${master.u_id}">${master.u_nickname}</a></span>
					</c:when>
					<c:otherwise>
						<span>탈퇴한 회원</span>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- end of item row master  -->
			<div class="item-row-pid">
				<span><strong>파티번호 </strong>${party.p_id}</span>
			</div>
			<!-- end of item-row-pid  -->
			<div class="item-row-pmax">
				<span><strong>파티인원 </strong>${fn:length(participant_list)}/${party.p_max}</span>
			</div>
			<!-- end of item-row-pid  -->
			<div class="item-row-pid">
				<span><strong>파티기간 </strong> <fmt:formatDate
						value="${party.p_finish_date}" pattern="yyyy-MM-dd" /> 까지</span>
			</div>
			<!-- end of item row pid  -->
			<div class="item-row-id">
				<span><strong>플랫폼 ID </strong>${party.p_platform_id}</span>
			</div>
			<!-- end of item-row-pid  -->
			<div class="item-row-pwd">
				<span><strong>플랫폼 PW </strong>${party.p_platform_password}</span>
			</div>
			<!-- end of item-row-pid  -->
			<div class="item-row-participant-list">
				<c:choose>
					<c:when test="${fn:length(participant_list) eq 0}">
						<h2 class="position-absolute top-50 start-50 translate-middle">가입한
							인원이 없습니다.</h2>
					</c:when>
					<c:otherwise>
						<ul>
							<c:forEach items="${participant_list}" var="pp_list"
								varStatus="i">
								<li>
									<div class="picture">
										<img src="../resources/img/shop/userIcon.png">
									</div> <c:choose>
										<c:when test="${empty pp_list.u_nickname }">
											<div>

												<span>탈퇴한 회원</span>
											</div>
										</c:when>
										<c:otherwise>
											<div>
												<span><a id="userLink"
													href="../review/review_list?u_id=${pp_list.u_id}">
														${pp_list.u_nickname} </a></span>
											</div>
										</c:otherwise>

									</c:choose>
								</li>
							</c:forEach>
							<%
								for (int i = 0; i < Integer.parseInt(pageContext.getAttribute("a").toString()); i++) {
							%>
							<li>
								<div class="picture">
									<img src="../resources/img/shop/emptyUserIcon.png">
								</div>
								<div>

									<span>모집 대기중</span>
								</div>
							</li>
							<%
								}
							%>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- end of participant-list   -->
			<div class="item-row-pContent ">
				<div>${party.p_content}</div>
			</div>
			<!-- end of pContent  -->
			<!--            	채팅방              -->
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
			<!-- end of chat-wrap  -->

			<div class="item-row-application-button ">


				<input type="button" value="목록" onclick="history.back()"
					class="btn btn-light">
				<c:if test="${sessionScope.u_id eq party.u_id}">
					<input type="button" value="삭제" onclick="deleteCheck()"
						class="btn btn-light">
					<input type="button" value="수정" onclick="modifyCheck()"
						class="btn btn-light">
				</c:if>


			</div>
			<!-- item-row-application-button  -->
		</div>
		<!-- end of width-container  -->
	</section>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>
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
<link href="../resources/css/shop/party_page.css" rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />
<body>
	<%@ include file="include/modifyDeleteCheck.jsp"%>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<section>
		<div class="justify-content-center">

			<div class="item-row-pTitle">
				<div class="icon">
					<img src="../resources/img/shop/netflixIcon.png" alt>
				</div>
				<div class="platform-title">
					<span class="text">${party.p_platform}</span>
					<div class="p_title">
						<strong>${party.p_title}</strong>
					</div>
				</div>
			</div>
			<div class="item-row-master">
				<div class="masterIcon">
					<img src="../resources/img/shop/userIcon.png" alt>
				</div>
				<c:choose>
					<c:when test="${master.u_nickname ne null }">
						<span><a href="../review/review_list?u_id=${master.u_id}">${master.u_nickname}</a></span>
					</c:when>
					<c:otherwise>
						<span>탈퇴한 회원</span>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="item-row-pid">
				<span>${party.p_id}</span>
			</div>
			<div class="item-row-finishDate">
				<span><fmt:formatDate value="${party.p_finish_date}"
						pattern="yyyy.MM.dd. HH:mm" />까지</span>
			</div>
			<div class="item-row-participant-list">

				<ul>
					<c:forEach items="${participant_list}" var="pp_list" varStatus="i">
						<li class>
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
										<span><a
											href="../review/review_list?u_id=${pp_list.u_id}">
												${pp_list.u_nickname} </a></span>
									</div>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="item-row-pContent">
				<div>${party.p_content}</div>
			</div>
			<div class="item-row-application-button">
				<form method="post" action="*">
					<c:choose>
						<c:when test="${ fn:length(participant_list)+1 < party.p_max}">
							<c:if test="${sessionScope.u_id ne party_u_id}">
								<input type="button" value="신청하기"
									onclick="javascript:window.location='application?p_id=${party.p_id}'">
							</c:if>
						</c:when>

						<c:otherwise>
							<span>파티 모집이 완료되었습니다.</span>
							<br />
						</c:otherwise>
					</c:choose>

					<input type="hidden" name="pageNum" value="${pageMaker.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.amount }">
					<input type="button" value="목록" formaction="list">
					<c:if test="${sessionScope.u_id eq party_u_id}">
						<input type="button" value="삭제" onclick="deleteCheck()">
						<input type="button" value="수정" onclick="modifyCheck()">
					</c:if>
					<input type="button" value="신고하기"
						onclick="javascript:window.location='../report/write?p_id=${party.p_id}'">
				</form>



			</div>
		</div>
	</section>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>



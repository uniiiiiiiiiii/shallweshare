<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/shop/shop_list.css" />
</head>
<body>
	<table border="1" class="head">
		<tr>
			<td colspan="3"><a href="list">shallweshare</a></td>
			<td>
				<!-- 				<a href="party_create" class="">파티만들기</a> --> <input
				type="button" class="makeParty" value="파티만들기" onclick="loginCheck()">
			</td>
			<c:choose>
				<c:when test="${sessionScope.u_id eq null }">
					<td><a href="../users/userSignIn">로그인</a></td>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${sessionScope.access_Token eq null }">
							<td><a href="../users/logout">로그아웃</a></td>
						</c:when>
						<c:otherwise>
							<td><a href="../users/kakaologout">로그아웃</a></td>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td><a href="listNetflix"> <img
					src="../resources/img/NETFLIX.png">
			</a></td>
			<td><a href="listWavve"> <img
					src="../resources/img/wavve.png">
			</a></td>
			<td><a href="listTving"> <img
					src="../resources/img/TVING.jpg">
			</a></td>
			<td><a href="listDisney"> <img
					src="../resources/img/DISNEY.jpg">
			</a></td>
			<td><a href="listWatcha"> <img
					src="../resources/img/WATCHA.jpg">
			</a></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>파티 번호</td>
			<td>파티장</td>
			<td>파티 인원</td>
			<td>파티 끝나는 기간</td>
			<td>파티 금액</td>
			<td>공유 플랫폼</td>
			<td>성인인증 유무</td>
			<td>제목</td>
			<td>파티 만든 시간</td>
		</tr>
		<c:forEach var="getParty_list" items="${getParty_list }">
			<tr>
				<td>${getParty_list.p_id }</td>
				<td>${getParty_list.u_id }</td>
				<td>${getParty_list.p_max }</td>
				<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm"
						value="${getParty_list.p_finish_date }" /></td>
				<td>${getParty_list.p_price }</td>
				<td>${getParty_list.p_platform }</td>
				<td>${getParty_list.p_adult }</td>
				<td><a class="move_link" href="${getParty_list.p_id}">${getParty_list.p_title }</a>
				</td>
				<td><fmt:formatDate pattern="yyyy.MM.dd. HH:mm"
						value="${getParty_list.p_created }" /></td>
			</tr>
		</c:forEach>
	</table>

	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
					<!-- 					시작페이지 - 1 하면 이전의 10개 페이지 표시 --> <!-- 				ex>11->10(1~10), 21->20(11~20) -->
					<a href="${pageMaker.startPage - 1}"> [Previous] </a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<%-- 				<li>${num}</li> --%>
				<%-- 				<li ${pageMaker.cri.pageNum == num ? "style='color:red'":""} > --%>
				<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
				<li class="paginate_button"
					${pageMaker.cri.pageNum == num ? "style='background-color:yellow'":""}>
					<!-- 					클릭한 현재페이지 번호를 링크로 연결 --> <a href="${num}"> [${num}] </a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
					<!-- 					끝페이지 + 1 하면 이후의 10개 페이지 표시 --> <!-- 				ex>10->11(11~20), 20->21(21~30) -->
					<a href="${pageMaker.endPage + 1}"> [Next] </a>
				</li>
			</c:if>
		</ul>
	</div>

	<form method="get" action="#" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>
	<form method="posdt" action="#" id="actionForm">
		<input type="hidden" name="u_id" value="${user.getU_id()}">
		${user.getU_id()}
	</form>

</body>
</html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
//파티만들기 이동시 로그인 확인

	var u_id = '<%=session.getAttribute("u_id")%>
	';
	function loginCheck() {
		console.log("@# u_id==>" + u_id);
		if (u_id === 'null') {
			alert("로그인 해라")
			window.location = 'login';
		} else {
			window.location = 'party_create?u_id=${user.getU_id()}';
		}
	}

	// 	페이지번호 처리
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log("@# href==>" + $(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	// 	게시글 처리
	$(".move_link")
			.on(
					"click",
					function(e) {
						e.preventDefault();
						var targetBno = $(this).attr("href");
						actionForm
								.append("<input type='hidden' name='p_id' value='"+targetBno+"'>")
						actionForm.attr("action", "party_page").submit();
					});
</script>

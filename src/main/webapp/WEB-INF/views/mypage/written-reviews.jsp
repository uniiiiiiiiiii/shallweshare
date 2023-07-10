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
				<h2>작성한 리뷰</h2>
				
				<table width="700" border="1">
				<tr>
						<td>리뷰 번호</td>
						<td>리뷰 만족도</td>
						<td>리뷰 파티</td>
						<td>수정/삭제</td>
					</tr>
					<c:forEach items="${written}" var="written" varStatus="status">
						<form method="post" action="../review/modify">
							<input type="hidden" name="review_id"
								value="${written.review_id}">
							<tr>
								<td>${written.review_satisfy}</td>
							</tr>
							<tr>
								<td>${partyInfo[status.index].p_title}</td>
							</tr>
							<tr>
								<td>${written.review_content}</td>
							</tr>
							<tr>
								<td><input type="submit" value="수정"> <input
									type="button" value="삭제" onclick="deleteCheck()"></td>
								<script>
									function deleteCheck() {
										var result = confirm('삭제하시겠습니까? 삭제하면 다시 되돌릴 수 없고, 새로운 리뷰를 적을 수 없습니다.');

										if (result) {
											window.location = '../review/delete_process?review_id=${written.review_id}';
											alert('삭제되었습니다.');
										} else {
											//no
										}
									}
								</script>
							</tr>
						</form>
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


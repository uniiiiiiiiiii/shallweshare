<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="mypageList.jsp"%>
	<h1>작성한 리뷰</h1>
	<table width="500" border="1">
		<c:forEach items="${written}" var="written" varStatus="status">
			<form method="post" action="../review/modify">
				<input type="hidden" name="review_id" value="${written.review_id}">
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
</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet">
<style>
@import
'../resources/css/style.css'
</style>
<!-- <link href="/css/style.css" rel="stylesheet" type="text/css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	/***********************게시판 내용 유효성 검사*************************/
	function fn_submit() {
		var review_content = document.getElementsByName("review_content")
		//        게시판 내용
		if (review_content[0].value.length == 0) {
			alert("게시판 내용을 적어주세요")

			return false;
		} else {
			if (review_content[0].value.length > 500) {
				alert('줄여서 적어주세요.');
				return false;
			}
		}
		//form 요소 자체
		var formData = $("#frm").serialize();

		$.ajax({
			type : "post",
			data : formData,
			url : "modify_process",

			success : function(data) {
				alert("저장완료");
				location.href = "../mypage/written-reviews?u_id=${sessionScope.u_id}";
			},
			error : function() {
				alert("오류발생");
			}

		});
	}
</script>
</head>
<body>
	<form id="frm" method="post" action="modify_process">
		<table width="500" border="1">
			<input type="hidden" name="review_id" value="${review.review_id}"> 
			<input type="hidden" name="review_u_id" value="${review.review_u_id}"> 
			
			<tr>
				<td>작성 대상 파티</td>
				<td>${party.p_title}</td>
			</tr>
			<tr>
			
				<td class="a">파티장</td>
				<c:if test="${master ne null }">
				<td>${master.u_nickname}</td>
				</c:if>
			</tr>

			<tr>
				<td>선택</td>
				<td>
					<label><input type="radio" name="review_satisfy" value="T">만족했어요</label> 
					<label><input type="radio" name="review_satisfy" value="F">별로예요</label>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="90%" name="review_content"
						id="review_content" value="${review.review_content}"></textarea></td>
			</tr>

			<tr>
				<td colspan="2">
					<input type="button" onclick="fn_submit()" value="입력"> &nbsp;&nbsp; 
					<a href="../mypage/written-reviews?u_id=${sessionScope.u_id}">목록보기</a>
				</td>
			</tr>
		</table>


	</form>
</body>
</html>
<script type='text/javascript'>
if(${review.review_satisfy eq 'T'}){
	$("input:radio[name='review_satisfy']:radio[value='T']").prop('checked', true); 
}else{
	$("input:radio[name='review_satisfy']:radio[value='F']").prop('checked', true); 
	
}
</script>













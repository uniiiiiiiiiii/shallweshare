<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet">
<style>
@import
'../resources/css/table.css'
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
			url : "write_process",

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
	<form id="frm" method="post" action="write">
        <input type="hidden" name="a_id" value="${param.a_id}"> 
        <input type="hidden" name="p_id" value="${param.p_id}"> 
        <input type="hidden" name="u_id" value="${sessionScope.u_id}">
        <input type="hidden" name="review_u_id" value="${master.u_id}" size="50">
        <h3>작성 대상 파티</h3>
		<table width="500" border="1">
            <tr>
                <td>${party.p_title}</td>
            </tr>
        </table>
        <h3>파티장</h3>
        <table width="500" border="1">
            <tr>
                <td>${master.u_nickname}</td>
            </tr>
        </table>
        <h3>만족도</h3>
        <table width="500" border="1">
            <tr>
                <td>
                    <label><input type="radio" name="review_satisfy" value="T">만족했어요</label> 
					<label><input type="radio" name="review_satisfy" value="F">별로예요</label>
                </td>
			</tr>            
        </table>
        <h3>내용</h3>
        <table width="500" border="1">
            <tr>
                <td>
                	<textarea style="resize: none;" placeholder="내용을 입력해주세요." cols="60" rows="20" name="review_content" id="review_content"></textarea>
       			    <input type="button" onclick="fn_submit()" value="입력"> &nbsp;&nbsp; 
       	 		  	<a href="../mypage/writable-reviews?u_id=${sessionScope.u_id}">목록보기</a>   
                </td> 
			</tr>
        </table>
    </form>
</body>
</html> 
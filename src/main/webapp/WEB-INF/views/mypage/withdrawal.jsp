<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShallWeShare - 회원 탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<%@ include file="mypageList.jsp" %>


	<div id="content">
		<table width="700" border="1">
			<tr>
				<td>유저 아이디</td>
				<td>${user.u_id}</td>
			</tr>
			<tr>
				<td>유저 닉네임</td>
				<td>${user.u_nickname}</td>
			</tr>
			<tr>
				<td colspan="2">정말 탈퇴하시겠습니까?</td>
			</tr>
			<tr>
				<form method="post" action="withdrawal_process" id="withdrawal_form">
				<input type="hidden" name="u_id" id="u_id" value="<%=session_u_id%>">
				<td colspan="2"><input type="text"
					placeholder="'탈퇴합니다'를 입력해주세요." name="withdrawal_check" id="w_check">
					<button id="withdrawal_submit">보내기</button></td>
				</form>
			</tr>
		</table>
	</div>
</body>
</html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$('#withdrawal_submit').on('click', function(e) {
		e.preventDefault();
		var actionForm =$("#withdrawal_form");
		var w_check = $("#w_check").val();
		var u_id = $('input[name=u_id]').val();
		console.log(u_id);
		if (w_check.trim() == '') {
			alert('데이터를 입력해주세요');
		}else if(w_check!='탈퇴합니다') {
			alert('입력값이 맞지 않습니다.');
		}else {
			alert("탈퇴 완료");
			actionForm.find("input[name='u_id']").val($(this).attr("href"));
			actionForm.submit();
		}
	});
</script>
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
<link href="../resources/css/mypage/withdrawal.css" rel="stylesheet" />
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
				<table border="1">
			<h5><b>유저 아이디</b></h5>
			<tr>
				<td>${user.u_id}</td>
			</tr>
		</table><br>
		
		<table border="1">
			<h5><b>유저 닉네임</b></h5>
			<tr>
				<td>${user.u_nickname}</td>
			</tr>
		</table><br>
		
		<table border="1">
			<h5><b>탈퇴 확인</b></h5>
			<tr>
				<td colspan="2">
				<b>정말 탈퇴하시겠습니까?</b><br>
				<input type="text" class="centerBtn"
					placeholder="'탈퇴합니다'를 입력해주세요." name="withdrawal_check" id="w_check">
					<button id="withdrawal_submit" class="test_btn1">전송</button>
				</td>
			</tr>
		</table>
				
			</div>
		</div>
		</section>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>
<script src="../resources/js/mypage/withdrawal.js"></script>	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script>
	$('#withdrawal_submit').on('click', function(e) {
		e.preventDefault();
		var w_check = $("#w_check").val();
		var u_id = $('input[name=u_id]').val();
		console.log(u_id);
		if (w_check.trim() == '') {
			alert('데이터를 입력해주세요');
		}else if(w_check!='탈퇴합니다') {
			alert('입력값이 맞지 않습니다.');
		}else {
			alert("회원 탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			if(${user.u_login_platform == 'KAKAO'}){
				location.href='../users/kakaounlink'
			}else{
				location.href='../users/userDel'
				
			}
		}
	});
</script>
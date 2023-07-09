<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	$(document).ready(
			function() {
				var checkNickname = "";
				var u_pwd = $("#u_nickname").val();
				$('.nick_already').css("display", "none");
				$('.nick_ok').css("display", "none");

				$("#u_nickname").keyup(
						function() {
							checkNickname = "";
							// 			닉네임 중복확인
							var nickname = $('#u_nickname').val();
							$.ajax({
								url : "nickModifyChk",
								type : "post",
								dataType : "json",
								data : {
									"u_nickname" : nickname
								},

								success : function(data) {
									if (data == 0) {
										$('.nick_ok').css("display",
												"inline-block");
										$('.nick_already').css("display",
												"none");
										checkNickname = "Y";
									} else {
										$('.nick_already').css("display",
												"inline-block");
										$('.nick_ok').css("display", "none");
									}
								}, //end of success

								error : function(request, error) {
									alert("fail");
									alert("code: " + request.status + "\n"
											+ "message: "
											+ request.responseText + "\n"
											+ "error:" + error);
								} //end of error
							}); //end of ajax
						});//end of keyup

				$("#kakaoModifyForm").submit(function() {
					if (checkNickname == "") {
						alert("중복된 닉네임이 존재합니다.");
						return false;
					}			
					
				}) //submit
			}); //end of ready
</script>
</head>
<body>
	<%@ include file="mypageList.jsp" %>
	<table border="1" align="center">
		<form method="post" action="userModify_process" name="regform"
			id="kakaoModifyForm">
			<tr height="50">
				<td colspan="2">
					<h1>회원수정</h1>
				</td>
			</tr>
				<tr height="30">
					<td width="80">아이디</td>
					<td>${usersInfo.u_sns_id}</td>
				</tr>
				<c:if test="${usersInfo.u_login_platform ne 'KAKAO' }">
					<tr height="30">
						<td width="80">비밀번호</td>
						<td><input type="text" size="20" name="u_pwd"
							value="${usersInfo.u_pwd}" id="u_pwd" required></td>
					</tr>
				</c:if>
				<tr height="30">
					<td width="80">이름</td>
					<td>${usersInfo.u_name}</td>
				</tr>
				<tr height="30">
					<td width="80">닉네임</td>
					<td><input type="text" size="20" name="u_nickname"
						id="u_nickname" value="${usersInfo.u_nickname}" required>
						<span class="nick_ok">사용 가능한 닉네임입니다.</span> <span
						class="nick_already">중복된 닉네임입니다.</span></td>
				</tr>

				<tr height="30">
					<td width="80">폰번호</td>
					<td><input type="text" size="12" name="u_phoneNum"
						value="${usersInfo.u_phoneNum }" required
						placeholder="'-'를 제외한 번호만 입력해주세요."></td>
				</tr>

				<tr height="30">
					<td width="80">성별</td>
					<td>${usersInfo.u_gender}</td>
				</tr>
				<tr height="30">
					<td width="80">이메일</td>
					<td><input type="text" size="20" name="u_email"
						value="${usersInfo.u_email }"></td>
				</tr>
				<tr height="30">
					<td width="80">계좌번호</td>
					<td><input type="text" size="20" name="u_bank_account"
						value="${ usersInfo.u_bank_account}"></td>
				</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정하기">
			</td>
		</tr>
		</form>
	</table>

</body>
</html>
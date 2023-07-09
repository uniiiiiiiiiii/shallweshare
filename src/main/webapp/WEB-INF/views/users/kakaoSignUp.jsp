<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	var checkNickname="";
		    $('.nick_already').css("display", "none");
	       	$('.nick_ok').css("display", "none");
	       	
	       	
	       	 $("#u_nickname").keyup(function() {
			   checkNickname="";
// 			닉네임 중복확인
	       	var nickname = $('#u_nickname').val();
			$.ajax({
				url : "nickChk",
				type : "post",
				dataType : "json",
				data : {"u_nickname" : nickname},
				
				success : function(data){
					if(data == 0){
	                    $('.nick_ok').css("display","inline-block"); 
	                    $('.nick_already').css("display", "none");
	                    checkNickname="Y";
					}else{
	                    $('.nick_already').css("display","inline-block");
	                    $('.nick_ok').css("display", "none");
					}
				}, //end of success
				
				error : function(request, error){
					alert("fail");
					alert("code: " +request.status + "\n" + "message: "+ request.responseText + "\n" +"error:" +error);
				} //end of error
			}); //end of ajax
		});//end of keyup
			
			$("#kakaoRegisterForm").submit(function(){
					if(checkNickname == ""){
						alert("중복된 닉네임이 존재합니다.");
					return false;
			}
			}) //submit
	}); //end of ready
	</script> 
</head>
<body>
<table border="1" align="center">
		<form method="post" action="kakaoSignUpOk" name="regform" id="kakaoRegisterForm">
			<tr height="50">
				<td colspan="2">
					<h1>회원가입</h1>
				</td>
			</tr>
			<tr height="30">
				<td width="80">이메일</td>
				<td>
					<input type="text" size="20" name="u_email" placeholder="별명을 적어주세요." required>
				</td>
			</tr>
			<tr height="30">
				<td width="80">닉네임</td>
				<td>
					<input type="text" size="20" name="u_nickname" id="u_nickname" placeholder="별명을 적어주세요." required>
						<span class="nick_ok">사용 가능한 닉네임입니다.</span>
						<span class="nick_already">중복된 닉네임입니다.</span>				
				</td>
			</tr>

			<tr height="30">
				<td width="80">폰번호</td>
				<td>
					<input type="text" size="12" name="u_phoneNum" required placeholder="'-'를 제외한 번호만 입력해주세요.">
				</td>
			</tr>
			
			<tr height="30">
				<td width="80">
					계좌번호
				</td>
				<td>
					<input type="text" size="20" name="u_bank_account">
				</td>
			</tr>
			
			<input type ='hidden' name='u_id' value="${u_id}">
			
			<tr>
				<td colspan="2">
					<input type="submit" value="가입하기">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
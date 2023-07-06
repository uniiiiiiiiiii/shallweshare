<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- <script type="text/javascript" src="/js/user.js" charset="UTF-8"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	 	
	 	<script type="text/javascript">
// 	var idck = 0;
	
		$(document).ready(function(){
			
		
			// 취소 클릭
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			//회원가입 클릭
			$("#check_ok").on("click", function(){
				if($("#u_sns_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#u_sns_id").focus();
					return false;
				}
				if($("#u_pwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#u_pwd").focus();
					return false;
				}
				if($("#u_name").val()==""){
					alert("이름을 입력해주세요.");
					$("#u_name").focus();
					return false;
				}
				
				var idChkVal = $("#idChk").val();
				
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
				
			}); // 회원가입
			
			
		})
		
		
// 		var listVar = $('input[name="u_gender"]:checked').val();
		
		
		
		// 아이디 중복확인 클릭
		$(function(){
			$("#idChk").click(function(){
				
			$.ajax({
				url : "/idChk",
				type : "post",
// 				dataType : "json",
				data : {"u_sns_id" : $("#u_sns_id").val()},
				success : function(data){
					console.log(data)
					if(data == "N"){
						alert("중복된 아이디입니다.");
					}else{
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
// 						idck = 1;
					}
				}, //end of success
// 				error : function(error){alert(error);}
				error : function(request, error){
					alert("fail");
					alert("code: " +request.status + "\n" + "message: "+ request.responseText + "\n" +"error:" +error);
				}
			}); //end of ajax
		
			});//end of click function
		}); //end of function()
		
</script> 
</head>
<body>

<table border="1" align="center">
		<form method="post" action="signUpOk" name="regform">
			<tr height="50">
				<td colspan="2">
					<h1>회원가입</h1>
				</td>
			</tr>
			<tr height="30">
				<td width="80">아이디</td>
				<td>
					<input type="text" size="20" name="u_sns_id" id="u_sns_id" placeholder="아이디를 적어주세요." required minlength="4">
<!-- 					<button class="idChk" type="button" id="idChk" onclick="fn_idChk()" value="N">중복확인</button> -->
					<button class="idChk" type="button" id="idChk" value="N">중복확인</button>
				</td>
			</tr>
			
			<tr height="30">
				<td width="80">비밀번호</td>
				<td>
					<input type="password" size="20" name="u_pwd" placeholder="비밀번호를 적어주세요." required>
				</td>
			</tr>
			
<!-- 			<tr height="30"> -->
<!-- 				<td width="80">비밀번호 확인</td> -->
<!-- 				<td> -->
<!-- 					<input type="text" size="20" name="u_pwd_cnf" placeholder="비밀번호 확인을 적어주세요." required> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			
			
			<tr height="30">
				<td width="80">이름</td>
				<td>
					<input type="text" size="20" name="u_name" placeholder="이름을 적어주세요." required>
				</td>
			</tr>
			<tr height="30">
				<td width="80">닉네임</td>
				<td>
					<input type="text" size="20" name="u_nickname" placeholder="닉네임을 적어주세요." required>
				</td>
			</tr>
<!-- 			<tr height="30"> -->
<!-- 				<td width="80"> -->
<!-- <!-- 				나중에 캘린더로 수정? or 주민 뒷자리 1개까지 받아서 성별이랑 같이 처리 -->
<!-- 					생일  -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 					<input type="text" size="20" name="u_birth"> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr height="30">
				<td width="80">폰번호</td>
				<td>
					<input type="text" size="12" name="u_phoneNum" required placeholder="'-'를 제외한 번호만 입력해주세요.">
				</td>
			</tr>
			
			<tr height="30">
				<td width="80">
					성별
				</td>
				<td>
<!-- 				<input type="text" size="1" name="u_gender"> -->
					<input type="radio" size="1" name="u_gender" value='F'>여자
					<input type="radio" size="1" name="u_gender"  value='M'>남자
				</td>
			</tr>
			<tr height="30">
				<td width="80">
					이메일
				</td>
				<td>
					<input type="text" size="20" name="u_email">
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
			
			<tr>
				<td colspan="2">
<!-- 					<input type="button" onclick="signUpCheck()" value="가입하기"> -->
					<input type="submit" value="가입하기">
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
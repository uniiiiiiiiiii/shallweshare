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
			//취소 클릭
			$(".cencle").on("click", function(){
// 				location.href = "../shop/list";
				location.href = "../users/userSignIn";
			})
		
			var checkId="";
			var checkNickname="";
			
	       	$('.id_already').css("display", "none");
	       	$('.id_ok').css("display", "none");
	       	$('.nick_already').css("display", "none");
	       	$('.nick_ok').css("display", "none");
			
	       	
	       	$("#u_sns_id").keyup(function() {
	       		checkId="";
	       	
			// 아이디 중복확인 클릭
// 			 function checkId(){
	       	 var id = $('#u_sns_id').val();
				$.ajax({
					url : "idChk",
					type : "post",
					dataType : "json",
					data : {"u_sns_id" : id},
					
					success : function(data){
						if(data == 0){
// 							alert(data);
// 							var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;	
// 							if(special_pattern.test(id) == true) return true;
						
// 		                    여기서 유효성 체크 한번 더하자 (중복X인 상태에서)
// 							if(아이디 좀 꼬롬하면) -> 특수문자는 사용할 수 없습니다. 등의 문구 나오게

// 		                    }else{ 안꼬롬하면 -> 
		                    $('.id_ok').css("display","inline-block"); 
		                    $('.id_already').css("display", "none");
		                    
							checkId="Y";
						}else{
		                    $('.id_already').css("display","inline-block");
		                    $('.id_ok').css("display", "none");
						}
					}, //end of success
					
					error : function(request, error){
						alert("fail");
						alert("code: " +request.status + "\n" + "message: "+ request.responseText + "\n" +"error:" +error);
					} //end of error
				}); //end of ajax
				
				});//end of keyup
	       	
				
				
				
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
			
			
			
			
			
			$("#registerForm").submit(function(){
				
				var id= $("#u_sns_id").val();
				
				if(id ==""){
					alert("아이디를 입력해주세요.");
					$("#u_sns_id").focus(); return false;
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
				
				if(checkId == ""){
					alert("중복된 아이디가 존재합니다.");
					return false;
			}
				
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
		<form method="post" action="signUpOk" name="regform" id="registerForm">
			<tr height="50">
				<td colspan="2">
					<h1>회원가입</h1>
				</td>
			</tr>
			<tr height="30">
				<td width="80">아이디</td>
				<td>
					<input type="text" size="20" name="u_sns_id" id="u_sns_id" placeholder="아이디를 적어주세요." required minlength="4" oninput = "checkId()">
<!-- 					<button class="idChk" type="button" id="idChk" value="N">중복확인</button> -->
						<span class="id_ok">사용 가능한 아이디입니다.</span>
						<span class="id_already">중복된 아이디입니다.</span>
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
					<input type="text" size="20" name="u_nickname" id="u_nickname" placeholder="닉네임을 적어주세요." required>
						<span class="nick_ok">사용 가능한 닉네임입니다.</span>
						<span class="nick_already">중복된 닉네임입니다.</span>
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
					<input type="submit" value="취소" class="cencle">
					
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
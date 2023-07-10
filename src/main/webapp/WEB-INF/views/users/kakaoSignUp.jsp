<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <meta name="viewport" content="width=device-width,initial-scale=1"> -->
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>카카오 추가 회원가입</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	 	
  <script type="text/javascript">
$(document).ready(function(){
	  $(".cencle").on("click", function(){
		//			location.href = "../shop/list";
		location.href = "../users/userSignIn";
		})

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
<style>

.form-structor {
    padding: 50px;
    margin: 90px auto;
	height: 570px;
	width: 540px;
    content: '';
    top: 100px;
    bottom: 100px;
	background-color: #FDF5E6;   
}

.txt{
  border-bottom: 2px solid #adadad;
  margin-top: 10px;
  width: 70%;
  position: relative;
  margin: 10px;
  margin-left: 50px;
  padding: 7px 10px;
}


/* 인풋 텍스트 */
     .inputtxt1{
        background-color: #FDF5E6;
        border:0;
        width: 100%;
        padding: 2px;
       
        margin-top: 5px;
        &:focus {
        color: #b17505;
       
        outline: none;
        font-size: 1em;
        transition: .8s all ease;
    &::placeholder {
        opacity: 0;
      } 
    }
    &:hover {
          transition: all .3s ease;
          background-color: #fffcf6;
        }
  } 

     
  .submit-btn {
      height: 40px;
        background-color: #FFA500;
        color: rgba(256,256,256,0.7);
        border:0;
        border-radius: 8px;
        display: block;
        margin: 10px auto; 
        margin-top: 40px;

        padding: 5px 45px;
        width: 77%;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
        opacity: 1;
        visibility: visible;
        -webkit-transition: all .3s ease;

        &:hover {
          transition: all .3s ease;
          background-color: #FFDBC1;
        }
      }
    .cencle{
      height: 30px;
        background-color: #dec08a;
        color: rgba(256,256,256,0.7);
        border:0;
        border-radius: 8px;
        display: block;
        margin: 7px auto; 
        padding: 2px 45px;
        width: 77%;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
        opacity: 1;
        visibility: visible;
        -webkit-transition: all .3s ease;

        &:hover {
          transition: all .3s ease;
          background-color: #FFDBC1;
        }
      }


  
  #signup{    
     text-align: center;
     margin-bottom: 40px;
     color: #b17505;
  }

  .chk{
    font-size: 5px;
    color: #b17505;
    padding-left: 55px;
  }



</style>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<%@ include file="../header.jsp" %>
<body>

<div class="form-structor" id="screen2">

  <div class="signup">
    <h2 class="form-title" id="signup">KAKAO Sign Up</h2>
  </div>
  <form method="post" action="kakaoSignUpOk" name="regform" id="kakaoRegisterForm">
    <div class="form-holder">

        <div class="txt">
            <input class="inputtxt1" type="text" size="20" name="u_email" required placeholder="이메일">
        </div>

      <div class="txt">
        <input class="inputtxt1" type="text" size="20" name="u_nickname" id="u_nickname" placeholder="닉네임" required>
      </div>
      <div class="chk">
        <span class="nick_ok">사용 가능한 닉네임입니다.</span>
        <span class="nick_already">중복된 닉네임입니다.</span>
      </div>

      <div class="txt">
        <input class="inputtxt1" type="text" size="12" name="u_phoneNum" required placeholder="폰번호  ('-'를 제외한 번호만 입력해주세요.)">
      </div>   

      <div class="txt">
        <input class="inputtxt1" type="text" size="20" name="u_bank_account" required placeholder="계좌번호">
      </div>

      <input type ='hidden' name='u_id' value="${u_id}">
    </div>
    
    
        <input type="submit" class="submit-btn" value="회원가입">
        <input type="submit" value="취소" class="cencle">
        
</form>
    </div>
</body>
<%@ include file="../footer.jsp" %>
</html>
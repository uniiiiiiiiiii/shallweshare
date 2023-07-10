<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <meta name="viewport" content="width=device-width,initial-scale=1"> -->
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>회원가입</title>
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
<style>
/* html,body { */
/* 	background-color: #FAEBD7; */
/* } */
.form-structor {
    padding: 50px;
    margin: 90px auto;
	height: 800px;
	width: 540px;
    content: '';
    top: 100px;
    bottom: 100px;
	background-color: #FDF5E6;   
} 


.txt{
  border-bottom: 2px solid #adadad;
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
        margin: 15px auto; 
        margin-bottom: 10px;
        margin-top: 20px;
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
     color: #b17505;
  }

  .chk{
    font-size: 5px;
    color: #b17505;
    padding-left: 55px;
  }

  .radio-box{
    color: gray; 
  } 

   [type="radio"] {
    
  vertical-align: middle;
  appearance: none;
  border: max(2px, 0.1em) solid gray;


  &:hover {
          transition: all .3s ease;
          background-color: #f7a76e;
        }
  
  border-radius: 50%;
  width: 1.1em;
  height: 1.1em;
  /* background-color: #f7a76e */
}

[type="radio"]:checked{
  background-color: #f7a76e;
}
</style>
<head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
</head>
<%@ include file="../header.jsp" %>
<body>
<div class="form-structor" id="screen2">

  <div class="signup">
    <h2 class="form-title" id="signup">Sign Up</h2>
  </div>
    <form method="post" action="signUpOk" name="regform" id="registerForm">
    <div class="form-holder">
      <div class="txt">
       <input class="inputtxt1" type="text" size="20" name="u_sns_id" id="u_sns_id" placeholder="아이디" required minlength="4" oninput = "checkId()">
      </div>
      <div class="chk">
        <span class="id_ok">사용 가능한 아이디입니다.</span>
        <span class="id_already">중복된 아이디입니다.</span>
      </div>
      <div class="txt">
        <input class="inputtxt1" type="text" size="20" name="u_pwd" placeholder="비밀번호" required>
      </div>
      <div class="txt">
        <input class="inputtxt1" type="text" size="20" name="u_name" placeholder="이름" required>
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



      <div class="txt" >
          <label class="radio-box"><input class="inputtxt1" type="radio" size="1" name="u_gender" value='F'>
            <span class="on"></span>
            여자
          </label>
          <label class="radio-box"><input class="inputtxt1" type="radio" size="1" name="u_gender"  value='M'>
            <span class="on"></span>
            남자
          </label>
      </div>
      <div class="txt">
        <input class="inputtxt1" type="text" size="20" name="u_email" required placeholder="email">
      </div>
      <div class="txt">
        <input class="inputtxt1" type="text" size="20" name="u_bank_account" required placeholder="계좌번호">
      </div>
</div>
    <input type="submit" class="submit-btn" value="회원가입">
    <input type="submit" value="취소" class="cencle">

  </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
<%@ include file="../footer.jsp" %>
</html>
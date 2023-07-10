<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var checkNickname = "Y";
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

<title>ShallWeShare - 내 파티 보기</title>
<style>
#content-container {
	padding: 20px;
}

html,body { 
	margin-bottom: 200px;  
 } 
.form-structor {
    padding: 50px;
    margin: 0px auto;
    margin-bottom: 80px;
	height: 800px;
	width: 600px;
    content: '';
    top: 100px;
    bottom: 100px;
	background-color: #FDF5E6;   
}

.txt{
  border-bottom: 2px solid #adadad;
  margin-top: 10px;
  width: 77%;
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
        font-size: 1.2em;
        transition: .8s all ease;

    &::placeholder {
        opacity: 0;
      } 
    }
  } 
      .inputtxt1:hover {
          transition: all .3s ease;
          background-color: #fffcf6;

        } 

     
  .submit-btn {
      height: 40px;
        background-color: #FFA500;
        color: rgba(256,256,256,0.7);
        border:0;
        border-radius: 8px;
        display: block;
        margin: 25px auto; 
        margin-bottom: 10px;
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

.tt{
    font-size: 7px;
    color: #6d4702;
}

#fix{
    font-size: 1.1em;
    color: #a09f9f;
}

.fix{
    color: #f50606;
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
				<div class="form-structor" id="screen2">
	
		<form method="post" action="userModify_process" name="regform" id="kakaoModifyForm">
  		<div class="signup">
    		<h2 class="form-title" id="signup">회원 수정</h2>
 		 </div>
        <div class="txt" id="fix" >
     	  아이디:&nbsp;&nbsp; ${usersInfo.u_sns_id}   &nbsp;&nbsp;&nbsp;
<!--      	  <span class="fix">(수정불가)</span> -->
     	 </div>

		<c:if test="${usersInfo.u_login_platform ne 'KAKAO' }">
			<div class="txt" >
	       		<span class="tt">비밀번호</span>
				<input class="inputtxt1" type="text" size="20" name="u_pwd"
						value="${usersInfo.u_pwd}" id="u_pwd" required>
			</div>
		</c:if>
				
		<div class="txt" id="fix">
        <span class="fixname">이름:&nbsp;&nbsp;</span> ${usersInfo.u_name}  &nbsp;&nbsp;&nbsp; 
<!--         <span class="fix">(수정불가)</span> -->
     	 </div>		
		
		<div class="txt">
	        <span class="tt">닉네임</span>
	        <input class="inputtxt1" type="text" size="20" name="u_nickname" id="u_nickname" value="${usersInfo.u_nickname}" placeholder="닉네임" required>
      </div>		
	      <div class="chk">
        <span class="nick_ok">사용 가능한 닉네임입니다.</span>
        <span class="nick_already">중복된 닉네임입니다.</span>
      </div>

	  <div class="txt">
        <span class="tt">폰번호</span>
        <input class="inputtxt1" type="text" size="12" name="u_phoneNum" value="${usersInfo.u_phoneNum }" required placeholder="폰번호  ('-'를 제외한 번호만 입력해주세요.)">
      </div>

      <div class="txt"  id="fix">
        성별:&nbsp;&nbsp;${usersInfo.u_gender}&nbsp;&nbsp;&nbsp; 
<!--         <span class="fix">(수정불가)</span> -->
      </div>

	 <div class="txt">
        <span class="tt">이메일</span>
        <input class="inputtxt1" type="text" size="20" name="u_email" required value="${usersInfo.u_email }" placeholder="email">
      </div>
      <div class="txt">
        <span class="tt">계좌번호</span>
        <input class="inputtxt1" type="text" size="20" name="u_bank_account" value="${usersInfo.u_bank_account}" placeholder="계좌번호" required>
      </div>
	    <input type="submit" class="submit-btn" value="수정하기">
	</div>
		</form>

		</div>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
				
			</div>
		</div>
		</section>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>
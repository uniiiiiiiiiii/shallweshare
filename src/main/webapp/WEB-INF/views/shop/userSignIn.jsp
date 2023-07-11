<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>


.form-structor {
    padding: 50px;
    margin: 80px auto;
	height: 430px;
	width: 500px;
    content: '';
    top: 150px;
    bottom: 100px;
	background-color: #FDF5E6;
}
  
   .form-holder {
        border-radius: 15px;
        background-color: #ffffff;
        margin-top: 30px;
        opacity: 1;
   
        .input11 {
        width: 80%;
          border: 0;
          border-radius: 15px;
           outline: none; 
          display: block;
          height: 40px;
          line-height: 30px;
          padding: 8px 30px;
          font-size: 14px;
        }
      }
      
    .input11:focus{
        width: 80%;
          border: 0;
          border-radius: 15px;
          outline: none;
          display: block;
          height: 50px;
          line-height: 30px;
          padding: 8px 30px;
          font-size: 17px;
          font-color: #FDF5E6
        }
      
      
  .submit-btn {
      height: 55px;
        background-color: #FFA500;
        color: rgba(256,256,256,0.7);
        border:0;
        border-radius: 8px;
        display: block;
        margin: 15px auto; 
        /* margin-bottom: 40px; */
        padding: 15px 45px;
        width: 100%;
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

.kakao{
        height: 10px;
        &:hover {
          transition: all .3s ease;
          opacity: 0.6
        }
}
 

a:hover{
  color: #FFA500;
}

.linkyun {
  text-align: right;
  text-decoration: none;
  color: #999;
  font-size: 1rem;
  transition: .3s;
}


    .linkyun1{
    text-align: right;
  	text-decoration: none;
  	color: #999;
 	font-size: 1rem;
 	transition: .3s;
    margin: 10px; 
    margin-left: 45px;
    padding-left: 17px;
    margin-right: 10px;
    opacity: 0.7
}

.linkyun1:hover {
          color: #FFA500;
          font-size: 1.1rem;
        }

    .linkyun2{
    text-align: right;
  	text-decoration: none;
  	color: #999;
 	font-size: 1rem;
 	transition: .3s;
    margin: 10px; 
    margin-left: 7px;
    margin-right: 10px;
    opacity: 0.7
}

.linkyun2:hover {
          color: #FFA500;
          font-size: 1.1rem;
        }


 .ttext{ 
     margin-top: 15px; 
 } 

img{
    position: relative;
    top: 0px;
}
.mainimg{
    margin: auto;
    width: 500px;
    position: absolute;
    top: 110px;
    left: -250px;
    /* position:relative;top:20px;left:100px */
}
  
  #signup{
  margin-top: 50px auto;
     text-align: center;
     color: #b17505;
  }
</style>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
</head>
<%@ include file="../header.jsp" %>
<body>



<div class="form-structor">
  <div class="signup">
    <h2 class="form-title" id="signup">ShallWeShare?</h2>
    <form method="post" action="userSignIn_yn">
    <div class="form-holder">
      <input type="text" class="input11"name="u_sns_id" class="input" placeholder="Id" />
      <input type="password" class="input11" name="u_pwd" placeholder="Password" />
    </div>
    <input type="submit" class="submit-btn" value="로그인">
  </div>
</form>
  <div class="wrap">
    <div>
        <a class="kakao"
            href="https://kauth.kakao.com/oauth/authorize?client_id=97b3eb27ba108e2e3f48aa5cbed11254&redirect_uri=http://localhost:8181/shallweshare/users/kakaoLogin&response_type=code">

            <img
            src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_wide.png"
            style="height: 60px">
        </a>
    </div>
</div>
    <div class="ttext">
<!--     ><a class="nav-link" href="list"> -->
        <a class= linkyun1 href="#">아이디 찾기</a>
        <span class="txt">|</span>
        <a class= linkyun2  href="#">비밀번호 찾기</a>
        <span class="txt">|</span>
        <a class= linkyun2  href="userSignUp">회원가입</a>
    </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
<%@ include file="../footer.jsp" %>
</html>
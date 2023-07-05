<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
  div ul{
    list-style-type: none;
    margin: 0;
    padding: 0;
  }
      a{
      text-decoration: none;
    }
  div ul li{
    font-size: 1.5em;
    padding-left: 7px;
    margin-bottom: 15px;
    border-left-style: solid;
    border-left-color: #906;
    border-left-width: 5px;
    display: inline;
  }
  a{
  	text-decoration: none;
  	color : black;
  }
  .users:hover {
  	color : red;
    font-weight: 900;
  }
  .report:hover {
  	color : red;
    font-weight: 900;
  }
</style>
<body>
	<h1 align="center"><a href="http://localhost:8181/shallweshare/admin/admain">관리자 페이지</a></h1>
	<hr>
	<div align="center">
		<ul>
			<li><a class="users" href="#" onclick="changeIframeSrc('http://localhost:8181/shallweshare/admin/adUserInfo')">회원정보</a></li>
			<li><a class="report" href="#" onclick="changeIframeSrc('http://localhost:8181/shallweshare/admin/adReport')">신고내역</a></li>
		</ul>
	</div>
	<div>
		<iframe src="http://localhost:8181/shallweshare/admin/adUserInfo" id="iframe" width="95%" height="500"></iframe>
	</div>
		<script>
		function changeIframeSrc(src) {
			document.getElementById("iframe").src = src;
		}
	</script>
</body>
</html>
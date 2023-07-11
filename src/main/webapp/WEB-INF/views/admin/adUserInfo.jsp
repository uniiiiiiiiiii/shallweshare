<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../resources/css/admin.css"/>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보(관리자)</title>
</head>
<body>
	<table width = "90%" border = "3" align="center">
	<div style="float: right; margin-right: 124">
	<caption id="cap-top">
		<form method="post" action="uSearchList">
			<input name="u_name" type="text" placeholder="이름이나 닉네임 입력">&nbsp;&nbsp;
			<input type="submit" value="검색">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</caption>
		</div>
		<div style="width: 450px; margin: 0 auto;">
				<tr align="center" class="main-table">
					<td>회원번호</td>
					<td>닉네임</td>
					<td>이름</td>
					<td>가입날짜</td>
					<td>역할</td>
					<td colspan="2">등&nbsp;&nbsp;급</td>
				</tr>
			<c:forEach items="${ulist}" var = "dto" varStatus="status">
				<form method="post" action="modify">
						<tr align="center" class="${status.count % 2 == 0 ? 'users-table' : 'odd-row'}">
							<td>${dto.u_id}</td>
							<td>
								<a href="user_view?u_id=${dto.u_id}" onclick="window.open(this.href, '_blank', 'width=650, height=1500'); return false;">${dto.u_nickname}</a>
							</td>
							<td>${dto.u_name}</td>
							<td><fmt:formatDate value="${dto.u_created}" pattern="yyyy-MM-dd"/></td>
							<td>${dto.u_role}</td>
							<td>
		                    <select name="u_role">
		                    	<c:choose>
		                    		<c:when test="${dto.u_role=='USER'}">
			                    	    <option value="ADMIN" selected>ADMIN</option>
			                	        <option value="RESTRICT">RESTRICT</option>		                    			
		                    		</c:when>
		                    		<c:when test="${dto.u_role=='ADMIN'}">
			                    	    <option value="USER" selected>USER</option>
			                	        <option value="RESTRICT">RESTRICT</option>		                    			
		                    		</c:when>
		                    		<c:when test="${dto.u_role=='RESTRICT'}">
			                	        <option value="USER" selected>USER</option>		                    			
			                    	    <option value="ADMIN">ADMIN</option>
		                    		</c:when>
		                    		<c:otherwise>		                    			
			                	        <option value="USER" selected>USER</option>		                    			
			                    	    <option value="ADMIN">ADMIN</option>
			                    	    <option value="RESTRICT">RESTRICT</option>
		                    		</c:otherwise>
		                    	</c:choose>
	            	        </select>
						</td>
						<td>
							<input type="hidden" name="u_id" value="${dto.u_id}">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<input type="hidden" name="url" value="uSearchList">
							<input type="submit" value="수정">
						</td>
					</tr>
				</form>
			</c:forEach>
	</div>
		<caption id="cap-bottom">
		<div class="user_page">
			<ul>
				<c:if test="${pageMaker.prev}">				
					<li class="paginate_button">
	<!-- 				시작페이지 -1 하면 이전의 10개 페이지 표시 -->
						<a href="${pageMaker.startPage-1}">
							[Prev]
						</a>
						&nbsp;
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	<%-- 			<li>${num}</li> --%>
	<%-- 			<li ${pageMaker.cri.pageNum == num ? "style='color:red'":""}> --%>
	<!-- 				현재 페이지는 배경색 노란색으로 표시 -->
					<li class="paginate_button">
	<!-- 				클릭한 현재 페이지 번호를 링크로 연결 -->
						<a href="${num}" ${pageMaker.cri.pageNum == num ? "style='font-weight: 900; font-size: larger; color:#FFC147;'":""}>
							[${num}]
						</a>
					</li>
					&nbsp;
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="paginate_button">
	<!-- 				끝페이지 +1 하면 이후의 10개 페이지 표시 -->
						<a href="${pageMaker.endPage+1}">
							[Next]
						</a>
					</li>				
				</c:if>
			</ul>
		</div>
		</caption>
	</table>
		<form method="get" id="actionForm" action="#">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm = $("#actionForm");
// 	페이지 번호 처리	
	$(".paginate_button a").on("click", function(e){
// 		기본 동작 막음 : 페이지 이동
		e.preventDefault();
		console.log("click~!!!");
		console.log("@@@@### href ===> "+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
// 	게시글 처리
	$(".move_link").on("click",function(e){
		e.preventDefault();
		var targetBno = $(this).attr("href");
// 		console.log("move click~!!"));
// 		console.log("@# href ===>"$(this).attr("href"));

// 		게시글 클릭 후 뒤로가기 누를 때 &bid=번호 계속 누적되는거 방지
		var bno = actionForm.find("input[name='bid']").val();
		if (bno != ''){
			actionForm.find("input[name='bid']").remove();
		}
		
		actionForm.append("<input type='hidden' name='bid' value='"+targetBno+"'>")
		actionForm.attr("action","user_view").submit();
// 		"content_view?bid=${dto.bid}" 에 있는 ?bid= 의 bid와 name 을 매칭
	});
</script>	
</html>
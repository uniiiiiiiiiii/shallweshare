<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>shallweshare</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Custom Google font-->
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/font.css" rel="stylesheet" />

</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-light bg-warning py-3">
			<div class="container px-10">
				<a class="navbar-brand" href="../shop/list"> <span
					class="fw-bolder text-primary"> <img
						src="../resources/img/shallweshare.png" alt="Bootstrap"
						width="250" height="50">
				</span>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-0 ml-0 mb-lg-0 Large  fw-bolder">
						<li class="nav-item"><a class="nav-link" href="../shop/list">모집/신청</a></li>
						<li class="nav-item"><a class="nav-link " href="../mypage/">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="../admin/">관리자페이지</a></li>
					</ul>
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0 Large  fw-bolder ">
						<!--                             <li class="nav-item"><a class="nav-link " href="index.html" >티모님 환영합니다</a></li> -->
						<li class="nav-item"><c:choose>
								<c:when test="${sessionScope.u_id eq null }">
									<li><a class="dropdown-item" href="../users/userSignIn">로그인</a></li>
								</c:when>
								<c:otherwise>
									<div class="dropdown">
										<a href="#" class=" nav-link dropdown-toggle p-0"
											id="dropdownUser1" data-bs-toggle="dropdown"
											aria-expanded="false"> <img
											src="../resources/img/Teemo.jpg" alt="" width="50"
											height="50" class="rounded-circle me-2"> ${sessionScope.u_nickname }님환영합니다
										</a>

										<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
											aria-labelledby="dropdownUser1" style="">
											<li><a class="dropdown-item" href="../mypage/userModify"">프로필 수정</a></li>
											<li><a class="dropdown-item" href="../mypage/my_partyList">내 파티</a></li>
											<li><a class="dropdown-item" href="../mypage/my_reportList">신고 내역</a></li>
											<li><a class="dropdown-item" href="../mypage/writable-reviews">리뷰 쓰기</a></li>
											<li><hr class="dropdown-divider"></li>
											<c:choose>
												<c:when test="${sessionScope.access_Token eq null }">
													<li><a class="dropdown-item" href="../users/logout">로그아웃</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="dropdown-item"
														href="../users/kakaologout">로그아웃</a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</div>
			</div>
		</nav>
</body>
</html>
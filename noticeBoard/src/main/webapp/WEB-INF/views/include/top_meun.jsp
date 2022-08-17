<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>게시판</title>
<!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <script src="/resources/js/topmeun.js"></script>
    
</head>
<body>
	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		<a class="sidebar-brand d-flex align-items-center justify-content-center"
		href="index">
			<div class="sidebar-brand-text mx-3">
				게시판
			</div>
		</a>
		<form method="POST" id="serachForm" action="search">
			<div class="input-group">
				<input type="text" name="search" class="form-control bg-light border-0">
				<button class="btn btn-primary" id="searchBtn">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</form>
		<ul class="navbar-nav ml-auto">
			<c:if test="${member == null}">
			<li class="nav-item no-arrow mx-1">
				<a href="login">로그인</a>
			</li>
			<li class="nav-item no-arrow mx-1">
				<a href="register">회원가입</a>
			</li>
			</c:if>
			<c:if test="${member != null}">
			<li class="nav-item no-arrow mx-1">
				<a href="write">글쓰기</a>
			</li>
			<li class="nav-item no-arrow mx-1">
				<a href="userinfo">회원정보수정</a>
			</li>
			<li class="nav-item no-arrow mx-1">
				<a href="logout.do">로그아웃</a>
			</li>
			<div class="topbar-divider d-none d-sm-block"></div>
			<div class="text-center">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">
					${member.name}
				</span>
			</div>
			</c:if>
		</ul>
	</nav>
	<br>

<!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

</body>
</html>
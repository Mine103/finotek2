<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <link href="resources/css/login.css" rel="stylesheet">
    
    <script src="resources/js/login.js"></script>
</head>
<body class="container bg-gradient-primary">

	<!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

<div class="row justify-content-center">
<div class="col-xl-10 col-lg-12 col-md-9">
<div class="card o-hidden border-0 shadow-lg my-3">
<div class="card-body p-0">
<div class="row p-5 bgdiv">
<div class="col-md-12" style="float: none; margin:0 auto;">
<c:if test="${member == null}">
	<form method="POST" class="user" action="login.do" id="loginform">
		<br><h1 class="text-center">로그인</h1><br>
		<div class="form-group">
			<input type="email" class="form-control form-control-user loginInput"
			placeholder="이메일을 입력해주세요" id="email" name="email"/>
		</div>
		<div class="form-group">
			<input type="password" class="form-control form-control-user loginInput"
			placeholder="비밀번호" id="pass" name="pass"/>
		</div>
        <div id="alert" class="text-center text-danger"></div>
		<br>
        <input type="button" class="btn btn-primary btn-user btn-block loginInput" value="로그인" id="login">
		<hr>
		<div class="text-center">
			<a class="small" href="register" id="register">Create an Account</a>
		</div>
	</form>
</c:if>
<c:if test="${member != null}">
	<div class="text-center text-danger">이미 로그인이 되어 있습니다.</div>
</c:if>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
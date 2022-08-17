<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <script src="resources/js/register.js"></script>
    
</head>
<body class="container bg-gradient-primary">

<div class="row justify-content-center">
<div class="col-xl-10 col-lg-12 col-md-9">
<div class="card o-hidden border-0 shadow-lg my-3">
<div class="card-body p-0">
<div class="row p-5 bgdiv">
<div class="col-md-12" style="float: none; margin:0 auto;">
	<form method="POST" class="user" action="register.do" id="registerForm">
		<br><h1 class="text-center">회원가입</h1><br>
		<div class="form-group">
			<input type="email" class="form-control form-control-user"
			placeholder="이메일 주소를 입력해주세요" id="email" name="email"/>
		</div>
		<div class="form-group row">
			<div class="col-sm-6">
				<input type="password" class="form-control form-control-user"
				placeholder="비밀번호" id="pass" name="pass"/>
			</div>
			<div class="col-sm-6">
				<input type="password" class="form-control form-control-user"
				placeholder="비밀번호 확인" id="confirmpass" name="conpass"/>
			</div>
		</div>
		<div class="form-group">
			<input type="text" class="form-control form-control-user"
			placeholder="이름" id="name" name="name">
		</div>
        <div id="alert" class="text-center text-danger"></div>
		<br>
		<br>
        <input type="button" class="btn btn-primary btn-user btn-block loginInput" value="회원가입" id="register">
		<hr>
		<div class="text-center">
			<a class="small" href="login">Already have an account? Login</a>
		</div>
	</form>
</div>
</div>
</div>
</div>
</div>
</div>
	
	<!-- Bootstrap core JavaScript-->
    <script src="resources/vendor/jquery/jquery.min.js"></script>
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/js/sb-admin-2.min.js"></script>

</body>
</html>
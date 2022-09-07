<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>

<!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <script>
    	$(document).ready(function() {
    		$(".delete").on("click", function(event) {
    			location.href = "/delete";
    		});
    	});
    </script>

</head>
<body>

<%@include file="../include/top_meun.jsp" %>

<div class="container bg-gradient">
<div class="row justify-content-center">
<div class="col-xl-10 col-lg-12 col-md-9">
<div class="card o-hidden border-0 shadow-lg my-3">
<div class="card-body p-0">
<div class="row p-5 bgdiv">
<div class="col-md-12" style="float: none; margin:0 auto;">

	<form method="POST" class="user">
		<br><h1 class="text-center">회원 정보 수정</h1><br>
		<div class="form-group">
			<div class="form-control form-control-user loginInput"
			name="email">${member.email}</div>
		</div>
		<div class="form-group">
			<input type="password" class="form-control form-control-user loginInput"
			placeholder="Password" name="pass" value="${member.pass}"/>
		</div>
		<div class="form-group">
			<input type="text" class="form-control form-control-user loginInput"
			placeholder="Name" name="name" value="${member.name}"/>
		</div>
		<br>
        <input type="submit" class="btn btn-primary btn-user btn-block loginInput" value="정보 수정">
        <br><br>
        <button type="button" class="btn btn-danger btn-user btn-block" data-toggle="modal" data-target="#exampleModal">
  			회원 탈퇴
		</button>
	</form>
	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
			<div class="modal-content">
		    	<div class="modal-header">
		        	<h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          	<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		      	<div class="modal-body">
		      		  정말 탈퇴하시겠습니까?
		      	</div>
		      	<div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        	<button type="button" class="btn btn-danger" id="delete">탈퇴</button>
		      	</div>
		    </div>
		</div>
	</div>
	
</div>
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

    <!-- Page level plugins -->
    <script src="resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="resources/js/demo/chart-area-demo.js"></script>
    <script src="resources/js/demo/chart-pie-demo.js"></script>

</body>
</html>
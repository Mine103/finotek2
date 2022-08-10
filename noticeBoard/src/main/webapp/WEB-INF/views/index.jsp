<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>

    <div id="wrapper">
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center"
            href="index">
                <div class="sidebar-brand-text mx-3">
                	게시판
                </div>
            </a>
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
            <a class="nav-link" href="write">글쓰기</a>
            <li>
            
        </ul>
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                	<form method="POST">
            			<div class="input-group">
            				<input type="text" name="search" class="form-control bg-light border-0">
            				<button class="btn btn-primary">
            					<i class="fas fa-search fa-sm"></i>
            				</button>
            			</div>
            		</form>
                    <ul class="navbar-nav ml-auto">
                    	<li class="nav-item no-arrow mx-1">
                    		<a href="login">로그인</a>
                    	</li>
                    	<li class="nav-item no-arrow mx-1">
                    		<a href="register">회원가입</a>
                    	</li>
                    	<li class="nav-item no-arrow mx-1">
                    		<a href="userinfo">회원정보수정</a>
                    	</li>
                    	<li class="nav-item no-arrow mx-1">
                    		<a href="#">로그아웃</a>
                    	</li>
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <div class="text-center">
                        	<span class="mr-2 d-none d-lg-inline text-gray-600 small">
                        		Name
                        	</span>
                        </div>
                    </ul>
                </nav>
                <br>
                <div class="container">
                	<table class="table table-striped">
                		<thead>
                			<tr>
                				<td>제목</td>
                				<td>작성자</td>
                				<td>작성일</td>
                				<td>조회수</td>
                			</tr>
                		</thead>
                		<tbody>
                			<tr>
                				<td>title</td>
                				<td>writer</td>
                				<td>date</td>
                				<td>view</td>
                			</tr>
                			<tr>
                				<td>title2</td>
                				<td>writer2</td>
                				<td>date2</td>
                				<td>view2</td>
                			</tr>
                			<tr>
                				<td>title3</td>
                				<td>writer3</td>
                				<td>date3</td>
                				<td>view3</td>
                			</tr>
                			<tr>
                				<td>title4</td>
                				<td>writer4</td>
                				<td>date4</td>
                				<td>view4</td>
                			</tr>
                		</tbody>
                	</table>
                	<hr>
                	<br>
                	<div class="text-center">
                		<ul class="pagination justify-content-center">
                			<li class="page-item">
                				<a class="page-link" href="#" aria-lable="Previous">
                					<span aria-hidden="true">&laquo;</span>
                				</a>
                			</li>
                			<li class="page-item active"><a class="page-link" href="#">1</a></li>
                			<li class="page-item"><a class="page-link" href="#">2</a></li>
                			<li class="page-item"><a class="page-link" href="#">3</a></li>
                			<li class="page-item"><a class="page-link" href="#">4</a></li>
                			<li class="page-item"><a class="page-link" href="#">5</a></li>
                			<li class="page-item"><a class="page-link" href="#">6</a></li>
                			<li class="page-item"><a class="page-link" href="#">7</a></li>
                			<li class="page-item"><a class="page-link" href="#">8</a></li>
                			<li class="page-item"><a class="page-link" href="#">9</a></li>
                			<li class="page-item"><a class="page-link" href="#">10</a></li>
                			<li class="page-item">
                				<a class="page-link" href="#" aria-lable="Next">
                					<span aria-hidden="true">&raquo;</span>
                				</a>
                			</li>
                		</ul>
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
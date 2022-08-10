<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Custom fonts for this template-->
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="page-top">

    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center"
            href="index">
                <div class="sidebar-brand-text mx-3">
                	게시판
                </div>
            </a>
            
            <hr class="sidebar-divider my-0">
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                    	<li class="nav-item no-arrow mx-1">
                    		<a href="login">로그인</a>
                    	</li>
                    	<li class="nav-item no-arrow mx-1">
                    		<a href="register">회원가입</a>
                    	</li>
                    	<li class="nav-item no-arrow mx-1">
                    		<a href="#">회원정보수정</a>
                    	</li>
                    	<li class="nav-item no-arrow mx-1">
                    		<a href="#">로그아웃</a>
                    	</li>
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <div class="text-center">
                        	<span class="mr-2 d-none d-lg-inline text-gray-600 small">
                        		Name
                        	</span>
                        </div>
                    </ul>
                </nav>
        </div>
        <!-- End of Content Wrapper -->

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
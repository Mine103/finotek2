<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>

	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
</head>
<body>
	<div id="wrapper">
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@include file="../include/top_meun.jsp" %>
                <div class="container">
                	<form method="post">
						<input type="text" name="bdTitle" class="form-control mt-4 mb-2"
							placeholder="제목을 입력해주세요." maxlenght="20" required
						>
						<div class="form-group">
							<textarea class="form-control" rows="10" name="bdContent"
								placeholder="내용을 입력해주세요" maxlenght="200" required
							></textarea>
						</div>
						<button id="write" class="btn btn-secondary mb-3">제출하기</button>
					</form>
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
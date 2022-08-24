<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>

	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <script>
    $(document).ready(function () {

        var formObj = $("form[role='form']");
        console.log(formObj);

        $(".modBtn").on("click", function () {
            formObj.attr("action", "${path}/article/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });

        $(".delBtn").on("click", function () {
           formObj.attr("action", "${path}/article/remove");
           formObj.submit();
        });

        $(".listBtn").on("click", function () {
           self.location = "${path}/article/list"
        });

    });
    </script>
</head>
<body>
	
	<%@include file="../include/top_meun.jsp" %>
	<div id="wrapper">
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@include file="../include/top_meun.jsp" %>
                <div class="container">
                	<div class="card-header">
			            <h3 class="card-title">글제목 : ${article.title}</h3>
			        </div>
			        <div class="card-body" style="height: 700px">
			            ${article.content}
			        </div>
			        <div class="card-footer">
			            <div class="user-block">
			                <img class="img-circle img-bordered-sm" src="${path}/dist/img/user1-128x128.jpg" alt="user image">
			                <span class="username">
			                    <a href="#">${article.writer}</a>
			                </span>
			                <span class="description"><fmt:formatDate pattern="yyyy-MM-dd" value="${article.regDate}"/></span>
			            </div>
			        </div>
			        <div class="card-footer">
			            <form role="form" method="post">
			                <input type="hidden" name="article_no" value="${article.article_no}">
			            </form>
			            <button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
			            <div class="float-right">
			                <button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
			                <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
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
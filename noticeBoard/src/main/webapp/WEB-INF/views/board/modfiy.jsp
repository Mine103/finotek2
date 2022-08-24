<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

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
            formObj.submit();
        });

        $(".cancelBtn").on("click", function () {
            history.go(-1);
        });

        $(".listBtn").on("click", function () {
            self.location = "${path}/article/list"
        });

    });
    </script>
</head>
<body>

	<div id="wrapper">
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <%@include file="../include/top_meun.jsp" %>
                <div class="col-lg-12">
				    <form role="form" id="writeForm" method="post" action="${path}/article/modify">
				        <div class="card">
				            <div class="card-header">
				                <h3 class="card-title">게시글 작성</h3>
				            </div>
				            <div class="card-body">
				                <input type="hidden" name="article_no" value="${article.article_no}">
				                <div class="form-group">
				                    <label for="title">제목</label>
				                    <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" value="${article.title}">
				                </div>
				                <div class="form-group">
				                    <label for="content">내용</label>
				                    <textarea class="form-control" id="content" name="content" rows="30"
				                              placeholder="내용을 입력해주세요" style="resize: none;">${article.content}</textarea>
				                </div>
				                <div class="form-group">
				                    <label for="writer">작성자</label>
				                    <input class="form-control" id="writer" name="writer" value="${article.writer}" readonly>
				                </div>
				            </div>
				            <div class="card-footer">
				                <button type="button" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button>
				                <div class="float-right">
				                    <button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i> 취소</button>
				                    <button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 저장</button>
				                </div>
				            </div>
				        </div>
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
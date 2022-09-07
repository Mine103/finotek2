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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
    $(document).ready(function () {
    	var article_no = ${article.article_no}; // 현재 게시글 번호
        var templatePhotoAttach = Handlebars.compile($("#templatePhotoAttach").html()); // 이미지 Template
        var templateFileAttach = Handlebars.compile($("#templateFileAttach").html());   // 일반파일 Template
        /*================================================게시판 업로드 첨부파일 추가관련===================================*/
        // 전체 페이지 파일 끌어 놓기 기본 이벤트 방지 : 지정된 영역외에 파일 드래그 드랍시 페이지 이동방지
        $(".content-wrapper").on("dragenter dragover drop", function (event) {
            event.preventDefault();
        });
        // 파일 끌어 놓기 기본 이벤트 방지
        $(".fileDrop").on("dragenter dragover", function (event) {
            event.preventDefault();
        });
        // 파일 드랍 이벤트 : 파일 전송 처리
        $(".fileDrop").on("drop", function (event) {
            event.preventDefault();
            var files = event.originalEvent.dataTransfer.files;
            var file = files[0];
            var formData = new FormData();
            formData.append("file", file);
            $.ajax({
                url: "/mypage/file/upload",
                data: formData,
                dataType: "text",
                processData: false,
                contentType: false,
                type: "POST",
                success: function (data) {
                    // 파일정보 가공
                    var fileInfo = getFileInfo(data);
                    // 이미지 파일일 경우
                    if (fileInfo.fullName.substr(12, 2) == "s_") {
                        var html = templatePhotoAttach(fileInfo);
                        // 이미지 파일이 아닐경우
                    } else {
                        html = templateFileAttach(fileInfo);
                    }
                    // 목록에 출력
                    $(".uploadedList").append(html);
                }
            });
        });
        // 수정 처리시 파일 정보도 함께 처리
        $("#writeForm").submit(function (event) {
            event.preventDefault();
            var that = $(this);
            var str = "";
            $(".uploadedList .delBtn").each(function (index) {
                str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>"
            });
            that.append(str);
            that.get(0).submit();
        });
        // 파일 삭제 버튼 클릭 이벤트
        $(document).on("click", ".delBtn", function (event) {
            event.preventDefault();
            if (confirm("삭제하시겠습니까? 삭제된 파일은 복구할 수 없습니다.")) {
                var that = $(this);
                $.ajax({
                    url: "/mypage/file/delete/" + article_no,
                    type: "post",
                    data: {fileName:$(this).attr("href")},
                    dataType: "text",
                    success: function (result) {
                        if (result == "DELETED") {
                            alert("삭제되었습니다.");
                            that.parents("li").remove();
                        }
                    }
                });
            }
        });
        /*================================================게시판 업로드 첨부파일 목록관련===================================*/
        $.getJSON("/mypage/file/list/" + article_no, function (list) {
            $(list).each(function () {
                var fileInfo = getFileInfo(this);
                // 이미지 파일일 경우
                if (fileInfo.fullName.substr(12, 2) == "s_") {
                    var html = templatePhotoAttach(fileInfo);
                    // 이미지 파일이 아닐 경우
                } else {
                    html = templateFileAttach(fileInfo);
                }
                $(".uploadedList").append(html);
            })
        });
        
        var formObj = $("form[role='form']");
        console.log(formObj);

        $(".modBtn").on("click", function () {
            formObj.submit();
        });

        $(".cancelBtn").on("click", function () {
            history.go(-1);
        });

        $(".listBtn").on("click", function () {
            self.location = "/list?page=${searchCriteria.page}"
                + "&perPageNum=${searchCriteria.perPageNum}"
                + "&searchType=${searchCriteria.searchType}"
                + "&keyword=${searchCriteria.keyword}";
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
				    <form role="form" id="writeForm" method="post" action="/modify">
				        <div class="card-body">
						  	<input type="hidden" name="article_no" value="${board.bno}">
						  	<input type="hidden" name="page" value="${searchCriteria.page}">
						  	<input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
						  	<input type="hidden" name="searchType" value="${searchCriteria.searchType}">
						  	<input type="hidden" name="keyword" value="${searchCriteria.keyword}">
						  	<div class="form-group">
						    	<label for="title">제목</label> <input class="form-control"
						    	id="title" name="title" placeholder="제목을 입력해주세요"
						    	value="${board.title}">
						  	</div>
						  	<div class="form-group">
						    	<label for="content">내용</label>
						    	<textarea class="form-control" id="content" name="content"
						    	rows="30" placeholder="내용을 입력해주세요" style="resize: none;">${board.content}</textarea>
						  	</div>
						  	<div class="form-group">
						    	<label for="writer">작성자</label> <input class="form-control"
						    	id="writer" name="writer" value="${board.writer}" readonly>
						  	</div>
						  	<div class="form-group">
						    	<div class="fileDrop">
						      		<br /> <br /> <br /> <br />
						      		<p class="text-center">
						        	<i class="fas fa-paperclip"></i> 첨부파일을 드래그해주세요.
						      		</p>
						    	</div>
						  	</div>
						</div>
						<div class="box-footer">
						  	<ul class="mailbox-attachments clearfix uploadedList"></ul>
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
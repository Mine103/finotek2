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
    
    <style>
    	.fileDrop {
        	width: 100%;
        	height: 200px;
        	border: 2px dotted #0b58a2;
    	}
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
	    /*====================================================게시판 첨부파일 업로드 관련======================================*/
	    $(document).ready(function () {
	        var fileDropDiv = $(".fileDrop");
	        var templatePhotoAttach = Handlebars.compile($("#templatePhotoAttach").html());
	        var templateFileAttach = Handlebars.compile($("#templateFileAttach").html());
	        // 전체 페이지 파일 끌어 놓기 기본 이벤트 방지 : 지정된 영역외에 파일 드래그 드랍시 페이지 이동방지
	        $(".content-wrapper").on("dragenter dragover drop", function (event) {
	            event.preventDefault();
	        });
	        // 파일 끌어 놓기 기본 이벤트 방지
	        fileDropDiv.on("dragenter dragover", function (event) {
	            event.preventDefault();
	        });
	        // 파일 드랍 이벤트 : 파일 전송 처리, 파일 화면 출력
	        fileDropDiv.on("drop", function (event) {
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
	                    if (data.substr(12, 2) == "s_") {
	                    	console.log("This is Image");
	                        var html = templatePhotoAttach(fileInfo);
	                    // 이미지 파일이 아닐 경우
	                    } else {
	                        html = templateFileAttach(fileInfo);
	                    }
	                    $(".uploadedList").append(html);
	                }
	            });
	        });
	        // 글 저장 버튼 클릭 이벤트 : 파일명 DB 저장 처리
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
	        // 파일 삭제 버튼 클릭 이벤트 : 파일삭제, 파일명 DB 삭제 처리
	        $(document).on("click", ".delBtn", function (event) {
	            event.preventDefault();
	            var that = $(this);
	            $.ajax({
	                url: "/mypage/file/delete",
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
	        });
	    });
	</script>
    
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
						<div class="form-group">
						  	<label for="writer">작성자</label> <input class="form-control"
						  	id="writer" name="writer" value="${login.userId}" readonly>
						</div>
						<%--첨부파일 영역 추가--%>
						<div class="form-group">
						  	<div class="fileDrop">
						    	<br/>
						    	<br/>
						    	<br/>
						    	<br/>
						    	<p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
						  	</div>
						</div>
						<%--첨부파일 영역 추가--%>
						<div class="card-footer">
							<ul class="mailbox-attachments clearfix uploadedList"></ul>
						</div>
						<%--첨부파일 하나의 영역--%>
						<%--이미지--%>
						<script id="templatePhotoAttach" type="text/x-handlebars-template">
    						<li>
        						<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        						<div class="mailbox-attachment-info">
            						<a href="{{getLink}}" class="mailbox-attachment-name" data-lightbox="uploadImages"><i class="fas fa-camera"></i> {{fileName}}</a>
            						<a href="{{fullName}}" class="btn btn-default btn-xs float-right delBtn"><i class="far fa-trash-alt"></i></a>
        						</div>
    						</li>
							</script>
						<%--일반 파일--%>
						<script id="templateFileAttach" type="text/x-handlebars-template">
    						<li>
        						<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        						<div class="mailbox-attachment-info">
            						<a href="{{getLink}}" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> {{fileName}}</a>
            						<a href="{{fullName}}" class="btn btn-default btn-xs float-right delBtn"><i class="far fa-trash-alt"></i></a>
        						</div>
    						</li>
						</script>
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
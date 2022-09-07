<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.servlet.http.HttpSession" %>
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
    $(document).ready(function () {

        var formObj = $("form[role='form']");
        console.log(formObj);

        $(".modBtn").on("click", function () {
            formObj.attr("action", "/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });
        $(".delBtn").on("click", function () {
           formObj.attr("action", "/remove");
           formObj.submit();
        });

        
     // 3번째 게시글
    	var article_no = 3;
        // 목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지)
    	var replyPageNum = 1;
    	// 댓글 목록 호출
    	getRepliesPaging(replyPageNum);
    	// 댓글 목록 출력 함수
    	function getReplies() {
    	    $.getJSON("/replies/all/" + bno, function (data) {
    	        console.log(data);
    	        var str = "";
    	        $(data).each(function () {
    	            str += "<li data-reply_no='" + this.reply_no + "' class='replyLi'>"
    	                +   "<p class='reply_text'>" + this.reply_text + "</p>"
    	                +   "<p class='reply_writer'>" + this.reply_writer + "</p>"
    	                +   "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
    	                + "</li>"
    	                + "<hr/>";

    	        });
    	        $("#replies").html(str);
    	    });
    	}
    	
    	$(".replyAddBtn").on("click",function() {
    	    // 화면으로부터 입력 받은 변수값의 처리
    	    var reply_text = $("#newReplyText");
    	    var reply_writer = $("#newReplyWriter");
    	    var reply_textVal = reply_text.val();
    	    var reply_writerrVal = reply_writer.val();
    	    console.log("1212121212");
    	    // AJAX 통신 : POST
    	    $.ajax({
    	        type : "post",
    	        url : "/replies",
    	        headers : {
    	            "Content-type" : "application/json",
    	            "X-HTTP-Method-Override" : "POST"
    	        },
    	        dataType : "text",
    	        data : JSON.stringify({
    	            bno : bno,
    	            reply_text : reply_textVal,
    	            reply_writer : reply_writerrVal
    	        }),
    	        success : function (result) {
    	            // 성공적인 댓글 등록 처리 알림
    	            if (result == "regSuccess") {
    	                alert("댓글 등록 완료!");
    	            }
    	            getRepliesPaging(replyPageNum); // 댓글 목록 출력 함수 호출
    	            reply_text.val(""); // 댓글 내용 초기화
    	            reply_writer.val(""); // 댓글 작성자 초기화
    	        }
    	    });
    	});
    	
    	$("#replies").on("click", ".replyLi button", function () {
    	    var reply = $(this).parent();
    	    var rno = reply.attr("data-reply_no");
    	    var reply_text = reply.find(".reply_text").text();
    	    var reply_writer = reply.find(".reply_writer").text();
    	    $("#rno").val(rno);
    	    $("#reply_text").val(reply_text);
    	    $("#reply_writer").val(reply_writer);
    	});
    	
    	$(".modalDelBtn").on("click", function () {
    	    // 댓글 번호
    	    var rno = $(this).parent().parent().find("#rno").val();
    	    // AJAX통신 : DELETE
    	    $.ajax({
    	        type : "delete",
    	        url : "/replies/" + rno,
    	        headers : {
    	            "Content-type" : "application/json",
    	            "X-HTTP-Method-Override" : "DELETE"
    	        },
    	        dataType : "text",
    	        success : function (result) {
    	            console.log("result : " + result);
    	            if (result == "delSuccess") {
    	                alert("댓글 삭제 완료!");
    	                $("#modifyModal").modal("hide"); // Modal 닫기
    	                getRepliesPaging(replyPageNum); // 댓글 목록 갱신
    	            }
    	        }
    	    });
    	});
    	
    	$(".modalModBtn").on("click", function () {
    	    // 댓글 선택자
    	    var reply = $(this).parent().parent();
    	    // 댓글번호
    	    var rno = reply.find("#rno").val();
    	    // 수정한 댓글내용
    	    var reply_text = reply.find("#reply_text").val();
    	    // AJAX통신 : PUT
    	    $.ajax({
    	        type : "put",
    	        url : "/replies/" + rno,
    	        headers : {
    	            "Content-type" : "application/json",
    	            "X-HTTP-Method-Override" : "PUT"
    	        },
    	        data : JSON.stringify(
    	            {reply_text : reply_text}
    	        ),
    	        dataType : "text",
    	        success : function (result) {
    	            console.log("result : " + result);
    	            if (result == "modSuccess") {
    	                alert("댓글 수정 완료!");
    	                $("#modifyModal").modal("hide"); // Modal 닫기
    	                getRepliesPaging(replyPageNum); // 댓글 목록 갱신
    	            }
    	        }
    	    });
    	});
    	
    	function getRepliesPaging(page) {
    	    $.getJSON("/replies/" + bno + "/" + page, function (data) {
    	        console.log(data);
    	        var str = "";
    	        $(data.replies).each(function () {
    	            str += "<li data-reply_no='" + this.rno + "' class='replyLi'>"
    	                +  "<p class='reply_text'>" + this.reply_text + "</p>"
    	                +  "<p class='reply_writer'>" + this.reply_writer + "</p>"
    	                +  "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
    	                +  "</li>"
    	                +  "<hr/>";
    	        });
    	        $("#replies").html(str);
    	        // 페이지 번호 출력 호출
    	        printPageNumbers(data.pageMaker);
    	    });
    	}

    	// 댓글 목록 페이지 번호 출력 함수
    	function printPageNumbers(pageMaker) {
    	    var str = "";
    	    // 이전 버튼 활성화
    	    if (pageMaker.prev) {
    	        str += "<li class=\"page-item\"><a class=\"page-link\" href='"+(pageMaker.startPage-1)+"'>이전</a></li>";
    	    }
    	    // 페이지 번호
    	    for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
    	        var strCalss = pageMaker.criteria.page == i ? 'class=active' : '';
    	        str += "<li class=\"page-item\" "+strCalss+"><a class=\"page-link\" href='"+i+"'>"+i+"</a></li>";
    	    }
    	    // 다음 버튼 활성화
    	    if (pageMaker.next) {
    	        str += "<li class=\"page-item\"><a class=\"page-link\" href='"+(pageMaker.endPage + 1)+"'>다음</a></li>";
    	    }
    	    $(".pagination-sm").html(str);
    	}

    	// 목록페이지 번호 클릭 이벤트
    	$(".pagination").on("click", "li a", function (event) {
    	    event.preventDefault();
    	    replyPageNum = $(this).attr("href"); // 목록 페이지 번호 추출
    	    getRepliesPaging(replyPageNum); // 목록 페이지 호출
    	});
    });
    </script>
</head>
<body>
	
	<%@include file="../include/top_meun.jsp" %>
	<div id="wrapper">
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <div class="container">
                	<div class="card-header">
			            <h3 class="card-title">글제목 : ${board.title}</h3>
			        </div>
			        <div class="card-body" style="height: 700px">
			            ${board.content}
			        </div>
			        <div class="card-footer">
			            <div class="user-block">
			            	<span class="username">
			                    <a href="#">${board.writer}</a>
			            	</span>
			            	<span class="description"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></span>
			        	</div>
			        </div>
			        <div class="card-footer">
			            <form role="form" method="post">
			                <input type="hidden" name="bno" value="${board.bno}">
			            </form>
			            <button type="submit" class="btn btn-primary listBtn invisible"><i class="fa fa-list"></i> 목록</button>
			            <div class="float-right">
			                <c:if test="${member.name eq board.writer}">
			                	<button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
			                	<button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
			                </c:if>
			            </div>
			        </div>
                </div>
                <div class="col-lg-12">
    				<div class="card">
        				<div class="card-header with-border">
            				<h3 class="card-title">댓글 작성</h3>
        				</div>
        				<div class="card-body">
            				<div class="row">
            				<div class="form-group col-sm-8">
            				<input class="form-control input-sm" id="newReplyText"
            				type="text" placeholder="댓글 입력...">
				            </div>
				            <div class="form-group col-sm-2">
				            <input class="form-control input-sm" id="newReplyWriter" type="text" placeholder="작성자">
							</div>
							<div class="form-group col-sm-2">
							<button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn">
							<i class="fa fa-save"></i> 저장
							</button>
						</div>
						</div>	
				        </div>
				        <div class="card-footer">
				            <ul id="replies">
				
				            </ul>
				        </div>
				        <div class="card-footer">
						<nav aria-label="Contacts Page Navigation">
				                <ul class="pagination pagination-sm no-margin justify-content-center m-0">
				
				                </ul>
				            </nav>
				        </div>
				    </div>
				  </div>

				  <div class="modal fade" id="modifyModal" role="dialog">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal">&times;</button>
				                <h4 class="modal-title">댓글 수정창</h4>
				            </div>
				            <div class="modal-body">
				                <div class="form-group">
				                    <label for="reply_no">댓글 번호</label>
				                    <input class="form-control" id="reply_no" name="reply_no" readonly>
				                </div>
				                <div class="form-group">
				                    <label for="reply_text">댓글 내용</label>
				                    <input class="form-control" id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요">
				                </div>
				                <div class="form-group">
				                    <label for="reply_writer">댓글 작성자</label>
				                    <input class="form-control" id="reply_writer" name="reply_writer" readonly>
				                </div>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
				                <button type="button" class="btn btn-success modalModBtn">수정</button>
				                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
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
	
</body>
</html>
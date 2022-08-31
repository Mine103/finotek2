<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>

	<!-- Custom fonts for this template-->
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
            formObj.attr("action", "${path}/board/modify");
            formObj.attr("method", "get");
            formObj.submit();
        });

        $(".delBtn").on("click", function () {
           formObj.attr("action", "${path}/board/remove");
           formObj.submit();
        });

        $(".listBtn").on("click", function () {
           self.location = "${path}/board/list"
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
			            <h3 class="card-title">글제목 : title</h3>
			        </div>
			        <div class="card-body" style="height: 700px">
			            content
			        </div>
			        <div class="card-footer">
			            <div class="user-block">
			                <span class="username">
			                    <p>writer</p>
			                </span>
			            </div>
			        </div>
			        <div class="card-footer">
			            <form role="form" method="post">
			                <input type="hidden" name="bno" value="1">
			            </form>
			            <button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
			            <div class="float-right">
			                <button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
			                <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
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
  <div class="card card-primary card-outline">
  <%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
  <div class="card-header">
  <a href="" class="link-black text-lg"><i class="fas fa-comments margin-r-5 replyCount"></i></a>
    <div class="card-tools">
      <button type="button" class="btn primary"  data-widget="collapse">
          <i class="fa fa-plus"></i>
      </button>
    </div>
  </div>
  <%--댓글 목록--%>
  <div class="card-body repliesDiv">
  
  </div>
  <%--댓글 페이징--%>
  <div class="card-footer">
    <nav aria-label="Contacts Page Navigation">
    <ul class="pagination pagination-sm no-margin justify-content-center m-0">

    </ul>
    </nav>
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
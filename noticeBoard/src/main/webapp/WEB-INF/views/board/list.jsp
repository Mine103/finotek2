<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>c
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
    
    <script>
    	$(document).ready(function() {
    		var result = "${msg}";
    		if (result == "regSuccess") {
    		    alert("게시글 등록이 완료되었습니다.");
    		} else if (result == "modSuccess") {
    		    alert("게시글 수정이 완료되었습니다.");
    		} else if (result == "delSuccess") {
    		    alert("게시글 삭제가 완료되었습니다.");
    		}
    	});
    </script>
</head>
<body>

	<div id="wrapper"> 
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
			    <div class="container">
					<table class="table table-striped">
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
			                	<td>작성자</td>
			                	<td>작성일</td>
			                	<td>조회수</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boards}" var="board">
								<tr>
									<td>${board.bno}</td>
									<td><a href="/read?bno=${board.bno}">${board.title}</a></td>
									<td>${board.writer}</td>
									<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd a HH:mm"/></td>
									<td>${board.viewCnt}</td>
								</tr>
							</c:forEach> 
						</tbody>
					</table>
					<hr>
					<br>
					<div class="text-center">
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item">
									<a class="page-link" href="#" aria-lable="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li class="page-item"
        							<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
        							<a class="page-link" href="${path}/article/listPaging?page=${idx}">${idx}</a>
        						</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        						<li class="page-item"><a class="page-link"
        						href="${path}/article/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
      						</c:if>
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
	
</body>
</html>
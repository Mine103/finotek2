<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<body>
	
	<%@include file="../include/top_meun.jsp" %>
	
	<div class="container">
		<div class="text-center">"${search}"에 대한 검색결과 입니다.</div><br>
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
				
			</tbody>
		</table>
	</div>
	
</body>
</html>
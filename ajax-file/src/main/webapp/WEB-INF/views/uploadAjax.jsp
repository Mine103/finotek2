<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax</h1>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<div class="oImg">
		
	</div>
	
	<div class="uploadResult">
		<ul>
			
		</ul>
	</div>
	
	<button id="uploadBtn">Submit</button>
	
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script>
		$(document).ready(function() {
			var regex = new RegExp("(.*?)\.(exe|sh|js|alz)$");
			var maxSize = 5242880;
			
			function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize) {
					alert("파일사이즈 초과");
					return false;
				}
				if(regex.test(fileName)) {
					alert("허용되지 않은 확장자");
					return false;
				}
				return true;
			}
			
			var uploadResult = $(".uploadResult ul");
			
			function showUploadFile(uploadResultArr) {
				var str = "";
				$(uploadResultArr).each(function(i, ojb) {
					if(!ojb.image) {
						var fileCallPath = encodeURIComponent(ojb.uploadPath+"/"+ojb.uuid+"_"+ojb.fileName);
						
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						
						str += "<li><a herf='/download?fileName="+fileCallPath+"'>'"
							+"<img src='/controller/resources/img/file_img.png'>"+ojb.fileName+"</a>"
							+"<span data-file=\'"+fileCallPath+"\' data-type='file'></span></li>";
					} else {
						var fileCallPath = encodeURIComponent(ojb.uploadPath +
								"/s_"+ojb.uuid+"_"+ojb.fileName);
						var originPath = ojb.uploadPath+"\\"+ojb.uuid+"_"+ojb.fileName;
						originPath = originPath.replace(new RegExp(/\\/g), "/");
						str += "<li><a "
						+"herf='javascript:showImage(\""+originPath+"\")>'"
						+"<img src='/display?fileName="+fileCallPath+"''>"+ojb.fileName+"</a>"
						+"<span data-file=\'"+fileCallPath+"\' data-type='file'></span></li>";
					}
				});
				uploadResultArr.append(str);
			}
			
			function showImage(fileCallPath) {
				alert(fileCallPath);
				$(".oImg").html("<img src='.display?fileName='"+encodeURI(fileCallPath)+
						"' style='width=600px; height:600px' >")
			}
			
			var cloneOjb = $(".uploadDiv").clone();
			
			$("#uploadBtn").on('click', function(e) {
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
				
				console.log(files);
				
				for(var i = 0; i < files.length; i++) {
					if(!chechExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : "/uploadAjaxAction",
					processData : false,
					contentType : false,
					data : formData,
					type : "POST",
					dataType : "json",
					success : function(result) {
						alert("Uploaded");
						$(".uploadDiv").html(cloneOjb.html());
						
						showUploadFile(result);
					}
				});
			});
			
			$(".uploadResult").on("click", "span", function(e) {
				alert("1");
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				
				$.ajax({
					url : '/deleteFile',
					data : {fileName: targetFile, type : type},
					dataType : 'text',
					type : 'POST',
					success : function(result) {
						alert(result);
					}
				});
			})
		});
	</script>
</body>
</html>
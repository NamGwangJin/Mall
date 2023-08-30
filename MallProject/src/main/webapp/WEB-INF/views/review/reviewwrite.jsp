<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/star.css" rel="stylesheet"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<title>게시물 작성</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto;}
h1{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto; }
table td { border : 1px solid black; }

</style>
<body align=center>
<table>
${reviewwrite}
<form method='post' action='/insert1' id=frmInsert name=frmInsert>
<input type=hidden name=prod_name value="${prod_name}">
<tr><td colspan=2><h1>후기 작성</h1></td></tr>
<tr><td>별점</td><td>
	<div class="star-rating space-x-4 mx-auto">
		<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
		<label for="1-star" class="star pr-4">★</label>
		<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
		<label for="4-stars" class="star">★</label>
		<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
		<label for="3-stars" class="star">★</label>
		<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
		<label for="2-stars" class="star">★</label>
		<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
		<label for="1-star" class="star">★</label>
</div>
</td></tr>
<tr><td>제목</td><td><input type=text name=title id=title maxlength=128 style='width:90%'></td></tr>
<tr><td>내용</td><td><textarea rows=10 cols=50 name=content id=content style='width:90%'></textarea></td></tr>
<tr><td>이미지</td><td>
<input type=hidden name=img id=img size=64 maxlength=128 value="">
<td><input type=submit id=btnSubmit name=btnSubmit value='작성'></td></tr>
</form>
<form id="uploadForm1" action="/upload1" method="post" enctype="multipart/form-data">
        <!-- <label for="file1"></label> -->
        <input type="file" id="file1" name="file1" value=""><br>
        <input type="submit" value="상품이미지업로드">
</form>
<div id="reviewUploadResult">

</div>
<tr><td><a href="review"><h3>목록으로</h3></a></td>

</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function () {
	
    $('#uploadForm1').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/upload1', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#reviewUploadResult').html(response);
                $('#img').val($('#filename1').text());
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#reviewUploadResult').text('파일 업로드 실패');
            }
        });
    });
})
</script>
</html> 
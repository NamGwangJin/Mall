<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>SimpleShop</title>
    <meta charset="UTF-8">
    <link href="css/mall.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
  </head>   
<body>
   
<h1 align=center>인서트 테스트</h1>
<tr><td><a href="/">메인화면으로</a></td>
<!-- <form action="/insert" method="post" enctype="multipart/form-data"> -->
<!-- 	 	<fieldset> -->
<!-- 			<legend>상품 이미지 업로드</legend> -->
			
<!-- 			<p>파일명 : <input type="file" name="file"></p> -->
<!-- 			<p><input type="submit" value="upload"></p>	 	 -->
<!-- 	 	</fieldset> -->
<!-- </form> -->

<form method="post" action="/insert" id=frmInsert name=frmInsert
 enctype="multipart/form-data"  >

<table>
<%-- <tr><td>상품번호</td><td>${rowid}</td></tr> --%>
<tr><td>상품명</td><td><input type=text name=name id=name size=64 maxlength=128></td></tr>
<tr><td>상품설명</td><td><textarea rows=10 cols=61 name=comment id=comment></textarea></td></tr>
<tr><td>가격</td><td><input type=text name=price id=price size=64 maxlength=128></td></tr>
<tr><td>이미지이름<td><input type=text name=img id=img size=64 maxlength=128></td>
<!-- <fieldset> -->
<!-- 			<legend>상품 이미지 업로드</legend> -->
			
<!-- 			<p>파일명 : <input type="file" name="img" id=img></p> -->
			
<!-- </fieldset> -->
</td></tr>


<td style='text-align:right'>


<input type=submit id=btnSubmit name=btnSubmit value='상품 등록하기'>&nbsp;&nbsp;
</td></tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#frmInsert',function(){
	
})
</script>
</html>
</body>
</html>
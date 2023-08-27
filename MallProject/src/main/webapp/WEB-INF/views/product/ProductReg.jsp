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
<div class="navbar">
    <a href="/" id="logo">
        <img src="img/weverslogo.jpg" width="149">
    </a>
    <ul id="menu">
    	<input type=hidden name=id value="${id}">
    	<li><a href="#">${review}</a></li>
    	<li><a href="#">${bbs}</a></li>
        <li><a href="/cartList?id=${id}">장바구니</a></li>
        <li><a href="/orderList?id=${id}">주문/배송조회</a></li>
        <li><a href="/mypage">${infoline}</a></li>
        <li>${inforeg}</li>
    </ul>
</div>
   
<h1 align=center>상품 등록하기</h1>
<a href="/">메인화면으로</a>

 <form id="uploadForm" action="/upload" method="post" enctype="multipart/form-data">
        <label for="file">상품 이미지 선택:</label>
        <input type="file" id="file" name="file" value=""><br>
        <input type="submit" value="상품이미지업로드">
</form>

<div id="uploadResult">

</div>

<br><br>
<form method="post" action="/insert" id=frmInsert name=frmInsert>
<table>
<tr><td>상품명</td><td><input type=text name=prod_name id=prod_name size=64 maxlength=128></td></tr>
<tr><td>상품설명</td><td><textarea rows=10 cols=61 name=prod_msg id=prod_msg></textarea></td></tr>
<tr><td>가격</td><td><input type=text name=prod_price id=prod_price size=64 maxlength=128></td></tr>
<tr><td><td><input type=text name=prod_img id=prod_img size=64 maxlength=128 value=""></td></tr>
<tr><td style='text-align:right'><input type=submit id=btnSubmit name=btnSubmit value='상품 등록하기'>&nbsp;&nbsp;<br></td></tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

$(document)
.ready(function () {
    $('#uploadForm').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/upload', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#uploadResult').html(response);
                $('#prod_img').val($('#filename').text());
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#uploadResult').text('파일 업로드 실패');
            }
        });
    });
})
.on('click','#test',function(){
	console.log($('#prod_name').val());
})
;
</script>
</body>
</html>
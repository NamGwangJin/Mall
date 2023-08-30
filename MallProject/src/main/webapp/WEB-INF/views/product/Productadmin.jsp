<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>상품관리자</title>
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
       
        <li><a href="/mypage">${infoline}</a></li>
        <li>${inforeg}</li>
    </ul>
</div>
   
   
   
   
   
<a href="/ProductReg">상품 새로 등록하기</a>

 <form id="uploadForm" action="/regProductList" method="post">
       
        <input type="submit" value="등록된상품불러오기">
</form>
<div id="regProductListResult">
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function () {
    $('#uploadForm').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/regProductList', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#regProductListResult').html(response);
                
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#regProductListResult').text('불러오기 실패');
            }
        });
    });
});
</script>
</html>

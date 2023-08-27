<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>Weverse</title>
</head>
<style>
table {width : 80%; margin-left:auto; margin-right:auto; }
#tblBoard{border-collapse : collapse;}
#tblBoard th { background-color :white; color :black; border : 1px solid gray; }
#tblBoard td { border : 1px solid black; cursor : pointer; }
</style>
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
        <li><a href="/mypage"></a>${infoline}</li>
        <li>${inforeg}</li>
    </ul>
</div>


    <table id=tblBoard>
	<thead>
		<tr><th>게시물 번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성시각</th><th>수정시각</th></tr>
	</thead>
	<tbody>
	<c:forEach items="${mlist}" var="list">
	<tr><td>${list.num}</td><td>${list.title}</td><td>${list.writer}</td><td>${list.hit}</td><td>${list.created}</td><td>${list.updated}</td></tr>
	</c:forEach>
	</tbody>
	</table>
	<table>
	<tr>
		<!-- <td style='text-align:right;'><a href='/write'><h3>게시물 작성</h3></a></td> -->
		<td style='font-size:18px;'>${pagestr}</td>
		<td>${write}</td>
	</tr>
</table>
    
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).on('click', '.product', function() {
    var productName = $(this).attr('num');
    document.location = "/product?num=" + encodeURIComponent(productName);
})
.on('click','#logout',function(){
    if(!confirm('정말로 로그아웃할까요?')){
        return false;
    } else {			
        document.location= "/logout";
    }
});
</script>
</html>
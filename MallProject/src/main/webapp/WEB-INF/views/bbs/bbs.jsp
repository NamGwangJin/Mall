<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<link href="resources/css/bbs.css" rel="stylesheet"/>
<title>Weverse</title>
</head>
<body>
<div class="navbar">
    <a href="/" id="logo">
        <img src="img/weverslogo.jpg" width="149">
    </a>
    <ul id="menu">
    	<input type=hidden name=id value="${id}">

    	<li><a href="#">${bbs}</a></li>
        <li><a href="/cartList?id=${id}">장바구니</a></li>
        <li><a href="/orderList?id=${id}">주문/배송조회</a></li>
        <li><a href="/mypage"></a>${infoline}</li>
        <li>${inforeg}</li>
    </ul>
</div>
 <h1 class="con">게시글 목록</h1>
    <section class="article-list table-common con">
     <table border="1" id=tblBoard>
	<thead>
		<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성시각</th><th>조회수</th></tr>
	</thead>
	<tbody>
	<c:forEach items="${mlist}" var="list">
	<tr><td>${list.num}</td><td>${list.title}</td><td>${list.writer}</td><td>${list.created}</td><td>${list.hit}</td></tr>
	</c:forEach>
	</tbody>
	</table>
	<table>
	<tr>
		<td>${write}</td>
	</tr>
</table>

      <div class="pagination">
    <a class="pagination__button pagination__button--prev pagination__button--disabled">&lt;</a>
    <a class="pagination__button pagination__button--active" href="">${pagestr}</a>
    <a class="pagination__button pagination__button--next" href="" data-remote="true">&gt;</a>
  </div>
    
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#tblBoard tbody tr',function(){
	document.location = '/view?num=' + $(this).find('td:first').text();
	return false;
})
.on('click','#logout',function(){
    if(!confirm('정말로 로그아웃할까요?')){
        return false;
    } else {			
        document.location= "/logout";
    }
})
</script>
</html>
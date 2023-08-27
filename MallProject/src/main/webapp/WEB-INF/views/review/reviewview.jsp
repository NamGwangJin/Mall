<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${rPost.title}</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto; }
table td { border : 1px solid black; }
</style>
<body align=center>
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
<table>
<tr><td colspan=2><h1>후기 보기</h1></td></tr>
<tr><td>게시물 번호</td><td id=num>${rPost.num}</td></tr>
<tr><td>제목</td><td>${rPost.title}</td></tr>
<tr><td>내용</td><td><textarea rows=10 cols=50 readonly>${rPost.content}</textarea></td></tr>
<tr><td>작성자</td><td>${rPost.writer}</td></tr>
<tr><td>조회수</td><td>${rPost.hit}</td></tr>
<tr><td>작성시각</td><td>${rPost.created}</td></tr>
<tr><td>수정시각</td><td>${rPost.updated}</td></tr>
<tr><td colspan=2><a href="/">목록보기</a>&nbsp;
<c:if test="${id==rPost.reviewwriter}">
<a href='/write'>게시물 작성</a>&nbsp;&nbsp;
<button id=btnUd style='background-color:blue; color:white;'>수정</button>
<button id=btnDel style='background-color:red; color:white;'>삭제</button></td></tr>
</c:if>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#btnDel',function(){
	if(!confirm('정말로 삭제하시겠습니까?')) return false;
	
	document.location = '/delete?num='+$('#num').text();
	alert("삭제가 완료되었습니다.");
	return false;
})
.on('click','#btnUd',function(){
	document.location = '/update?num='+$('#num').text();
	return false;
})
</script>
</html>
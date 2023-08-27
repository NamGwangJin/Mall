<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<style>
table {
border: 2px solid teal;
width:500px;
border-collapse:collapse;
margin:auto;
align:center;
}
td {
width:33%;
height:40%;
border:1px solid teal;
text-align:center;
}
</style>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>마이페이지</title>
</head>
<body>
<div class="navbar">
    <a href="/" id="logo">
        <img src="img/weverslogo.jpg" width="149">
    </a>
    <ul id="menu">          
        <li><a href="/cartList?id=${id}">장바구니</a></li>
        <li><a href="/orderList?id=${id}">주문/배송조회</a></li>
        <li>${infoline}</li>
        <li>${inforeg}</li>
    </ul>
</div>
<h1 align="center">${info} 님 반갑습니다!</h1>
<div class="">
	<table>
		<tr>
			<td>* 아이디</td><td><input type=text value="${imp.user_id}" id=userid readonly></td>
		</tr>
		<tr>
			<td>* 이름</td><td><input type=text value="${imp.user_name }" readonly></td>
		</tr>
		<tr>
			<td>* 연락처</td><td><input type=text value="${imp.user_mobile}" readonly></td>
		</tr>
		<tr>
			<td>* 이메일</td><td><input type=text value="${imp.user_email }" readonly></td>
		</tr>
		<tr>
			<td>* 주소</td><td><input type=text value="${imp.user_address }" readonly></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="수정하기">
			<button id = quit>탈퇴하기</button>
			</td>
		</tr>
	</table>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#logout',function(){
    if(!confirm('정말로 로그아웃할까요?')){
        return false;
    } else {			
        document.location= "/logout";
    }
})
.on('click','#quit',function(){
	if(!confirm('정말로 탈퇴하시겠습니까?')){
		return false;
	} else {
		alert("정상적으로 탈퇴되었습니다.");
		document.location= "/quit?user_id="+$('#userid').val();
	}
});
</script>
</html>
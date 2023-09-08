<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="myPagelnbWrapper css-jo3gxq-defaultStyle">
<div class="mypageLnb">
<h2 class="mypageLnbTitle">

<a href="/mypage" style="font-size: inherit; color:#25C7A0;">MY Weverse</a></h2>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">MY 주문정보</h3>

<ul class="myPageLnbList">
<li><a href="/orderList?id=${id}">주문/배송 조회</a></li>
<li><a href="/orderList?id=${id}">취소/반품/교환 조회</a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">MY 쇼핑활동</h3>

<ul class="myPageLnbList">
<li><a href="/question">1:1 문의 내역</a></li>
<li><a href="/questionwrite">상품문의</a></li>
<li><a href="/bbs">게시판</a></li>
<li><a href="/faq">FAQ</a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">MY 회원정보</h3>

<ul class="myPageLnbList">
<li><a href="/profile">회원 정보 관리</a></li>
<li><a href="/delivery">배송 정보 관리</a></li>
</ul>
</div>
</div>
</div>
</body>
</html>
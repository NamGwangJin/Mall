<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html class="scrollbar-custom use-webfont">
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>회원정보관리</title>
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<style data-styled="" data-styled-version="5.3.5"></style>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
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
		<!-- 헤더 아이디&이메일 -->
<div class="body">
<div class="MoreLayoutView_container__8Ahvr">
<div class="MoreHeaderView_container__kK6Wj">
	<div class="MoreHeaderView_inner__BRiQZ">
		<div class="MoreHeaderView_profile_wrap__Y9XWQ">
			<div class="MoreHeaderView_name__4ZkcS">
				<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
				${imp.user_id}님 환영합니다.</h2>
			</div>
			<address class="MoreHeaderView_email__Ui6wT">${imp.user_email }</address>
		</div>
		<!-- 수정/탈퇴 버튼 -->
		<div class="MoreHeaderView_button_wrap__B-cQ2">
			<a href="#" class="MoreHeaderView_button_item__gv6pa">수정하기</a>
			<a href="/quit" id = quit class="MoreHeaderView_button_item__gv6pa">탈퇴하기</a>
		</div>
	</div>
</div>

<!-- 사이드메뉴 -->

<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="myPagelnbWrapper css-jo3gxq-defaultStyle">
<div class="mypageLnb">
<h2 class="mypageLnbTitle">

<a href="/mypage" style="font-size: inherit; color:#25C7A0;">MY Weverse</a></h2>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">MY 주문정보</h3>

<ul class="myPageLnbList">
<li><a href="#">주문/배송 조회</a></li>
<li><a href="#">취소/반품/교환 조회</a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">MY 쇼핑혜택</h3>

<ul class="myPageLnbList">
<li><a href="#">쿠폰</a></li>
<li><a href="#">마일리지</a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">MY 쇼핑활동</h3>

<ul class="myPageLnbList">
<li><a href="#">나의 찜</a></li>
<li><a href="#">상품리뷰</a></li>
<li><a href="#">1:1 문의 내역</a></li>
<li><a href="#">상품문의</a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">MY 회원정보</h3>

<ul class="myPageLnbList">
<li><a href="/profile">회원 정보 관리</a></li>
<li><a href="#">배송 정보 관리</a></li>
<li><a href="#">SNS연결 설정</a></li>
<li><a href="#">개인정보 이용내역</a></li>
</ul>
</div>
</div>
</div>

<!-- 마이페이지 -->
<div class="myPageContainer">
<div class="css-koqdwb-defaultStyle">
<div class="mypageTitleBox mainTitle borderStyle css-qma8am-mypageTitleStyle">
<div class="titleArea">
<h2 class="title">회원 정보 관리</h2>
</div>
<div class="rightArea">
</div>
</div>
<!-- 마이페이지헤더끝 -->

<div class="myp-form-wrap">
<p class="form-title">회원정보</p>

<div class="myp-form-col">
<div class="input-group inline">
<label class="control-label">이름</label>
<div class="static-field">
<input type="text" name="hp_tail1" value="${imp.user_name }">
</div>
</div>
<div class="input-group inline">
<label class="control-label">아이디</label>
<div class="control-field">
<input type="text" name="email" value="${imp.user_id}">
</div>
</div>
<div class="input-group inline">
<label class="control-label">생년월일</label>
<div class="control-field">
<input type="text" name="email" value="${imp.user_birthday }">
</div>
</div>
</div>
<div class="input-group" style="display: block;">
</div>

<p class="form-title multi">연락처</p>
<div class="myp-form-col">
<div class="input-group inline">
<label class="control-label">전화</label>
<div class="control-field col">
<input type="text" placeholder="" name="hp_tail0" value="${imp.user_mobile }">
</div>
</div>
<div class="input-group inline">
<label class="control-label">이메일</label>
<div class="control-field">
<input type="text" name="email" value="${imp.user_email }">
</div>
</div>
</div>
</div>

<div class="lnb-form-action">
<button class="btn btn-default" onclick="location.href='/mypage';">취소</button>
<button class="btn btn-default btn-primary">확인</button>
</div>
</div>
</div>
<!-- 마이페이지끝 -->
</div>
</div>
</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#logout',function(){
    if(!confirm('정말로 로그아웃할까요?')){
        return false;
    } else {			
    	alert('정상적으로 로그아웃되었습니다.');
        document.location= "/logout";
    }
});
</script>

</html>
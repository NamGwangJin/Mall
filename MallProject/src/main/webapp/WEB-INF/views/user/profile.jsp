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
<%@ include file="..\header.jsp" %>
		<!-- 헤더 아이디&이메일 -->
<div class="body" style="margin-top:50px;">
<div class="MoreLayoutView_container__8Ahvr">
<div class="MoreHeaderView_container__kK6Wj">
	<div class="MoreHeaderView_inner__BRiQZ">
		<div class="MoreHeaderView_profile_wrap__Y9XWQ">
			<div class="MoreHeaderView_name__4ZkcS">
				<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
				${imp.user_name}님 환영합니다.</h2>
			</div>
			<address class="MoreHeaderView_email__Ui6wT">${imp.user_email }</address>
		</div>
		<!-- 수정/탈퇴 버튼 -->
		<div class="MoreHeaderView_button_wrap__B-cQ2">
<input type="button" value="${imp.user_id}" id=userid class="MoreHeaderView_button_item__gv6pa1"> 
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
<li><a href="/orderList?id=${id}">주문/배송 조회</a></li>
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
<li><a href="/bbs">게시판</a></li>
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
<input type="text" name="hp_tail1" value="${imp.user_name }" readonly>
</div>
</div>
<div class="input-group inline">
<label class="control-label">아이디</label>
<div class="control-field">
<input type="text" name="email" value="${imp.user_id}" readonly>
</div>
</div>
<div class="input-group inline">
<label class="control-label">생년월일</label>
<div class="control-field">
<input type="text" name="email" value="${imp.user_birthday }" readonly>
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
<input type="text" name="mobile" value="${imp.user_mobile }" readonly>
</div>
</div>
<div class="input-group inline">
<label class="control-label">주소</label>
<div class="control-field">
<input type="text" name="address" value="${imp.user_address }" readonly>
</div>
</div>
<div class="input-group inline">
<label class="control-label">이메일</label>
<div class="control-field">
<input type="text" name="email" value="${imp.user_email }" readonly>
</div>
</div>
</div>

<p class="form-title multi">가입일자</p>
<div class="myp-form-col">
<div class="input-group inline">
<label class="control-label"></label>
<div class="control-field col">
<input type="text" name="mobile" value="${imp.signup_date }" readonly>
</div>
</div>
</div>


<div class="lnb-form-action">
<button class="btn btn-default" onclick="location.href='/mypage';">취소</button>
<button class="btn btn-default btn-primary" onclick="location.href='/mypage';">확인</button>
</div>
</div>
</div>
<!-- 마이페이지끝 -->
</div>
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
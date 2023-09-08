<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html class="scrollbar-custom use-webfont">
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<style data-styled="" data-styled-version="5.3.5"></style>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
</head>
<body>
<%@ include file="../header.jsp" %>
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
			<a href=/logout name=logout class="MoreHeaderView_button_item__gv6pa" >로그아웃</a>
			<a href="/quit" id=quit class="MoreHeaderView_button_item__gv6pa">탈퇴하기</a>
		</div>
	</div>
</div>


<!-- 헤더끝 -->
<!-- 본문 시작 -->

<div class="mypageWrapper css-11849r4-defaultStyle">

<!-- 사이드 시작 -->

<%@ include file="side.jsp" %>
<!-- 사이드 끝  -->

<!-- 회원정보 본문 시작  -->
<div class="myPageContainer">
<div class="css-man8h3-defaultStyle">
<div class="userBaseInfo">
<div class="userGradeBox gradeType1">
<div class="grade">
<a class=" css-n2sa3z-defaultStyle-underlineStyle-Linked">
<i class="ico"></i>
</a>
</div>
<div class="gradeDetail">
<strong>${imp.user_id}님</strong>
<p>이 달의 회원 등급<a class=" css-n2sa3z-defaultStyle-underlineStyle-Linked" href="#">
<strong class="gradeText">JOKEBEAR+</strong>
<i class="css-f0fihq-defaultStyle-icon_094-Icon">
<b class="css-1ypm30w-ir"></b>
</i>
</a>
</p>
</div>
</div>

<ul class="benefitList">
<li>
<em>마이위버스포인트</em>
<div class="itemDisplayTooltip  css-li9w5-defaultStyle"></div>

<div class="num">
<strong>0</strong> P</div></li>
</ul>
</div>

<div class="userTimelineBox">
<div class="mypageTitleBox subTitle  css-qma8am-mypageTitleStyle">
<div class="titleArea">
<h2 class="title">MY 주문정보</h2>
<p>(최근 15일 기준)</p>
</div>
<div class="rightArea">
<a class=" css-n2sa3z-defaultStyle-underlineStyle-Linked" href="/orderList?id=${id}">전체보기
<i class="css-f0fihq-defaultStyle-icon_094-Icon">
<b class="css-1ypm30w-ir"></b>
</i>
</a>
</div>
</div>
<div class="orderSummaryBox">
<ul>
<li>
<em>결제완료</em>
<a class="num css-y9z3ts-defaultStyle-Linked" href="#">0</a>
</li>
<li class="type1"><em>상품준비중</em>
<a class="num css-y9z3ts-defaultStyle-Linked" href="#">0</a>
</li>
<li class="type2">
<em>배송중</em>
<a class="num css-y9z3ts-defaultStyle-Linked" href="#">0</a>
</li>
<li>
<em>배송완료</em>
<a class="num css-y9z3ts-defaultStyle-Linked" href="#">0</a>
</li>
<li>
<em>취소/반품/교환</em>
<a class="num css-y9z3ts-defaultStyle-Linked" href="#">0</a>
</li>
</ul>
</div>
</div>
<!-- <div class="mypageTitleBox subTitle borderStyle css-qma8am-mypageTitleStyle"> -->
<!-- <div class="titleArea"> -->
<!-- <h2 class="title">찜한 상품</h2> -->
<!-- </div> -->
<!-- <div class="rightArea"> -->
<!-- <a class="underlineBtn css-n2sa3z-defaultStyle-underlineStyle-Linked" href="#">전체보기 -->
<!-- <i class="css-f0fihq-defaultStyle-icon_094-Icon"> -->
<!-- <b class="css-1ypm30w-ir"></b> -->
<!-- </i> -->
<!-- </a> -->
<!-- </div> -->
<!-- </div> -->
<!-- <div class="wishList"> -->
<!-- <ul> -->
<!-- <li class="css-1eog3zh-noResultStyle-MypageMainWishItem"> -->
<!-- <div class="emptyBox css-szzxfb-noResultStyle-MyPageNoResult"> -->
<!-- <p class="mainText">찜한 상품이 없습니다.</p> -->
<!-- <p class="subText">이번 주에 가장 잘 팔리는 베스트 상품을 확인해보세요.</p> -->
<!-- <a class="LinkerMoveTo css-y9z3ts-defaultStyle-Linked" href="#">바로가기</a> -->
<!-- </div> -->
<!-- </li> -->
<!-- </ul> -->
<!-- </div> -->

<!-- </div> -->
</div> <!-- 마이페이지 컨테이너 -->
</div>



<!-- 헤더 div 끝 -->
</div> <!-- 전체배경색상 -->
</div> <!-- body -->
<!-- 
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
-->
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
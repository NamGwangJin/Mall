<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html class="scrollbar-custom use-webfont">
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<style data-styled="" data-styled-version="5.3.5"></style>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
<title>쿠폰</title>
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
<li><a href="/coupon">쿠폰</a></li>
<li><a href="#">MY포인트</a></li>
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
<!-- 헤더& 사이드메뉴 끝 // 쿠폰정보-->
<div class="myPageContainer">
<div class="css-omrrhd-defaultStyle">
<div class="mypageTitleBox mainTitle  css-qma8am-mypageTitleStyle">
<div class="titleArea">
<h2 class="title">쿠폰</h2>
</div>
<div class="rightArea">
</div>
</div>
	<div class="couponHead">
	<div class="couponTotal">보유 쿠폰 총 ${imp.user_id }장</div>
	<div class="couponReg">
	<button type="button" class=" css-nc9j3n-defaultStyle-Button">쿠폰 등록</button>
	</div>
	</div>
<div class="tabList">
	<ul>
		<li>
			<button type="button" class="on">
			<span>사용가능한 쿠폰</span>
			</button>
		</li>
		<li>
			<button type="button" class="">
			<span>지난 쿠폰 내역</span>
			</button>
		</li>
	</ul>
</div>
<div class="couponListHead">
	<div class="sortTypeList">
		<button type="button" class="on">마감임박순</button>
		<button type="button" class=" ">최근발급순</button>
	</div>
</div>
<!--  
<div class="emptyBox css-1xsxxpf-noResultStyle-MyPageNoResult">
	<p class="mainText">보유한 쿠폰이 없습니다.</p>
	<p class="subText">위버스 회원만을 위한 특별한 쿠폰을 확인해보세요.</p>
<a class="LinkerMoveTo css-y9z3ts-defaultStyle-Linked" href="#">바로가기</a>
</div>
-->
<div>

<!--  쿠폰 테이블  -->
<div class="mytmall_tbl1">
	<table width="100%">
		<caption>지난 쿠폰 내역</caption>
		<colgroup>
			<col width="36">
			<col width="118">
			<col width="68">
		</colgroup>
		<thead>
			<tr>
				<th class="first" scope="col">쿠폰종류</th>
				<th scope="col">쿠폰정보</th>
				<th scope="col">유효기간</th>
			</tr>
		</thead>
	
	<tbody>
			<!-- loop -->
		<tr class="first">
			<td class="first">
				<div class="c-coupon c-coupon--primary ">
					 <p class="fnt_1 alignL">${imp.user_id }</p>
				</div>
			</td>
			<td>
				<p class="fnt_1 alignL">${imp.user_id }</p>
				<p class="fnt_12 alignL">[${imp.user_name }] 10,000원 이상 구매 <span class="bLine">|</span> 최대 5,000원 할인</p>
			</td>
			<td>
				<p>${imp.user_birthday } ~ 23.12.31</p>
			</td>
		</tr>	
			<!-- //loop -->
	</tbody>
	</table>
</div>


<div class="mypageNotice css-fzw2w6-noticeListStyle">
<ul class="content">
<li class="css-1vz83ui-bulletTypeCircle">유효기간이 지난 쿠폰은 사용할 수 없습니다.</li>
<li class="css-1vz83ui-bulletTypeCircle">일부 행사상품에는 쿠폰 적용이 되지 않습니다.</li>
<li class="css-1vz83ui-bulletTypeCircle">할인쿠폰별 설정된 최소 결제금액 이상 구매 시, 쿠폰 적용이 가능합니다.</li>
<li class="css-1vz83ui-bulletTypeCircle">재판매 목적 등으로 구매한 경우 주문이 취소될 수 있습니다.</li>
<li class="css-1vz83ui-bulletTypeCircle">당사 사정에 따라 쿠폰 회수 또는 조기종료 될 수 있습니다.</li>
<li class="css-1vz83ui-bulletTypeCircle">환불/부분환불/취소 시 환급 또는 재발행 되지 않습니다.</li>
</ul>
</div>

</div>
</div>



</div>
</div>
</div>
</div>



</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	$(".tabList li").click(function(){
		let idx = $(this).index();
		$(".tabList li button").removeClass("on");
		$(".tabList li button").eq(idx).addClass("on");
	})
})
.ready(function(){
	$(".sortTypeList button").click(function(){
		let ix = $(this).index();
		$(".sortTypeList button").removeClass("on");
		$(".sortTypeList button").eq(ix).addClass("on");
	})
})
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
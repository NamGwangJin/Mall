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
<title>배송확인</title>
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
<%@ include file="side.jsp" %>

<!-- 헤더& 사이드메뉴 끝 // 배송정보-->
<div class="myPageContainer">
<div class="css-106ihda-defaultStyle">
<div class="mypageTitleBox mainTitle  css-qma8am-mypageTitleStyle">

<div class="titleArea">
<h2 class="title">배송 정보 관리</h2>
</div>
<div class="rightArea">
</div>
</div>
<form>
<div class="mypageTitleBox subTitle  css-qma8am-mypageTitleStyle">
<div class="titleArea">
<h2 class="title">배송지 목록</h2>
</div>
<div class="rightArea">
<button type="button" class=" css-1y1dd3a-defaultStyle-lineBlackStyle-Button">배송지 추가</button>
</div>
</div>
<div class="boxBaseDelivery">
<dl>
<dt>기본 배송지</dt>
<dd>
<strong>${imp.user_id}</strong>
<span>
${imp.user_name}(${imp.user_mobile})</span>
<p>${imp.user_address}</p>
</dd>
</dl>
</div>
<div class="addressTable css-j67mw4-defaultStyle">
<table>
<caption>배송지 목록</caption>
<colgroup>
<col width="15%">
<col width="28%">
<col width="100%">
</colgroup>
<thead class="">
<tr>
<th scope="col">선택</th>
<th scope="col">받는 분</th>
<th scope="col">주소</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<div class="radioBox css-1mdkf15-defaultStyle">
<input type="radio" id="delivery-13827309" name="deliveryRadio" title="집" aria-label="라디오버튼" value="13827309">
<label class="radioLabel" for="delivery-13827309">
<span
class="radioShape">
</span>
</label>
</div>
</td>
<td>${imp.user_name}<br>
${imp.user_mobile}</td>
<td>
<div class="address">
${imp.user_address }</div>
</td>
<td>
</td>
</tr>
</tbody>
</table>
</div>
<button type="submit" class="css-1b6ft4t-defaultStyle-blackStyle-Button">기본 배송지 설정</button>
</form>
</div>
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
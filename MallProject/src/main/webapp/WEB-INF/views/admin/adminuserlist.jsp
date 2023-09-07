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
		
			
		</div>
		<!-- 수정/탈퇴 버튼 -->
		<div class="MoreHeaderView_button_wrap__B-cQ2">
			<a href=/logout name=logout class="MoreHeaderView_button_item__gv6pa" >로그아웃</a>
			
		</div>
	</div>
</div>
<!-- 헤더끝 -->
<!-- 본문 시작 -->

<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="myPagelnbWrapper css-jo3gxq-defaultStyle">
<div class="mypageLnb">
<h2 class="mypageLnbTitle">

<a href="/goreg" style="font-size: inherit; color:#25C7A0;">Weverse Admin</a></h2>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">주문현황</h3>

<ul class="myPageLnbList">
<li><a href="/adminOrder">주문내역보기</a></li>
<li><a href="/adminOrderCancelList">취소/반품신청 내역</a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">상품 관리</h3>

<ul class="myPageLnbList">
<li><a href="/ProductReg">새 상품 등록하기</a></li>
<li><a href="/goreglist"> 
				<form id="uploadForm" action="/regProductList" method="post" class="custom-button-wrap">
			      등록된 상품 목록
			    </form></a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">게시판관리</h3>

<ul class="myPageLnbList">
<li><a href="#">공지사항작성</a></li>

</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">회원관리</h3>

<ul class="myPageLnbList">
<li><a href="/adminuserlist">회원 정보보기</a></li>
<li><a href="#">회원 권한 관리</a></li>

</ul>
</div>
</div>
</div>




<div class="myPageContainer">
<div class="css-man8h3-defaultStyle">
<div class="userBaseInfo">
  		<section>
        	<div>
        		<div>
       				<table cellspacing="0" cellpadding="0" width="90%" align="center">
       					<caption><h1 style="text-align:left;">회원목록</h1></caption>
        				<thead style="height:50px; text-align:center;">
        					<tr width="90%"><td><b>로그인아이디</b></td><td><b>비밀번호</b></td><td><b>닉네임</b></td><td><b>전화번호</b></td><td><b>이메일</b></td><td><b>주소</b></td><td><b>생년월일</b></td><td><b>가입일자</b></td><td><b>보유포인트</b></td>
        					
<!--         					<td><b>상태<select name='userstates' id='userstates'><option value='nomal'>일반</option> -->
<!-- 				        														<option value='restrict'>제한</option> -->
<!-- 				        														<option value='rest'>휴면</option> -->
<!-- 				        														<option value='outdelay'>탈퇴대기</option> -->
<!-- 				        														<option value='VIP'>VIP</option></select></b></td> -->
				        	</tr>
        					<tr><td colspan=9><hr></td></tr>
        				</thead>
        				<tbody id="cartList" style="text-align:center;">
        				<c:choose>
        					<c:when test="${uList == '없음'}">
        						<tr><td colspan=9><Strong style="color:red;">주문내역이 없습니다.</Strong></td></tr>
      						
      						</c:when>
      						<c:otherwise>
      						<div id="orderList">
							    <c:forEach items="${uList}" var="user">
							        <tr>
							        	
							            <td name='user_id'>${user.user_id}</td>
							            <td name='user_pw'>${user.user_pw}</td>
<%-- 							            <td name='prodname'><img name='orderimg' src="/img/${order.prod_img}" style="width:100px;">&nbsp;${order.prod_name}</td> --%>
							            <td name='user_name'>${user.user_name}</td>
							            <td name='user_mobile'>${user.user_mobile}</td>
							            <td name='user_email'>${user.user_email}</td>
							            <td name='user_address'>${user.user_address}</td>
							            <td name='user_birthday'>${user.user_birthday}</td>
							            <td name='signup_date'>${user.signup_date}</td>
							            <td name='user_point'>${user.user_point}</td>
							        </tr>
							        <tr><td colspan=9><hr></td></tr>
							    </c:forEach>
							 </div>
							</c:otherwise>
	        			</c:choose>
        				</tbody>			     				
        			</table>
        		</div>
			</div>
		</section>


<div class="userGradeBox gradeType1">
<div class="grade">

</div>
      
<a class=" css-n2sa3z-defaultStyle-underlineStyle-Linked">

</a>
</div>
<div class="gradeDetail">

</div>

<div class="userTimelineBox">
<div class="mypageTitleBox subTitle  css-qma8am-mypageTitleStyle">

</div>

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

$(document).ready(function () {	

	
	
});
</script>
</html>
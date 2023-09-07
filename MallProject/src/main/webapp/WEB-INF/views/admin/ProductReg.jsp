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
  	<h1 align=center>　</h1>
	
	
	 <form id="uploadForm" action="/upload" method="post" enctype="multipart/form-data">
	        <label for="file">상품 이미지 선택:</label>
	        <input type="file" id="file" name="file" value=""><br>
	        <input type="submit" value="상품이미지업로드">
	</form>
	
	<div id="uploadResult">
	</div>
	
	<br><br>
		<form method="post" action="/insert" id=frmInsert name=frmInsert>
			<table>
			   <input type=hidden name=id id=id value="${id}">
			<tr><td>상품명</td><td><input type=text name=prod_name id=prod_name size=64 maxlength=128></td></tr>
			<tr><td>상품설명</td><td><textarea rows=10 cols=61 name=prod_msg id=prod_msg></textarea></td></tr>
			<tr><td>가격</td><td><input type=text name=prod_price id=prod_price size=64 maxlength=128></td></tr>
			<tr><td><td><input type=text name=prod_img id=prod_img size=64 maxlength=128 value=""></td></tr>
			<tr><td style='text-align:right'><input type=submit id=btnSubmit name=btnSubmit value='상품 등록하기'>&nbsp;&nbsp;<br></td></tr>
			</table>
		</form>
	</body>


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

$(document)
.ready(function () {
    $('#uploadForm').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/upload', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#uploadResult').html(response);
                $('#prod_img').val($('#filename').text());
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#uploadResult').text('파일 업로드 실패');
            }
        });
    });
})
.on('click','#logout',function(){
    if(!confirm('정말로 로그아웃할까요?')){
        return false;
    } else {			
        document.location= "/logout";
    }
});
</script>
</html>
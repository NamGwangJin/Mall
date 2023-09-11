<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/review2.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<link href="resources/css/bbs.css" rel="stylesheet"/>
<link href="resources/css/bbs2.css" rel="stylesheet"/>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
<title>리뷰 수정</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto; }
table td { border : 1px solid black; }
</style>
<body>
<!-- 배너  -->
<div class="navbar">
<%@ include file="..\header.jsp" %>
</div>
<!-- 헤더 -->
<div class="body" style="margin-top:50px;">
<div class="MoreLayoutView_container__8Ahvr">
	<div class="MoreHeaderView_container__kK6Wj">
		<div class="MoreHeaderView_inner__BRiQZ">
			<div class="MoreHeaderView_profile_wrap__Y9XWQ">
				<div class="MoreHeaderView_name__4ZkcS">
					<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
					리뷰 수정</h2>
				</div>
				<div class="MoreHeaderView_email__Ui6wT">작성한 리뷰를 수정해보세요.</div>
			</div>
		</div>
	</div>
<!-- 본문 -->
<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="mypageTitleBox mainTitle borderStyle css-qma8am-mypageTitleStyle">
<div class="titleArea">
<h2 class="title">MY REVIEW</h2>
</div>
</div>

<body>
<table>
<form method="post" action="/modify1" id=frmUpdate name=frmUpdate>

<input type=hidden id=no name=num value='${rPost.num}'>
<div class="myp-form-wrap">
	<p class="form-title2">작성시각 | ${rPost.created}</p>
	<div class="myp-form-col">
		<div class="input-group inline">
			<label class="control-label2">게시물 번호</label>
			<div class="static-field">
			<input type="text" class="inputcolor" name="hp_tail1" id=num readonly value="${rPost.num}">
			</div>
		</div>
		<div class="input-group inline">
			<label class="control-label2">작성자</label>
			<div class="control-field">
			<input type=text class="inputcolor" name="hp_tail1" id=title value="${rPost.writer}" readonly>
			</div>
		</div>
		<div class="input-group inline">
			<label class="control-label2">조회수</label>
			<div class="control-field">
			<input type=text class="inputcolor" name="hp_tail1" id=title value="${rPost.hit}" readonly>
			</div>
		</div>
		<div class="input-group inline">
			<label class="control-label2">제목</label>
			<div class="control-field">
			<input type=text name=title id=title value="${rPost.title}" maxlength=128>
			<input type=hidden name=img value="${rPost.img}">
			</div>
		</div>
		<div class="input-group inline">
			<label class="control-label2">내용</label>
			<div class="control-field">
			<textarea class="textfull" rows=10 cols=50 name=content id=content>${rPost.content}</textarea>
			</div>
		</div>
	</div>
	
</div>
	<div class="myp-form-wrap">
		<p class="form-title3">수정시각 | ${rPost.updated}</p>
	</div>
<div class="pc-series-nav">
<div class="pc-btn pc-btn-default btn_cursor" onclick="location.href='/orderList';">목록보기</div>
	<div class="btn_cursor2">
		<input type=submit class="btn2 btn2-de" id=btnSubmit name=btnSubmit value='수정 완료'>
	</div>
</div>
</form>
</table>
</body>
</div>	
</div>
</div>
</body>




<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#frmUpdate',function(){
	if( $('#title').val()=='' ) {
		alert('제목을 입력하세요.');
		return false;
	}
	if( $('#content').val()=='' ){
		alert('내용을 입력하세요.');
		return false;
	}
	alert('수정이 완료되었습니다.');
})
</script>
</html>
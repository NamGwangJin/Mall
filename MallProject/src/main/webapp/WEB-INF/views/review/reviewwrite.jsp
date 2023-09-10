<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html class="scrollbar-custom use-webfont">
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<link href="resources/css/star.css" rel="stylesheet"/>
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/review2.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
<title>게시물 작성</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto;}
h1{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto; }
table td { border : 1px solid black; }
</style>
<!-- 배너  -->
<%@ include file="../header.jsp" %>
<!-- 헤더  -->
<div class="body" style="margin-top:50px;">
<div class="MoreLayoutView_container__8Ahvr">
	<div class="MoreHeaderView_container__kK6Wj">
		<div class="MoreHeaderView_inner__BRiQZ">
			<div class="MoreHeaderView_profile_wrap__Y9XWQ">
				<div class="MoreHeaderView_name__4ZkcS">
					<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
					후기 작성</h2>
				</div>
				<div class="MoreHeaderView_email__Ui6wT">상품 후기를 작성해주세요!</div>
			</div>
		</div>
	</div>
<!-- 본문  -->
<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="mypageTitleBox mainTitle borderStyle css-qma8am-mypageTitleStyle">
<div class="titleArea">
<h2 class="title">MY REVIEW</h2>
</div>
</div>

<p class="form-title"></p>
<body>
<table>
<form method='post' action='/insert1' id=frmInsert name=frmInsert>
<input type=hidden name=prod_name value="${prod_name}">
<input type=hidden name=order_num value="${order_num}">
	<p class="form-title2"></p>
<div class="myp-form-wrap">
	<div class="myp-form-col">
		<div class="input-group inline">
			<label class="control-label2">별점</label>
			<div class="static-field">
				<div class="star-rating space-x-4 mx-auto">
				<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
				<label for="5-stars" class="star">★</label>
				<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
				<label for="4-stars" class="star">★</label>
				<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
				<label for="3-stars" class="star">★</label>
				<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
				<label for="2-stars" class="star">★</label>
				<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
				<label for="1-star" class="star">★</label>
				</div>
			</div>
		</div>
		<div class="input-group inline">
			<label class="control-label2">제목</label>
			<div class="static-field">
			<input type="text" name="hp_tail1" id=title>
			</div>
		</div>
		<div class="input-group inline">
			<label class="control-label2">내용</label>
			<div class="control-field">
			<textarea class="textfull" rows=10 cols=100 name="hp_tail" id=content></textarea>
			</div>
		</div>
	</div>
	<p class="form-title2"></p>
	<div class="myp-form-col">
		<div class="input-group inline">
			<label class="control-label2">이미지</label>
			<div class="control-field">
			
			</div>
		</div>
	</div>
	
	<!-- 버튼 -->
	<div class="lnb-form-action">
	<button class="btn btn-default">취소</button>
		<input type=submit id=btnSubmit name=btnSubmit value='작성' class="btn btn-default btn-primary">
	</div>
	<!-- 버튼끝 -->
	
</div>

<input type=hidden name=img id=img size=64 maxlength=128 value="">
<!-- 
<td><input type=submit id=btnSubmit name=btnSubmit value='작성'></td></tr>
 -->
</form>
<form id="uploadForm1" action="/upload1" method="post" enctype="multipart/form-data">
        <!-- <label for="file1"></label> -->
        <input type="file" id="file1" name="file1" value=""><br>
        <input type="submit" value="상품이미지업로드">
</form>
<div id="reviewUploadResult">
</div>

</table>
</body>


</div><!-- 본문끝  -->
</div>
</div> 

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function () {
	
    $('#uploadForm1').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/upload1', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#reviewUploadResult').html(response);
                $('#img').val($('#filename1').text());
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#reviewUploadResult').text('파일 업로드 실패');
            }
        });
    });
})
</script>
</html> 
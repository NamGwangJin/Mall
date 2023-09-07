<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html class="scrollbar-custom use-webfont">
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/review2.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<link href="resources/css/bbs.css" rel="stylesheet"/>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
<title>글쓰기</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto;}
h1{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto; }
table td { border : 1px solid black; }
</style>
<!-- 배너  -->
<%@ include file="..\header.jsp" %>
<!-- 헤더  -->
<div class="body" style="margin-top:50px;">
<div class="MoreLayoutView_container__8Ahvr">
	<div class="MoreHeaderView_container__kK6Wj">
		<div class="MoreHeaderView_inner__BRiQZ">
			<div class="MoreHeaderView_profile_wrap__Y9XWQ">
				<div class="MoreHeaderView_name__4ZkcS">
					<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
					게시물 작성</h2>
				</div>
				<div class="MoreHeaderView_email__Ui6wT">특별한 게시글을 작성해보세요!</div>
			</div>
			<div class="MoreHeaderView_button_wrap__B-cQ2">
			<a href="/bbs" class="MoreHeaderView_button_item__gv6pa">목록으로</a>
		</div>
		</div>
	</div>
<!-- 본문  -->
<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="mypageTitleBox mainTitle borderStyle css-qma8am-mypageTitleStyle">
<div class="titleArea">
<h2 class="title">MY POST</h2>
</div>
</div>

<p class="form-title"></p>
<body>
<table>
${write}
<form method='post' action='/insert2' id=frmInsert name=frmInsert>

<div class="myp-form-wrap">
	<div class="myp-form-col">
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
	<!-- 버튼 -->
	<div class="lnb-form-action">
		<button class="btn btn-default">취소</button>
		<input type=submit id=btnSubmit name=btnSubmit value='작성' class="btn btn-default btn-primary">
	</div>
	<!-- 버튼끝 -->

</div>
<!--
		<td><input class=con1 type=submit id=btnSubmit name=btnSubmit value='작성' ></td></tr>
 -->

</form>
<form id="uploadForm2" action="/upload2" method="post" enctype="multipart/form-data">
     	
        <input type="file" id="file2" name="file2" value=""><br>
        <input type="submit" value="상품이미지업로드">
</form>
<div id="UploadResult">
</div>

</table>
</body>
</div>
</div>
</div>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#frmInsert',function(){
	if( $('#title').val()=='' ) {
		alert('제목을 입력하세요.');
		return false;
	}
	if( $('#content').val()=='' ){
		alert('내용을 입력하세요.');
		return false;
	}
})
 $('#uploadForm2').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/upload2', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#UploadResult').html(response);
                $('#img').val($('#filename2').text());
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#UploadResult').text('파일 업로드 실패');
            }
        });
    });
</script>
</html>

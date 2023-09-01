<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>SimpleShop</title>
    <meta charset="UTF-8">
    <link href="css/mall.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<style data-styled="" data-styled-version="5.3.5"></style>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
  </head>   
<body>
  <header>
			<div class="navbar">
			    <a href="/" id="logo">
			        <img src="img/weverslogo.jpg" width="149">
			    </a>
			    <ul id="menu">
			    	<input type=hidden name=id value="${id}">
			    	
			    	<li><a href="#">${bbs}</a></li>
			       
			        <li><a href="/mypage">${infoline}</a></li>
			        <li>${inforeg}</li>
			    </ul>
			</div>
        </header>
<div class="body">
<!-- <div class="MoreLayoutView_container__8Ahvr"> -->
<div class="MoreHeaderView_container__kK6Wj">
	<div class="MoreHeaderView_inner__BRiQZ">
		<div class="MoreHeaderView_profile_wrap__Y9XWQ">
			<div class="MoreHeaderView_name__4ZkcS">
				<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
				${id}님 의 새 상품등록</h2>
			</div>
			<address class="MoreHeaderView_email__Ui6wT">${imp.user_email }</address>
		</div>
		<!-- 수정/탈퇴 버튼 -->
		<div class="MoreHeaderView_button_wrap__B-cQ2">
			<a href="/goreg" t class="MoreHeaderView_button_item__gv6pa">관리페이지로이동</a>
		</div>
		<div class="MoreHeaderView_button_wrap__B-cQ2">
		
		</div>
		<div class="MoreHeaderView_button_wrap__B-cQ2">
		
		</div>
		<div class="MoreHeaderView_button_wrap__B-cQ2">
		
		</div>
	</div>
</div></div>
      
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
</body>
</html>
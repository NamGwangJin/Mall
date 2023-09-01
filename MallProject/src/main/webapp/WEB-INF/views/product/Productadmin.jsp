<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>상품관리자</title>
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<style data-styled="" data-styled-version="5.3.5"></style>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
<style>
    .MoreHeaderView_button_wrap__B-cQ2 {
        position: relative;
        display: inline-block;
    }

  .MoreHeaderView_button_item__gv6pa {
        width: 100px; /* 원하는 너비 */
        height: 80px; /* 원하는 높이 */
    }

    .tooltip {
        visibility: hidden;
        background-color: #333;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px;
        position: absolute;
        z-index: 1;
        bottom: 110%; /* 툴팁을 이미지 아래에 표시 */
        left: 50%;
        transform: translateX(-50%);
        opacity: 0;
        transition: opacity 0.3s;
        white-space: nowrap; /* Prevent text from wrapping */
    }

    .MoreHeaderView_button_wrap__B-cQ2:hover .tooltip {
        visibility: visible;
        opacity: 1;
    }
     .custom-button-wrap {
        position: relative;
        display: inline-block;
    }

    .custom-button {
        display: inline-block;
        border: none;
        background: none;
        cursor: pointer;
        padding: 0;
        margin: 0;
        width: 60px; 
        height: 60px;
    }

  
</style>
</head>

<body>

<%@ include file="..\header.jsp" %>
<div class="body">
<!-- <div class="MoreLayoutView_container__8Ahvr"> -->
<div class="MoreHeaderView_container__kK6Wj">
	<div class="MoreHeaderView_inner__BRiQZ">
		<div class="MoreHeaderView_button_wrap__B-cQ2">
			
		</div>
		<div class="MoreHeaderView_profile_wrap__Y9XWQ">
			<div class="MoreHeaderView_name__4ZkcS">
				<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
				${id}님 의 상품관리.</h2>
			</div>
<%-- 			<address class="MoreHeaderView_email__Ui6wT">${imp.user_email }</address> --%>
		</div>
		<!-- 수정/탈퇴 버튼 -->
		<div class="MoreHeaderView_button_wrap__B-cQ2">
    		<a href="/ProductReg">
        <img src='img/regProductImg.jpg' class="MoreHeaderView_button_item__gv6pa">
		        <span class="tooltip">새 상품 등록하기</span>
		    </a>
		</div>
		<div class="MoreHeaderView_button_wrap__B-cQ2">
	
		
<!-- 			<a href="/quit" id=quit class="MoreHeaderView_button_item__gv6pa">탈퇴하기</a> -->
			<div class="MoreHeaderView_button_wrap__B-cQ2">
			    <form id="uploadForm" action="/regProductList" method="post" class="custom-button-wrap">
			        <input type="image" src="img/regProductListImg.jpg" alt="등록된상품불러오기" class="custom-button">
			        <span class="tooltip">등록된 상품 목록</span>
			    </form>
			</div>
		</div>
	</div>
</div>   
</div>

   
<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="myPagelnbWrapper css-jo3gxq-defaultStyle">
<div class="mypageLnb">
<h3 class="mypageLnbSubTitle">　</h3>

<ul class="myPageLnbList">

<li><a href="#">　</a></li>
</ul>
</div>
   
   
   


<!--  <form id="uploadForm" action="/regProductList" method="post"> -->
       
<!--         <input type="submit" value="등록된상품불러오기"> -->
<!-- </form> -->
<div id="regProductListResult">

</div></div></div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>

$(document)
.ready(function () {
    $('#uploadForm').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/regProductList', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#regProductListResult').html(response);
                
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#regProductListResult').text('불러오기 실패');
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
})
;
</script>
</html>

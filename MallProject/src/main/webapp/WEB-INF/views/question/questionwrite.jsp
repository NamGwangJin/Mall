<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/guide.min.css?202307171515"/>
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/sub.css?202306211732" />
<link href="css/mall.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/review2.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<link href="resources/css/bbs.css" rel="stylesheet"/>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>


<title>Q&A</title>

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
					Q&A 작성</h2>
				</div>
				<div class="MoreHeaderView_email__Ui6wT">문의하실 내용을 적어주세요!</div>
			</div>
			<div class="MoreHeaderView_button_wrap__B-cQ2">
			<a href="/question" class="MoreHeaderView_button_item__gv6pa">목록으로</a>
		</div>
		</div>
	</div>
<!-- 본문  -->
<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="mypageTitleBox mainTitle borderStyle css-qma8am-mypageTitleStyle">
<div class="titleArea">
<body>
<div class="right_contents">
			<h2 class="title-page">CS Center</h2>
		</div>
		
<div class="cs_center_tap">
	<ul>
		<li class="hover_effect_none">
			<span class="title">Tel. 1234-5678</span>
			<span>평일 9:00~18:00</span>
		</li>	
		<li class="active">
			<a href="/questionwrite">
				<span class="title">1:1 Q&A</span>
				<span>질문 전 FAQ(자주 묻는 질문)을 먼저 확인해 주세요.</span>
			</a>
		</li>
		<li class="">
			<a href="/faq">
				<span class="title">FAQ</span>
				<span>자주 묻는 질문</span>
			</a>				
		</li>	
	</ul>	
</div>	

			<div class="right_contents">
				<h3 class="title_cs font-mss">1:1 Q&A</h3>
				<ul class="n-info-txt">
					<li class="txt-danger">제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품 및 부속 사용/분실 시, 교환/환불이 불가능 합니다.</li>
					<li class="txt-danger">교환을 원하시는 상품의 재고가 부족 시, 교환이 불가합니다.</li>
					<li>고객님의 주문내역을 선택, 질문이 필요한 상품을 선택하시면 1:1상담이 가능합니다.</li>
					<li>주문취소/교환/환불은 <a href="/mypage" class="n-txt-link">마이페이지>주문내역</a>에서 신청하실 수 있습니다.</li>
					<li>1:1문의 처리 내역은 <a href="/mypage" class="n-txt-link">마이페이지&gt;1:1문의</a>를 통해 확인하실 수 있습니다.</li>
					<li>상품 정보 관련 문의는 해당 상품 문의에 남기셔야 빠른 답변이 가능합니다.</li>
				</ul>

				<div class="section_form">
					<div class="harf_area">
						<header class="n-section-title">
							<h2 class="tit">문의 작성</h2>
						</header>
						<table>
						<form method='post' action='/insert3' id=frmInsert name=frmInsert>
						<div class="myp-form-wrap">
						<div class="myp-form-col">
						<div class="input-group inline">
						<label class="control-label2">제목</label>
						<div class="static-field">
			<input type="text" name="hp_tail3" id=title>
			</div>
		</div>
		<div class="input-group inline">
			<label class="control-label2">내용</label>
			<div class="control-field">
			<textarea class="textfull" rows=10 cols=100 name="hp_tail2" id=content></textarea>
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

</form>
<form id="uploadForm3" action="/upload3" method="post" enctype="multipart/form-data">
     	
        <input type="file" id="file3" name="file3" value=""><br>
        <input type="submit" value="상품이미지업로드">
</form>
<div id="UploadResult">
</div>
</table>
</div>
</div>
</div>
</body>
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
/*  $('#uploadForm3').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/upload3', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#UploadResult').html(response);
                $('#img').val($('#filename3').text());
            },
            error: function (xhr, status, error) {
                console.log(error);
                $('#UploadResult').text('파일 업로드 실패');
            }
        });
    }); */
</script>
</html>
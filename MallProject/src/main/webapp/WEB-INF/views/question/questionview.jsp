<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="//static.msscdn.net/ui/build/pc/css/common.css?202109290900">
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?202202150915" />
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/store_common.css?202112011113" />
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/guide.min.css?202307171515"/>
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/sub.css?202306211732" />
    
   
    

<title>Q&A</title>
</head>
<body>
<div class="right_contents">
			<h2 class="title-page">CS Center</h2>
		</div>
		
<div class="cs_center_tap">
	<ul>
		<li class="hover_effect_none">
			<span class="title">Tel. 1544-7199</span>
			<span>평일 9:00~18:00</span>
		</li>	
		<li class="active">
			<a href="/question">
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
<!-- //CS Center 탭버튼 -->
		<form name="f1" id="f1" method='post' action="/app/cs/counsel_save">
			<input type="hidden" name="qna_board_no" value="" />
			<input type="hidden" name="cmd" value="add" />
			<input type="hidden" name="opener" value="N" />
			<input type="hidden" name="faq_view_yn" value="N" />
			<input type="hidden" name="image_yn" value="N" />
			<input type="hidden" name="period" />
			<input type="hidden" name="goods_no" value=""/>
			<input type="hidden" name="goods_sub" value="0"/>
			<!-- 고객센터 콘텐츠 -->
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
					<!-- [D] 주문확인 -->
					<div class="harf_area">
						<header class="n-section-title">
							<h2 class="tit">문의 작성</h2>
						</header>
						<table class="n-table table-row">
						<form method='post' action='/insert3' id=frmInsert name=frmInsert>
							<tbody>
								<tr>
									<th scope="row">제목</th>
									<td>
									<div>
									<textarea class="textfull1" rows=2 cols=30 name="hp_tail" id=content1></textarea>
									</div>
									</td>
								</tr>
								<tr class="n-same-row">
									<th scope="row">문의내용</th>
									<td>
									<div>
										<textarea name="qa_msg" cols="10" rows="10" class="n-input" placeholder="우선 접수된 문의 건부터 순차적으로 답변을 드리고 있습니다. 문의유형과 주문번호, 문의내용을 상세히 기재해 주시면 더욱 신속히 답변 드릴 수 있습니다. 문의하신 내용에 답변을 위해 전화로 연락을 드릴 수 있습니다."></textarea>
									</div>
								</tr>
								<tr class="n-same-row">
									<th scope="row">사진</th>
									<td class="file-upload">
										<ul class="file_show" id="file_show"></ul>
										<form id="uploadForm2" action="/upload2" method="post" enctype="multipart/form-data">
										 <input type="file" id="file2" name="file2" value=""><br>
        									<input type="submit" value="상품이미지업로드">
										</form>
										<div id="UploadResult">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div id="faq_list" class="harf_area"></div>
				<!-- 버튼 -->
				<div class="n-btn-group">
					<a href="javascript:void(0)" onClick="cancel(); return false;" class="n-btn btn-lighter">취소</a>
					<a href="javascript:void(0)" onClick="qna_add(); return false;" class="n-btn btn-accent">작성하기</a>
				</div>
				<!-- //버튼 -->
			</div>
			
		</form>
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
                console.log(error);
                $('#UploadResult').text('파일 업로드 실패');
            }
        });
    });
</script>
</html>
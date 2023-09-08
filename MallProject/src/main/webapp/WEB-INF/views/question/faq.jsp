<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/magazine_common.css?202202150915" />
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/store_common.css?202112011113" />
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/sub.css?202306211732" />
<link href="css/mall.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/review2.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<link href="resources/css/bbs.css" rel="stylesheet"/>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
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
					FAQ</h2>
				</div>
				<div class="MoreHeaderView_email__Ui6wT">자주 묻는 질문을 확인해주세요!</div>
			</div>
			<div class="MoreHeaderView_button_wrap__B-cQ2">
			<a href="/" class="MoreHeaderView_button_item__gv6pa">목록으로</a>
		</div>
		</div>
	</div>
	<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="mypageTitleBox mainTitle borderStyle css-qma8am-mypageTitleStyle">
<div class="titleArea">
<title>FAQ</title>
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
<!-- 스토어, 매거진 공통 스크립트 -->
<script type="text/javascript" src="//static.msscdn.net/mfile_outsrc/js/vendor/jquery-1.11.1.min.js?20160201"></script>


    <!--jqModal-->
    <link rel="stylesheet" type="text/css" href="//static.msscdn.net/skin/musinsa/css/jqModal.css?20160119" />
    <script src="//static.msscdn.net/skin/musinsa/js/jqModal.min.js?20160511" type="text/javascript"></script>
    <!--//jqModal-->

<link type="text/css" rel="stylesheet" href="//static.msscdn.net/skin/musinsa/css/image_search.css?202201051301" />
<script type="text/javascript" src="//static.msscdn.net/static/search/js/common/pc/search/image_search.js?20220127"></script>
<script type="text/javascript">
    var search_front_url = "https://search.musinsa.com";
    
    $(document).ready(function(){
        if (window.image_search) {
            window.image_search.setUrl(search_front_url);
        }
    });
    
</script>
<link rel="stylesheet" type="text/css" href="//static.msscdn.net/ui/build/pc/css/faq.css?20220525000000">

<script type="text/javascript">
	window.onload = function(){
		$(".CFaqTableItem").on("click", function(event) {
			if(event.target.closest(".CFaqTableItem").classList.contains("CFaqTableItem--active")) {
				event.target.closest(".CFaqTableItem").classList.remove("CFaqTableItem--active");
			} else {
				$('.CFaqTableItem--active').each(function(index,item){
					item.classList.remove("CFaqTableItem--active");
				});
				event.target.closest(".CFaqTableItem").classList.add("CFaqTableItem--active");
			}
		});
	}

	function getFaq(main_class, sub_class) {
		let url = "/app/cs/faq";
		if(main_class !== '') url += "/"+main_class;
		if(sub_class !== '') url += "/"+sub_class;
		location.href = url;
	}
</script>

</head>
<body>

<div class="top-column column" style="display:none">
	<div id="short_top_special" class="header header-small store_header clearfix">
		<div class="main-wrapper wrapper">
			<h1 class="title"><a href="javascript:void(0)" onclick="showShortTopSpecial(); return false;">MUSINSA STORE 메뉴 열기</a></h1>
		</div>
	</div>
</div>

<div id="default_top" >
	<div id="topCommonPc"></div>
</div>

<script src="//static.msscdn.net/static/common/1.2.0/pc.js"></script><!--// 상단 콘텐츠 영역 -->


<div class="wrap">
	<!-- 왼쪽 메뉴 영역 -->
		<div id="leftCommonPc"></div>


		<div class="faq-contents">
			<div class="CFaqTitle">
				<h3 class="CFaqTitle__title">FAQ</h3>
				<span class="CFaqTitle__subtitle">자주 묻는 질문</span>
			</div>
			<div class="faq-contents-block-space--20"></div>
			<form id="" method="get" action="/app/cs/faq" class="CFaqSearch">
				<input type="text" name="q" placeholder="무엇을 도와드릴까요?" class="CFaqSearch__input" value="">
				<button type="submit" class="CFaqSearch__button">FAQ 검색</button>
			</form>
			<div class="faq-contents-block-space--48"></div>
			<nav class="CFaqNavgation">
				<h2 class="blind">FAQ Navigation</h2>
								<button
						type="button"
						class="CFaqNavgation__button "
						value="000"
						onclick="getFaq('000', '')"
				>회원정보</button>
								<button
						type="button"
						class="CFaqNavgation__button "
						value="001"
						onclick="getFaq('001', '')"
				>상품확인</button>
								<button
						type="button"
						class="CFaqNavgation__button "
						value="002"
						onclick="getFaq('002', '')"
				>주문/결제</button>
								<button
						type="button"
						class="CFaqNavgation__button "
						value="003"
						onclick="getFaq('003', '')"
				>배송</button>
								<button
						type="button"
						class="CFaqNavgation__button "
						value="004"
						onclick="getFaq('004', '')"
				>교환/취소(반품)</button>
								<button
						type="button"
						class="CFaqNavgation__button "
						value="005"
						onclick="getFaq('005', '')"
				>서비스</button>
							</nav>
			<div class="faq-contents-block-space--20"></div>
			<div class="CFaqCategory">
							</div>
			<div class="faq-contents-block-space--24"></div>
			<div class="MFaqTable">
				<div class="CFaqTableHeader">
					<p class="CFaqTableHeader__category">구분</p>
					<p class="CFaqTableHeader__title">제목</p>
				</div>
				<div class="CFaqTableItem-box">
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">로그인/정보</em>
							<p class="CFaqTableItem__question">아이디와 비밀번호가 기억나지 않아요.</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>로그인 화면에서 &nbsp;아이디 찾기/비밀번호 찾기를 통해 확인 가능합니다.<br />
아이디 찾기는 아래 3가지 방법 중 하나로 진행해 주세요.<br />
<br />
■ 휴대전화<br />
회원 정보에 등록된 본인의 휴대전화 번호를 인증하는 방법입니다.<br />
<br />
■ 이메일<br />
회원 정보에 등록된 본인의 이메일 주소를 인증하는 방법입니다.<br />
<br />
■ 본인인증<br />
이용 중인 통신사와 휴대전화 번호를 인증하는 방법입니다.<br />
<br />
※ 비밀번호 재설정을 완료한 휴면 회원은 휴면 해제 및 탈퇴 신청이 취소됩니다.<br />
※ 비밀번호 찾기는 휴대전화 본인 인증으로만 가능합니다.<br />
<br />
<span style="color:#3498db;"><strong><a href="https://www.musinsa.com/app/cs/faq?idx=59">[아이디/비밀번호 수정 FAQ 바로 가기]</a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=58">[회원정보 수정 FAQ 바로 가기]</a></strong></span></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">로그인/정보</em>
							<p class="CFaqTableItem__question">회원 정보 수정은 어디서 하나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>회원 정보 수정은 아래 경로로 직접 변경 가능합니다.&nbsp;<br />
<br />
■ 회원 정보 수정&nbsp;<br />
모바일(앱/웹) : 마이페이지 > 내 정보 관리 > 오른쪽 위 톱니바퀴<br />
PC(웹) : 마이페이지 > 회원정보 변경<br />
※ 원활한 주문 및 배송을 위해 회원 정보를 정확하게 기재해 주세요.<br />
<br />
■ 이름 개명 시 수정<br />
모바일(앱/웹) : 마이페이지 > 내 정보 관리 > 오른쪽 위 톱니바퀴 > 회원 정보 > 이름/휴대전화/생년월일<br />
PC(웹) : 마이페이지 > 회원정보 변경 > 이름수정<br />
<br />
※ 개명한 이름이 NICE 평가 정보에 등록되어 있어야 합니다.<br />
※ 본인인증을 통해 NICE 평가 정보 적용된 이름(실명)을 기준으로 변경됩니다.<br />
<strong><a href="https://www.niceinfo.co.kr/business/NICEiD.nice"><span style="color:#3498db;">NICE 평가정보 실명 등록하러 가기</span></a><br />
<a href="/mypage"><span style="color:#3498db;">내 정보 관리&nbsp;바로 가기</span></a></strong><br />
&nbsp;</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">상품 문의</em>
							<p class="CFaqTableItem__question">구매했을 때 보다 가격이 떨어졌어요 차액 환불이 되나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>상품 금액은 온라인 판매처 특성상 유동적으로 변동될 수 있어 차액 환불은 가능하지 않습니다.&nbsp;<br />
<br />
※ 판매 가격 변동으로 인한 교환(환불) 신청 시 반품 배송비는 회원님 부담으로 진행됩니다.&nbsp;<br />
※ 출고 처리중인 경우 취소는 가능하지 않습니다.&nbsp;</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">상품 문의</em>
							<p class="CFaqTableItem__question">재고가 없어요. 언제쯤 구입할 수 있을까요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>품절 상품 재입고 여부 및 일정은 정확한 확인이 가능하지 않지만 재입고 알림을 등록하면 알림톡으로 확인 할 수 있습니다. &nbsp;<br />
알림 신청 방법은 아래내용을 확인해 주세요.<br />
<br />
■ 재입고 알림 신청&nbsp;<br />
모바일(앱) : 상품 선택 > 구매하기 > 재입고 알림 받기 선택<br />
<br />
※ 재입고 알림 신청은 APP에서만 신청이 가능합니다.<br />
※ 재고 입고 수량에서 요청순서에 따라 순차적으로 발송 됩니다.<br />
※ 재입고 알림 버튼이 보이지 않거나 재입고 관련 상세확인은 상품 페이지의 상품문의를 이용해 주세요.<br />
<br />
<a href="https://www.musinsa.com/app/cs/faq?idx=10"><span style="color:#3498db;"><strong>[상품문의 작성 FAQ 바로 가기]</strong></span></a><br />
<br />
&nbsp;<img alt="" height="449" src="img/product1.jpg" width="408" /></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">결제수단</em>
							<p class="CFaqTableItem__question">결제하는 방법에 따라 할인 이벤트가 있나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>결제하는 수단에 따라 할인 이벤트가 있습니다.&nbsp;<br />
할인 이벤트 확인 하는 방법은 아래 경로를 확인 해주세요.&nbsp;<br />
<br />
■ 할인 이벤트 확인 경로&nbsp;<br />
모바일(앱/웹) : 이벤트 > 혜택에서 확인 가능&nbsp;<br />
PC(웹) : 세일 > 기획전 에서 확인 가능&nbsp;<br />
<br />
<strong><a href="https://www.musinsa.com/app/plan/lists"><span style="color:#3498db;">할인 이벤트 바로 가기</span></a></strong><br />
※ 카드사 예산 소진 시 조기 종료 될 수 있습니다.&nbsp;<br />
※ 결제수단에 따라 이벤트 적용 조건이 다르기 때문에 상세보기에서 주의사항을 꼭 확인해 주세요.</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">결제수단</em>
							<p class="CFaqTableItem__question">결제 방법에는 어떤 것들이 있나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>주문서 작성 시 무신사페이 또는 일반결제로 결제 항목에서 선택이 가능합니다.&nbsp;<br />
<br />
■ 무신사페이&nbsp;<br />
신용카드 또는 은행 계좌 연결해서 간편하게 결제할 수 있습니다.<br />
<br />
■ 일반 결제&nbsp;<br />
신용카드, 가상계좌, 계좌이체,&nbsp;Apple pay, 휴대폰결제, 토스 페이, 카카오 페이, 네이버 페이, 페이코 결제가 있습니다.&nbsp;<br />
<br />
<a href="https://store.musinsa.com/app/plan/lists"><span style="color:#3498db;"><strong>결제 관련 프로모션 바로 가기</strong></span></a><br />
<br />
※ 신용카드 결제 선택 시 안전 결제(ISP) 또는 안심클릭으로 결제됩니다. (30만원 이상 결제 시 공인인증서 필요)<br />
※ 원하는 결제 수단으로 체크 후 결제 가능합니다. (단, 복합 결제는 불가)&nbsp;<br />
※ 그 외 문의 및 오류 관련 문의는 해당 결제 수단 고객센터로 문의해 주세요.&nbsp;<br />
※ 주문 완료 후 결제 방법 변경은 가능하지 않습니다. (입금 확인 상태에서 취소 후 다시 주문)<br />
<br />
<span style="color:#3498db;"><strong><a href="https://www.musinsa.com/app/cs/faq?idx=83">[무신사페이 등록 FAQ 바로 가기]</a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=80">[휴대폰 결제 FAQ 바로 가기]</a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=79">[가상계좌 결제 FAQ 바로 가기]</a></strong></span></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">주문</em>
							<p class="CFaqTableItem__question">상품을 받는 주소(배송지) 등록은 어떻게 하나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>마이페이지 > 배송지 관리 또는 주문서 작성 시 배송지 관리에서 배송 주소를 등록/수정/삭제할 수 있습니다.&nbsp;<br />
<br />
■<strong> <a href="/mypage"><span style="color:#3498db;">배송지 관리</span></a><span style="color:#3498db;"> </span></strong>경로&nbsp;<br />
모바일(앱/웹) : 마이페이지 > 내 정보 관리(오른쪽 위 톱니바퀴) > 배송지 관리<br />
PC(웹) : 마이페이지 > 회원정보 변경 > 배송지 관리<br />
<br />
※ 신규 배송지를 등록하더라도 기본배송지로 설정 되지 않으며, 기본 배송지로 설정 원할 경우 기본배송지 설정을 별도로 해주셔야 합니다.<br />
※ 주소지는 행정안전부의 [도로명 조회 사이트]에서 검색되는 주소를 기반으로 합니다.<br />
※ 띄어쓰기, 오타 여부 및 검색을 통해 실제 있는 주소인지 확인해 주세요.<br />
※ 주소가 등록되어 있지 않거나 건물명이 다른 경우 <a href="https://www.juso.go.kr/help/QABoardList.do"><span style="color:#3498db;"><strong>도로명주소 도움센터</strong></span></a>에 등록(변경) 요청해 주세요.<br />
※ 도로명 주소가 있지 않은 주소지는 등록이 가능하지 않습니다.<br />
<br />
* 도로명 조회 사이트에 등록되어 있으나 건물명이 검색되지 않을 경우 1 :1문의로 주소지와 함께 요청해 주세요.<br />
<br />
<a href="https://www.musinsa.com/app/cs/faq?idx=27"><span style="color:#3498db;"><strong>[고객센터 FAQ 바로 가기]</strong></span></a></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">기타</em>
							<p class="CFaqTableItem__question">주문한 상품이 일부만 도착했어요.</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>브랜드 및 상품에 따라 출고지가 다르기 때문에 여러 개 상품을 주문한 경우에는 각각 배송이 됩니다.&nbsp;<br />
브랜드가 달라도 상품 주문 시 한 번에 결제할 수 있습니다.&nbsp;<br />
<br />
아직 도착하지 않는 상품은 아래 경로에서 배송진행 상황을 확인해 주세요.&nbsp;<br />
<br />
■ 배송 조회 경로<br />
<a href="/orderList"><span style="color:#3498db;"><strong>마이페이지 > 배송 중/픽업 대기 > 배송조회</strong></span></a><br />
<br />
<a href="https://www.musinsa.com/app/cs/faq?idx=32"><span style="color:#3498db;"><strong>[배송조회 FAQ 바로 가기]</strong></span></a><br />
&nbsp;</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">배송 일반</em>
							<p class="CFaqTableItem__question">일반 배송 상품은 언제 배송 되나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>일반배송은 브랜드마다 일정이 다르고 평일 기준으로 출고 됩니다.&nbsp;<br />
출고 일정은 상품의 상세페이지 출고 정보에서 확인 가능합니다.&nbsp;<br />
<br />
※ 평일 기준 출고로 연휴 및 공휴일은 배송일에서 제외됩니다.<br />
※ 무신사스토어는 전 상품 100% 무료 배송입니다.&nbsp;<br />
※ 배송 지연 상품의 경우 상품명에 지연으로 아이콘이 표시됩니다.&nbsp;<br />
※ 출고 지연 발생 시에는 알림톡 또는 문자를 통해 안내해 드립니다.<br />
※ 주문 시 배송 메모에 배송 희망 일자를 작성하셔도 해당일에 지정 배송은 어렵습니다.<br />
<br />
<a href="https://www.musinsa.com/app/cs/faq?idx=32"><span style="color:#3498db;"><strong>[배송조회 FAQ 바로 가기]</strong></span></a><br />
<br />
<img alt="" height="361" src="//image.musinsa.com/images/faq/2022053015220200000003509.jpg" style="float:left" width="328" /></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">취소/반품(환불)</em>
							<p class="CFaqTableItem__question">반품접수는 어떻게 하나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>교환(환불) 접수 시 선택했던 방법으로 반품 접수해 주세요.<br />
<br />
■ 회수해 주세요<br />
무신사 자동회수 서비스로 택배기사가 요청한 회수지로 평일 기준 1일 ~ 3일 이내 방문합니다.&nbsp;<br />
※ 방문 전 택배 기사분이 연락 후 방문 예정이며, 비대면으로 상품을 전달할 때는 반품 상자를 구분할 수 있도록 표시 후 회수 장소에 보관해 주세요.<br />
<br />
■ 직접 발송했어요<br />
상품을 받은 택배사와 같은 택배사로 고객님께서 직접 반품 예약을 해주셔야 합니다.<br />
상품 회수 완료 시 반송장 정보를 입력해 주세요.<br />
<br />
※ 계약된 택배사가 아닌 다른 택배사 이용 시 추가 비용 발생할 수 있고 2개 이상의 브랜드 반송 시, 각각 반송지로 보내주세요.<br />
※ 안내서에 배송비 동봉 등에 대한 내용이 있더라도, 동봉하면 안 됩니다.<br />
<br />
<span style="color:#3498db;"><strong><a href="https://www.musinsa.com/app/cs/faq?idx=100">[반송장 입력 FAQ 바로 가기]</a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=38">[택배사 고객센터 FAQ 바로 가기]</a></strong></span></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">취소/반품(환불)</em>
							<p class="CFaqTableItem__question">반송장 입력, 수정은 어떻게 하나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>마이 페이지 > 주문/배송/픽업 조회에서 교환(환불) 요청한 상품에 반송장 입력해 주셔야 빠른 처리가 가능합니다.<br />
<br />
■ 반송장 입력하기<br />
마이 페이지 > 주문/배송/픽업 조회&nbsp;<br />
반송장 입력을 눌러 반품을 보낸 택배 업체와 송장 번호, 반품 날짜를 등록할 수 있습니다.<br />
<br />
■ 반송장 수정하기<br />
마이 페이지 > 주문/배송/픽업 조회&nbsp;<br />
반송장 수정을 선택 후 택배 업체, 송장 번호, 날짜를 변경 하면 완료됩니다.<br />
<br />
※ 교환(환불) 요청 다음 날부터 9일 이내 입력을 하지 않거나 상품이 반품 주소지에 도착하지 않는 경우 반품은 취소되고 주문 상태는 구매 확정으로 변경됩니다.<br />
<br />
<a href="https://www.musinsa.com/app/mypage/order_list_opt"><span style="color:#3498db;"><strong>주문/배송/픽업 조회 바로 가기</strong></span></a><br />
<span style="color:#3498db;"><strong><a href="https://www.musinsa.com/app/cs/faq?idx=96">[교환 접수 FAQ 바로 가기]</a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=91">[환불 접수 FAQ 바로 가기]</a></strong></span></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">교환/반품</em>
							<p class="CFaqTableItem__question">상품은 보냈는데 언제 교환상품이 배송 되나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>교환 진행 과정은 아래 내용 참고해 주세요.&nbsp;<br />
<br />
■ 교환 진행 과정&nbsp;<br />
상품 회수 > 반품 도착 > 검수 진행 > &nbsp;교환 상품 출고<br />
<br />
※ 상품 회수 후 반품 도착까지 평일 기준 1일 ~ 2일 소요됩니다.&nbsp;<br />
※ 검수 기간은 평일 기준 1일 ~ 3일 소요됩니다.&nbsp;<br />
※ 교환 상품 출고 까지는 평일 기준 1일 ~ 3일 소요됩니다.&nbsp;<br />
※ 해외 배송 교환의 경우 평일 기준 2주 이상 소요됩니다.&nbsp;<br />
<br />
<a href="https://www.musinsa.com/app/cs/faq?idx=101"><span style="color:#3498db;"><strong>[반품 접수 FAQ 바로 가기]</strong></span></a></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">교환/반품</em>
							<p class="CFaqTableItem__question">같은 브랜드 다른 상품으로 교환 가능 한가요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>같은 브랜드 상품이라도 품번 및 상품이 다르면 교환이 가능하지 않습니다.<br />
<br />
※ 동일한 상품명의 옵션으로만 교환 신청이 가능합니다.&nbsp;<br />
※ 품절된 옵션이거나 추가 금액이 포함된 옵션은 교환이 가능하지 않습니다.<br />
※ 회원님의 사유로 교환 진행중인 상품이 품절될 경우, 반품비가 발생될 수 있고 이를 제외한 결제 금액이 환불 처리됩니다.&nbsp;<br />
※ 다른 상품으로 교환 희망 시 환불 후 재주문해 주세요.</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">교환/반품</em>
							<p class="CFaqTableItem__question">상품을 받았는데 교환하고 싶어요.</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>교환은 배송 완료 일자 포함 7일 이내일 경우에만 주문/배송/픽업 조회에서 접수 가능합니다.<br />
(예시 : 3월 8일 상품을 받으신 경우 3월 14일까지 교환 접수 가능)<br />
<br />
<span style="font-size:14px;">■ <a href="/orderList"><span style="color:#3498db;"><strong>교환 접수 경로</strong></span></a><br />
모바일(앱/웹): 마이페이지 > 주문/배송/픽업 조회 > 교환 요청<br />
PC(웹): 마이페이지 > 주문 내역 조회 > 교환 요청<br />
<br />
1. 반품할 상품의 교환을 선택 해주세요.<br />
<br />
2. 반품 방법을 선택해 주세요.<br />
- 회수해 주세요 : 무신사 자동회수 서비스로 택배기사가 요청한 회수지로 평일 기준 1일 ~ 3일 이내 방문합니다.&nbsp;<br />
- 직접 발송했어요 : 상품을 받은 택배사와 같은 택배사로 반품 예약해야 합니다.&nbsp;<br />
※ 반송장 번호가 아직 없다면 반송장 정보는 &#39;다음에 등록하기&#39;를 선택해 주세요.&nbsp;<br />
<br />
3. 교환 배송비를 선결제해야 합니다.<br />
신용카드 또는 가상 계좌 결제만 가능합니다.<br />
<br />
4. 상품은 받아본 그대로 포장해서 반품해 주셔야 합니다.<br />
<br />
※ 회원님의 사유로 교환 진행중인 상품이 품절될 경우, 반품비가 발생될 수 있고 이를 제외한 결제 금액이 환불 처리됩니다.&nbsp;<br />
※ <a href="https://www.musinsa.com/app/cs/faq?idx=42"><span style="color:#3498db;"><strong>[교환처리가 어려운 경우 FAQ]</strong></span></a>를 꼭 확인해 주세요.<br />
<br />
<span style="color:#3498db;"><strong><a href="https://www.musinsa.com/app/cs/faq?idx=101">[반품 접수 FAQ 바로가기]</a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=98">[교환 진행 과정 FAQ 바로가기]</a></strong></span></span></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">무탠 픽업 취소/환불</em>
							<p class="CFaqTableItem__question">무탠 픽업 주문건을 취소(환불/교환) 하고 싶어요.</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>픽업 주문 건은 진행 단계에 따라 취소 또는 교환(환불) 처리 방법이 다르고 픽업 완료일 기준 7일 이내에 접수 가능합니다.<br />
아래 내용을 확인해 주세요.<br />
<br />
■ 주문접수 / 결제완료 단계 교환(환불)<br />
온라인에서 바로 교환(환불)요청 가능합니다.<br />
※ 주문 완료 후 상품 준비 중 상태에서 실시간 매장 재고 현황에 따라 자동으로 주문이 취소될 수 있습니다.<br />
※ 동일한 상품의 다른 옵션으로만 교환이 가능합니다. (다른 상품으로 교환을 원할 경우 환불 후 재주문 필수)<br />
<br />
■ 픽업 대기 / 픽업완료 단계 교환(환불)<br />
픽업 완료일 기준 7일 이내에 매장 방문을 통해서만 환불 가능하고 교환은 가능하지 않습니다.<br />
※ 교환을 원하는 경우 환불 후 다시 주문해 주세요. (매장 방문 시, 무신사 온라인 스토어 > 상품 상세 페이지에서 재고 수량을 미리 확인 후 방문해 주세요.)<br />
<br />
※ 구매 확정 여부과 관계없이 픽업 완료일로부터 7일 경과 시 환불이 가능하지 않습니다.<br />
※ 픽업 완료일 기준으로 7일 시점에 자동으로 구매확정됩니다.<br />
<br />
<a href="https://www.musinsa.com/app/mypage/order_list_opt"><span style="color:#3498db;"><strong>주문/배송/픽업 조회 바로 가기</strong></span></a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=52"><span style="color:#3498db;"><strong>[오프라인 매장 FAQ 바로 가기]</strong></span></a></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">취소/반품(환불)</em>
							<p class="CFaqTableItem__question">환불 금액은 언제 입금되나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>결제했던 수단으로 환불되고 각 결제 수단마다 환불 기간이 다릅니다.<br />
아래 결제수단별 환불 소요 기간을 확인해 주세요.<br />
<img alt="" src="//image.musinsa.com/images/faq/2023061317131700000033507.png" /><br />
※ 해외 비자 카드의 경우 부분 취소가 가능하지 않습니다.<br />
※&nbsp;휴대전화 환불은 결제월과 환불월이 다르거나 부분 취소 시 계좌로 환불됩니다.</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">취소/반품(환불)</em>
							<p class="CFaqTableItem__question">상품은 보냈는데 언제 환불 되나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>환불 진행 과정은 아래 내용 참고해 주세요.&nbsp;<br />
<br />
■ 환불 진행 과정&nbsp;<br />
상품 회수 > 반품 도착 > 검수 진행 > &nbsp;환불 진행<br />
<br />
※ 상품 회수 후 반품 도착까지 평일 기준 1일 ~ 2일 소요됩니다.&nbsp;<br />
※ 검수 기간은 평일 기준 1일 ~ 3일 소요됩니다.&nbsp;<br />
※ 환불 완료되었어도 결제한 수단으로 환불까지 기간이 소요됩니다.&nbsp;<br />
※ 해외 배송 환불의 경우 평일 기준 7일 이상 소요됩니다.&nbsp;<br />
<br />
<a href="https://www.musinsa.com/app/cs/faq?idx=93"><span style="color:#3498db;"><strong>[결제수단 별 환불 기간 FAQ 바로 가기]</strong></span></a></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">취소/반품(환불)</em>
							<p class="CFaqTableItem__question">상품을 받았는데 환불하고 싶어요.</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>환불은 배송 완료 일자 포함 7일 이내일 경우에만 주문/배송/픽업 조회에서 접수 가능합니다.<br />
(예시 : 3월 8일 상품을 받으신 경우 3월 14일까지 환불 접수 가능)<br />
<br />
■ <a href="/mypage"><span style="color:#3498db;"><strong>환불 접수 경로</strong></span></a><br />
모바일(앱/웹): 마이페이지 > 주문/배송/픽업 조회 > 환불 요청<br />
PC(웹): 마이페이지 > 주문 내역 조회 > 환불 요청<br />
<br />
1. 반품할 상품의 환불을 선택해 주세요.<br />
<br />
2. 반품 방법을 선택해 주세요.<br />
- 회수해 주세요 : 무신사 자동회수 서비스로 택배기사가 요청한 회수지로 평일 기준 1일 ~ 3일 이내 방문합니다.&nbsp;<br />
- 직접 발송했어요 : 상품을 받은 택배사와 같은 택배사로 고객님께서 직접 반품 예약을 해주셔야 합니다.<br />
※ 반송장 번호가 아직 없다면 반송장 정보는 다음에 등록하기를 선택해 주세요.&nbsp;<br />
<br />
3. 환불 배송비는 상품 도착 및 검수 완료 후 주문 금액에서 차감 환불 됩니다.<br />
※ 휴대전화 결제, 반품 배송비가 상품 금액보다 클 경우 반품비 결제 후 접수 가능합니다.<br />
<br />
4. 상품은 받아본 그대로 포장해서 반품해 주셔야 합니다.<br />
※ 받은 사은품이 있다면 같이 포장해서 반품해 주세요.<br />
<br />
<span style="color:#3498db;"><strong><a href="https://www.musinsa.com/app/cs/faq?idx=101">[반품 접수 FAQ 바로 가기]</a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=42">[환불이 어려운 경우 FAQ 바로 가기]</a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=92">[환불 진행 과정 FAQ 바로 가기]</a></strong></span></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">취소/반품(환불)</em>
							<p class="CFaqTableItem__question">주문을 취소(옵션변경)를 하고 싶어요.</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>주문 후 주문 상태에 따라 &nbsp;마이페이지 > 주문/배송/픽업 조회에서 즉시 취소 또는 취소 요청이 가능합니다.&nbsp;<br />
<br />
■ 주문 상태별 취소 안내<br />
- 입금 확인: 신청 즉시 주문이 취소되고, 사용한 적립금과 쿠폰은 반환되어 재사용 가능합니다.<br />
- 출고 처리중: 취소 요청 승인 시 주문이 자동 취소됩니다. 배송 준비가 완료된 경우 취소 요청이 거절될 수 있습니다.<br />
<br />
※ 가상 계좌 결제는 2일 이내 입금하지 않을 경우와 재고 품절 시 주문은 자동으로 취소됩니다.<br />
※ 반환된 쿠폰의 유효기간이 만료된 경우 재사용이 가능하지 않습니다.<br />
※ 옵션 변경의 경우 입금 확인 상태에서만 가능하며, 입금하지 않은 주문의 옵션 변경을 원하는 경우 주문 취소 후 재주문해 주세요.<br />
<br />
<a href="https://www.musinsa.com/member/mypage"><span style="color:#3498db;"><strong>주문/배송/픽업 조회 바로 가기</strong></span></a><br />
<strong><a href="https://www.musinsa.com/app/cs/faq?idx=142"><span style="color:#3498db;">[출고 처리중 주문취소 FAQ 바로 가기]</span></a></strong><br />
<strong><a href="https://www.musinsa.com/app/cs/faq?idx=90"><span style="color:#3498db;">[가상계좌 결제 자동취소 FAQ 바로 가기]</span></a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=91"><span style="color:#3498db;">[환불 접수 FAQ 바로 가기]</span></a></strong></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">기타</em>
							<p class="CFaqTableItem__question">랭킹은 무엇이고 어떻게 정해지나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>랭킹은 무신사의 주요 콘텐츠인 상품, 브랜드, 검색어의 순위를 제공하는 메뉴입니다. 각 항목의 랭킹은 아래와 같은 기준으로 정해집니다.<br />
&nbsp;<br />
&nbsp;■ 상품 랭킹<br />
&nbsp;상품 랭킹은 제품의 매출, 수량, 조회 수, 작성 후기의 수 등을 반영한 공식에 의해 산정됩니다. 실시간, 일간, 주간, 월간, 3개월 기간으로 나누어 볼 수 있으며, 실시간 랭킹은 30분 단위로 갱신됩니다.<br />
&nbsp;<br />
&nbsp;■ 브랜드 랭킹<br />
&nbsp;브랜드 랭킹은 제품의 인기도, 매출, 상품 조회 수 등을 반영한 공식에 의해 산정됩니다. 실시간, 일간, 주간, 월간, 3개월 기간으로 나누어 볼 수 있습니다.<br />
<br />
* 무신사는 랭킹을 조작하거나 랭킹으로 광고를 하지 않습니다.<br />
* 랭킹이 집계되는 시간당 전체 주문수가 상대적으로 적은 새벽이나 아침 시간에는 특정 상품이 적은 수량의 판매만으로도 랭킹 상위권에 올라갈 가능성이 있습니다.<br />
* 비정상적인 방법(매크로 프로그램을 이용한 조회 수 조작, 허위 주문 후 취소 반복)을 이용한 인위적인 랭킹 조작이 적발되는 경우 무신사 내부 규정에 따라 랭킹 노출 제외, 일정 기간 판매 중지, 퇴점 등의 조치를 취합니다.</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">프로모션/이벤트</em>
							<p class="CFaqTableItem__question">친구 초대 이벤트란 무엇인가요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>내가 초대한 친구가 회원 가입 및 신규 구매 시 추천인, 초대한 친구 모두 3,000원의 적립금을 지급받을 수 있는 이벤트입니다.<br />
* 초대한 친구가 회원 가입 시 1,000원, 첫 구매 완료 시 2,000원 지급<br />
* 회원 가입 기준 : 본인인증 완료, 첫 구매 기준 : 구매확정 완료<br />
<br />
※ 초대받은 친구가 가입 후 본인 인증 하지 않는 경우, 적립금이 지급되지 않습니다.<br />
※ 초대받은 친구가 탈퇴 후 재가입할 경우, 적립금은 재지급되지 않습니다.<br />
※ 구매확정은 주문 상품을 받은 후 주문/배송조회 페이지에서 선택 가능합니다.<br />
※ 초대받은 친구가 첫 구매확정 적립금을 받으신 후 주문 취소/환불 시, 지급된 적립금은 회수됩니다. 첫 구매 다음 주문 시에도 재지급되지 않습니다.<br />
※ 이벤트 기간 중에 친구가 회원 탈퇴 또는 탈퇴 후 재가입 시 초대 횟수에 반영되지 않습니다.<br />
<br />
<strong><a href="https://www.musinsa.com/member/event/friend"><span style="color:#3498db;">친구 초대 이벤트 바로 가기</span></a></strong></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">후기</em>
							<p class="CFaqTableItem__question">후기 종류 및 규정은 어떻게 되나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>후기는 일반 후기, 상품 사진 후기, 뷰티 후기, 스타일 후기로 구성되어 있고 작성 시 적립금이 지급됩니다.<br />
후기 작성 방법 및 적립금 지급액은 아래 내용을 확인해 주세요.<br />
<br />
■ 일반 후기<br />
- 사진 등록 없이, 글로만 작성<br />
- 적립금 500원 지급<br />
<br />
■ 상품 사진 후기<br />
- 상품 포장을 제거한 뒤 상품의 전체 실루엣이 또렷하게 보이도록 직접 촬영한 사진을 등록<br />
- 적립금 1,000원 지급<br />
<br />
■ 뷰티 후기<br />
- 상품을 발색/도포/사용한 신체 부위가 식별 가능하도록 직접 촬영한 사진을 등록<br />
- 적립금 2,000원 지급<br />
<br />
■ 스타일 후기<br />
- 상품을 착용, 전신 스타일링한 후 어깨부터 발끝까지 보이도록 직접 촬영한 사진을 등록<br />
- 착용이 어려운 상품은 손에 들거나 몸에 지닌 상태로 어깨부터 발끝까지 보이도록 직접 촬영한 사진을 등록<br />
- 적립금 2,000원 지급<br />
<br />
※ 20자 미만으로 작성 시 등록되지 않습니다.<br />
※ 단순 문자 및 기호 나열 및 반복은 입력이 제한됩니다.<br />
※ 이미지 폭이 300px 미만이거나 2000px을 초과하면 등록되지 않습니다.<br />
※ 이메일, 휴대전화 번호 등의 개인 정보/광고/비속어가 포함된 후기는 비노출 처리됩니다.<br />
※ 주문 상품과 관련 없는 후기 작성 시, 적립금이 지급되지 않습니다.<br />
※ 도용이 적발될 시에는 이미 작성된 후기 및 적발 일로부터 3개월간 작성된 후기에 대하여 적립금 지급이 중단됩니다.&nbsp;<br />
&nbsp;&nbsp;&nbsp;또한, 해당 후기 종류에 지급되는 최대 적립금의 2배 회수 및 무신사 서비스 이용이 1년간 정지됩니다.<br />
<br />
■ 참고 사항<br />
- 작성한 후기는 무신사 스토어 및 무신사 글로벌 이용자에게 공개되며, 다른 회원이 댓글을 작성할 수 있습니다.<br />
- 작성된 후기는 무신사 홍보 콘텐츠로 사용될 수 있습니다.<br />
<br />
<a href="https://m.store.musinsa.com/app/mypage/write_review"><span style="color:#3498db;"><strong>후기 작성 바로 가기</strong></span></a></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">AS</em>
							<p class="CFaqTableItem__question">상품이 불량인 것을 착용하고나서 확인했어요 어떻게 하나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>착용 후 불량 확인 시에는 초기 불량 여부 확인이 어려워 교환 및 환불이 가능하지 않습니다.<br />
<br />
* 브랜드 측으로 AS 가능 여부 확인 후 AS 처리 진행이 가능합니다.<br />
* 미 착용 상태에서 불량 확인 시, 무상으로 환불 및 교환 처리가 가능합니다.<br />
<br />
<a href="https://www.musinsa.com/app/cs/faq?idx=34"><span style="color:#3498db;"><strong>[AS FAQ 바로 가기]</strong></span></a></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">혜택</em>
							<p class="CFaqTableItem__question">포인트를 모으는 방법이 따로 있나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>준비된 미션 수행 시 포인트를 지급합니다.<br />
스냅에서 좋아요 3개 이상을 누르고 포인트 받기를 누르면 하루에 50포인트를 지급받을 수 있습니다.<br />
아래 오늘의 미션 바로 가기에서 다양한 미션을 만나보세요.<br />
<br />
<strong><a href="https://www.musinsa.com/member/mission"><span style="color:#3498db;">오늘의 미션 바로 가기</span></a><br />
<a href="https://www.musinsa.com/mz/community-event_notice/view/737757"><span style="color:#3498db;">포인트 적립 방식 개편 안내 바로 가기</span></a><br />
<a href="https://www.musinsa.com/app/cs/faq?idx=1"><span style="color:#3498db;">[적립금, 포인트 FAQ 바로 가기]</span></a></strong></p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">혜택</em>
							<p class="CFaqTableItem__question">적립금은 언제나 사용할 수 있나요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>적립금은 5,000원 이상 보유 시 판매가의 7%까지 사용이 가능합니다.<br />
<br />
■ 적립금 사용이 되지 않을 경우<br />
- 바로 접속 OFF일 경우 적립금 사용이 제한됩니다.&nbsp;<br />
- 바로 접속 ON으로 변경 방법: 실행된 브라우저를 모두 종료 후 무신사 스토어 URL 주소를 직접 입력하여 접속해 주세요.<br />
- 위와 같은 방법으로도 바로 접속 OFF 상태일 경우 아래 URL을 복사하여 주소창에 입력 후 접속해 주세요.(store.musinsa.com/app/?source=ICON)<br />
- 일부 상품의 경우 본사 또는 브랜드 정책상 적립금 사용이 가능하지 않을 수 있습니다. 적립금 사용이 가능하지 않은 상품은 주문 작성 페이지에서 확인 가능합니다.</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">혜택</em>
							<p class="CFaqTableItem__question">환불 시 사용한 적립금은 어떻게 반환되나요</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>주문 시 사용한 적립금은 상품을 환불할 경우 다시 반환됩니다.<br />
부분 환불 시 사용한 적립금의 비율만큼 반환됩니다.<br />
<br />
■ 부분 환불 예시&nbsp;<br />
A 상품 - 30,000원 / B 상품 - 50,000원 / C 상품 - 70,000원을 구매할 때 사용한 적립금이 10,500원(구매 금액의 7%)일 경우,&nbsp;<br />
- A 상품 취소 시 30,000원의 7%인 2,100원의 적립금 반환, 차액 27,900원 환불&nbsp;<br />
- B 상품 취소 시 50,000원의 7%인 3,500원의 적립금 반환, 차액 46,500원 환불<br />
- C 상품 취소 시 70,000원의 7%인 4,900원의 적립금 반환, 차액 65,100원 환불</p>
							</div>
						</div>
					</div>
										<div class="CFaqTableItem ">
						<div class="CFaqTableItem__list">
							<em class="CFaqTableItem__category">혜택</em>
							<p class="CFaqTableItem__question">적립금과 포인트는 무엇인가요?</p>
						</div>
						<div class="CFaqTableItem__contents-box">
							<em class="CFaqTableItem__answer">답변</em>
							<div class="CFaqTableItem__contents">
								<p>1. 적립금은?<br />
무신사 스토어 상품을 구매하거나 후기 작성을 통해 지급됩니다.<br />
* 주문 시 할인 수단으로 사용 가능(단, 현금으로 환급은 불가)<br />
<br />
■<span style="color:#3498db;"> </span><strong><a href="/mypage"><span style="color:#3498db;">회원 등급별 적립금 혜택</span></a></strong><br />
- 모바일(앱/웹) : 마이페이지 > 회원 혜택(오른쪽 위 회원등급)에서 확인<br />
- PC(웹) : 마이페이지 > 등급혜택에서 확인<br />
<br />
2. 포인트는?<br />
준비된 미션 수행을 통해 지급됩니다.<br />
* 보유 포인트가 1,000점 이상일 때 적립금으로 전환 가능(단, 한 번 전환된 포인트는 다시 회수 불가)<br />
<strong><a href="/mypage"><span style="color:#3498db;">오늘의 미션 바로 가기</span></a></strong><br />
<br />
■ <strong><a href="/mypage"><span style="color:#3498db;">포인트 적립 확인 및 전환</span></a></strong><br />
- PC/모바일 : 마이페이지 > 포인트에서 확인</p>
							</div>
						</div>
					</div>
									</div>
			</div>
		</div>
	
</body>
</html>
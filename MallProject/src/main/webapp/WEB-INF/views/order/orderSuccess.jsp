<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="ko">
<head><title>로그인</title>
<meta charSet="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
<link rel="icon" href="/favicon.ico"/>
<link rel="apple-touch-icon" href="/weverse_touchicon.png"/>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
<link rel="stylesheet" href="/resources/css/weverse.css"/>
<style data-styled="" data-styled-version="5.3.5">
</style>
</head>
<body>
<div class="navbar">
    <a href="/" id="logo">
        <img src="img/weverslogo.jpg" width="149">
    </a>
</div>

<div class="sc-fdeced8b-1 iIqxLr">
	<div class="sc-fdeced8b-0 bQTewR">
		<div class="sc-b9ce515e-0 iFUJFS">
			<img src="img/weverslogo.jpg" alt="weverse" class="sc-b9ce515e-1 eFotTF"/>
		</div>
	</div>
	
	<div class="sc-fdeced8b-3 fuepEy">
		<h1 class="sc-abf9608-0 gherQT">주문이 완료되었습니다.</h1>
		<div class="sc-e68656a-0 bwXZkX">
			<div class="sc-ed52fcbe-0 cmqmuL">
				<label class="sc-ed52fcbe-1 csduFG">-상품 정보</label>
				<div class="sc-ed52fcbe-8 bhRZmA">
					<img src="img/${img}" style="width:150px;">
					<b>${prodname}</b>
				</div>
				<br>
				<div class="sc-ed52fcbe-8 bhRZmA">
					<b>수량 : ${qty} 개</b>
				</div>
				<br>
				<div class="sc-ed52fcbe-8 bhRZmA">
					<b>금액 : ${total} 원</b><sub style="font-weight:bold;">(+ ${savePoint}P)</sub>
				</div>
				<br>
				<div class="sc-ed52fcbe-8 bhRZmA">
					<b>사용 포인트 : ${usePoint} 점</b>
				</div>
				<div class="sc-ed52fcbe-5 brYFFU">
					<strong class="sc-ed52fcbe-6 gdkOVW"></strong>
				</div>
			</div>
			
			<div class="sc-d0f94a43-0 eJnyxH">
				<div class="sc-ed52fcbe-0 cmqmuL">
					<label class="sc-ed52fcbe-1 csduFG"><b>-주문자 정보</b></label>
					<br>
						<div class="sc-ed52fcbe-8 bhRZmA">
							<span>받는 분 : </span> <Strong>&nbsp;${name}</Strong>
							<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<br>
						<div class="sc-ed52fcbe-8 bhRZmA">
							<span>전화번호 : <Strong>${mobile}</Strong></span>
							<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<br>
						<div class="sc-ed52fcbe-8 bhRZmA">
							<span>주소 : <Strong>${address}</Strong></span>
							<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<br>
						<div class="sc-ed52fcbe-8 bhRZmA">
							<span>결제 수단 : <Strong>${payment}</Strong></span>
							<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<br>
						<div class="sc-ed52fcbe-8 bhRZmA">
							<span>결제 일시 : <Strong>${now}</Strong></span>
							<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<br>
				</div>
				<br><br>
				<a href="/">
				<button type="button" class="sc-763a3587-1 frWBac" id=home>
				<span class="sc-763a3587-2 gTYrd">추가 쇼핑하기</span>
				</button>
				</a>
			</div>
			
			<table><tr height="20px"></tr></table>
		</div>
		<a href="/orderList">
		<button type="button" class="sc-763a3587-1 frWBac" id=orderlist>
		<span class="sc-763a3587-2 gTYrd">주문내역 확인하기</span>
		</button>
		</a>
	</div>
</div>
</body>
</html>
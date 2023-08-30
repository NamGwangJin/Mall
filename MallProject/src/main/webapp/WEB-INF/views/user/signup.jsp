<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head><title>회원가입</title>
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
			<img src="img/weverseAccount.svg" alt="weverse account" class="sc-b9ce515e-1 eFotTF"/>
		</div>
	</div>
	
	<div class="sc-fdeced8b-3 fuepEy">
		<h1 class="sc-abf9608-0 gherQT"></h1>
		<div class="sc-e68656a-0 bwXZkX">
			
			<div class="sc-d0f94a43-0 eJnyxH">
				<!-- ID 구역 -->
				<div class="sc-ed52fcbe-0 cmqmuL">
					<label class="sc-ed52fcbe-1 csduFG"></label>
					<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="text" id=id aria-required="true" name="id" placeholder="ID" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-4 jKMGbI"></button>
						<button tabindex="-1" type="button" class="sc-763a3587-1 frWBac" style="width:500px;" id=check disabled="disabled">중복확인</button>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
					</div>
					<div id=idvd></div>
					<div class="sc-ed52fcbe-5 brYFFU">
						<strong class="sc-ed52fcbe-6 gdkOVW"></strong>
					</div>
				</div>
				<!-- ID 구역 끝-->
				<!-- 비밀번호 -->
				<div class="sc-ed52fcbe-0 cmqmuL">
					<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="password" id=passcode1 aria-required="true" name="password" placeholder="Password" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-4 jKMGbI"></button>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-3 diGBDF"></button>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
					</div>
				</div>
				<div class="sc-ed52fcbe-0 cmqmuL">
					<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="password" id=passcode2 aria-required="true" name="password" placeholder="Confirm Password" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-4 jKMGbI"></button>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-3 diGBDF"></button>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
					</div>
					<div id=pwvd></div>
				</div>
				<!-- 비밀번호, 비밀번호 확인 구역 끝 -->
				<!-- 이름 -->
				<div class="sc-d0f94a43-0 eJnyxH">
					<div class="sc-ed52fcbe-0 cmqmuL">
						<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="text" id=name aria-required="true" name="name" placeholder="이름 ex)홍길동" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-4 jKMGbI"></button>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<div id=namevd></div>
					</div>
				</div>
				<!-- 이름 끝 -->
				<!-- 생년월일 -->
				<div class="sc-d0f94a43-0 eJnyxH">
					<div class="sc-ed52fcbe-0 cmqmuL">
						<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="date" id=birthday aria-required="true" name="birthday" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<div id=bdvd></div>
					</div>
				</div>
				<!-- 생년월일 끝 -->
				<!-- 모바일 -->
				<div class="sc-d0f94a43-0 eJnyxH">
					<div class="sc-ed52fcbe-0 cmqmuL">
						<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="text" id=mobile aria-required="true" name="mobile" placeholder="휴대전화 ex)010-1234-5678" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-4 jKMGbI"></button>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<div id=mobilevd></div>
					</div>
				</div>
				<!-- 모바일 끝 -->
				<!-- 이메일 -->
				<div class="sc-d0f94a43-0 eJnyxH">
					<div class="sc-ed52fcbe-0 cmqmuL">
						<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="text" id=email aria-required="true" name="email" placeholder="이메일" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-4 jKMGbI"></button>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
						<div id=emailvd></div>
					</div>
				</div>
				<!-- 이메일 끝 -->
				<!-- 주소 -->
				<div class="sc-d0f94a43-0 eJnyxH">
					<div class="sc-ed52fcbe-0 cmqmuL">
						<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="text" id=postcode aria-required="true" name="address" placeholder="우편번호" class="sc-ed52fcbe-7 jPIHur" value="" readonly/><br>
						<button tabindex="-1" type="button" class="sc-763a3587-1 frWBac" style="width:500px;" id=search>검색</button>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
					</div>
				</div>
				<div class="sc-d0f94a43-0 eJnyxH">
					<div class="sc-ed52fcbe-0 cmqmuL">
						<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="text" id=address1 aria-required="true" name="address" placeholder="주소" class="sc-ed52fcbe-7 jPIHur" value="" readonly/>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
					</div>
				</div>
				<div class="sc-d0f94a43-0 eJnyxH">
					<div class="sc-ed52fcbe-0 cmqmuL">
						<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="text" id=address2 aria-required="true" name="address" placeholder="상세주소" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
						</div>
					</div>
				</div>
				<!-- 주소 끝 -->
				<br><br>
				<button type="button" class="sc-763a3587-1 frWBac" id=signup>
				<span class="sc-763a3587-2 gTYrd">가입하기</span>
				</button>
			</div>
			
			<table><tr height="20px"></tr></table>
		</div>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/signup.js"></script>
</html>
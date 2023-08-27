<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<img src="img/weverseAccount.svg" alt="weverse account" class="sc-b9ce515e-1 eFotTF"/>
		</div>
	</div>
	
	<div class="sc-fdeced8b-3 fuepEy">
		<h1 class="sc-abf9608-0 gherQT">위버스	 계정으로<br>로그인 해주세요.</h1>
		<div class="sc-e68656a-0 bwXZkX">
			<div class="sc-ed52fcbe-0 cmqmuL">
				<label class="sc-ed52fcbe-1 csduFG"></label>
				<div class="sc-ed52fcbe-8 bhRZmA">
					<input type="text" id=id aria-required="true" name="email" placeholder="ID" class="sc-ed52fcbe-7 jPIHur" value=""/>
					<button tabindex="-1" type="button" class="sc-ed52fcbe-4 jKMGbI"></button>
					<hr class="sc-ed52fcbe-2 bVlPDx"/>
				</div>
				<div class="sc-ed52fcbe-5 brYFFU">
					<strong class="sc-ed52fcbe-6 gdkOVW"></strong>
				</div>
			</div>
			
			<div class="sc-d0f94a43-0 eJnyxH">
				<div class="sc-ed52fcbe-0 cmqmuL">
					<label class="sc-ed52fcbe-1 csduFG"></label>
						<div class="sc-ed52fcbe-8 bhRZmA">
						<input type="password" id=passcode1 aria-required="true" name="password" placeholder="Password" class="sc-ed52fcbe-7 jPIHur" value=""/>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-4 jKMGbI"></button>
						<button tabindex="-1" type="button" class="sc-ed52fcbe-3 diGBDF"></button>
						<hr class="sc-ed52fcbe-2 bVlPDx"/>
					</div>
				</div>
				<br><br>
				<button type="button" class="sc-763a3587-1 frWBac" id=login>
				<span class="sc-763a3587-2 gTYrd">로그인</span>
				</button>
			</div>
			
			<table><tr height="20px"></tr></table>
		</div>
		
		<button type="button" class="sc-763a3587-1 frWBac" id=signup>
		<span class="sc-763a3587-2 gTYrd">회원가입</span>
		</button>
		<br><br>
		<div class="sc-610c9ba6-1 ijHOdC">
		<hr/><span class="sc-610c9ba6-2 frKZDb">혹은</span><hr/>
		</div>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
    $("#passcode1").on("keyup",function(key){
        if(key.keyCode==13) {
            $('#login').trigger("click");
        }
    });
})
.on('click','#login',function(){
	$.ajax({
		url:'/login',
		data: {
			'id': $('#id').val(),
			'passcode1': $('#passcode1').val()
		},
		type:'post',
		dataType:'text',
		beforeSend:function(){
			if($('#id').val()==''){
				alert('아이디가 없습니다.'); return false;
			}
			if($('#passcode1').val()==''){
				alert('비밀번호가 없습니다.'); return false;
			}
		},
		success:function(data){
			if (data == "1"){
				document.location = "/"
			} else {
				alert("입력하신 회원정보와 일치하는 데이터가 없습니다.");
			}
		},
		error:function(){
			alert("로그인 도중 오류가 발생했습니다. 다시 시도해 주세요.");
			return false;
		}
	})
})
.on('click','#signup',function(){
	document.location = "/gosignup"
})
</script>
</html>
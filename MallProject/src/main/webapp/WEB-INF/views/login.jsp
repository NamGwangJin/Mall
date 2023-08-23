<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<body>
<table>
	<tr><td>아이디 <input type="text" name=id id=id value=''></td></tr>
	<tr><td>비밀번호 <input type="text" name= passcode1 id=passcode1 value=''></td></tr>
	
</table>
<table>
	<tr><td><input type="button" id=login value='로그인'></td><td></td>
		<td><input type="button" id=cancle value='취소'></td>
	</tr>	
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script> <!--필수-->

<script>
$(document).on('click', '#login', function(){
			
	$.ajax({
		url:'/login',
		data: {
			'id': $('#id').val(),
			'passcode1': $('#passcode1').val()
		},
		method:'post',
		dataType:'text',
		brforeSend:function(){
			if($('#id').val()==''){
				alert('아이디가 없습니다.'); return false;
			}
			if($('#passcode1').val()==''){
				alert('비밀번호가 없습니다.'); return false;
			}
		},
		success:function(data){
			document.location=data;
		}
	})
});
</script>
</html>
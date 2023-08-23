<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

table {width:33%; border-collapse:collapse;}
td {width:33%; height:33%; border:1px solid teal;}
</style>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
</head>
<body>
<table>
	<tr><td>아이디 <input type="text" name=id id=id value='' size=12></td></tr>
	<tr><td>비밀번호  <input type="text" name=passcode1 id=passcode1 value='' size=12></td></tr>
	<tr><td>비밀번호확인<input type="text" name=passcode2 id=passcode2 value='' size=12></td></tr>
	<tr><td>이름<input type="text" name=name id=name value='' size=12></td></tr>
	<tr><td>생년월일 <input type="date" name=birthday id=birthday></td></tr>
	<tr><td>모바일번호 <input type="text" name=mobile id=mobile value='' size=16></td></tr>
	<tr><td>이메일 <input type="text" name=email id=email value='' size=16></td></tr>	
</table>
<table>
	<tr><td><input type="button" id=signup value='가입'></td>
		<td><input type="reset" id=signcancle value='취소'></td>
		
	</tr>
	
</table>
<a href='/login'>로그인하기</a>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>
$(document)
.on('click', '#signup', function(){	
	$.ajax({
		url:'/signup',
		data:{'id':$('#id').val(), 'passcode1':$('#passcode1').val(), 'passcode2':$('#passcode2').val(),
			'name':$('#name').val(),'birthday':$('#birthday').val(),'mobile':$('#mobile').val(),
			'email':$('#email').val()},
		method:'post',
		dataType:'text',
		beforeSend:function(){
			if($('#id').val()==''){
				alert('id가 없습니다.'); return false;
			}
			if($('#passcode1').val()==''){
				alert('비밀번호가 없습니다.'); return false;
			} else if($('#passcode1').val()!=$('#passcode2').val()){
				alert('비밀번호와  비밀번호 확인 값이 같아야 합니다.'); return false;
			} 
			if ($('#name').val() === '') {
                showAlert('실명을 입력하시오');
                return false;
            }
			if ($('#birthday').val() === '') {
                showAlert('생년월일을 입력하시오');
                return false;
            }
			
			return true;
		},
		success:function(data){
			console.log(data)
			if(data.substr(0,1)=="/"){
				document.location=data;
			} else {
				alert(data);
			}
		}
		
	})
	return false;			
}); 


</script>
</html>
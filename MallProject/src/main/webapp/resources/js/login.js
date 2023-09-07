$(document)
.ready(function(){
	$('#id').val($.cookie('userid'));
	$('#passcode1').val($.cookie('passcode1'));
	
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
				
				if( $.cookie('userid') != $('#id').val() || $.cookie('userid') == '' ) {
					if(confirm("로그인 정보를 저장 할까요?") == true) {
						$.cookie('userid',$('#id').val());
						$.cookie('passcode1',$('#passcode1').val());
						document.location = "/"
						return false;
					} else {
						document.location = "/"
						return false;
					}
				} else {
					document.location = "/"
					return false;
				}
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
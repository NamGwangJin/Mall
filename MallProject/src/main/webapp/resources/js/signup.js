var idRegExp = /^[a-z0-9]{8,16}$/; // 아이디
var pwRegExp = /^[a-zA-z0-9]{8,16}$/; // 비밀번호
var nameRegExp = /^[가-힣]{2,15}$/; //이름 한글만
var mobileRegExp = /^\d{3}-\d{4}-\d{4}$/ // 번호
var emailRegExp =/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;

$(document)
.on('click','#search',function(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                $('#address1').val(extraAddr);
            
            } else {
                $('#address1').val('');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#postcode').val(data.zonecode);
            $('#address1').val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $('#address2').focus();
        }
    }).open();
})
.on('click','#signup',function(){
	if ($('#id').val()==''){
		alert("아이디를 입력해주세요.");
		return false;
	} else if ( !idRegExp.test( $("#id").val() ) ) {
		alert("아이디의 형식을 확인해주세요.")
		return false;
	} else if ( $('#checkOk').text() != "사용 가능한 아이디입니다." ) {
		alert("아이디 중복확인을 해주세요.")
		return false;
	}
	
	if ($('#passcode1').val()==''){
		alert("비밀번호를 입력해주세요.");
		return false;
	} else if ($('#passcode2').val()=='') {
		alert("비밀번호 확인을 입력해주세요.")
		return false;
	}  else if ( $('#passcode1').val() != $('#passcode2').val() ){
		alert("비밀번호와 비밀번호 확인이 같지 않습니다.")
		return false;
	} else if ( !pwRegExp.test($('#passcode1').val()) && !pwRegExp.test($('#passcode2').val() ) ){
		alert("비밀번호의 형식을 확인해주세요.")
		return false;
	}
	
	if($('#name').val() == '') {
		alert("실명을 입력해주세요.")
		return false;
	}
	
	if($('#mobile').val() == '') {
		alert("모바일 번호를 입력해주세요.")
		return false;
	} else if (!mobileRegExp.test($('#mobile').val())){
		alert("모바읿 번호의 형식을 확인해주세요.");
		return false;
	}
	
	if($('#birthday').val() == '') {
		alert("생년월일을 선택해주세요.");
		return false;
	}
	
	if($('#email').val() == '') {
		alert("이메일을 입력해주세요.");
		return false;
	}else if(!emailRegExp.test($('#email').val())) {
		alert("이메일의 형식을 확인해주세요.");
		return false;
	}
	
	let address = $('#postcode').val() + "," + $('#address1').val() + "," + $('#address2').val();
	$.ajax({url:'/signup', data: {id : $('#id').val(), pw : $('#passcode1').val(), name : $('#name').val(), bd : $('#birthday').val(), mobile : $('#mobile').val(), email : $('#email').val(), address : address },
				type:'post', dataType: 'text',
				success: function(data){
					if(data == "1"){
						alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
						document.location = "/gologin"
					}
				}, error: function(){
					alert("다시 시도해 주세요.")
					return false;
				}
	})
})
.on('input','#id',function(){
	if ( !idRegExp.test( $(this).val() ) ) {
		$('#idvd').html('<small style="color:red;"><img src="/img/redcheck.png" style="width:20px;">아이디는 8자 이상, 16자 이하 영소문자,숫자만 입력 가능합니다.</small>');
		$('#check').attr("disabled",true);
	}
	if ( idRegExp.test( $(this).val() ) ) {
		$('#idvd').html('<small style="color:green;"><img src="/img/greencheck.png" style="width:20px;">올바른 아이디 형식입니다. 중복 확인 버튼을 클릭해주세요.</small>')
		$('#check').attr("disabled",false);
	}
})
.on('click','#check',function(){
	$.ajax({url:'/idCheck', data: { id: $('#id').val() }, type: 'post', dataType: 'text',
		success: function(data){
			if ( data == "1" ) {
				$('#idvd').html('<small style="color:green;"><img src="/img/redcheck.png" style="width:20px;">중복된 아이디가 있습니다. 다른 아이디를 사용해주세요.</small>');
				return false;
			} else {
				$('#idvd').html('<small id="checkOk" style="color:green;"><img src="/img/greencheck.png" style="width:20px;">사용 가능한 아이디입니다.</small>');
				return false;
			}
		},
		error: function(){
			alert("알 수 없는 오류가 발생했습니다. 다시 시도해 주세요.")
		}
	})
})
.on('input','#passcode1',function(){
	if ( !pwRegExp.test( $(this).val() ) ) {
		$('#pwvd').html('<small style="color:red;"><img src="/img/redcheck.png" style="width:20px;">비밀번호는 8자 이상, 16자 이하 영대소문자,숫자만 입력 가능합니다.</small>');
		return false;
	} else {
		if( $(this).val() == $('#passcode2').val() ){
			$('#pwvd').html('<small style="color:green;"><img src="/img/greencheck.png" style="width:20px;">사용가능한 비밀번호입니다.</small>')
		} else {
			$('#pwvd').html('<small style="color:red;"><img src="/img/redcheck.png" style="width:20px;">비밀번호와 비밀번호 확인이 일치하지 않습니다.</small>');
		}
	}
})
.on('input','#passcode2',function(){
	if ( !pwRegExp.test( $(this).val() ) ) {
		$('#pwvd').html('<small style="color:red;"><img src="/img/redcheck.png" style="width:20px;">비밀번호는 8자 이상, 16자 이하 영대소문자,숫자만 입력 가능합니다.</small>');
		return false;
	} else {
		if( $(this).val() == $('#passcode1').val() ){
			$('#pwvd').html('<small style="color:green;"><img src="/img/greencheck.png" style="width:20px;">사용가능한 비밀번호입니다.</small>')
		} else {
			$('#pwvd').html('<small style="color:red;"><img src="/img/redcheck.png" style="width:20px;">비밀번호와 비밀번호 확인이 일치하지 않습니다.</small>');
		}
	}
})
.on('input','#name',function(){
	if ( !nameRegExp.test( $(this).val() ) ) {
		$('#namevd').html('<small style="color:red;"><img src="/img/redcheck.png" style="width:20px;">이름은 한글 2자 이상만 입력 가능합니다.</small>');
		return false;
	} else {
		$('#namevd').html('<small style="color:green;"><img src="/img/greencheck.png" style="width:20px;">사용 가능한 이름입니다.</small>');
		return false;
	}
})
.on('input','#birthday',function(){
	if( parseInt( getToday() - $(this).val().split("-")[0] ) < 15 ) {
		$('#bdvd').html('<small style="color:red;"><img src="/img/redcheck.png" style="width:20px;">14세 이상만 가입 가능합니다.</small>');
		return false;
	} else {
		$('#bdvd').html('<small style="color:green;"><img src="/img/greencheck.png" style="width:20px;">가입 가능한 생년월일입니다.</small>');
		return false;
	}
})
.on('input','#mobile',function(){
  let inputVal = $(this).val().replace(/\D/g, ''); // 숫자 이외의 문자 제거
  if (inputVal.length > 11) {
    inputVal = inputVal.substr(0, 10); // 10자리까지만 유효
  }
  let formattedVal = inputVal.replace(/(\d{3})(\d{0,4})(\d{0,4})/, "$1-$2-$3");
  $(this).val(formattedVal);
})
.on('input','#email',function(){
	if ( !emailRegExp.test($(this).val() ) ) {
		$('#emailvd').html('<small style="color:red;"><img src="/img/redcheck.png" style="width:20px;">올바른 이메일 형식이 아닙니다.</small>');
		return false;
	} else {
		$('#emailvd').html('<small style="color:green;"><img src="/img/greencheck.png" style="width:20px;">사용 가능한 이메일입니다.</small>');
		return false;
	}
})
.on('click','button[name=x]',function(){
  $(this).siblings('input').val('');
  return false;
})
;
function getToday(){
	var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

	return year;
    /*return year + "-" + month + "-" + day; */
}
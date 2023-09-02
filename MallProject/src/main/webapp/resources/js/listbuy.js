$(document)
.ready(function(){
	var prod_id = "";
	for(var i=0; i<$("input[name=prodId]").length; i++){
		prod_id += $("input[name=prodId]").eq(i).val();
	}
	$('input[name=prod_id]').val(prod_id);
	
	var prod_img = "";
	for(var i=0; i<$("input[name=img]").length; i++){
		if ( i == $("input[name=img]").length - 1) {
			prod_img += $('input[name=img]').eq(i).val();
			break;
		}
		prod_img += $('input[name=img]').eq(i).val()+ ",";
	}
	$('input[name=prod_img]').val(prod_img);
	
	var prod_name = "";
	for(var i=0; i<$("input[name=prodName]").length; i++){
		if ( i == $("input[name=prodName]").length - 1) {
			prod_name += $('input[name=prodName]').eq(i).val();
			break;
		}
		prod_name += $('input[name=prodName]').eq(i).val() + ",";
	}
	$('input[name=prod_name]').val(prod_name);

	var prod_qty = "";
	for(var i=0; i<$("input[name=qty]").length; i++){
		if ( i == $("input[name=qty]").length - 1) {
			prod_qty += $('input[name=qty]').eq(i).val();
			break;
		}
		prod_qty += $('input[name=qty]').eq(i).val() + ",";
	}
	$('input[name=prod_qty]').val(prod_qty);
	
	prod_qty = 0;
	for(var i=0; i<$('input[name=qty]').length; i++){
		prod_qty += parseInt($('input[name=qty]').eq(i).val());
	}
	$('#qty').text("상품금액 ("+prod_qty+"개)")
	
	var prod_total = "";
	for(var i=0; i<$("input[name=total]").length; i++){
		if ( i == $("input[name=total]").length - 1) {
			prod_total += $('input[name=total]').eq(i).val();
			break;
		}
		prod_total += $('input[name=total]').eq(i).val() + ",";
	}
	$('input[name=prod_total]').val(prod_total);
	
	let total = 0;
	var qty = $('input[name=total]').length;
	for(var i=0; i<qty; i++){
		total += parseInt($('input[name=total]').eq(i).val());
	}
	$('#total').text(total);
	$('#price').text(total);
})
.on('submit',"#frmOrder",function(){
	if ( $('input[name=orderer]').val() == '' ) {
		alert("받는분을 입력해주세요.");
		return false;
	}
	if ( $('input[name=hp]').val() == '' ) {
		alert("휴대폰 번호를 입력해주세요.");
		return false;
	}
	if ( $('input[name=zip]').val() == '' ) {
		alert("주소를 입력해주세요.");
		return false;
	}
	let payment = ""
	$('input[name=payment]:checked').each(function(){
		payment += $(this).val();
	})
	if (payment == "") {
		alert("결제 수단을 선택해주세요.");
		return false;
	}
	return true;
})
.on('change','#same',function(){
	if ( $(this).is(':checked') ) {
		$.ajax({ url: '/same', data: { }, type: 'post', dataType: 'text',
				success: function(data){
					let order = data.split("/")[0];
					let mobile = data.split("/")[1];
					let addr = data.split("/")[2];
					let post = addr.split(",")[0];
					let addr1 = addr.split(",")[1];
					let addr2 = addr.split(",")[2];
					
					$('input[name=orderer]').val(order);
					$('input[name=hp]').val(mobile);
					$('input[name=zip]').val(post);
					$('input[name=addr1]').val(addr1);
					$('input[name=addr2]').val(addr2);
					return true;
				}, error: function(){
					alert("회원정보를 불러오지 못했습니다.")
					return false;
				}
		})
	} else {
		$('input[name=orderer]').val('');
		$('input[name=hp]').val('');
		$('input[name=zip]').val('');
		$('input[name=addr1]').val('');
		$('input[name=addr2]').val('');
		return false;
	}
})
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
                $('input[name=addr1]').val(extraAddr);
            
            } else {
                $('input[name=addr1]').val('');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('input[name=zip]').val(data.zonecode);
            $('input[name=addr1]').val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $('input[name=addr2]').val('');
            $('input[name=addr2]').focus();
        }
    }).open();
})
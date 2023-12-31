let productList = [];
$(document)
.ready(function(){
	addToProductList($('#prodId').val());
})
.on('click','#decrease',function(){
	$('#numInput').val( $('#numInput').val() - 1 );
	if ( $('#numInput').val() <= 0 ) {
		alert ('최소 주문 수량은 1개입니다.');
		$('#numInput').val(1);
		return false;
	}
	$('#totalPrice').text( parseInt($('#numInput').val() * parseInt($('#productPrice').text()) ) )
})
.on('click','#increase',function(){
	$('#numInput').val( parseInt($('#numInput').val()) + 1 );
	if ( $('#numInput').val() >= 6 ) {
		alert ('최대 주문 수량은 5개입니다.');
		$('#numInput').val(5);
		return false;
	}
	$('#totalPrice').text( parseInt($('#numInput').val() * parseInt($('#productPrice').text()) ) )
})
.on('click','#addCart',function(){
	$.ajax({url:'/cart', data:{id:$('#id').val() , prodId: $('#prodId').val(), qty:$('#numInput').val(), totalPrice:$('#totalPrice').text() },
				type:'post', dataType:'text',
				success: function(data){
					if(data=="있음") {
						if (confirm("장바구니에 이미 있는 상품입니다. 장바구니로 이동할까요?") == true) {
							document.location = "/cartList"
							return false;
						} else {
							return false;
						}
					} else if(data=="1"){
						if (confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동할까요?") == true) {
							document.location = "/cartList"
							return false;
						}
						else {
							return false;
						}
					} else {
						document.location = data
					}
				}, error: function(){
					alert("오류가 발생했습니다.");
					return false;
				}
	})
})
.on('click','#buy',function(){
	if ($('input[name=id]').val() == null || $('input[name=id]').val() == '') {
		document.location = "/gologin"
		return false;
	}
	$.ajax({ url:'/buy', data:{user_id : $('input[name=id]').val(), prod_name : $('#productName').text(), prod_id : $('#prodId').val(),
										qty : $('#numInput').val(), price : $('#productPrice').text(), total : $('#totalPrice').text(), img : $('#img').val()},
				type:'post', dataType:'text',
				success: function(data){
					if (data == "same") {
						alert("장바구니에 동일 상품이 존재하여 장바구니로 이동합니다.");
						document.location = "/cartList";
						return false;
					} else if ( data == "other") {
						alert("회원님의 장바구니에 담긴 다른 상품과 함께 구매해보세요 !");
						document.location = "/cartList";
						return false;
					} else {
						document.location = "/buy?prod_name=" + $('#productName').text() + "&qty=" + $('#numInput').val() + "&price=" +
								 					$('#productPrice').text() + '&total=' + $('#totalPrice').text() + '&img=' + $('#img').val() + '&prod_id=' + $('#prodId').val() + "&user_id=" + $('input[name=id]').val();
						return false;
					}
				}, error: function(){
					
				}			
	})
})
;
function addToProductList(value) {
    // 중복된 항목을 제거합니다.
    if (getCookieArray("prod_id")){
		productList = getCookieArray("prod_id");
    	productList = productList.filter(item => item !== value);
    }

    // 새로운 상품 ID를 배열에 추가합니다.
    productList.push(value);
    
    if (productList.length > 5) {
        productList = productList.slice(productList.length - 5);
    }

    // 배열을 쿠키에 저장합니다.
    $.cookie("prod_id", JSON.stringify(productList));
}
function getCookieArray(key) {
    let cookieValue = $.cookie(key);
    if (cookieValue) {
        return JSON.parse(cookieValue);
    } else {
        return [];
    }
}
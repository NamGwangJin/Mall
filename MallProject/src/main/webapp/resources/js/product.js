$(document)
.ready(function(){
	console.log($('input[name=id]').val(), $('#prodId').val())
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
						if (!confirm("장바구니에 이미 있는 상품입니다. 장바구니로 이동할까요?")) return false;
						document.location = "/cartList"
					}
					if(data=="1"){
						if (!confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동할까요?")) return false;
						document.location = "/cartList"
					}
				}, error: function(){
					alert("오류가 발생했습니다.");
					return false;
				}
	})
})
.on('click','#buy',function(){
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
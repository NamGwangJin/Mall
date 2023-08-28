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
					if(data=="1"){
						if (!confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동할까요?")) return false;
						document.location = "/cartList"
					} else {
						alert("장바구니에 이미 있는 상품입니다.");
						return false;
					}
				}, error: function(){
					alert("장바구니에 이미 있는 상품입니다.");
					return false;
				}
	})
})
.on('click','#buy',function(){
	document.location = "/buy?prod_name=" + $('#productName').text() + "&qty=" + $('#numInput').val() + "&price=" +
								 $('#productPrice').text() + '&total=' + $('#totalPrice').text() + '&img=' + $('#img').val() + '&prod_id=' + $('#prodId').val() + "&user_id=" + $('input[name=id]').val();
})
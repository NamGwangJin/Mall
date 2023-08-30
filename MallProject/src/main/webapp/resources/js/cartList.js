let price = 0;
let sale = 0;
let total = 0;
let count = 0;
let prodid = "";
$(document)
.ready(function(){
	$('#checked').hide();
	$('#head').hide();
	$('input[name=checkbox]').attr("checked","on");
	changeCheckbox();
})

.on('change','input[name=checkbox]',function(){
	changeCheckbox();
})

.on('click','button[name=increase]',function(){
	if ($(this).parent().find('input[name=qty]').val() == 5) {
		alert ('최대 주문 수량을 초과하였습니다.');
		return false;
	}
	let prod_id = $(this).closest('tr').find('td:eq(0)').find('input[name=prodid]').val();
	let numInput = $(this).parent().find('input[name=qty]');
	let totalPrice = $(this).parent().parent().find("td:eq(3)").find("b[name=total]");
	numInput.val( parseInt(numInput.val()) + 1 );
	totalPrice.text( parseInt(numInput.val()) *  $(this).closest('tbody').find("input[name=price]").val());
	changeCheckbox();
	$.ajax({ url:'/cartUpdate', data:{qty : numInput.val(), total : totalPrice.text(), prod_id : prod_id},
				type:'post', dataType:'text',
				success: function(data) {
					if ( data == "success") {
						return true;
					}
				}, error: function(){
					alert("error!")
				}
	})
//	document.location = "/cartUpdate?qty=" + numInput.val() + "&total=" + totalPrice.text() + "&prod_id=" + prod_id;
})

.on('click','button[name=decrease]',function(){
	if ($(this).parent().find('input[name=qty]').val() == 1) {
		alert ('최수 주문 수량은 1개입니다.');
		return false;
	}
	let prod_id = $(this).closest('tr').find('td:eq(0)').find('input[name=prodid]').val();
	let numInput = $(this).parent().find('input[name=qty]');
	let totalPrice = $(this).parent().parent().find("td:eq(3)").find("b[name=total]");
	numInput.val( parseInt(numInput.val()) - 1 );
	totalPrice.text( parseInt(numInput.val()) *  $(this).closest('tbody').find("input[name=price]").val());
	changeCheckbox();
		$.ajax({ url:'/cartUpdate', data:{qty : numInput.val(), total : totalPrice.text(), prod_id : prod_id},
				type:'post', dataType:'text',
				success: function(data) {
					if ( data == "success"){
						return true;
					}
				}, error: function(){
					alert("error!")
				}
	})
//	document.location = "/cartUpdate?qty=" + numInput.val() + "&total=" + totalPrice.text() + "&prod_id=" + prod_id;
})

.on('click',"input[name=del]",function(){ // 선택 아이템 삭제
	if(!confirm("정말로 장바구니에서 삭제하시겠어요?")) return false;
	let prod_id = $(this).closest('tr').find('td:eq(0)').find('input[name=prodid]').val();
	$.ajax({ url:'/deleteCartItem', data:{user_id:$('#userid').val(), prod_id: prod_id}, type:'post', dataType:'text',
				success: function(data){
					if (data != null || data != ""){
						alert("삭제가 완료되었습니다.")
						document.location ="/cartList"
					}
				}, error: function(){
					alert("장바구니 삭제 중 오류가 발생했습니다. 다시 시도해 주세요.")
					return false;
				}
	})
})

.on('click','#clearCart',function(){ // 장바구니 비우기
	if(!confirm("정말로 장바구니를 비울까요?")) return false;
	$.ajax({ url:'/dropCart', data:{user_id:$('#userid').val()}, type:'post', dataType:'text',
				success: function(data){
					alert("장바구니를 비웠습니다.")
					document.location = data;
				}, error: function(){
					alert("장바구니 비우는 중 오류가 발생했습니다. 다시 시도해 주세요")
					return false;
				}
	})
})

.on('click','#buy',function(){ // 선택 아이템 주문
	if($(this).text() == "상품 보러 가기") {
		document.location = "/";
		return false;
	}
	if(count == 0) {
		alert("선택된 상품이 없습니다.");
		return false;
	} else if (count == 1) {
		document.location = "/buy?prod_name=" + $('#prodname').text() + "&qty=" + $('#qty').val() + 
		"&price=" + parseInt($('#total').text() / $('#qty').val()) + '&total=' + $('#total').text() + '&img=' + $('#img').val() + "&prod_id=" + $('#prodid').val();
	} else {
		prodid = "";
		$('input[name=checkbox]:checked').each(function(){
			prodid += $(this).parent().find("input[name=prodid]").val();
		})
		document.location = "/listbuy?user_id=" + $('#userid').val() + "&prod_id=" + prodid;
	}
})
;
function changeCheckbox(){
	$('#checked').show();
	$('#head').show();
	price = 0;
	count = 0;
	$('input[name=checkbox]:checked').each(function(){
		price += parseInt($(this).parent().parent().find("td:eq(3)").text());
		total = price - sale;
		$('#checked').find('td:first').html('<strong style="font-size:30px;">'+price+'</strong>');
		$('#checked').find('td:eq(2)').html('<strong style="font-size:30px;">'+sale+'</strong>');
		$('#checked').find('td:eq(4)').html('<strong style="font-size:30px;">'+total+'</strong>');
		if ($(this)) count += 1;
	})
	if (count == 0) {
		$('#head').hide();
		$('#checked').hide();
	}
}
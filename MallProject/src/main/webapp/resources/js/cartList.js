let price = 0;
let total = 0;
let count = 0;
let qty = 0;
let prodid = "";
$(document)
.ready(function(){
	allCheck();
	changeCheckbox();
})

.on('change', 'input[name=checkbox]',function(){
	if ($(this).is(":checked")) {
        allCheck();
    } else{
		allUnCheck();
	}
})

.on('change','input[name=prodCheckBox]',function(){
	count = 0;
	$('input[name=prodCheckBox]').each(function(){
		if ( $(this).is(":checked") ) count += 1;
	})
	if ( count == 0 ) {
		allUnCheck();
	} else if ( count == $('input[name=prodCheckBox]').length ) {
		allCheck();
	}
	changeCheckbox();
})

.on('click','button[name=increase]',function(){
	if ($(this).closest('ul').find('input[name=qty]').val() == 5) {
		alert ('최대 주문 수량을 초과하였습니다.');
		return false;
	}
	let prod_id = $(this).closest('ul').find('input[name=prod_id]').val();
	let numInput = $(this).closest('ul').find('input[name=qty]');
	let total = $(this).closest("ul").find("dd[name=total]");
	numInput.val( parseInt(numInput.val()) + 1 );
	total.text( parseInt(numInput.val()) *  $(this).closest('ul').find("input[name=price]").val());
	changeCheckbox();
		$.ajax({ url:'/cartUpdate', data:{qty : numInput.val(), total : total.text(), prod_id : prod_id},
				type:'post', dataType:'text',
				success: function(data) {
					if ( data == "success"){
						return true;
					}
				}, error: function(){
					alert("error!")
					return false;
				}
	})
})

.on('click','button[name=decrease]',function(){
	if ($(this).closest('ul').find('input[name=qty]').val() == 1) {
		alert ('최수 주문 수량은 1개입니다.');
		return false;
	}
	let prod_id = $(this).closest('ul').find('input[name=prod_id]').val();
	let numInput = $(this).closest('ul').find('input[name=qty]');
	let total = $(this).closest("ul").find("dd[name=total]");
	numInput.val( parseInt(numInput.val()) - 1 );
	total.text( parseInt(numInput.val()) *  $(this).closest('ul').find("input[name=price]").val());
	changeCheckbox();
		$.ajax({ url:'/cartUpdate', data:{qty : numInput.val(), total : total.text(), prod_id : prod_id},
				type:'post', dataType:'text',
				success: function(data) {
					if ( data == "success"){
						return true;
					}
				}, error: function(){
					alert("error!")
					return false;
				}
	})
})

.on('click',"button[name=del]",function(){ // 선택 아이템 삭제
	if(!confirm("정말로 장바구니에서 삭제하시겠어요?")) return false;
	let prod_id = $(this).closest('ul').find('input[name=prod_id]').val();
	console.log(prod_id);
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
	if (count == 1) {
		let checkProduct = $('input[name=prodCheckBox]:checked').closest("ul")
		let prod_name = checkProduct.find('[name=prod_name]').text();
		let qty = checkProduct.find('[name=qty]').val();
		let price = checkProduct.find('[name=price]').val();
		let img = checkProduct.find('[name=img]').val();
		let prod_id = checkProduct.find('[name=prod_id]').val();
		document.location = "/buy?prod_name=" + prod_name + "&qty=" + qty + 
		"&price=" + price + '&total=' + $('[name=totalPrice]').text() + '&img=' + img + "&prod_id=" + prod_id;
	} else {
		prod_id = "";
		$('input[name=prodCheckBox]:checked').each(function(index){
			prod_id += $(this).closest("ul").find("input[name=prod_id]").val();
			if ( index < $('input[name=prodCheckBox]:checked').length - 1) {
				prod_id += ",";
			}
		})
		document.location = "/listbuy?user_id=" + $('#userid').val() + "&prod_id=" + prod_id;
	}
})
;
function changeCheckbox(){
	price = 0;
	count = 0;
	qty = 0;
	$('input[name=prodCheckBox]:checked').each(function(){
		price += parseInt($(this).closest("ul").find("dd[name=total]").text());
		qty += parseInt($(this).closest("ul").find("input[name=qty]").val())
		if ($(this)) count += 1;
	})
	$('span[name=totalPrice]').text(price);
	$('span[name=totalQty]').text(qty);
	if (count == 0) {
		$('#buy').prop("disabled",true);
	} else {
		$('#buy').prop("disabled",false);
	}
}
function allCheck() {
    $('input[name=checkbox]').prop("checked", true);
    $('input[name=prodCheckBox]').each(function () {
        $(this).prop("checked", true);
    })
    changeCheckbox();
}
function allUnCheck() {
	$('input[name=checkbox]').prop("checked", false);
    $('input[name=prodCheckBox]').each(function () {
        $(this).prop("checked", false);
    })
    changeCheckbox();
}
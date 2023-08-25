let price = 0;
let sale = 0;
let total = 0;
let count = 0;
let qtyTotal = 0;
let prodid = "";
$(document)
.ready(function(){
	qtyTotal = parseInt($('#total').text() / $('#qty').text());
	$('#checked').hide();
	$('input[name=checkbox]').attr("checked","on");
	changeCheckbox();
})
.on('change','input[name=checkbox]',function(){
	changeCheckbox();
})
.on('click',"input[name=del]",function(){ // 선택 아이템 삭제
	if(!confirm("정말로 장바구니에서 삭제하시겠어요?")) return false;
	$.ajax({ url:'/deleteCartItem', data:{user_id:$('#userid').val(), prod_id: $('#prodid').val()}, type:'post', dataType:'text',
				success: function(data){
					if (data=="1"){
						alert("삭제가 완료되었습니다.")
						document.location ="/cartList"
					}
				}, error: function(){
					alert("삭제 실패!!")
					return false;
				}
	})
})
.on('click','#reset',function(){ // 장바구니 비우기
	if(!confirm("정말로 장바구니를 비울까요?")) return false;
	$.ajax({ url:'/dropCart', data:{user_id:$('#userid').val()}, type:'post', dataType:'text',
				success: function(data){
					alert("장바구니를 비웠습니다.")
					document.location = data;
				}, error: function(){
					alert("비우기 실패!!")
					return false;
				}
	})
})
.on('click','#order',function(){ // 선택 아이템 주문
	if(count == 0) {
		alert("선택된 상품이 없습니다.");
		return false;
	} else if (count == 1) {
		document.location = "/buy?prod_name=" + $('#prodname').text() + "&qty=" + $('#qty').text() + 
		"&price=" + qtyTotal + '&total=' + $('#total').text() + '&img=' + $('#img').val();
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
		$('#checked').hide();
	}
}
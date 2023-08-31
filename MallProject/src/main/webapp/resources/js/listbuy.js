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
			prod_img += $('input[name=img]').eq(i).val() + ".jpg";
			break;
		}
		prod_img += $('input[name=img]').eq(i).val() + ".jpg" + ",";
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
.on('submit',"#order",function(){
	// 유효성 검사 해야함
	return true;
})
.on('change','#same',function(){
	if ( $(this).is(':checked') ) {
		$.ajax({ url: '/same', data: { }, type: 'post', dataType: 'text',
				success: function(data){
					console.log(data);
				}, error: function(){
					
				}
		})
	}
})
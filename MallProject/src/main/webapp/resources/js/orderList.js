$(document)
.ready(function(){
	stateCheck();
})
.on('click','#buy',function(){
	document.location = "/"
})
.on('click','button[name=cancel]',function(){
	if(confirm("정말로 취소 요청을 하시겠습니까?") == false) return false;
	else {
		$.ajax({url:'/updateState', data:{orderNum : $(this).closest('tr').find('td:eq(0)').text(), state : $(this).text()}, type:'post', dataType:'text',
			success: function(data){
				alert("취소 요청이 완료되었습니다. 요청이 수락되기 전 언제든 취소 철회가 가능합니다.");
				document.location="/orderList"
			}, error: function(){
				alert("취소 요청 중 에러가 발생했습니다. 다시 시도해 주세요.")
			}
		})
	}
})
.on('click','button[name=noCancel]',function(){
	if(confirm("정말로 취소 요청을 철회 하시겠습니까?") == false) return false;
	else{
		$.ajax({url:'/updateState', data:{orderNum : $(this).closest('tr').find('td:eq(0)').text(), state : $(this).text()}, type:'post', dataType:'text',
			success: function(data){
				alert("취소 요청 철회가 완료되었습니다.");
				document.location="/orderList"
			}, error: function(){
				alert("취소 요청 철회 중 에러가 발생했습니다. 다시 시도해 주세요.")
			}
		})
	}
})
.on('click','button[name=back]',function(){
	if(confirm("정말로 반품 요청을 하시겠습니까?") == false) return false;
	else{
		$.ajax({url:'/updateState', data:{orderNum : $(this).closest('tr').find('td:eq(0)').text(), state : $(this).text()}, type:'post', dataType:'text',
			success: function(data){
				alert("반품 요청이 완료되었습니다.");
				document.location="/orderList"
			}, error: function(){
				alert("반품 요청 중 에러가 발생했습니다. 다시 시도해 주세요.")
			}
		})
	}
})
.on('click','button[name=backCancel]',function(){
	if(confirm("정말로 반품 요청을 철회 하시겠습니까?") == false) return false;
	else{
		$.ajax({url:'/updateState', data:{orderNum : $(this).closest('tr').find('td:eq(0)').text(), state : $(this).text()}, type:'post', dataType:'text',
			success: function(data){
				alert("반품 요청 철회가 완료되었습니다.");
				document.location="/orderList"
			}, error: function(){
				alert("반품 요청 철회 중 에러가 발생했습니다. 다시 시도해 주세요.")
			}
		})
	}
})
;
function stateCheck() {
	console.log("들어옴")
	for(let i=0; i<$('input[name=status]').length; i++){
		if( $('input[name=status]').eq(i).val() == "배송 대기중" ) {
			$('td[name=state]').eq(i).find('button[name=cancel]').show();
		} else if ( $('input[name=status]').eq(i).val() == "취소 요청" ) {
			$('td[name=state]').eq(i).find('button[name=noCancel]').show();
			$('td[name=state]').eq(i).find('button[name=cancel]').hide();
		} else if ( $('input[name=status]').eq(i).val() == "배송 완료" ) {
			$('td[name=state]').eq(i).find('button[name=review]').show();
			$('td[name=state]').eq(i).find('button[name=back]').show();
			$('td[name=state]').eq(i).find('button[name=cancel]').hide();
		} else if ( $('input[name=status]').eq(i).val() == "반품 요청" ) {
			$('td[name=state]').eq(i).find('button[name=backCancel]').show();
			$('td[name=state]').eq(i).find('button[name=back]').hide();
			$('td[name=state]').eq(i).find('button[name=review]').hide();
		} else if ( $('input[name=status]').eq(i).val() == "리뷰 작성 완료" ){
			$('td[name=state]').eq(i).find('button[name=goReview]').show();
			$('td[name=state]').eq(i).find('button[name=backCancel]').hide();
		}
	}
}
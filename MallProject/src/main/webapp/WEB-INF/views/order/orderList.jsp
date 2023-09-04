<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<link href="css/mall.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Order List</title>
</head>
<body>
<%@ include file="..\header.jsp" %>
        <section>
        	<div>
        		<div>
       				<table  cellspacing="0" cellpadding="0" width="90%" align="center">
       					<c:choose>
       						<c:when test="${oList == '없음'}">
		       					<caption><h1 style="text-align:left;">주문내역</h1></caption>
		        				<thead style="height:50px; text-align:center;">
		        					<tr width="90%"><td><h2>주문 일시</h2><td>${order.order_time}</td></tr>
		        					<tr width="90%"><td><b>주문번호</b></td><td width="30%"><b>제품명</b></td><td><b>수량</b></td><td><b>가격</b></td><td><b>받는분</b></td><td><b>번호</b></td><td><b>주소</b></td><td><b>상태</b></td></tr>
		        					<tr><td colspan=8><hr></td></tr>
		        				</thead>
		        				<tbody id="cartList" style="text-align:center;">
		        						<tr><td colspan=8><Strong style="color:red;">주문내역이 없습니다.</Strong></td></tr>
		      							<tr><td colspan=8><button id=buy class="buy">상품 보러 가기</button></td></tr>
		      					</tbody>
      						</c:when>
      						<c:otherwise>
      							<caption><h1 style="text-align:left;">주문내역</h1></caption>
      							<c:forEach items="${dList}" var="d">
		        				<thead style="height:50px; text-align:center;">
		        					<tr width="80%"><td><h2>주문일시</h2><td><h3>${d.order_time}</h3></td></tr>
		        					<tr width="80%">
		        					<td width="10%"><b>주문번호</b></td>
		        					<td width="20%"><b>제품명</b></td>
		        					<td><b>수량</b></td>
		        					<td><b>가격</b></td>
		        					<td><b>받는분</b></td>
		        					<td><b>번호</b></td>
		        					<td><b>주소</b></td>
		        					<td><b>상태</b></td></tr>
		        					<tr><td colspan=8><hr></td></tr>
		        				</thead>
		        				<tbody style="text-align:center;">
							        <c:forEach items="${orderMap[d.order_time]}" var="order">
							            <tr>
							                <td>${order.order_num}</td>
							                <td><img src="/img/${order.prod_img}" style="width:100px;">&nbsp;${order.prod_name}</td>
							                <td>${order.order_qty}</td>
							                <td>${order.order_price} 원</td>
							                <td>${order.user_name}</td>
							                <td>${order.user_mobile}</td>
							                <td>${order.user_address}</td>
							                <td name=state><input type=hidden name=status value="${order.order_state}">
							                ${order.order_state}<br>
							                <button name=cancel style="display:none">취소 요청</button>
							                <button name=noCancel style="display:none;">취소 요청 철회</button><br>
							                <a href="/reviewwrite?prod_name=${order.prod_name}&order_num=${order.order_num}"><button style="display:none" name=review>리뷰 작성</button></a>
							                <a href="/product?name=${order.prod_name}"><button style="display:none" name="goReview">작성한 리뷰 보기</button>
							                <button style="display:none" name="back">반품 요청</button>
							                <button style="display:none" name="backCancel">반품 요청 철회</button></td>
							            </tr>
							            <tr><td colspan="8"><hr></td></tr>
							        </c:forEach>
	        					</tbody>
	        					</c:forEach>
	        				</c:otherwise>
	        			</c:choose>
        				</tbody>
        			</table>
        		</div>
        	</div>
        	<div>
        	</div>
        </section>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
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
</script>
</html>
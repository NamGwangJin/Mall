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
		        					<tr width="80%"><td><h2>${d.order_time}</h2></tr>
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
							                <td name=state>${order.order_state}</td>
							                <td style="display:none;"><a href="/reviewwrite?prod_name=${order.prod_name}"><button>리뷰 작성</button></a></td>
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
.on('click','#buy',function(){
	document.location = "/"
})
</script>
</html>
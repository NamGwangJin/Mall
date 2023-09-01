<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<link href="css/product.css" rel="stylesheet" />
<link href="css/mall.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Order List</title>
</head>
<body>
<div class="navbar">
    <a href="/" id="logo">
        <img src="img/weverslogo.jpg" width="149">
    </a>
    <ul id="menu">
    	<input type=hidden name=id value="${id}">
    	<li><a href="#">${review}</a></li>
    	<li><a href="#">${bbs}</a></li>
        <li><a href="/cartList?id=${id}">장바구니</a></li>
        <li><a href="/orderList?id=${id}">주문/배송조회</a></li>
        <li><a href="/mypage">${infoline}</a></li>
        <li>${inforeg}</li>
    </ul>
</div>
        <section>
        	<div>
        		<div>
       				<table cellspacing="0" cellpadding="0" width="90%" align="center">
       					<caption><h1 style="text-align:left;">주문내역</h1></caption>
        				<thead style="height:50px; text-align:center;">
        					<tr width="90%"><td><b>주문번호</b></td><td><b>주문일시</b></td><td width="30%"><b>제품명</b></td><td><b>수량</b></td><td><b>가격</b></td><td><b>받는분</b></td><td><b>번호</b></td><td><b>주소</b></td><td><b>상태</b></td></tr>
        					<tr><td colspan=9><hr></td></tr>
        				</thead>
        				<tbody id="cartList" style="text-align:center;">
        				<c:choose>
        					<c:when test="${oList == '없음'}">
        						<tr><td colspan=9><Strong style="color:red;">주문내역이 없습니다.</Strong></td></tr>
      							<tr><td colspan=9><button id=buy class="buy">상품 보러 가기</button></td></tr>
      						</c:when>
      						<c:otherwise>
	        					<c:forEach items="${oList}" var="order">
	        						<tr><td>${order.order_num}</td><td>${order.order_time}</td>
	        								<td><img src="/img/${order.prod_img}" style="width:100px;">&nbsp;${order.prod_name}</td>
	        								<td>${order.order_qty}</td><td>${order.order_price} 원</td><td>${order.user_name}</td>
	        								<td>${order.user_mobile}</td><td>${order.user_address}</td><td>배송 대기중</td>
	        								<td><a href="/reviewwrite?prod_name=${order.prod_name}"><button>리뷰 작성</button></a></td></tr>
	        						<tr><td colspan=9><hr></td></tr>
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
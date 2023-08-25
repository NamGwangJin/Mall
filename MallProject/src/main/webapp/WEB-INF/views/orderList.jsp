<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>Order List</title>
</head>
<body>
<div class="navbar">
    <a href="/" id="logo">
        <img src="img/weverslogo.jpg" width="149">
    </a>
    <ul id="menu">          
        <li><a href="/cartList">장바구니</a></li>
        <li><a href="#">주문/배송조회</a></li>
        <li><a href="#">${infoline}</a></li>
        <li><a href="#">${inforeg}</a></li>
    </ul>
</div>
        <section>
        	<div>
        		<div>
        			<h1>주문내역</h1>
        			<hr>
        			<table border="1" cellspacing="0" cellpadding="0" width="90%" align="center">
        				<thead style="height:50px;">
        					<tr width="90%"><td><b>주문번호</b></td><td width="60%"><b>제품명</b></td><td><b>수량</b></td><td><b>가격</b></td><td><b>받는분</b></td><td><b>번호</b></td><td><b>주소</b></td><td><b>상태</b></td></tr>
        				</thead>
        				<tbody id="cartList">
        					<c:forEach items="${oList}" var="order">
        						<tr><td>${order.order_num}</td><td><img src="/img/${order.prod_img}">&nbsp;${order.prod_name}</td><td>${order.order_qty}</td><td>${order.order_price}</td><td>${order.user_name}</td><td>${order.user_mobile}</td><td>${order.user_address}</td><td>배송 대기중</td></tr>
        						<tr><td colspan=8><hr></td></tr>
        					</c:forEach>
        				</tbody>
        			</table>
        		</div>
        	</div>
        </section>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
</script>
</html>
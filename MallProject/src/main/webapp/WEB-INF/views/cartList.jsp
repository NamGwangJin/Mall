<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>Cart List</title>
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
        			<h1>CART</h1>
        			
        			<hr>
        			<table border="1" cellspacing="0" cellpadding="0" width="90%" align="center">
        				<thead style="height:50px;">
        					<tr width="90%"><td><b>선택</b></td><td width="60%"><b>제품</b></td><td><b>수량</b></td><td><b>가격</b></td><td><b>취소</b></td></tr>
        				</thead>
        				<tbody id="cartList">
        					<c:forEach items="${cList}" var="cart">
        						<input type=hidden id=userid value="${cart.user_id}">
        						<input type=hidden id=img value="${cart.prod_img}.jpg">
        						<tr>
        								<td><input type=hidden name=prodid id=prodid value="${cart.prod_id}"><input name="checkbox" type=checkbox></td>
        								<td><img src="/img/${cart.prod_img}.jpg">&nbsp;<b id=prodname>${cart.prod_name}</b></td>
        								<td><b id=qty>${cart.prod_qty}</b></td>
        								<td><b id=total>${cart.prod_total}</b></td>
        								<td><input type=button name=del style="color:red;" value="삭제하기"></td>
        						</tr>
        						<tr><td colspan=5><hr></td></tr>
        					</c:forEach>
        				</tbody>
        			</table>
        			<div>
        				<table border="1" cellspacing="0" cellpadding="0" width="90%" align="center">
       						<thead style="height:50px;">
        						<tr width="90%"><td>총 금액</td><td></td><td>할인 금액</td><td></td><td>결제할 금액</td></tr>
        					</thead>
        					<tbody id=checked>
        						<tr height="150px;"><td></td><td><img src="/img/minus.png" style="width:50px;"></td><td></td><td><img src="/img/equal.png" style="width:50px;"></td><td></td></tr>
        					</tbody>
        				</table>
        			</div>
        			<div>
        		<table cellspacing="0" cellpadding="0" width="90%" align="center">
        				<tr width="90%"><td><button id=order style="color:green">주문하기</button>&nbsp;<button id=reset style='color:red;'>장바구니 비우기</button></td></tr>
        		</table>
        			</div>
        		</div>
        	</div>
        </section>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/cartList.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<link href="css/product.css" rel="stylesheet" />
<link href="css/mall.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Cart List</title>
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
        <section class="view">
        	<div id="wrapper">
        		<div>
        			<table cellspacing="0" cellpadding="0" width="90%" align="center">
        				<caption><h1 style="text-align:left;">장바구니</h1></caption>
        				<thead style="height:50px; text-align:center">
        					<tr width="90%"><td><b>선택</b></td><td width="50%"><b>제품</b></td><td><b>수량</b></td><td><b>가격</b></td><td><b>취소</b></td></tr>
        					<tr><td colspan=5><hr></td></tr>
        				</thead>
        				<input type="hidden" value="${cList}" id=test>
        				
        				<c:choose>
        					<c:when test="${cList == '없음'}">
        						<tbody id="cartList" style="text-align:center;">
        							<tr><td colspan=5><Strong style="color:red;">장바구니에 담긴 상품이 없습니다.</Strong></td></tr>
        							<tr><td colspan=5><button id=buy class="buy">상품 보러 가기</button></td></tr>
        						</tbody>
        					</c:when>
        					<c:otherwise>
        						<c:forEach items="${cList}" var="cart">
        						<input type=hidden id=userid value="${cart.user_id}">
        						<input type=hidden id=img value="${cart.prod_img}.jpg">
        						<tbody id="cartList" style="text-align:center;">
	        						<tr>
	        								<td><input type=hidden name=prodid id=prodid value="${cart.prod_id}"><input name="checkbox" type=checkbox></td>
	        								<td><img src="/img/${cart.prod_img}.jpg" style="width:100px;">&nbsp;<b id=prodname>${cart.prod_name}</b></td>
	        								<td><b id=qty>${cart.prod_qty}</b></td>
	        								<td><b id=total>${cart.prod_total}</b></td>
	        								<td><input type=button name=del style="color:red;" value="X"></td>
	        						</tr>
	        					</tbody>
        						<tr><td colspan=5><hr></td></tr>
        						</c:forEach>
        					</c:otherwise>
        				</c:choose>
        				
        			</table>
        			<br><br><br>
        			<div>
        				<table cellspacing="0" cellpadding="0" width="90%" align="center">
       						<thead style="height:50px;" id=head>
        						<tr width="90%" align="center"><td><Strong>총 금액</Strong></td><td></td><td><Strong>할인 금액</Strong></td><td></td><td><Strong>결제할 금액</Strong></td></tr>
        						<tr><td colspan=5><hr></td></tr>
        					</thead>
        					<tbody id=checked style="background-color:beige;">
        						<tr height="150px;" align="center"><td></td><td><img src="/img/minus.png" style="width:50px;"></td><td></td><td><img src="/img/equal.png" style="width:50px;"></td><td></td></tr>
        					</tbody>
        				</table>
        			</div>
        			<c:if test="${cList != '없음'}">
	       				<div class="button">
			        		<table cellspacing="0" cellpadding="0" width="90%" style="text-align:right;">
			        				<tr width="90%"><td><button id=buy class="buy" style="width:200px; height:100px; font-size:30px;">주문하기</button></td></tr>
			        		</table>
	       				</div>
	       			</c:if>
        		</div>
        	</div>
        </section>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/cartList.js"></script>
</html>
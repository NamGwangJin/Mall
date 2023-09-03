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
<%@ include file="..\header.jsp" %>
        <section class="view">
        	<div id="wrapper">
        		<div>
        			<table cellspacing="0" cellpadding="0" width="90%" align="center">
        				<caption><h1 style="text-align:left;">장바구니</h1></caption>
        				<thead style="height:50px; text-align:center">
        					<tr width="90%"><td><b>선택</b></td><td width="50%"><b>제품/제품명</b></td><td><b>수량</b></td><td><b>합계</b></td><td><b>취소</b></td></tr>
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
        						<tbody id="cartList" style="text-align:center;">
	        						<tr>
	        								<td><input type=hidden name=prodid id=prodid value="${cart.prod_id}"><input type=hidden name=price id=price value="${cart.prod_price}"><input name="checkbox" type=checkbox></td>
	        								<td><input type=hidden id=img value="${cart.prod_img}"><img src="/img/${cart.prod_img}" style="width:100px;">&nbsp;<b id=prodname>${cart.prod_name}</b></td>
	        								<td>
	        								<button class="decrease" name="decrease" style="width:30px;height:30px;">-</button>
	        								<input type="text" name=qty id=qty value="${cart.prod_qty}" style="width:30px; height:30px; text-align:center;" readonly>
	        								<button class="increase" name="increase" style="width:30px;height:30px;">+</button>
	        								</td>
	        								<td><b id=total name=total>${cart.prod_total}</b><b>원</b></td>
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
        					<tbody id=checked style="background-color:#25C7A0;">
        						<tr height="150px;" align="center"><td></td><td><img src="/img/minus.png" style="width:50px;"></td><td></td><td><img src="/img/equal.png" style="width:50px;"></td><td></td></tr>
        					</tbody>
        				</table>
        			</div>
        			<c:if test="${cList != '없음'}">
        				<br><br><br>
	       				<div class="button">
			        		<table cellspacing="0" cellpadding="0" width="100%" style="text-align:center;">
			        				<tr>
			        				<td><button id=buy class="buy" style="width:200px; height:100px; font-size:30px;">주문하기</button></td>
			        				<td><button id=clearCart class="buy" style="width:200px; height:100px; font-size:30px; background-color:red; color:white;">비우기</button></td>
			        				</tr>
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
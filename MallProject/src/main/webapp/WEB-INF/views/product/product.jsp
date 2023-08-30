<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
  <link href="css/mall.css" rel="stylesheet" />
    <title>SimpleShop</title>
    <meta charset="UTF-8">
    <link href="css/product.css" rel="stylesheet" />
    <link href="css/mall.css" rel="stylesheet" />
  </head>
<body>
    <div id="wrapper">
        <header>
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
        </header>
        <br><br><br><br><br>
        <input type=hidden name=id id=id value="${id}">
        <input type=hidden name=img id=img value="${product.prod_img}.jpg">
        <main id="product">
            <section class="view">
                <nav>                
                </nav>
                 
                <article class="info">
                    <div class="image" style="text-align:center;">
                    	<input type='hidden' id="prodId" value="${product.prod_id}">
                        <img src="img/${product.prod_img}.jpg" alt="상품이미지" style="width:70%;">
                    </div>
                    <div class="summary">
                        <nav style="height:100px;">
                            <h1 id="productName" name="productName">${product.prod_name}</h1> 
                        </nav>
                        <nav style="height:100px;">                           
                            <div class="dis_price">
                                <ins id="productPrice" name="productPrice">${product.prod_price}</ins>
                            </div>
                        </nav>                  
                        <div class="count1">
                        	<table>
                        	<tr>
                            <td><button class="decrease" id="decrease" style="width:30px;height:30px;">-</button></td>
                            <td><input type="text" id="numInput" name="numInput" value="1" readonly style="width:50px;height:30px;text-align:center;"></td>
                            <td><button class="increase" id="increase" style="width:30px;height:30px;">+</button></td>
                            </tr>
                            </table>
                        </div><br><br><br><br>
                        <div>
                        <p> * 최대 5 개까지 구매 가능합니다.</p>
                        <span></span>
                        </div>
                        <div class="total" style="height:100px; align:left;">
                            <span id="totalPrice" name="totalPrice">${product.prod_price}</span>
                            <em>총 상품금액</em>
                        </div>
						<div class="button">
						    <input type="button" id="addCart" class="cart" value="장바구니">
						    <input type="button" id="buy" class="buy" value="구매하기">
						</div>
                    </div>
                </article>  
               </section>
               </main>
			</div>
			<%@ include file="..\review\review.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/product.js">
</script>
</html>
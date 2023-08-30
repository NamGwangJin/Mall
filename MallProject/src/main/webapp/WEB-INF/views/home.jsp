<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>Weverse</title>
</head>
<body>

<div class="navbar">
    <a href="/" id="logo">
        <img src="img/weverslogo.jpg" width="149">
    </a>
    <ul id="menu">
    	<input type=hidden name=id value="${id}">
    	<li><a href="#">${bbs}</a></li>
        <li><a href="/cartList?id=${id}">장바구니</a></li>
        <li><a href="/orderList?id=${id}">주문/배송조회</a></li>
        <li>${infoline}</li>
        <li>${inforeg}</li>
    </ul>
</div>

<div class="products">
    <h3>상품목록</h3>
    <div class="product-list">
        <div class="product-list">
            <body>
            <tr>
            <c:forEach items="${mlist}" var="product">         
                <a class="product" id='${product.prod_name}' name='${product.prod_name}'>
                    <img src="img/${product.prod_img}" height="225" width="225">
                    <div class="product-name">
                        ${product.prod_name}
                    </div>
                    <div class="product-price">${product.prod_price}원</div>
                </a>
            </c:forEach>
            </tr>
            </body>
        </div>
    </div>
    <div class="fixed-footer" id="pagestr">
        <tr><td style='font-size:24px;'>${pagestr}</td></tr>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).on('click', '.product', function() {
    var productName = $(this).attr('name');
    document.location = "/product?name=" + encodeURIComponent(productName);
})
.on('click','#logout',function(){
    if(!confirm('정말로 로그아웃할까요?')){
        return false;
    } else {			
        document.location= "/logout";
    }
});
</script>
</html>
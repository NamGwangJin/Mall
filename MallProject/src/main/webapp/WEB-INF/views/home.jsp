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
        <li><a href="#">장바구니</a></li>
        <li><a href="#">주문/배송조회</a></li>
        <li><a href="#">${infoline}</a></li>
        <li><a href="#">${inforeg}</a></li>
    </ul>
</div>

<div class="products">
    <h3>상품목록</h3>
    <div class="product-list">
        <div class="product-list">
            <body>
            <tr>
           
            <c:forEach items="${mlist}" var="product">         
                <a class="product" id='${product.name}' name='${product.name}'>
                    <img src="img/${product.img}.jpg" hight="225" width="225">
                    <div class="product-name">
                        ${product.name}
                    </div>
                    <div class="product-price">${product.price}</div>
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
</html>
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
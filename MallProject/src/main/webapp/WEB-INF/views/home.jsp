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
<%@ include file="header.jsp" %>
<%@ include file="main.jsp" %>
<div class="products">
    <div class="product-list">
    <h3>상품목록</h3>
        <div class="product-list">
            <body>
            <tr>
            <c:forEach items="${mlist}" var="product">         
                <a class="product" id='${product.prod_name}' name='${product.prod_id}'>
                    <img src="img/${product.prod_img}" height="225" width="225">
                    <div class="product-name">
                      ${product.prod_name}
                    </div>
                    <div class="product-name products"><h4>₩${product.prod_price}</h4></div>
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

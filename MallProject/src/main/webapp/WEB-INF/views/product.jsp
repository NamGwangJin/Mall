<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>SimpleShop</title>
    <meta charset="UTF-8">
<!--     <link href="css/mall.css" rel="stylesheet" /> -->
    <link href="css/product.css" rel="stylesheet" />
  </head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">              
            </div>
            <div class="logo">
                <div>
                    <a href="/">
                       <img src="../img/weverslogo.jpg" alt="헤더로고">
                    </a>                   
                </div>
            </div>
            <div class="menu">
                <div>                   
                </div>
            </div>
        </header>        
        <main id="product">
<!--             	     <ul id="menu">           -->
<!-- 		         	 <li><a href="/">메인으로</a></li> -->
<!-- 				  	 </ul> -->
            <section class="view">
                <nav>                
                </nav>
                 
                <article class="info">
                    <div class="image">
                        <img src="img/${product.img}.jpg" alt="상품이미지">
                    </div>
                    <div class="summary">
                   
                        <nav>
                            <h1 id="productName" name="productName">${product.name}</h1>  
                                                   
                        </nav>
                        <nav>                           
                            <div class="dis_price">
                                <ins id="productPrice" name="productPrice">${product.price}</ins>
                            </div>
                        </nav>                  
                        <div class="count1">
                            <button class="decrease" id="decrease">-</button>
                            <input type="text" id="numInput" name="numInput" value="1" readonly>
                            <button class="increase" id="increase">+</button>
                        </div>
                        <div class="total">
                            <span id="totalPrice" name="totalPrice">${product.price}</span>
                            <em>총 상품금액</em>
                        </div>
						<form method="post" action="/cart" id="frmCart" name="frmCart">
						    <table hidden>
						        <tr>
						            <td>
						           		<input type="hidden" id="hiddenUserId" name="userId" value="">
						                <input type="hidden" id="hiddenProductName" name="productName" value="">
										<input type="hidden" id="hiddenProductPrice" name="productPrice" value="">
										<input type="hidden" id="hiddenNumInput" name="numInput" value="">
										<input type="hidden" id="hiddenTotalPrice" name="totalPrice" value="">										
						            </td>
						        </tr>
						    </table>
						    <div class="button">
						        <input type="submit" id="btnSubmit" class="cart" value="장바구니">
						        <input type="button" id="buy" class="buy" value="구매하기">
						    </div>
						</form>
                    </div>
                </article>            
    </div>
</body>
</html>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

$(document)
.on('submit', '#frmCart', function () {
	var userId = "${sessionScope.id}";
    var productName = $("#productName").val();
    var productPrice = $("#productPrice").val();
    var numInputValue = $("#numInput").val();
    var totalPrice = $("#totalPrice").val();

 
    $("#hiddenUserId").val(userId);
    $("#hiddenProductName").val(productName);
    $("#hiddenProductPrice").val(productPrice);
    $("#hiddenNumInput").val(numInputValue);
    $("#hiddenTotalPrice").val(totalPrice);

    if (confirm('주문상품을 장바구니에 담으시겠습니까?')) {
        alert('장바구니에 상품이 담겼습니다.');
        return true; 
    } else {
        return false; 
    }
})
.on('click','#buy',function(){
    if(confirm('구매 페이지로 이동합니다.')){
				document.location="/buy";				
	}else{			
		return false;
	}
})
.on('click','#increase',function(){
	var numInput = $("#numInput");
    var totalPrice = $("#totalPrice");
    var productPrice = ${product.price};    
    var num = parseInt(numInput.val());
    num += 1;
    numInput.val(num);
    var total = productPrice * num;
    totalPrice.text(total);
})
.on('click','#decrease',function(){
	var numInput = $("#numInput");
    var totalPrice = $("#totalPrice");
    var productPrice = ${product.price};     
    var num = parseInt(numInput.val());
    if (num > 1) {
        num -= 1;
        numInput.val(num);
        var total = productPrice * num;
        totalPrice.text(total);
    }
})
;
</script>
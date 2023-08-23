<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>SimpleShop</title>
    <meta charset="UTF-8">
<!--     <link href="css/mall.css" rel="stylesheet" /> -->
    <link href="css/product.css" rel="stylesheet" />
  </head>

<body>

<form method="post" action="/cart" id=frmCart name=frmCart>
    <div id="wrapper">
        <header>
            <div class="top">
              
            </div>
            <div class="logo">
                <div>
                    <a href="#">
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
            	     <ul id="menu">          
		         	 <li><a href="/">메인으로</a></li>
				  	 </ul>
            <section class="view">
                <nav>
                  
                  
                </nav>
                <article class="info">
                    <div class="image">
                        <img src="img/product1.jpg" alt="상품이미지">
                    </div>
                    <div class="summary">
                        <nav>
                            <h1>Mini photo card</h1>
                            
                        </nav>

                        <nav>
                           
                            <div class="dis_price">
                                <ins>8,000</ins>
                            </div>
                        </nav>
                      
                        

                       
                       
                        <div class="count">
                            <button class="decrease">-</button>
                            <input type="text" name="num" value="1" readonly>
                            <button class="increase">+</button>
                        </div>
                        <div class="total">
                            <span>8,000</span>
                            <em>총 상품금액</em>
                        </div>
                        <div class="button">
                        	<input type=submit id=btnSubmit class="cart" value="장바구니">

                            <input type="button" id=buy class="buy" value="구매하기">
                        </div>
                    </div>
                </article>
            
    </div>
</form>
</body>
</html>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#frmCart',function(){

    if(confirm('주문상품을 장바구니에 담으시겠습니까?')){
				alert('장바구니에 삼품이 담겼습니다.')
				return "/cart";
				
	}else{			
		document.location= "/product1";
	}
})
.on('click','#buy',function(){

    if(confirm('구매 페이지로 이동합니다.')){
				document.location="/buy";
				
	}else{			
		document.location= "/product1";
	}
})
;
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/buy.css">
<link href="css/mall.css" rel="stylesheet" />
<title>구매 페이지</title>
</head>
<body>
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
    <div id="wrapper">
        <main id="product">
            <section class="order">
                <nav>
                    <h1>결제하기</h1>
                </nav>
               <form action="/listorder" method="get" id="frmOrder">
               		<input type=hidden name=prod_id value="">
               	    <input type=hidden name=id value="${id}">
     				<input type=hidden name=prod_img value="">
     				<input type=hidden name=prod_name value="">
     				<input type=hidden name=prod_qty value="">
     				<input type=hidden name=prod_total value="">
                    <table border="0">
                        <tr>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>판매가</th>
                            <th>배송비</th>
                            <th>소계</th>
                        </tr>
                        <c:forEach items="${cList}" var="cart">
                        <tr>
                            <td><article>
                                <a href="#">
                                	<input type=hidden name=prodId value="${cart.prod_id}">
                                	<input type=hidden name=img value="${cart.prod_img}">
                                    <img style="width:80px; height:100px;" src="img/${cart.prod_img}.jpg" alt="1">
                                </a>
                                <div>
                                    <h2>${cart.prod_name}</h2>
                                    <input type=hidden name=prodName value="${cart.prod_name}">
                                    <p></p>
                                </div>
                            </article></td>
                            <td>${cart.prod_qty}</td>
                            <input type=hidden name=qty value="${cart.prod_qty}">
                            <td>${cart.prod_price}</td>
                            <td>무료배송</td>
                            <td>${cart.prod_total}</td>
                            <input type=hidden name=total value="${cart.prod_total}">
                        </tr>
                        </c:forEach>
                    </table>
                    <div class="final">
                        <h2>최종결제 정보</h2>
                        <table>
                            <tr>
                                <td>총</td>
                                <td>${size} 건</td>
                            </tr>
                            <tr>
                                <td id=qty></td>
                                <td id=price></td>
                            </tr>
                            <tr>
                                <td>할인금액</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>무료 배송</td>
                            </tr>
                            <tr>
                                <td>포인트 할인</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td id=total></td>
                            </tr>
                        </table>
                        <input type="submit" value="결제하기">
                    </div>
                    <!-- 배송정보 -->
                    <article class="delivery">
                        <h1>배송정보</h1>
                        <table>
                            <tr>
                                <td>받는분</td>
                                <td><input type="text" name="orderer"></td>
                            </tr>
                            <tr>
                                <td>휴대폰</td>
                                <td>
                                    <input type="text" name="hp">
                                    <span>- 포함 입력</span>
                                </td>
                            </tr>
                            <tr>
                                <td>우편번호</td>
                                <td>
                                    <input type="text" name="zip">
                                    <input type="button" value="검색">
                                </td>
                            </tr>
                            <tr>
                                <td>기본주소</td>
                                <td>
                                    <input type="text" name="addr1">
                                </td>
                            </tr>
                            <tr>
                                <td>상세주소</td>
                                <td><input type="text" name="addr2"></td>
                            </tr>
                        </table>
                    </article>
                    <!-- 할인정보 -->
                    <article class="discount">
                        <h1>할인정보</h1>
                        <div>
                            <p>
                                현재 포인트 : 
                                <span>0</span>점
                            </p>
                            <label>
                                <input type="text" name="point">점
                                <input type="button" value="적용">
                            </label>
							<br>
                            <br>
                            <span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
                        </div>
                    </article>
                    <!-- 결제방법 -->
                    <article class="payment">
                        <h1>결제방법</h1>
                        <div>
                            <span>신용카드</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="신용카드">신용카드 결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="체크카드">체크카드 결제
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>계좌이체</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="계좌이체">실시간 계좌이체
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="무통장입금">무통장 입금
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>기타</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="휴대폰결제">휴대폰 결제
                                </label>
                            </p>
                        </div>
                    </article>
        	</form>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	var prod_id = "";
	for(var i=0; i<$("input[name=prodId]").length; i++){
		prod_id += $("input[name=prodId]").eq(i).val();
	}
	$('input[name=prod_id]').val(prod_id);
	
	var prod_img = "";
	for(var i=0; i<$("input[name=img]").length; i++){
		if ( i == $("input[name=img]").length - 1) {
			prod_img += $('input[name=img]').eq(i).val() + ".jpg";
			break;
		}
		prod_img += $('input[name=img]').eq(i).val() + ".jpg" + ",";
	}
	$('input[name=prod_img]').val(prod_img);
	
	var prod_name = "";
	for(var i=0; i<$("input[name=prodName]").length; i++){
		if ( i == $("input[name=prodName]").length - 1) {
			prod_name += $('input[name=prodName]').eq(i).val();
			break;
		}
		prod_name += $('input[name=prodName]').eq(i).val() + ",";
	}
	$('input[name=prod_name]').val(prod_name);

	var prod_qty = "";
	for(var i=0; i<$("input[name=qty]").length; i++){
		if ( i == $("input[name=qty]").length - 1) {
			prod_qty += $('input[name=qty]').eq(i).val();
			break;
		}
		prod_qty += $('input[name=qty]').eq(i).val() + ",";
	}
	$('input[name=prod_qty]').val(prod_qty);
	
	prod_qty = 0;
	for(var i=0; i<$('input[name=qty]').length; i++){
		prod_qty += parseInt($('input[name=qty]').eq(i).val());
	}
	$('#qty').text("상품금액 ("+prod_qty+"개)")
	
	var prod_total = "";
	for(var i=0; i<$("input[name=total]").length; i++){
		if ( i == $("input[name=total]").length - 1) {
			prod_total += $('input[name=total]').eq(i).val();
			break;
		}
		prod_total += $('input[name=total]').eq(i).val() + ",";
	}
	$('input[name=prod_total]').val(prod_total);
	
	let total = 0;
	var qty = $('input[name=total]').length;
	for(var i=0; i<qty; i++){
		total += parseInt($('input[name=total]').eq(i).val());
	}
	$('#total').text(total);
	$('#price').text(total);
})
.on('submit',"#order",function(){
	// 유효성 검사 해야함
	return true;
})
</script>
</html>
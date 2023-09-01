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
                                    <img style="width:80px; height:100px;" src="img/${cart.prod_img}" alt="1">
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
                        <h1>배송정보</h1><input type="checkbox" id=same><sub style="text-align:right;">회원정보와 동일</sub>
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
                                    <input type="text" name="zip" readonly>
                                    <input type="button" value="검색" id=search>
                                </td>
                            </tr>
                            <tr>
                                <td>기본주소</td>
                                <td>
                                    <input type="text" name="addr1" readonly>
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
                                <input type="text" name="point" style="text-align:right;" value=0>점
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
                            <span>간편결제</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="카카오페이">카카오페이
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="네이버페이">네이버페이
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>카드</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="신용카드">신용카드
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="체크카드">체크카드
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/listbuy.js"></script>
</html>
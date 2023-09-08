<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/buy.css">
<link href="css/mall.css" rel="stylesheet" />
<title>구매 페이지</title>
</head>
<style>
    /* 버튼의 배경색과 글자색을 변경합니다. */
    input[type="submit"] {
        background-color: #25C7A0; /* 원하는 배경색으로 변경하세요. */
        color: white; /* 원하는 글자색으로 변경하세요. */
        /* 기타 스타일 속성을 필요에 따라 추가하세요. */
    }
</style>
<body>
<div class="navbar">
<%@ include file="..\header.jsp" %>
</div>
<div class="buybody">
    <div id="wrapper" >
    <h1>결제하기</h1>
        <main id="product">
            <section class="order">
               <form action="/order" method="post" id="frmOrder">
               		
               	    <input type=hidden name=id value="${id}">
     				<input type=hidden name=img value="${img}">
                    <table border="0">
                        <tr>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>판매가</th>
                            <th>배송비</th>
                            <th>소계</th>
                        </tr>
                        <tr>
                            <td><article>
                                <a href="product?name=${prod_name}">
                                    <img style="width:200px; height:200px;" src="img/${img}" alt="1">
                                </a>
                                <div>
                                    <h2>${prod_name}</h2>
                                    <input type=hidden name=prodName value="${prod_name}">
                                    <input type=hidden name=prodid value="${prod_id}">
                                    <p></p>
                                </div>
                            </article></td>
                            <td>${qty}</td>
                            <input type=hidden name=qty value="${qty}">
                            <td>${price}</td>
                            <td>무료배송</td>
                            <td>${total}</td>
                            <input type=hidden name=total value="${total}">
                        </tr>
                    </table>
                    <div class="final">
                        <h2>최종결제 정보</h2>
                        <table>
                            <tr>
                                <td>총</td>
                                <td>1 건</td>
                            </tr>
                            <tr>
                                <td>상품금액 (${qty}개)</td>
                                <td>${total}</td>
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
                                <input type=hidden name=sale value="">
                                <td id=sale>0</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td id=total>${total}</td>
                            </tr>
                        </table>
                        <input type="submit" value="결제하기">
                    </div>
                    <article class="delivery">
                        <h1>배송정보</h1>
                        <input type="checkbox" id=same><sub style="text-align:right;">회원정보와 동일</sub>
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
                    할인정보
                    <article class="discount">
                        <h1>할인정보</h1>
                        <div>
                            <p>
                                현재 포인트 :
                                <input type=hidden id="point" value="${point}">
                                <span>${point}</span>점
                            </p>
                            <label id="pointLabel">
                                <input type="text" id="usePoint" style="text-align:right;" value=0>점
                                <input type="button" id="apply" value="적용">
                            </label>
							<br>
                            <br>
                            <span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
                        </div>
                    </article>
                    결제방법
                    <article class="payment">
                        <h1>결제방법</h1>
                        <div>
                            <span>간편결제</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="카카오페이"><img src="/img/kakaopay.png" style="width:60px;">
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
        </section>
       </main>
       </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/buy.js"></script>
</html>
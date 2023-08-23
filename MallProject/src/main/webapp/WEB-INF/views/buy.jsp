<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/buy.css">
<link href="css/mall.css" rel="stylesheet" />
<title>Insert title here</title>
</head>

<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <a href="">로그인</a>
                    <a href="">회원가입</a>
                    <a href="">마이페이지</a>
                    <a href="">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니
                    </a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="#">
                       <img src="img/weverslogo.jpg" alt="헤더로고">
                    </a>
                   
                </div>
            </div>
            <div class="menu">
                <div>
                    
                </div>
            </div>
        </header>
        <main id="product">
           
            <section class="order">
                <nav>
                    <h1>결제하기</h1>
                  
                </nav>
               <form action="#">
                    <table border="0">
                        <tr>
                            <th>상품명</th>
                            <th>총수량</th>
                            <th>판매가</th>
                            <th>배송비</th>
                            <th>소계</th>
                        </tr>
                        <tr class="empty">
                            <td colspan="7">장바구니에 상품이 없습니다.</td>
                        </tr>
                        <tr>
                            <td><article>
                                <a href="#">
                                    <img style="width:80px; height:100px;" src="img/product1.jpg" alt="1">
                                </a>
                                <div>
                                    <h2><a href="#">상품명</a></h2>
                                    <p>상품설명</p>
                                </div>
                            </article></td>
                            <td>1</td>
                            <td>27,000</td>
                            <td>무료배송</td>
                            <td>27,000</td>
                        </tr>
                        <tr>
                            <td><article>
                                <a href="#">
                                    <img src="	https://via.placeholder.com/80x80" alt="1">
                                </a>
                                <div>
                                    <h2><a href="#">상품명</a></h2>
                                    <p>상품설명</p>
                                </div>
                            </article></td>
                            <td>1</td>
                            <td>27,000</td>
                            <td>무료배송</td>
                            <td>27,000</td>
                        </tr>
                        <tr>
                            <td><article>
                                <a href="#">
                                    <img src="	https://via.placeholder.com/80x80" alt="1">
                                </a>
                                <div>
                                    <h2><a href="#">상품명</a></h2>
                                    <p>상품설명</p>
                                </div>
                            </article></td>
                            <td>1</td>
                            <td>27,000</td>
                            <td>무료배송</td>
                            <td>27,000</td>
                        </tr>
                    </table>
                    <div class="final">
                        <h2>최종결제 정보</h2>
                        <table>
                            <tr>
                                <td>총</td>
                                <td>3 건</td>
                            </tr>
                            <tr>
                                <td>상품금액</td>
                                <td>27,000</td>
                            </tr>
                            <tr>
                                <td>할인금액</td>
                                <td>-1,000</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>포인트 할인</td>
                                <td>-1,000</td>
                            </tr>
                            <tr>
                                <td>전체주문금액</td>
                                <td>25,000</td>
                            </tr>
                        </table>
                        <input type="submit" value="결제하기">
                    </div>
                    <!-- 배송정보 -->
                    <article class="delivery">
                        <h1>배송정보</h1>
                        <table>
                            <tr>
                                <td>주문자</td>
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
                                <span>7200</span>점
                            </p>

                            <label>
                                <input type="text" name="point">점
                                <input type="button" value="적용">
                            </label>
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
                                    <input type="radio" name="payment" value="type1">신용카드 결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type2">체크카드 결제
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>계좌이체</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type3">실시간 계좌이체
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type4">무통장 입금
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>기타</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type4">휴대폰 결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type5">카카오페이
                                    <img src="../img/ico_kakaopay.gif" alt="카카오페이">
                                </label>
                            </p>
                        </div>
                    </article>
                    <!-- 경고 -->
                    <article class="alert">
                        <ul>
                            <li><span>케이마켓의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 케이마켓 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.
                            </span></li>
                            <li><span>케이마켓 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.
                            </span></li>
                            <li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다.
                            </span></li>
                        </ul>
                    </article>
               </form>
            </section>
        </main>
        <footer>
            <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">전자금융거래약관</a></li>
            </ul>
            <div>
                <p><img src="../img/footer_logo.png" alt="푸터로고"></p>
                <p>
                    <strong>(주)KMARKET</strong>
                    <br>
                    부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                    <br>
                    대표이사 : 홍길통
                    <br>
                    사업자등록번호 : 220-81-83676 사업자정보확인
                    <br>
                    통신판매업신고 : 강남 10630호 Fax : 02-589-8842
                </p>
                <p>
                    <strong>고객센터</strong>
                    <br>
                    Tel : 1234-5678 (평일 09:00~18:00)
                    <br>
                    스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)
                    <br>
                    경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층
                    <br>
                    Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr
                    <br>
                </p>
            </div>
        </footer>
        <button type="button" id="top">상단이동</button>
    </div>
</body>
</html>
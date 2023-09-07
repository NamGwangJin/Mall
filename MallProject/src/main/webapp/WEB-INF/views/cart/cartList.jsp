<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <link href="css/product.css" rel="stylesheet" /> -->
<!-- <link href="css/mall.css" rel="stylesheet" /> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Cart List</title> -->
<!-- </head> -->
<!-- <body> -->
<%-- <%@ include file="..\header.jsp" %> --%>
<!--         <section class="view" style="margin-top:150px;"> -->
<!--         	<div id="wrapper"> -->
<!--         		<div> -->
<!--         			<table cellspacing="0" cellpadding="0" width="90%" align="center"> -->
<%--         				<caption><h1 style="text-align:left;">장바구니</h1></caption> --%>
<!--         				<thead style="height:50px; text-align:center"> -->
<!--         					<tr width="90%"><td><b>선택</b></td><td width="50%"><b>제품/제품명</b></td><td><b>수량</b></td><td><b>합계</b></td><td><b>취소</b></td></tr> -->
<!--         					<tr><td colspan=5><hr></td></tr> -->
<!--         				</thead> -->
<%--         				<input type="hidden" value="${cList}" id=test> --%>
        				
<%--         				<c:choose> --%>
<%--         					<c:when test="${cList == '없음'}"> --%>
<!--         					<div class=summary> -->
<!--         					<div class=button> -->
<!--         						<tbody id="cartList" style="text-align:center; height:200px;"> -->
<!--         							<tr><td colspan=5><Strong style="color:gray;">장바구니에 담긴 상품이 없습니다.</Strong></td></tr> -->
<!--         							<tr><td colspan=5><a href="/"><button id="buy" class="buy" style="width:100px;height:50px;">샵으로 이동</button></a></td></tr> -->
<!--         						</tbody> -->
<!--         					</div> -->
<!--         					</div> -->
<%--         					</c:when> --%>
<%--         					<c:otherwise> --%>
<%--         						<c:forEach items="${cList}" var="cart"> --%>
<%--         						<input type=hidden id=userid value="${cart.user_id}"> --%>
<!--         						<tbody id="cartList" style="text-align:center;"> -->
<!-- 	        						<tr> -->
<%-- 	        								<td><input type=hidden name=prodid id=prodid value="${cart.prod_id}"><input type=hidden name=price id=price value="${cart.prod_price}"><input name="checkbox" type=checkbox></td> --%>
<%-- 	        								<td><input type=hidden id=img value="${cart.prod_img}"><img src="/img/${cart.prod_img}" style="width:100px;">&nbsp;<b id=prodname>${cart.prod_name}</b></td> --%>
<!-- 	        								<td> -->
<!-- 	        								<button class="decrease" name="decrease" style="width:30px;height:30px;">-</button> -->
<%-- 	        								<input type="text" name=qty id=qty value="${cart.prod_qty}" style="width:30px; height:30px; text-align:center;" readonly> --%>
<!-- 	        								<button class="increase" name="increase" style="width:30px;height:30px;">+</button> -->
<!-- 	        								</td> -->
<%-- 	        								<td><b id=total name=total>${cart.prod_total}</b><b>원</b></td> --%>
<!-- 	        								<td><input type=button name=del style="color:red;" value="X"></td> -->
<!-- 	        						</tr> -->
<!-- 	        					</tbody> -->
<!--         						<tr><td colspan=5><hr></td></tr> -->
<%--         						</c:forEach> --%>
<%--         					</c:otherwise> --%>
<%--         				</c:choose> --%>
<!--         			</table> -->
<!--         			<br><br><br> -->
<!--         			<div> -->
<!--         				<table cellspacing="0" cellpadding="0" width="90%" align="center"> -->
<!--        						<thead style="height:50px;" id=head> -->
<!--         						<tr width="90%" align="center"><td><Strong>총 금액</Strong></td><td></td><td><Strong>할인 금액</Strong></td><td></td><td><Strong>결제할 금액</Strong></td></tr> -->
<!--         						<tr><td colspan=5><hr></td></tr> -->
<!--         					</thead> -->
<!--         					<tbody id=checked style="background-color:beige;"> -->
<!--         						<tr height="150px;" align="center"><td></td><td><img src="/img/minus.png" style="width:50px;"></td><td></td><td><img src="/img/equal.png" style="width:50px;"></td><td></td></tr> -->
<!--         					</tbody> -->
<!--         				</table> -->
<!--         			</div> -->
<%--         			<c:if test="${cList != '없음'}"> --%>
<!--         				<br><br><br> -->
<!-- 	       				<div class="button"> -->
<!-- 			        		<table cellspacing="0" cellpadding="0" width="100%" style="text-align:center;"> -->
<!-- 			        				<tr> -->
<!-- 			        				<td><button id=buy class="buy" style="width:200px; height:100px; font-size:30px;">주문하기</button></td> -->
<!-- 			        				<td><button id=clearCart class="buy" style="width:200px; height:100px; font-size:30px; background-color:red; color:white;">비우기</button></td> -->
<!-- 			        				</tr> -->
<!-- 			        		</table> -->
<!-- 	       				</div> -->
<%-- 	       			</c:if> --%>
<!--         		</div> -->
<!--         	</div> -->
<!--         </section> -->
<!-- </body> -->
<!-- <script src="https://code.jquery.com/jquery-latest.js"></script> -->
<!-- <script src="/resources/js/cartList.js"></script> -->
<!-- </html> -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html><html lang="ko"><head><meta charSet="utf-8"/><link rel="dns-prefetch" href="https://api.weverseshop.io"/><link rel="dns-prefetch" href="https://cdn-contents.weverseshop.io"/><link rel="preconnect" href="https://api.weverseshop.io" crossorigin="use-credentials"/><link rel="preconnect" href="https://cdn-contents.weverseshop.io" crossorigin="anonymous"/><meta name="og:locale:alternate" content="en-US"/><link rel="alternate" hrefLang="en" href="https://weverseshop.io/en/cart"/><meta name="og:locale" content="ko-KR"/><link rel="alternate" hrefLang="ko" href="https://weverseshop.io/ko/cart"/><link rel="canonical" href="https://weverseshop.io/ko/cart"/><meta name="og:locale:alternate" content="ja-JP"/><link rel="alternate" hrefLang="ja" href="https://weverseshop.io/ja/cart"/><link rel="alternate" hrefLang="x-default" href="https://weverseshop.io/cart"/><meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/><meta name="keywords" content=" weverse shop, Weverse by Fans, official shop, official store, BTS official store, official merch, official merchandise, officially licensed merchandise, official membership, official light stick, BTS, TOMORROW X TOGETHER, TXT, SEVENTEEN, SVT, fromis_9, ENHYPEN, weeekly, P1Harmony, Cherry Bullet, CL, HENRY, SUNMI, TREASURE, BLACKPINK, WINNER, iKON, woo!ah!, STAYC, JUST B, EVERGROW, UP10TION, LEE JIN HYUK, VERIVERY, ARMY, MOA, CARAT, ENGENE, TREASURE MAKER, BLINK, INNER CIRCLE, HONEY10, V-DAN, VERRER, ARMY BOMB, weverse concert, concert, music concert, online concert, fanmeeting, fanlive, live streaming, online live streaming, 위버스샵, 위버스 바이 팬즈, 공식샵, 공식스토어, BTS 공식스토어, 공식상품, 공식멤버십, 위버스 콘서트, 콘서트, 팬미팅, 팬라이브, 라이브 스트리밍, 온라인 라이브 스트리밍, Weverse Shop, Weverse by Fans, 公式商品, 公式メンバーシップ, Weverseコンサート, コンサート, ファンミーティング, ファンライブ, ライブストリーミング, オンラインライブストリーミング, 公式グッズ, ライブ, ライブ配信"/><meta name="description" content="전 세계 팬들을 위한 Official 커머스, 위버스샵! 아티스트의 공식 상품과 위버스샵에서만 구매할 수 있는 단독 상품과 앨범, 그리고 공식 MEMBERSHIP을 위버스샵에서 만나보세요!"/><meta property="og:site_name" content="Weverse Shop - All things for Fans"/><meta property="og:url" content="https://weverseshop.io/cart"/><meta property="og:type" content="website"/><meta property="og:title" content="Weverse Shop - All things for Fans"/><meta property="og:description" content="전 세계 팬들을 위한 Official 커머스, 위버스샵! 아티스트의 공식 상품과 위버스샵에서만 구매할 수 있는 단독 상품과 앨범, 그리고 공식 MEMBERSHIP을 위버스샵에서 만나보세요!"/><meta property="og:image" content="https://weverseshop.io/weverseshop-og.png"/><meta name="twitter:card" content="summary_large_image"/><meta name="twitter:site" content="@weverseshop"/><meta name="twitter:creator" content="@weverseshop"/><meta property="al:ios:url" content="weverseshop://weverseshop.benx.co/?view=shop"/><meta property="al:ios:app_store_id" content="1456559072"/><meta property="al:ios:app_name" content="Weverse Shop - All things for Fans"/><meta property="al:android:url" content="weverseshop://weverseshop.benx.co/?view=shop"/><meta property="al:android:app_name" content="Weverse Shop - All things for Fans"/><meta property="al:android:package" content="co.benx.weply"/><meta property="al:web:url" content="https://weverseshop.io/cart"/><link rel="apple-touch-icon" href="https://weverseshop.io/weverseshop-touchicon.png"/><title>Cart | Weverse Shop - All things for Fans</title><meta name="next-head-count" content="34"/><meta name="format-detection" content="telephone=no"/><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pretendard/1.3.6/static/pretendard-dynamic-subset.css"/><link rel="preload" href="/_next/static/css/cebb91d4d49830f6.css" as="style"/><link rel="stylesheet" href="/_next/static/css/cebb91d4d49830f6.css" data-n-g=""/><link rel="preload" href="/_next/static/css/0e6c08fa34972eff.css" as="style"/><link rel="stylesheet" href="/_next/static/css/0e6c08fa34972eff.css" data-n-p=""/>
<link href="resources/css/weverse.css" rel="stylesheet">
<style data-styled="" data-styled-version="5.3.3">
</style>
</head>
<body>
<div id="__next">
	<main class="sc-caee9e04-0 cQYcdk">
		<header class="sc-caee9e04-1 hxtMlR mui-fixed">	
		<%@ include file="../header.jsp" %>
		</header>
		<section class="sc-caee9e04-3 fXAEDf">
			<div class="sc-a46b6271-0 hSICui">
				<div class="sc-a46b6271-1 gDvbzd">
					<h2 class="sc-a46b6271-2 dIsBjW">Cart</h2>
						<div class="sc-a46b6271-5 eHExAx">
							<div class="sc-a46b6271-4 ijaKwV">
							</div>
						</div>
				</div>
				<div class="sc-a46b6271-3 fuUPUL">
					<ul class="sc-db02710b-0 hjGNtN">
						<li class="sc-e5c05e6-0 ecoqDi">
							<div class="sc-e5c05e6-4 cDcdLf">
								<label tabindex="0" role="checkbox" class="sc-90ec9770-0 gwcrAI">
									<input name=checkbox type="checkbox" tabindex="-1"/>
										<span class="sc-90ec9770-3 kqlCjz">
											<svg width="22" height="22" fill="none" xmlns="http://www.w3.org/2000/svg">
												<path clip-rule="evenodd" d="M5 11.914L9.25 16l7.65-7.356L15.71 7.5l-6.46 6.211-3.06-2.942L5 11.914z"></path>
											</svg>
										</span>
									<span class="sc-90ec9770-1 eBoIMu">해당 상품 전체선택</span>
								</label>
							</div>
							<form>
							<c:forEach items="${cList}" var="cart">
							<input type=hidden id=userid value="${cart.user_id}">
							<ul class="sc-e5c05e6-1 cPMBZy">
								<li class="sc-a5f60b9e-0 clHAkD">
									<div class="sc-a5f60b9e-1 frTCP">
											<div class="sc-a5f60b9e-2 kXvvju">
												<div>
													<label tabindex="0" role="checkbox" class="sc-90ec9770-0 gwcrAI">
														<input name=prodCheckBox type="checkbox" tabindex="-1" name="saleItems.0.use"/>
															<span class="sc-90ec9770-3 kqlCjz">
																<svg width="22" height="22" fill="none" xmlns="http://www.w3.org/2000/svg">
																	<path clip-rule="evenodd" d="M5 11.914L9.25 16l7.65-7.356L15.71 7.5l-6.46 6.211-3.06-2.942L5 11.914z">
																	</path>
																</svg>
															</span>
															<span class="sc-90ec9770-1 eBoIMu">
															</span>
													</label>
												</div>
												<a href="/ko/shop/GL_KRW/sales/17506" class="sc-a5f60b9e-5">
												<div class="sc-a5f60b9e-6 fyAFwI">
													<div class="sc-a5f60b9e-4 kyIyjj">
														<img src="img/${cart.prod_img}" width="64" height="64" alt="" class="sc-a5f60b9e-3 jVtaxc"/>
													</div>
													<dl>
														<div class="sc-a5f60b9e-7 JihJK">
															<div class="MuiStack-root-eDNyyw ksKMSw">
																<div class="sc-5e4bd89c-0 hDKORF">
																</div>
															</div>
														</div>
														<div class="sc-a5f60b9e-11 cXGrF">
															<input type=hidden name=prod_id value="${cart.prod_id}">
															<dt aria-hidden="true">상품명</dt>
															<dd>${cart.prod_name}</dd>
														</div>
													</dl>
												</div>
												</a>
										</div>
										<button name=del type="button" class="sc-a5f60b9e-12 gqJett"></button>
									</div>
								</li>
								<div class="sc-55442b5d-11 bNBFVG" style="background-color : #f5f7fa">
									<div class="sc-55442b5d-8 dxIZfw">
										<div class="sc-55442b5d-1 sc-55442b5d-12 frvjHz duiARl">
											<dt>${cart.prod_name}</dt>
										</div>
										<div class="sc-55442b5d-0 dRKifJ">
											<div class="sc-ec4afced-0 fAabqR">
												<button name=decrease type="button" aria-label="step down"class="sc-ec4afced-1 hJVWMB"></button>
												<input type="number" min="1" max="5" step="1" readonly="" name="qty" class="sc-ec4afced-2 clhzrm" value="${cart.prod_qty}"/>
												<button name=increase type="button" aria-label="step up" class="sc-ec4afced-1 gtqZWv"></button>
											</div>
											<div class="sc-55442b5d-2 bIinMf">
												<div class="sc-55442b5d-3 iHgpvm">
													<dt aria-hidden="true">가격</dt>
													<div class="sc-55442b5d-4 iqxrcu">
													<input type=hidden name=price value="${cart.prod_price}">
													<span>₩</span><dd name=total class="sc-55442b5d-6 eNyxg">${cart.prod_total}</dd>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<div class="sc-55442b5d-10 hFTnnj">
							</div>
						</ul>
						</c:forEach>
						<div class="sc-e5c05e6-2 imIUjA">
							<div class="sc-e5c05e6-3 cPKHEl">
								<div class="sc-e5c05e6-6 dzvrVZ">총 상품 금액 (<span name=totalQty></span>개) </div>
									<div class="sc-e5c05e6-7 eKmRib"><span>₩</span><span name=totalPrice> </span></div>
							</div>
							<button id=buy type="submit" class="sc-ff976b3f-0 gdiOsG">결제 진행</button>
						</div>
					</form>
				</li>
			</ul>
		</div>
	</div>
</section>
</main>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/cartList.js"></script>
</html>	
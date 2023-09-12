<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html class="scrollbar-custom use-webfont">
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<style data-styled="" data-styled-version="5.3.5"></style>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
</head>
<body>
<%@ include file="..\header.jsp" %>
<%@ include file="adminside.jsp" %>

<div class="myPageContainer">
<div class="css-man8h3-defaultStyle">
<div class="userBaseInfo">
  		<section>
        	<div>
        		<div>
       				<table cellspacing="0" cellpadding="0" width="90%" align="center">
       					<caption><h1 style="text-align:left;">취소/반품신청 내역</h1></caption>
        				<thead style="height:50px; text-align:center;">
        					<tr width="90%"><td><b>주문번호</b></td><td><b>주문일시</b></td><td width="30%"><b>제품명</b></td><td><b>수량</b></td><td><b>가격</b></td><td><b>받는분</b></td><td><b>번호</b></td><td><b>주소</b></td><td><b>상태</b></td></tr>
        					<tr><td colspan=9><hr></td></tr>
        				</thead>
        				<tbody id="cartList" style="text-align:center;">
        				<c:choose>
        					<c:when test="${oList == '없음'}">
        						<tr><td colspan=9><Strong style="color:teal;">반품 신청 내역이 없습니다.</Strong></td></tr>
      						
      						</c:when>
      						<c:otherwise>
							    <c:forEach items="${oList}" var="order">
							        <tr>
							            <td name=orderNum>${order.order_num}</td>
							            <td>${order.order_time}</td>
							            <td><img src="/img/${order.prod_img}" style="width:100px;">&nbsp;${order.prod_name}</td>
							            <td>${order.order_qty}</td>
							            <td>${order.order_price}</td>
							            <td>${order.user_name}</td>
							            <td>${order.user_mobile}</td>
							            <td>${order.user_address}</td>
							            <td name='orderstate' id='orderstateCell-${order.order_num}'>${order.order_state}</td>
							            <td>
							                <a name='orderend'>
											    <c:choose>
											         <c:when test="${order.order_state eq '반품 요청'}">
											         			<div class="MoreHeaderView_button_wrap__B-cQ2" style="width:150px;">
											            <button id='completeButton-${order.order_num}' onclick='completeOrder(${order.order_num}, "반품 요청 승인")' class="MoreHeaderView_button_item__gv6pa">반품 승인 완료</button>
											        			</div>
											        </c:when>
											        <c:when test="${order.order_state eq '취소 요청'}">
											        			<div class="MoreHeaderView_button_wrap__B-cQ2" style="width:150px;">
											            <button id='completeButton-${order.order_num}' onclick='completeOrder(${order.order_num}, "취소 요청 승인")' class="MoreHeaderView_button_item__gv6pa">취소 승인 완료</button>
											       				</div>
											        </c:when>
											    </c:choose>
											</a>
							            </td>
							        </tr>
							        <tr><td colspan=9><hr></td></tr>
							    </c:forEach>
							</c:otherwise>
	        			</c:choose>
        				</tbody>
        			</table>
        		</div>
			</div>
		</section>


<div class="userGradeBox gradeType1">
<div class="grade">

</div>
      
<a class=" css-n2sa3z-defaultStyle-underlineStyle-Linked">

</a>
</div>
<div class="gradeDetail">

</div>

<div class="userTimelineBox">
<div class="mypageTitleBox subTitle  css-qma8am-mypageTitleStyle">

</div>

</div>
</li>
</ul>
</div>

</div>
</div>
</div>



</div>
</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

function completeOrder(orderNum) {

	    $.ajax({
	        type: 'POST',
	        url: '/adminOrderCancel',
	        data: { order_num: orderNum },
	        cache: false,
	        success: function (response) {
	            if (response == 'success') {
	           
              
            	var orderStateCell = $('#orderstateCell-' + orderNum);
                var completeButton = $('#completeButton-' + orderNum);
                orderStateCell.text('승인 완료');
                
            
                completeButton.hide();
            } else {
                console.error('서버 응답 오류');
              
            }
        },
        error: function (xhr, status, error) {
            console.error(error);
          
        }
    });
}
</script>
</html>
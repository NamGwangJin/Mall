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
       					<caption><h1 style="text-align:left;">주문내역</h1></caption>
        				<thead style="height:50px; text-align:center;">
        					<tr width="90%"><td><b>주문번호</b></td><td><b>주문일시</b></td><td width="30%"><b>제품명</b></td><td><b>수량</b></td><td><b>가격</b></td><td><b>받는분</b></td><td><b>번호</b></td><td><b>주소</b></td>
        					
        					<td><b>상태우선정렬<select name='orderstates' id='orderstates'><option value='orderdelay'>배송 대기중</option>
				        														<option value='cancelplease'>취소 요청</option>
				        														<option value='ordersuccess'>배송 완료</option>
				        														<option value='orderreturn'>반품 요청</option>
				        														<option value='reviewEnd'>리뷰 작성 완료</option></select></b></td></tr>
        					<tr><td colspan=9><hr></td></tr>
        				</thead>
        				<tbody id="cartList" style="text-align:center;">
        				<c:choose>
        					<c:when test="${oList == '없음'}">
        						<tr><td colspan=9><Strong style="color:red;">주문내역이 없습니다.</Strong></td></tr>
      						
      						</c:when>
      						<c:otherwise>
      						<div id="orderList">
							    <c:forEach items="${oList}" var="order">
							        <tr>
							            <td name='orderNum'>${order.order_num}</td>
							            <td name='ordertime'>${order.order_time}</td>
							            <td name='prodname'><img name='orderimg' src="/img/${order.prod_img}" style="width:100px;">&nbsp;${order.prod_name}</td>
							            <td name='orderqty'>${order.order_qty}</td>
							            <td name='orderprice'>${order.order_price}</td>
							            <td name='orderser_name'>${order.user_name}</td>
							            <td name='orderser_mobile'>${order.user_mobile}</td>
							            <td name='orderuseraddress'>${order.user_address}</td>
							            <td name='orderstate' id='orderstateCell-${order.order_num}'>${order.order_state}</td>
							            <td>
							                <a name='orderend'>
											    <c:choose>
											        <c:when test="${order.order_state eq '배송 대기중'}">
											            <button id='completeButton-${order.order_num}' onclick='completeOrder(${order.order_num}, "발송완료")' class='custom-button'>발송완료</button>
											        </c:when>
											    </c:choose>
											</a>
							            </td>
							        </tr>
							        <tr><td colspan=9><hr></td></tr>
							    </c:forEach>
							 </div>
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

$(document).ready(function () {	


 $('#orderstates').change(function() {
     
       var selectedValue = $(this).val();
		
	

		
		
		
		$.ajax({ url: '/deliverstates',
				data: { selectedValue: selectedValue },
				type:'post',
				dataType:'json',
					success: function(data) {
					
							
						for(let i=0; i<data.length; i++){
							let obj = data[i];
							$('td[name=orderNum]').eq(i).html(obj['orderNum'])
							$('td[name=ordertime]').eq(i).html(obj['ordertime'])
							let html = '<img name="orderimg" src="/img/' + obj['orderimg'] + '" style="width:100px;">&nbsp;'
							$('td[name=prodname]').eq(i).html(html + obj['prodname'])
							$('td[name=orderqty]').eq(i).html(obj['orderqty'])
							$('td[name=orderprice]').eq(i).html(obj['orderprice'])
							$('td[name=orderusername]').eq(i).html(obj['orderusername'])
							$('td[name=orderusermobile]').eq(i).html(obj['orderusermobile'])
							$('td[name=orderuseraddress]').eq(i).html(obj['orderuseraddress'])
							$('td[name=orderstate]').eq(i).html(obj['orderstate'])	
						}
					},
					error: function(){
						alert('deliverstates error!');
					}
		})
	})
 
});

function completeOrder(orderNum) {
		
	   
	    $.ajax({
	        type: 'POST',
	        url: '/adminEndOrder',
	        data: { order_num: orderNum },
	        cache: false,
	        success: function (response) {
	            if (response == 'success') {
	           
              
            	var orderStateCell = $('#orderstateCell-' + orderNum);
                var completeButton = $('#completeButton-' + orderNum);
                orderStateCell.text('배송 완료');
                
            
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
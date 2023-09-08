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
       					<caption><h1 style="text-align:left;">회원목록</h1></caption>
        				<thead style="height:50px; text-align:center;">
        					<tr width="90%"><td><b>로그인아이디</b></td><td><b>비밀번호</b></td><td><b>닉네임</b></td><td><b>전화번호</b></td><td><b>이메일</b></td><td><b>주소</b></td><td><b>생년월일</b></td><td><b>가입일자</b></td><td><b>보유포인트</b></td>
        					
<!--         					<td><b>상태<select name='userstates' id='userstates'><option value='nomal'>일반</option> -->
<!-- 				        														<option value='restrict'>제한</option> -->
<!-- 				        														<option value='rest'>휴면</option> -->
<!-- 				        														<option value='outdelay'>탈퇴대기</option> -->
<!-- 				        														<option value='VIP'>VIP</option></select></b></td> -->
				        	</tr>
        					<tr><td colspan=9><hr></td></tr>
        				</thead>
        				<tbody id="cartList" style="text-align:center;">
        				<c:choose>
        					<c:when test="${uList == '없음'}">
        						<tr><td colspan=9><Strong style="color:red;">주문내역이 없습니다.</Strong></td></tr>
      						
      						</c:when>
      						<c:otherwise>
      						<div id="orderList">
							    <c:forEach items="${uList}" var="user">
							        <tr>
							        	
							            <td name='user_id'>${user.user_id}</td>
							            <td name='user_pw'>${user.user_pw}</td>
<%-- 							            <td name='prodname'><img name='orderimg' src="/img/${order.prod_img}" style="width:100px;">&nbsp;${order.prod_name}</td> --%>
							            <td name='user_name'>${user.user_name}</td>
							            <td name='user_mobile'>${user.user_mobile}</td>
							            <td name='user_email'>${user.user_email}</td>
							            <td name='user_address'>${user.user_address}</td>
							            <td name='user_birthday'>${user.user_birthday}</td>
							            <td name='signup_date'>${user.signup_date}</td>
							            <td name='user_point'>${user.user_point}</td>
							             <td><input type="button" name="userdel" id="userdel" value="회원 탈퇴" class="custom-button3"></td>
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

	
	
})

.on('click','#userdel',function(){ 
	if(!confirm("회원정보를 삭제 시킵니까?")) return false;
	var user_id = $(this).closest('tr').find('td[name=user_id]').text();
	$.ajax({ url:'/userDelete', data:{user_id:user_id}, type:'post', dataType:'text',
				success: function(data){
					alert("회원정보가 삭제되었습니다.")
					
				
					document.location = data;
				}, error: function(){
					alert("삭제 실패!!")
					return false;
				}
	})
})
;
</script>
</html>
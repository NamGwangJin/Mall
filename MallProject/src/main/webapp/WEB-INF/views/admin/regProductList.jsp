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
<input type="button" id="regButton" name="regButton" value="새 상품 등록하기" class="custom-button3">
  		<section>
        	<div>
        		<div>
       				<table id=pList>
					<tr><td>　</td></tr>
					    <c:forEach items="${rList}" var="regProduct">
					       <tr>    
							    <input type="hidden" id="userid" name="userid" value="${regProduct.user_id}">
							    <input type="hidden" id="img" name="img" value="${regProduct.prod_img}">
							    <td><input type="hidden" name="prodid" id="prodid" value="${regProduct.prod_id}"></td>
							    <td><img src="/img/${regProduct.prod_img}" style="width:100px">&nbsp;<a id="prodname" name="prodname">${regProduct.prod_name}</a></td>
							    <td style="width: 150px;"><b id="price" name="price" style="white-space: nowrap;">${regProduct.prod_price}</b></td>
							    <td style="width: 200px;"><b id="msg" name="msg" style="white-space: nowrap;">코멘트:${regProduct.prod_msg}</b></td>
							    <td style="width: 100px;"> 
							        <input type="button" id="editButton" name="editButton" value="상품정보수정" class="custom-button">
							    </td>
							    <td><input type="button" name="regdel" id="regdel" value="상품 삭제" class="custom-button2"></td>
							</tr>
					        <tr><td colspan=7></td></tr>
					    </c:forEach>
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
$(document)
.ready(function () {
    $(document).on('click', 'input[name=regButton]', function() {
      
        var editUrl = "/ProductReg"
        
        window.open(editUrl, "_blank", "width=800,height=800");
    });
    
    $(document).on('click', 'input[name=editButton]', function() {
        var prodName = $(this).closest('tr').find('a[name=prodname]').text();
        var prodPrice = $(this).closest('tr').find('b[name=price]').text();
        var prodImg = $(this).closest('tr').find('input[name=img]').val();
        var prodMsg = $(this).closest('tr').find('b[name=msg]').text();
        
        
        var editUrl = "/regProductEdit?prodName=" + encodeURIComponent(prodName) +
            "&prodPrice=" + encodeURIComponent(prodPrice) +
            "&prodImg=" + encodeURIComponent(prodImg) +
            "&prodMsg=" + encodeURIComponent(prodMsg);
        
        window.open(editUrl, "_blank", "width=800,height=800");
    });
})
.on('click','#regdel',function(){ 
	if(!confirm("등록된 상품을 삭제합니까?")) return false;

	var prodName = $(this).closest('tr').find('a[name=prodname]').text();
	 var prodImg = $(this).closest('tr').find('input[name=img]').val();
	$.ajax({ url:'/regDelete', data:{prod_name:prodName, prod_img:prodImg}, type:'post', dataType:'text',
				success: function(data){
					alert("등록상품이 삭제되었습니다.")
					
				
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
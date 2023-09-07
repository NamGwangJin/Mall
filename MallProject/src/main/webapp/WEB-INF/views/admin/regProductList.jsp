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
		<!-- 헤더 아이디&이메일 -->
<div class="body" style="margin-top:50px;">
<div class="MoreLayoutView_container__8Ahvr">
<div class="MoreHeaderView_container__kK6Wj">
	<div class="MoreHeaderView_inner__BRiQZ">
		<div class="MoreHeaderView_profile_wrap__Y9XWQ">
			<div class="MoreHeaderView_name__4ZkcS">
				<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
				　　　　　　　　　　　　　　${id}님 환영합니다.</h2>
			</div>
		
			
		</div>
		<!-- 수정/탈퇴 버튼 -->
		<div class="MoreHeaderView_button_wrap__B-cQ2">
			<a href=/logout name=logout class="MoreHeaderView_button_item__gv6pa" >로그아웃</a>
			
		</div>
	</div>
</div>
<!-- 헤더끝 -->
<!-- 본문 시작 -->

<div class="mypageWrapper css-11849r4-defaultStyle">
<div class="myPagelnbWrapper css-jo3gxq-defaultStyle">
<div class="mypageLnb">
<h2 class="mypageLnbTitle">

<a href="/goreg" style="font-size: inherit; color:#25C7A0;">Weverse Admin</a></h2>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">주문현황</h3>

<ul class="myPageLnbList">
<li><a href="/adminOrder">주문내역보기</a></li>
<li><a href="/adminOrderCancelList">취소/반품신청 내역</a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">상품 관리</h3>

<ul class="myPageLnbList">

<li><a href="/goreglist"> 
					<form id="uploadForm" action="/regProductList" method="post" class="custom-button-wrap">
			      등록된 상품 목록
 			         </form>
</a></li>
</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">게시판관리</h3>

<ul class="myPageLnbList">
<li><a href="#">공지사항작성</a></li>

</ul>
</div>

<div class="mypageLnbListWrapper">
<h3 class="mypageLnbSubTitle">회원관리</h3>

<ul class="myPageLnbList">
<li><a href="/adminuserlist">회원 정보보기</a></li>
<li><a href="#">회원 권한 관리</a></li>

</ul>
</div>
</div>
</div>




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
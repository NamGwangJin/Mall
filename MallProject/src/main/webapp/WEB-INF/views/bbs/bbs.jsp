<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html class="scrollbar-custom use-webfont">
<head>
<meta charset="UTF-8">
<link href="css/product.css" rel="stylesheet" />
<link href="css/mall.css" rel="stylesheet" />
<link href="resources/css/bbs.css" rel="stylesheet"/>
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
<title>Weverse</title>
</head>
<body>
<div class="navbar">
<%@ include file="..\header.jsp" %>
</div>
<!-- 배너   -->
<!-- 헤더시작 -->
<div class="MoreLayoutView_container__8Ahvr">
<div class="MoreHeaderView_container__kK6Wj">
	<div class="MoreHeaderView_inner__BRiQZ">
		<div class="MoreHeaderView_profile_wrap__Y9XWQ">
			<div class="MoreHeaderView_name__4ZkcS">
				<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
				Weverse 게시판</h2>
			</div>
			<div class="MoreHeaderView_email__Ui6wT">회원님들의 의견을 자유롭게 공유해보세요!</div>
		</div>
	</div>
</div> 

<!-- 헤더 -->
<div class="mypageWrapper css-11849r4-defaultStyle">
	<div class="mypageTitleBox mainTitle borderStyle css-qma8am-mypageTitleStyle">
	<div class="titleArea">
	<h2 class="title">게시글 목록</h2>
	</div>
	</div>
<!-- 본편 -->
<div class="css-46rlgz-defaultStyle">
<div class="agreeTable">
	<table>
		<caption>개인정보 수집 및 최종 변경 일자</caption>
	<colgroup>
		<col width="10%">
		<col width="30%">
		<col width="20%">
		<col width="20%">
		<col width="10%">
	</colgroup>
	<thead>
		<tr>
		<th scope="col">번호</th>
		<th scope="col">제목</th>
		<th scope="col">작성자</th>
		<th scope="col">작성시각</th>
		<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody id = tblBoard style="text-align:center;">
	<c:forEach items="${mlist}" var="list">
	<tr>
	<td>${list.num}</td>
	<td>${list.title}</td>
	<td>${list.writer}</td>
	<td>${list.created}</td>
	<td>${list.hit}</td></tr>
	</c:forEach>
	</tbody>
</table>
</div>

<div class="af">
	${write }
</div>


	<div class="pagecontroller"  id="pagestr">
	    <a class="pagination__button pagination__button--active" href="">${pagestr}</a>
	</div>
</div>

<!-- end -->
</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#tblBoard tr',function(){
	document.location = '/view?num=' + $(this).find('td:first').text();
	return false;
})
.on('click','#logout',function(){
    if(!confirm('정말로 로그아웃할까요?')){
        return false;
    } else {			
        document.location= "/logout";
    }
})
</script>
</html>
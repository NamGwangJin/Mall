<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/product.css" rel="stylesheet" />
<link href="css/mall.css" rel="stylesheet" />
<link href="resources/css/bbs.css" rel="stylesheet"/>
<title>Weverse</title>
</head>
<body>
<%@ include file="..\header.jsp" %>

<section class = "view">
<div id = "wrapper" style="margin-top:150px;">
<div>
<table cellspacing="0" cellpadding="0" width="90%" align="center">


<caption>
<h1 style = "text-align:left;">Q&A 목록</h1>
</caption>


<thead style="height:50px; text-align:center">
<tr width="90%">
	<td width="10%">
	<b>번호</b>
	</td>
	<td width="25%">
	<b>제목</b>
	</td>
	<td>
	<b>작성자</b>
	</td>
	<td>
	<b>작성시각</b>
	</td>
	<td width="15%">
	<b>조회수</b>
	</td>
</tr>
<tr><td colspan="5"><hr></td></tr>
</thead>

	<tbody id = tblBoard style="text-align:center;">
	<c:forEach items="${qlist}" var="qlist">
	<tr><td>${qlist.num}</td><td>${qlist.title}</td><td>${qlist.writer}</td><td>${qlist.created}</td><td>${qlist.hit}</td></tr>
	<tr><td colspan=5><hr></td>
	</c:forEach>
	</tbody>

</table>
</div>
</div>
</section>

<table align="center">
<tr>
${questionwrite}
</tr>
</table>


<!-- 22  -->

	<div class="pagination" align="center">
	    <a class="pagination__button pagination__button--prev pagination__button--disabled">&lt;</a>
	    <a class="pagination__button pagination__button--active" href="">${pagestr}</a>
	    <a class="pagination__button pagination__button--next" href="" data-remote="true">&gt;</a>
	</div>
    
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#tblBoard tr',function(){
	document.location = '/questionview?num=' + $(this).find('td:first').text();
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
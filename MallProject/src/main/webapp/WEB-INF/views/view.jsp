<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bPost.title}</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto; }
table td { border : 1px solid black; }
</style>
<body align=center>
<table>
<tr><td colspan=2><h1>게시물 보기</h1></td></tr>
<tr><td>게시물 번호</td><td id=num>${bPost.num}</td></tr>
<tr><td>제목</td><td>${bPost.title}</td></tr>
<tr><td>내용</td><td><textarea rows=10 cols=50 readonly>${bPost.content}</textarea></td></tr>
<tr><td>작성자</td><td>${bPost.writer}</td></tr>
<tr><td>조회수</td><td>${bPost.hit}</td></tr>
<tr><td>작성시각</td><td>${bPost.created}</td></tr>
<tr><td>수정시각</td><td>${bPost.updated}</td></tr>
<tr><td colspan=2><a href="/">목록보기</a>&nbsp;
<c:if test="${id==bPost.writer}">
<a href='/write'>게시물 작성</a>&nbsp;&nbsp;
<button id=btnUd style='background-color:blue; color:white;'>수정</button>
<button id=btnDel style='background-color:red; color:white;'>삭제</button></td></tr>
</c:if>
</table>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('click','#btnDel',function(){
	if(!confirm('정말로 삭제하시겠습니까?')) return false;
	
	document.location = '/delete?num='+$('#num').text();
	alert("삭제가 완료되었습니다.");
	return false;
})
.on('click','#btnUd',function(){
	document.location = '/update?num='+$('#num').text();
	return false;
})
</script>
</html>
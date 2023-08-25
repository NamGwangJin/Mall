<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto; }
table td { border : 1px solid black; }
</style>
<body align=center>
<form method="post" action="/modify" id=frmUpdate name=frmUpdate>
<input type=hidden id=no name=num value='${bPost.num}'>
<table>
<tr><td colspan=2><h1>게시물 수정</h1></td></tr>
<tr><td>게시물 번호</td><td id=num>${bPost.num}</td></tr>
<tr><td>제목</td><td><input type=text name=title id=title value="${bPost.title}" maxlength=128></td></tr>
<tr><td>내용</td><td><textarea rows=10 cols=50 name=content id=content>${bPost.content}</textarea></td></tr>
<tr><td>작성자</td><td>${bPost.writer}</td></tr>
<tr><td>조회수</td><td>${bPost.hit}</td></tr>
<tr><td>작성시각</td><td>${bPost.created}</td></tr>
<tr><td>수정시각</td><td>${bPost.updated}</td></tr>
<tr><td colspan=2><a href="/">목록보기</a>&nbsp;
<input type=submit id=btnSubmit name=btnSubmit value='수정 완료'></td></tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#frmUpdate',function(){
	if( $('#title').val()=='' ) {
		alert('제목을 입력하세요.');
		return false;
	}
	if( $('#content').val()=='' ){
		alert('내용을 입력하세요.');
		return false;
	}
	alert('수정이 완료되었습니다.');
})
</script>
</html>
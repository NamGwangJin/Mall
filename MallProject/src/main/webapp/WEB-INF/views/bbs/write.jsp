<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<style>
table{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto;}
h1{ border-collapse : collapse; width:75%; margin-left:auto; margin-right:auto; }
table td { border : 1px solid black; }
</style>
<body align=center>
<table>
${write}
<form method='post' action='/insert2' id=frmInsert name=frmInsert>
<tr><td colspan=2><h1>게시물 작성</h1></td></tr>
<tr><td>제목</td><td><input type=text name=title id=title maxlength=128 style='width:90%'></td></tr>
<tr><td>내용</td><td><textarea rows=10 cols=50 name=content id=content style='width:90%'></textarea></td></tr>
<tr><td><a href="/bbs"><h3>목록으로</h3></a></td>
		<td><input type=submit id=btnSubmit name=btnSubmit value='작성'></td></tr>
</table>
</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#frmInsert',function(){
	if( $('#title').val()=='' ) {
		alert('제목을 입력하세요.');
		return false;
	}
	if( $('#content').val()=='' ){
		alert('내용을 입력하세요.');
		return false;
	}
})
</script>
</html>

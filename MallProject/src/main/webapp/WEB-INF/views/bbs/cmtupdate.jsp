<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글수정</title>
<link href="resources/css/bbs.css" rel="stylesheet"/>
</head>
<body>
<form method="post" action="/modify2" id=frmUpdate1 name=frmUpdate1>
<input type=hidden id=no name=num value='${cList.num}'>
 <h1 class="">댓글 목록</h1>
    <section class="reply-list table-common">
        <table border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
            
            <thead>
                <tr>
                    <td>${cList.writer}</td>
                    <td>${cList.content}</td>
                    <td>${cList.regdate}</td>
                </tr>
            </thead>
				
        </table>
    </section>
    
    <h1 class="">댓글 입력</h1>
    <section class="reply-form">
        
         <input type=hidden name=bbscmtnum value="${cList.bbscmtnum}">
            <div>
                <textarea name=content></textarea>
                <input type=submit >
            </div>
        
    </section>
</form>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.on('submit','#frmUpdate1',function(){
	if( $('#content').val()=='' ){
		alert('내용을 입력하세요.');
		return false;
	}
	alert('수정이 완료되었습니다.');
})
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/bbs.css" rel="stylesheet"/>
<title>${bPost.title}</title>
</head>
<%@ include file="..\header.jsp" %>
<div class=body style="margin-top:150px;">
<h1 class="con">게시글 상세</h1>
    <section class="article-detail table-common con row">
        <div class="article-writer cell">
                <div class="writer-icon"><img src="img/${bPost.bbs_img}"></div>
                <span>${bPost.writer}</span>
        </div>
        <table class="cell" border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
            <tbody>
                <tr class="article-title">
                    <th><span id=num>${bPost.num}</span></th>
                    <td colspan="3">${bPost.title}</td>
                </tr>
                <tr class="article-info">
                    <th>날짜</th>
                    <td>${bPost.created}</td>
                    <th>조회수</th>
                    <td>${bPost.hit}</td>
                </tr>
                <tr class="article-body">
                    <td colspan="4">${bPost.content}</td>
                </tr>
                
<tr><td colspan=2><a href="/bbs">목록보기</a>&nbsp;
<c:if test="${id==bPost.writer}">
<button id=btnUd>수정</button>
<button id=btnDel>삭제</button></td></tr>
</c:if>	
</tbody>
    </table>
 </section>
<div class="con reply">

    <h1 class="">댓글 목록</h1>
   
    <section class="reply-list table-common">
        <table border="1">
            <colgroup>
                <col width="100px">
            </colgroup> 
            <thead>
            <c:forEach items="${cList}" var="cList">
                <tr>
                <input type=hidden name=cmtnum value="${cList.num}">
                <input type=hidden name=bbscmtnum value="${cList.bbscmtnum}">
                <input type=hidden name=content value="${cList.content}">
            	<input type=hidden name=upnum value="${cList.upnum}">
                    <td>${cList.writer}</td>
                    <td>${cList.content}</td>
                    <td>${cList.regdate}</td>
                    <td><button name=btnreply>답글쓰기</button></td>
                    <c:if test="${id==cList.writer}" >
                    <td>
                    	<button name=btnUd1>수정</button>
             		    <button name=btnDel1>삭제</button></td>
             		    </c:if>	
                </tr>
            </c:forEach>
            </thead>
				
        </table>
    </section>
    
    <h1 class="">댓글 입력</h1>
    <section class="reply-form">
        <form method='post' action='/replyInsert'>
         <input type=hidden name=num value="">
            <div>
                <textarea name=content placeholder="댓글을 작성해주세요" maxlength="200"></textarea>
                <input type=submit class=con1 value="작성">
            </div>
        </form>
    </section>
    
</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	$('input[name=num]').val( $('#num').text());
})
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
.on('click','button[name=btnDel1]',function(){
	if(!confirm('정말로 삭제하시겠습니까?')) return false;
	let cmtnum = $(this).closest('tr').find('input[name=cmtnum]').val();
	document.location = '/delete1?num='+cmtnum+"&bbscmtnum="+$('input[name=bbscmtnum]').val();
	alert("삭제가 완료되었습니다.");
	return false;
})

.on('click','button[name=btnUd1]',function(){
 	$(this).closest('tr').find('td:eq(1)').wrap('<input type=text id=modify value=""></input>');
 	$('#modify').val( $(this).closest('tr').find('input[name=content]').val() );
 	$(this).attr("name","ok");
 	$(this).text("완료");

})
.on('click','button[name=ok]',function(){
	$.ajax({url:'/update1', data:{ num : $(this).closest('tr').find('input[name=cmtnum]').val(), content : $('#modify').val() }, type:'post', dataType:'text',
		success: function(data) {
			
			document.location = data + "?num=" + $('#num').text();
		}, error:function() {
			
		}
	})
})
</script>
</html>
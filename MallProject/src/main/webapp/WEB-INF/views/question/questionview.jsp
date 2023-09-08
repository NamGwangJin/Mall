<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/bbs.css" rel="stylesheet"/>
<title>${qPost.title}</title>
</head>
<%@ include file="..\header.jsp" %>
<div class=body style="margin-top:150px;">
<h1 class="con">Q&A 게시글 상세</h1>
    <section class="article-detail table-common con row">
        <div class="article-writer cell">
              <%--   <div class="writer-icon"><img src="img/${qPost.question_img}"></div> --%>
                <span>${qPost.writer}</span>
        </div>
        <table class="cell" border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
            <tbody>
                <tr class="article-title">
                    <th><span id=num>${qPost.num}</span></th>
                    <td colspan="3">${qPost.title}</td>
                </tr>
                <tr class="article-info">
                    <th>날짜</th>
                    <td>${qPost.created}</td>
                    <th>조회수</th>
                    <td>${qPost.hit}</td>
                </tr>
                <tr class="article-body">
                    <td colspan="4">${qPost.content}</td>
                </tr>
                
<tr><td colspan=2><a href="/question">목록보기</a>&nbsp;
<c:if test="${id==qPost.writer}">
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
            <c:forEach items="${qList}" var="qList">
                <tr>
                <input type=hidden name=cmtnum1 value="${qList.num}">
                <input type=hidden name=quecmtnum value="${qList.quecmtnum}">
                <input type=hidden name=content value="${qList.content}">
            	<input type=hidden name=upnum value="${qList.upnum}">
                    <td>${qList.writer}</td>
                    <td>${qList.content}</td>
                    <td>${qList.quedate}</td>
                    <td><button name=btnreply>답글쓰기</button></td>
                    <c:if test="${id==qList.writer}" >
                    <td>
                    	<button name=btnUd2>수정</button>
             		    <button name=btnDel2>삭제</button></td>
             		    </c:if>	
                </tr>
            </c:forEach>
            </thead>
				
        </table>
    </section>
    
    <h1 class="">댓글 입력</h1>
    <section class="reply-form">
        <form method='post' action='/replyInsert1'>
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
	
	document.location = '/delete3?num='+$('#num').text();
	alert("삭제가 완료되었습니다.");
	return false;
})
.on('click','#btnUd',function(){
	document.location = '/update3?num='+$('#num').text();
	return false;
})
.on('click','button[name=btnDel2]',function(){
	if(!confirm('정말로 삭제하시겠습니까?')) return false;
	let cmtnum1 = $(this).closest('tr').find('input[name=cmtnum1]').val();
	document.location = '/delete4?num='+cmtnum1+"&quecmtnum="+$('input[name=quecmtnum]').val();
	alert("삭제가 완료되었습니다.");
	return false;
})

.on('click','button[name=btnUd2]',function(){
 	$(this).closest('tr').find('td:eq(1)').wrap('<input type=text id=modify3 value=""></input>');
 	$('#modify3').val( $(this).closest('tr').find('input[name=content]').val() );
 	$(this).attr("name","ok");
 	$(this).text("완료");

})
.on('click','button[name=ok]',function(){
	$.ajax({url:'/update4', data:{ num : $(this).closest('tr').find('input[name=cmtnum1]').val(), content : $('#modify3').val() }, type:'post', dataType:'text',
		success: function(data) {
			
			document.location = data + "?num=" + $('#num').text();
		}, error:function() {
			
		}
	})
})
</script>
</html>
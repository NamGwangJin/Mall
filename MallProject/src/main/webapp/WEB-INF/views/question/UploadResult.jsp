<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드 결과</title>
</head>
<body>
    <h2>파일 업로드 결과</h2>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <p><strong><font color="red">${errorMessage3}</font></strong></p>
    <% } else { %>
<%--         <p>파일명 [${fileName}]가 디렉토리에 업로드 되었습니다.</p> --%>
        <p>파일명 :</p><p id=filename3>${fileRealName3}</p><p>이 디렉토리에 저장되었습니다. </p> 
    <% } %>
<!--     <p><a href="/upload">다시 업로드</a></p> -->
</body>
</html>
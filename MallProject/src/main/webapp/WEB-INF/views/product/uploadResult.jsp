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
        <p><strong><font color="red">${errorMessage}</font></strong></p>
    <% } else { %>
        <p>파일명: ${fileName}</p>
        <p>실제 파일명: </p><p id=filename>${fileRealName}</p>
    <% } %>
    <p><a href="/upload">다시 업로드</a></p>
</body>
</html>
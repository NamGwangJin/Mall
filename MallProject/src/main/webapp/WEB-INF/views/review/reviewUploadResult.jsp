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
    <% if (request.getAttribute("errorMessage1") != null) { %>
        <p><strong><font color="red">${errorMessage1}</font></strong></p>
    <% } else { %>
        <p>파일명: ${fileName1}</p>
        <p>실제 파일명: </p><p id=filename1>${fileRealName1}</p>
    <% } %>
    <p><a href="/upload1">다시 업로드</a></p>
</body>
</html>
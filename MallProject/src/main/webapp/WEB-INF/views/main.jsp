<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image Slideshow</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
  <div id="slideShow">
    <ul class="slides">
      <li><img src="/img/main/main1.webp" alt=""></li>
      <li><img src="/img/main/main2.webp" alt=""></li>
      <li><img src="/img/main/main3.webp" alt=""></li>
      <li><img src="/img/main/main4.webp" alt=""></li>
      <li><img src="/img/main/main5.webp" alt=""></li>
      <li><img src="/img/main/main6.webp" alt=""></li>
    </ul>
    <p class="controller">
      <span class="prev">&lang;</span>
      <span class="next">&rang;</span>
    </p>
  </div>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script src="resources/js/slideShow.js"></script>
</body>
</html>

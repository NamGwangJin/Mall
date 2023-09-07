<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Like Count Example</title>
</head>

<body>
<div class="navbar">
    <a href="/" id="logo">
        <img src="img/weverslogo.jpg" width="160">
    </a>
    <ul id="menu">
        <li class="menu-item">${infoline}</li>
        <li class="menu-item">${inforeg}</li>
    </ul>
    <ul id="menu">
        <input type=hidden name=id value="${id}">
        <li class="menu-item">${bbs}</li>
        <li class="menu-item">${cartlist}</li> 
        <li class="menu-item">${orderlist}</li>
    </ul>
</div>

<p>Like Count: <span id="result"></span></p>
<a href="javascript:void(0);" onclick="swapImg();">
    <img id="likeImage" name='imgstate' src="<c:choose>
            <c:when test="${lk == 0}">
                img/likeimgdumy.JPG
            </c:when>
            <c:when test="${lk == 1}">
                img/afterlikeimg.JPG
            </c:when>
        </c:choose>"
        alt="Image">
</a>

<div>
    <span id="countlike"></span>
</div>
<input type='text' name='title' id='title' value='testtitle' />
<input type=hidden name=id id=id value="${id}">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var likeImage = document.getElementById("likeImage");
var title = document.getElementById("title").value;
var isLiked = ${lk == 1};

$(document).ready(function () {
	$.ajax({
        type: 'GET',
        url: '/initialLikeCount?title=' + title, 
        success: function (response) {
          $('#result').text(response);
        },
        error: function (xhr, status, error) {
          console.error(error);
        }
      })
});



function swapImg() {
    isLiked = !isLiked;
    var imagePath = isLiked ? "img/afterlikeimg.JPG" : "img/beforelikeimg.JPG";
    likeImage.src = imagePath;
    updateCountAndImage(imagePath);
}

function updateCountAndImage(imagePath) {
    var data = {
        imgstate: imagePath,
        title: title
    };

    $.ajax({
        type: 'POST',
        url: isLiked ? '/increaseLikeCount' : '/decreaseLikeCount',
        data: data,
        success: function (response) {
            $('#result').text(response);
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });
}

</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/mall.css" rel="stylesheet" />
<title></title>
</head>
<body>
<div class="fixed-header">
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
</div>
</body>
</html>
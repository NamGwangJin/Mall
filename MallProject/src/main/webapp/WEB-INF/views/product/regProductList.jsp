<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            
            padding: 10px;
            border: 1px solid #ccc;
            vertical-align: auto;
            
        }
		tr{
			padding: 100%;
		}
        .product-image {
            max-width: 100px;
            height: auto;
        }

        .product-details {
            display: flex;
            align-items: center;
        }

        .product-details b {
            margin-right: 20px;
        }
    </style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="..\header.jsp" %>

<table id=pList>
<tr><td>　</td></tr>
    <c:forEach items="${rList}" var="regProduct">
       <tr>    
		    <input type="hidden" id="userid" name="userid" value="${regProduct.user_id}">
		    <input type="hidden" id="img" name="img" value="${regProduct.prod_img}">
		    <td><input type="hidden" name="prodid" id="prodid" value="${regProduct.prod_id}"><input name="checkbox" type="checkbox"></td>
		    <td><img src="/img/${regProduct.prod_img}" style="width:100px">&nbsp;<a id="prodname" name="prodname">${regProduct.prod_name}</a></td>
		    <td style="width: 150px;"><b id="price" name="price" style="white-space: nowrap;">${regProduct.prod_price}</b></td>
		    <td style="width: 200px;"><b id="msg" name="msg" style="white-space: nowrap;">코멘트:${regProduct.prod_msg}</b></td>
		    <td> 
		        <input type="button" id="editButton" name="editButton" value="상품정보수정">
		    </td>
		    <td><input type="button" name="regdel" id="regdel" style="color:red;" value="삭제하기"></td>
		</tr>
        <tr><td colspan=7></td></tr>
    </c:forEach>
</table>

</body>
   
<!-- <a href="/ProductReg">새로운 상품 등록하기</a> -->

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function () {
    $(document).on('click', 'input[name=editButton]', function() {
        var prodName = $(this).closest('tr').find('a[name=prodname]').text();
        var prodPrice = $(this).closest('tr').find('b[name=price]').text();
        var prodImg = $(this).closest('tr').find('input[name=img]').val();
        var prodMsg = $(this).closest('tr').find('b[name=msg]').text();
        
        
        var editUrl = "/regProductEdit?prodName=" + encodeURIComponent(prodName) +
            "&prodPrice=" + encodeURIComponent(prodPrice) +
            "&prodImg=" + encodeURIComponent(prodImg) +
            "&prodMsg=" + encodeURIComponent(prodMsg);
        
        window.open(editUrl, "_blank", "width=800,height=800");
    });
})
.on('click','#regdel',function(){ 
	if(!confirm("등록된 상품을 삭제합니까?")) return false;

	var prodName = $(this).closest('tr').find('a[name=prodname]').text();
	 var prodImg = $(this).closest('tr').find('input[name=img]').val();
	$.ajax({ url:'/regDelete', data:{prod_name:prodName, prod_img:prodImg}, type:'post', dataType:'text',
				success: function(data){
					alert("등록상품이 삭제되었습니다.")
					
				
					document.location = data;
				}, error: function(){
					alert("삭제 실패!!")
					return false;
				}
	})
})
;

</script>

</html>
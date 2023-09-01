<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="..\header.jsp" %>

<table>
<tr><td>등록된상품목록</td></tr>
				<c:forEach items="${rList}" var="regProduct">
        						<input type=hidden id=userid value="${regProduct.user_id}">
        						<input type=hidden id=img value="${regProduct.prod_img}.jpg">
        						<tr>
        								<td><input type=hidden name=prodid id=prodid value="${regProduct.prod_id}"><input name="checkbox" type=checkbox></td>
        								<td><img id=img src="/img/${regProduct.prod_img}">&nbsp;<b id=prodname>${regProduct.prod_name}</b></td>
        								<td><b id=price>${regProduct.prod_price}</b></td>
        								<td><b id=msg>${regProduct.prod_msg}</b></td>
        								<td><div id="regProductEditResult"></div></td>
        								<td> <form id="editForm" class="editButton" action="/regProductEdit" method="post">
							       			   <input type="submit" value="상품정보수정">
											 </form></td>
        								<td><input type=button name=regdel style="color:red;" value="삭제하기"></td>
        						</tr>
        						<tr><td colspan=5><hr></td></tr>
        		 </c:forEach>

</table>

</body>
   
<a href="/ProductReg">상품 새로 등록하기</a>



</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function () {
    $('#editForm').submit(function (e) {
        e.preventDefault(); 
        $.ajax({
            type: 'POST',
            url: '/regProductEdit', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
            	
            	var openNewWindow = window.open("productEdit","_blank","width=800,height=800");
            	openNewWindow.document.write(response);
            	

                
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#regProductEditResult').text('불러오기 실패');
            }
        });
    });
    $('.editButton').click(function () {
        var prodId = $(this).closest('tr').find('input[name="prodid"]').val();
        var prodName = $(this).closest('tr').find('#prodname').text();
        var prodImg = $(this).closest('tr').find('#img').val();
        var prodPrice = $(this).closest('tr').find('#price').text();
        var prodMsg = $(this).closest('tr').find('#msg').text();

        // 상세 정보 수정 페이지로 데이터 전달
        window.location.href = "/editProduct?prod_id=" + prodId +
            "&prod_name=" + encodeURIComponent(prodName) +
            "&prod_img=" + encodeURIComponent(prodImg) +
            "&prod_price=" + encodeURIComponent(prodPrice) +
            "&prod_msg=" + encodeURIComponent(prodMsg);
    });
    
})
// .on('click','#editForm',function(){
// 	document.location = "/buy?prod_name=" + $('#prodname').text() + $('#img').val() + 
// 								 $('#price').text() + $('#msg').text() ;
// })
</script>

</html>
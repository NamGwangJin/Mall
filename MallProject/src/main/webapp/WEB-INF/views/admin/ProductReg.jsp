<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>SimpleShop</title>
    <meta charset="UTF-8">
    <link href="css/mall.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
  </head>   
<body style="background-image: url('img/regbackground.jpg');">

 <div class=body style="margin-top:50px;">
<h1 align=center>${id}님의 상품 등록하기</h1>


 <form id="uploadForm" action="/upload" method="post" enctype="multipart/form-data">
        
        <label for="file">상품 이미지 등록:</label>
        <input type="file" id="file" name="file" value=""><br>
        <input type="submit" value="상품이미지등록">
        <img id="prod_uimg" style="width:100px" src="">
</form>
</div>
<div id="uploadResult">

</div>

<br><br>
<form method="post" action="/insert" id=frmreg name=frmreg>
<table>
  
<tr><td>상품명</td><td><input type=text name=prod_name id=prod_name size=64 maxlength=128 value=""></td></tr>
<tr><td>상품설명</td><td><textarea rows=10 cols=61 name=prod_msg id=prod_msg ></textarea></td></tr>
<tr><td>가격</td><td><input type=text name=prod_price id=prod_price size=64 maxlength=128 value=""></td></tr>
<tr><td><td><input type=text name=prod_img id=prod_img size=64 maxlength=128 value=""></td></tr>
<tr><td style='text-align:right'><input type=submit id=btnSubmit name=btnSubmit value='상품 등록하기'>&nbsp;&nbsp;<br></td></tr>
</table>
</form>


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<script>

$(document)
.ready(function () {
    $('#uploadForm').submit(function (e) {
        e.preventDefault(); 

        $.ajax({
            type: 'POST',
            url: '/upload', 
            data: new FormData(this),
            cache: false,
            contentType: false,
            processData: false,
            success: function (response) {
                
                $('#uploadResult').html(response);
                $('#prod_img').val($('#filename').text());
                $('#prod_uimg').attr('src', '/img/' + $('#filename').text());
                
            },
            error: function (xhr, status, error) {
                console.error(error);
                $('#uploadResult').text('파일 업로드 실패');
            }
        });
    });
    $('#frmreg').submit(function (e) {
        e.preventDefault(); 

        $.post('/insert', $(this).serialize(), function(data) {
            alert("등록 완료");
            window.close();
        }).fail(function(xhr, textStatus, errorThrown) {
            alert("등록 실패: " + xhr.responseText);
        });
    });
});

</script>
</body>
</html>
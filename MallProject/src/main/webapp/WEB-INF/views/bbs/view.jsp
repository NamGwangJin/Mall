<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html class="scrollbar-custom use-webfont">
<head>
<meta charset="UTF-8">
<link href="resources/css/bbs.css" rel="stylesheet"/>
<link href="css/mall.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/mypage.css"/>
<link rel="stylesheet" href="/resources/css/content.css"/>
<link href="resources/css/bbs2.css" rel="stylesheet"/>
<script type="text/javascript" src="https://appleid.cdn-apple.com/appleauth/static/jsapi/appleid/1/en_US/appleid.auth.js"></script>
<meta name="next-head-count" content="8"/>
<title>${bPost.title}</title>
</head>
<body>
<div class="navbar">
<%@ include file="..\header.jsp" %>
</div>
<!-- 배너   -->
<!-- 헤더시작 -->
<div class="MoreLayoutView_container__8Ahvr">
<div class="MoreHeaderView_container__kK6Wj">
	<div class="MoreHeaderView_inner__BRiQZ">
		<div class="MoreHeaderView_profile_wrap__Y9XWQ">
			<div class="MoreHeaderView_name__4ZkcS">
				<h2 class="TitleView_title__SSnHb TitleView_-color_white__6PV8I TitleView_-weight_600__OzPRx">
				Weverse 게시판</h2>
			</div>
			<div class="MoreHeaderView_email__Ui6wT">회원님들의 의견을 자유롭게 공유해보세요!</div>
		</div>
	</div>
</div> 
<!-- 헤더 -->
<div class="margin"></div>
<div class="subpage-container">
	<div class="free-board-sub-wrap">
		<div class="board-title">
			<div><span id=num>${bPost.num}</span> | ${bPost.title}</div>
		<div class="scale">
			<span class="name">${bPost.writer}</span>
			<span>${bPost.created}</span>
			<span> 조회 ${bPost.hit}</span>
			<span>
				
		</div>
	</div>
	<div class="board-text">
		<div style="white-space: pre-wrap; word-break: break-all; min-height: 240px;">
		<c:if test="${bPost.bbs_img != ''}">
			<img src="/img/${bPost.bbs_img}">
		</c:if>
		${bPost.content}
		</div>
		<ul class="board-text-bottom">
			<li class="pc-board-action">
			</li>
		</ul>
	<div class="like-container">
	    <a href="javascript:void(0);" onclick="swapImg();">
	    <input type=hidden name='lcnum' id='lcnum' value='${bPost.num}' />
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
		    <p><span id="lkresult"></span></p>
	</div>
		
	</div>
	</div>

	<div class="pc-series-nav">
		<div class="pc-btn pc-btn-default btn_cursor" onclick="location.href='/bbs';">목록보기</div>
	<div class="btn_cursor2">
		<c:if test="${id==bPost.writer}">
		<button class="btn1 btn1-de" id=btnUd>수정</button>
		<button class="btn1 btn1-de other" id=btnDel>삭제</button>
		</c:if>
	</div>
	</div>


<div class="icon-comment-list-wrap">
	<ul>
		<li class="comment-count"><div>댓글 목록</div></li>
		<c:forEach items="${cList}" var="cList">
		<li>
		<div class="comment-col">
                <input type=hidden name=cmtnum value="${cList.num}">
                <input type=hidden name=bbscmtnum value="${cList.bbscmtnum}">
                <input type=hidden name=content value="${cList.content}">
            	<input type=hidden name=upnum value="${cList.upnum}">
                  <div class="user-name">
                    ${cList.writer}
                  <div class="comment-util">
					<button name=btnreply>답글쓰기</button>
                    <c:if test="${id==cList.writer}" >
                    	<button name=btnUd1>수정</button>
             		    <button name=btnDel1>삭제</button>
					</c:if>	
                  </div>
                  </div>
                  <div class="date">
                 ${cList.regdate}
                  </div>
                <div class="con" name=content>
					${cList.content}
				</div>
        </div>
		</li>
		</c:forEach>
	</ul>
	
</div>
<div>
    <section class="reply-form">
        <form method='post' action='/replyInsert'>
       <input type=hidden name=num value="${bPost.num}">
            <div>
                <textarea name=content placeholder="댓글을 작성해주세요" maxlength="200"></textarea>
                <input type=submit class=con1 value="작성">
            </div>
        </form>
    </section>
</div>

</div>



</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
//좋아요 기능에서 변수들
var likeImage = document.getElementById("likeImage");
var lcnum = document.getElementById("lcnum").value;

var isLiked = ${lk == 1};
var thisliked;


$(document)
.ready(function(){
	$('input[name=num]').val( $('#num').text());
	thisliked = parseInt ($('#lkresult').text());
})


$.ajax({
        type: 'GET',
        url: '/initialLikeCount?lcnum=' + lcnum, 
        success: function (response) {
          $('#lkresult').text(response);
        },
        error: function (xhr, status, error) {
          console.log(error);
        }
      })
//좋아요 할때 쓰는 메소드
function swapImg() {
    if (!isNaN(thisliked) && thisliked >= 1) {
        var imagePath = isLiked ? "img/afterlikeimg.JPG" : "img/beforelikeimg.JPG";
        likeImage.src = imagePath;
        updateCountAndImage(imagePath);
    } else {
        isLiked = !isLiked;
        var imagePath = isLiked ? "img/afterlikeimg.JPG" : "img/beforelikeimg.JPG";
        likeImage.src = imagePath;
        updateCountAndImage(imagePath);
    }
}

function updateCountAndImage(imagePath) {
    var data = {
        imgstate: imagePath,
        lcnum: lcnum
    };

    $.ajax({
        type: 'POST',
        url: isLiked ? '/increaseLikeCount' : '/decreaseLikeCount',
        data: data,
        success: function (response) {
            $('#lkresult').text(response);
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });
}
</script>
<script>
$(document)
.on('click','#btnDel',function(){
	if(!confirm('정말로 삭제하시겠습니까?')) return false;
	
	document.location = '/delete?num='+$('#num').text();
	alert("삭제가 완료되었습니다.");
	return false;
})
.on('click','#btnUd',function(){
	document.location = '/update?num='+$('#num').text();
	return false;
})
.on('click','button[name=btnDel1]',function(){
	if(!confirm('정말로 삭제하시겠습니까?')) return false;
	let cmtnum = $(this).closest('li').find('input[name=cmtnum]').val();
	let bbscmtnum = $(this).closest('li').find('input[name=bbscmtnum]').val();
	console.log(cmtnum, bbscmtnum)
	document.location = '/delete1?num='+cmtnum+"&bbscmtnum="+bbscmtnum;
	alert("삭제가 완료되었습니다.");
	return false;
})

.on('click','button[name=btnUd1]',function(){
 	$(this).closest('li').find('div[name=content]').wrap('<input type=text id=modify value=""></input>');
 	$('#modify').val( $(this).closest('li').find('input[name=content]').val() );
 	$(this).attr("name","ok");
 	$(this).text("완료");

})
.on('click','button[name=ok]',function(){
	$.ajax({url:'/update1', data:{ num : $(this).closest('li').find('input[name=cmtnum]').val(), content : $('#modify').val() }, type:'post', dataType:'text',
		success: function(data) {
			
			document.location = data + "?num=" + $('#num').text();
		}, error:function() {
			
		}
	})
})
</script>
</html>
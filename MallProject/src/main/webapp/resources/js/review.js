$(document)
.ready(function(){
	let star = '';
	let rating = $('input[name=rating]');
	for(let i=0; i<rating.length; i++){
		star = '';
		for(let x=1; x<=parseInt(rating.eq(i).val()); x++){
			star += 	'<div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="star" style="fill: #000000">'
						+'<defs><path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z">'
						+'</path></defs><use xlink:href="#star-full"></use></svg></div>'
		}
		$('div[name=star]').eq(i).html(star);
	}
})
.on('click','#orderByRating',function(){
	$(this).parent().toggleClass("filter_sort_basic__sort_list_item--selected");
	$('#orderByDate').parent().toggleClass("filter_sort_basic__sort_list_item--selected");
	$.ajax({url:"/orderByRating", data:{prod_name : $('#name').val()}, type:'post', dataType:'json',
		success: function(data){
			for(let i = 0; i<data.length; i++) {
				let obj = data[i];
				
				$('h1[name=title]').eq(i).text( obj['title'] );
				$('div[name=created]').eq(i).text( obj['created'] );
				$('div[name=updated]').eq(i).text( obj['updated'] );
				$('b[name=writer]').eq(i).text( obj['writer'] );
				$('div[name=content]').eq(i).text( obj['content'] );
				
				let rating = obj['rating'];
				let star = ''
				for(let i=1; i<=parseInt(rating); i++){
					star += '<div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="star" style="fill: #000000">'
					+'<defs><path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z">'
					+'</path></defs><use xlink:href="#star-full"></use></svg></div>'
				}
				$('div[name=star]').eq(i).html(star);
			}
		}, error: function(){

		}
		})
})
.on('click','#orderByDate',function(){
	$(this).parent().toggleClass("filter_sort_basic__sort_list_item--selected");
	$('#orderByRating').parent().toggleClass("filter_sort_basic__sort_list_item--selected");
})
;
function starRating() {
	let star = ''
	for(let i=1; i<=parseInt(rating); i++){
		star += '<div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="star" style="fill: #000000">'
		+'<defs><path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z">'
		+'</path></defs><use xlink:href="#star-full"></use></svg></div>'
	}
	$('div[name=star]').eq(i).html(star);
}
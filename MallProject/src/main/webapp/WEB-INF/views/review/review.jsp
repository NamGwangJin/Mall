<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="resources/css/star.css" rel="stylesheet"/>
    <title>상품 리뷰</title>
    <link rel="stylesheet" media="all" href="https://assets6.cre.ma/latte/assets/pc/application-1b1a247660c31decc4aafec3560b90f95e92178d97d2a3460879cb5b71bc8a9f.css" />
    <link rel="shortcut icon" type="image/x-icon" href="https://assets.cre.ma/m/favicons/crema/v3/favicon.ico" />
    <style type="text/css">
 
    
    
<style>

body #content {
  background: transparent;
}

span.star, span.camera, .sprite_comment {
  background-image: url(//assets6.cre.ma/p/ptry-co-kr/brand_settings/00/00/00/00/01/sprite/20023ec14bc5450c.png);
}

i.star {
  color: #000000;
}

i.unstar:before {
  color: #000000;
}

  i.star:before {
    content: "\f005";
  }

  i.unstar:before {
    content: "\f006";
  }

.mall-link-color {
  color: #999999;
}

.review_list_v2__see_more_arrow_icon {
  stroke: #999999;
}

.review_popup_form__submit_button,
.reviews_popup_renewal__enter_button,
.review_popup_form__dialog_button {
  background-color: #000;
  color: #ffffff;
}

.products_reviews_summary_v2__create_review_button,
.no_reviews_message_v2__create_review_button,
.review_form__submit {
	background-color: #14161a;
	color: #ffffff;
}

  .products_reviews_summary_v2__score_percentile {
	background-color: #bcc2cc;
}

.products_reviews_summary_v2__score_filter--highlighted .products_reviews_summary_v2__score_percentile {
  background-color: #14161a;
}

</style>
    <style type="text/css">/* 리뷰작성 유도 팝업 버튼 색상 */


/* 리뷰작성 유도 팝업 모서리 각지게 */
.reviews_popup_renewal__container {
  border-radius: 0px
}
/* 폰트 변경 */
* {
  font-family: 'Roboto', 'Noto Sans KR', sans-serif !important;
}
.fa {
  font-family: FontAwesome !important;
}</style>
    <style type="text/css">.score_summary__score_filter__gauge .percentile {
  background: #000;
}

.products_reviews_summary {
  border: 1px solid #000;
  border-left: none;
  border-right: none;
}

.score_summary__average {
  background-color: #fff;
  border: 1px solid #000;
  color: #000;
}

.score_summary__footer .percentage {
  color: #000;
}

.review_options_search__option_type_dropdown_button, .product_options_search__option_type_dropdown_button {
  border-left-color: #000;
}

.review_options_search__option_type, .product_options_search__option_type {
  border-color: #000;
}

.products_reviews_header__separator {
  background: #000;
}

.products_reviews_list_review__info_container li {
  border-top-color: #000;
}

.widget_reviews__body {
  border-bottom-color: #000;
}

.review_options {
  border: 1px solid #000;
  border-left: none;
  border-right: none;
}

.comments {
  border-color: #000;
}

.comments__arrow_top:before {
  border-bottom-color: #000;
}

.comments__new_comment {
  border-color: #000;
}

.comments__new_comment_submit_button {
  border-color: #000;
}

.products_reviews_list_review {
  border-top-color: #000;
}

.pagination__button--active, .pagination__button:active {
  background: #fff;
  border: 1px solid #000;
}</style>

    
    
   <script>
      function fimg(id, w, h) {
        var img = document.getElementById(id);
        if(img && !img.complete) {
          var width = img.width || img.offsetWidth;
          img.style.height = Math.round(img.width / w * h) + "px";
          img.onload = function() {
            this.style.height = "";
          }
        }
      }
    </script>


    <script src="https://cdn.jsdelivr.net/npm/@hackler/javascript-sdk@11.7.1/lib/index.browser.umd.min.js"></script>

      <script>var HACKLE_SDK_KEY = "tRutmpvKV7HkOBqT2WuMKnlghSU8wBzK";</script>

    

    <script>var HACKLE_SDK_KEY = "tRutmpvKV7HkOBqT2WuMKnlghSU8wBzK";</script>
  
  </head>
  <body class="unknown unknown-116 windows_os products reviews ko-KR renewed_widget" lang="ko-KR" data-action="reviews" data-brand-code="http://192.168.0.16:8080/gologin" data-controller="products" data-enable-nonmember-evaluation="true" data-event-base-url="https://events6.cre.ma" data-facebook-app-id="339825122890117" data-facebook-sdk-version="v2.9" data-gaq-account="UA-45818307-11" data-iframe-id="crema-product-reviews-1" data-is-logged-in="false" data-is-refreshable="true" data-loader-url="//assets6.cre.ma/m/widgets/loader.gif" data-login-alert="로그인이 필요한 서비스입니다. 로그인 하시겠습니까?" data-mall-login-url="http://192.168.0.16:8080/gologin" data-no-popstate="false" data-need-ios-video-hack="false" data-parent-url="http://192.168.0.16:8080/" data-rails-env="production" data-redirect-directly-without-close-url="false" data-review-message-all-exposed="false" data-review-message-all-collapsed="false" data-shop-builder="cafe24" data-login-redirect-parameter="" data-widget-custom-width="" data-widget-id="2" data-widget-margin-style="margin-top: 50px; margin-bottom: 50px;" data-widget-renewed="true" data-default-translate-button-status="on" data-use-translate-button="true" data-use-google-translation="true" data-transparent-image-url="//assets6.cre.ma/m/widgets/transparent.png" data-fixed-top-menu-height="0" data-device="pc">
    <div class="navbar">

    <div id="crema-google-translate"></div>
    <div class="watermark"></div>

    <div id="i18n" style="display: none" data-image-size-too-large="첨부한 이미지 파일이 너무 큽니다. 더 작은 이미지를 첨부해주세요." data-close="닫기" data-error-403="접근 권한이 없습니다." data-error-404="요청하신 페이지를 찾을 수 없습니다." data-error-422="요청이 거부되었습니다." data-error-etc="요청을 처리하던 중 오류가 발생했습니다. 조속히 해결하겠습니다." data-image-field-cant-add-photo-without-file-input="파일 선택창이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file-reader="파일 미리 보기가 지원되는 브라우저가 아니어서 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file="선택된 파일이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-with-file-type="선택된 파일이 이미지 형식이 아닙니다. (선택된 형식:%{file_type})" data-image-field-cant-add-photo-with-file-name="이미지 형식의 파일만 첨부할 수 있습니다. (선택된 파일명:%{file_name})" data-app-restrict-image-upload="파일 업로드를 하려면 모바일 기본브라우저에서 쇼핑몰 모바일웹(%{url})으로 접속해주세요." data-review-already-posted="이미 리뷰를 작성한 상품입니다." data-review-already-largest-image="현재 이미지가 원본 크기입니다." data-require-update-app="원활한 사진첨부를 위해서 앱 업데이트가 필요합니다. 업데이트 하시겠습니까?" data-input-prompt="값을 입력해주세요."></div>

    
    <div id="content">
      
      <div class="products_reviews_list">
    <div class="widget_reviews js-pagination-list ">
        
  <div class="widget_header_basic">
  <div class="widget_header_basic__title_container">
    
      <span class="widget_header_basic__title js-translate-text">
        REVIEW
      </span>
    
      <span class="widget_header_basic__reviews_count js-widget-header-basic-reviews-count">
        
      </span>
    
    <div class="widget_header_basic__description">
      <span></span>
    </div>
  </div>
  <div class="widget_header_basic__links_container">
    
      
      
        <a
          data-url="http://192.168.0.16:8080/"
          class="widget_header_basic__link js-link-iframe"
        >
          전체 상품 리뷰 보기
        </a>
      
    
    
  </div>
</div>

<div class="js-renewed-products-reviews-summary">
  
  <div class="
    products_reviews_summary_v2
    
    
  ">
 
    <div class="products_reviews_summary_v2__summary_container">
      <div class="products_reviews_summary_v2__lcontent">
        <div class="products_reviews_summary_v2__score">
          <span class="products_reviews_summary_v2__score_icon"><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div></span>
		
      
          <span class="products_reviews_summary_v2__score_text">
          <c:forEach items="${list}" var="list">
          ${list.rating}
           </c:forEach>
          </span>
             
        </div>
        
          <div class="products_reviews_summary_v2__score_percentage">
            <!-- <b>100%</b>의 구매자가 이 상품을 좋아합니다. -->
          </div>
        	
       
      </div>
      
      <div class="products_reviews_summary_v2__rcontent">
        <ul class="products_reviews_summary_v2__score_filters">
        
            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted">
            
              <div class="products_reviews_summary_v2__score_title">아주 좋아요</div>
              
             <!--  <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: max(100%, 12px)" class="products_reviews_summary_v2__score_percentile"></div>
              </div> -->
              <div class="products_reviews_summary_v2__score_count">
              ★★★★★<br>
              <c:forEach items="${rlist}" var="list">
              	${list.rating}
              </c:forEach>
              </div>
              
            </li>
          
            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted">
              <div class="products_reviews_summary_v2__score_title">맘에 들어요</div>
             <!--  <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: max(0%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
              </div> -->
              <div class="products_reviews_summary_v2__score_count">
              ★★★★<br>
			  <c:forEach items="${rlist}" var="list" >
              	${list.rating}
              </c:forEach>
              </div>
            </li>
          
            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted ">
              <div class="products_reviews_summary_v2__score_title">보통이에요</div>
              <!-- <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: max(0%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
              </div> -->
              <div class="products_reviews_summary_v2__score_count">
              ★★★<br>
               <c:forEach items="${rlist}" var="list">
              	${list.rating}
              </c:forEach>
              </div>
            </li>
          
            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted">
              <div class="products_reviews_summary_v2__score_title">그냥 그래요</div>
            <!--   <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: max(0%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
              </div> -->
              <div class="products_reviews_summary_v2__score_count">
              ★★<br>
               <c:forEach items="${rlist}" var="list">
              	${list.rating}
              </c:forEach>
              </div>
            </li>
          
            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted ">
              <div class="products_reviews_summary_v2__score_title">별로예요</div>
              
             <!--  <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: max(0%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
              </div> -->
              <div class="products_reviews_summary_v2__score_count">
              ★<br>
              <c:forEach items="${rlist}" var="list">
             	${list.rating}
              </c:forEach>
              </div>
              
            </li>
          
        </ul>
        
      </div>
      
    </div>
    
  </div>


</div>
  
  <div class="products_reviews_media_summary">
    <div class="products_reviews_media_summary__header">
      <span class="products_reviews_media_summary__title">
        포토&amp;동영상
      </span>
      <span class="products_reviews_media_summary__media_count">
      </span>
      <a
        data-url="http://192.168.0.16:8080/"
        class="js-link-fullscreen-popup"
      >
        <div class="products_reviews_media_summary__show_all">
          전체보기
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="products_reviews_media_summary__show_all_arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

        </div>
      </a>
    </div>
    <div class="products_reviews_media_summary__content">
      <ul>
        <c:forEach items="${rlist}" var="list">
          <li
            class="
              products_reviews_media_summary__medium
              js-link-fullscreen-popup
            "
            data-url="http://192.168.0.16:8080/product?name=Mini%20Photo%20Card"
          >
            
              <img
                src="img/${list.img}"
                alt="img/${list.img}"
                class="smooth products_reviews_media_summary__thumbnail"
              >
              
            
          </li>
        
        </c:forEach>
      </ul>
    </div>
  </div>


<div class="filter_sort_basic menu">
  <ul class="
    filter_sort_basic__sort_search_list
    filter_sort_basic__sort_search_list--review_searchable
  ">
    <li class="filter_sort_basic__sort">
      
        <ul
  class="filter_sort_basic__sort_list js-review-sort-list"
  data-path="/http://192.168.0.16:8080//products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.http://192.168.0.16:8080/%2Fproduct%2Fdetail.html%3Fproduct_no%3D1363%26cate_no%3D514%26display_group%3D1&amp;product_code=1363&amp;secure_device_token=V24b7eed425d0c6d447490e1b58bbe71ec73c63034843a059c30522bfbc264d48cacb4cd4b1efdf17d240eb1a107524338&amp;widget_env=100&amp;widget_style="
>
  
    <li
      class="
        filter_sort_basic__sort_list_item
        
        js-review-sort-list-item
      "
      data-value="10"
    >
      추천순

      
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘추천순’ 정렬은 쇼핑몰 추천 리뷰와 고객들에게 도움이 많이 된 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
        
      
        
      
        
      
    </li>
  
    <li
      class="
        filter_sort_basic__sort_list_item
        filter_sort_basic__sort_list_item--selected
        js-review-sort-list-item
      "
      data-value="20"
    >
      최신순

      
        
      
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘최신순’ 정렬은 최신 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
        
      
        
      
    </li>
  
    <li
      class="
        filter_sort_basic__sort_list_item
        
        js-review-sort-list-item
      "
      data-value="30"
    >
      별점순

      
        
      
        
      
        
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘별점순’ 정렬은 별점이 높은 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
        
      
    </li>
  
</ul>

      

      <div
  class="dropdown_component filter_sort_basic__sort_dropdown js-dropdown-component"
  data-path="/http://192.168.0.16:8080//products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.http://192.168.0.16:8080/%2Fproduct%2Fdetail.html%3Fproduct_no%3D1363%26cate_no%3D514%26display_group%3D1&amp;product_code=1363&amp;secure_device_token=V24b7eed425d0c6d447490e1b58bbe71ec73c63034843a059c30522bfbc264d48cacb4cd4b1efdf17d240eb1a107524338&amp;widget_env=100&amp;widget_style="
  data-name="sort"
  data-box-offset-x="8"
>
  <div class="
  dropdown_button_component
  js-dropdown-button
">
  
  
    
      최신순
    
  
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    filter_sort_basic__sort_dropdown
    js-dropdown-box
    hidden
  "
  data-dropdown-type="radio"
>
  <div class="dropdown_box_component__item_wrapper">
    
    
    
      

  <div
    data-value="10"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    추천순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="20"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      dropdown_box_component__radio_select_item--selected
    "
  >
    최신순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="30"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    별점순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>


    
  </div>
  
  
    <div class="
      dropdown_box_component__radio_select_item
      dropdown_box_component__radio_select_item--custom
      js-dropdown-box-radio-select-item
    ">
      
  <div class="review_sort_description js-review-sort-description" data-url="/http://192.168.0.16:8080//review_sort_descriptions?media_reviews_first=false&amp;widget_env=100&amp;widget_id=2">
    <div class="review_sort_description__description_container">
      <a>
        <span class="review_sort_description__description">
          리뷰 정렬 기준
        </span>
        <span class="review_sort_description__icon"></span>
      </a>
    </div>
  </div>


    </div>
  
</div>

  </script>
</div>

    </li>
    
      <li class="
        filter_sort_basic__search
        js-filter-search-component
        js-search-toggle
        
      ">
        
          
  <div class="filter_sort_basic__search_input_container">
    
    
    <input
      type="text"
      value=""
      class="
        filter_sort_basic__search_input
        
        js-filter-search-input
      "
      placeholder="리뷰 키워드 검색"
    >
    <button
      class="
        filter_sort_basic__search_close_button
        js-filter-search-input-icon
        js-filter-search-input-reset
        hidden
      "
    >
      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" class="filter_sort_basic__search_input_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M2.207 2.25L15.75 15.793"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M0.5 -0.5L19.652 -0.5" transform="scale(-1 1) rotate(45 -10.966 -18.792)"></path>
</svg>

    </button>
    <a
      data-path="/http://192.168.0.16:8080//products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.http://192.168.0.16:8080/%2Fproduct%2Fdetail.html%3Fproduct_no%3D1363%26cate_no%3D514%26display_group%3D1&amp;product_code=1363&amp;secure_device_token=V24b7eed425d0c6d447490e1b58bbe71ec73c63034843a059c30522bfbc264d48cacb4cd4b1efdf17d240eb1a107524338&amp;widget_env=100&amp;widget_style="
      class="
        filter_sort_basic__search_submit_button
        js-filter-search-input-icon
        js-filter-search-trigger
        
      "
    >
      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="filter_sort_basic__search_input_icon">
    <rect width="10.5" height="10.5" x="2.25" y="2.25" stroke-width="1.5" rx="5.25"></rect>
    <path stroke-width="1.5" d="M11.78 11.47L16.28 15.97"></path>
</svg>

    </a>
  </div>

        
      </li>
    
    
      <li class="filter_sort_basic__show_media_reviews_first">
        
        <a href="/http://192.168.0.16:8080//products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;media_reviews_first=1&amp;parent_url=https%3A%2F%2Fwww.http://192.168.0.16:8080/%2Fproduct%2Fdetail.html%3Fproduct_no%3D1363%26cate_no%3D514%26display_group%3D1&amp;product_code=1363&amp;secure_device_token=V24b7eed425d0c6d447490e1b58bbe71ec73c63034843a059c30522bfbc264d48cacb4cd4b1efdf17d240eb1a107524338&amp;widget_env=100&amp;widget_style=" data-remote="true">
          <div class="
  toggle_button_component
  js-toggle-button-component
  filter_sort_basic__toggle_button
  js-toggle-button
  
">
  
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="toggle_button_component__icon toggle-check-off">
    <rect width="18.5" height="18.5" x="2.75" y="2.75" stroke-width="1.5" rx="9.25"></rect>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 12l4 4 6-7"></path>
</svg>

      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="toggle_button_component__icon toggle-check-on">
    <rect width="12.333" height="12.333" x="1.833" y="1.833" rx="6.167"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M4.667 8l2.666 2.667 4-4.667"></path>
</svg>

    
  <span>포토/동영상 먼저 보기</span>
</div>

        </a>
      </li>
    
  </ul>
  
  <div class="filter_sort_basic__filter_wrapper">
    <ul class="filter_sort_basic__filter_list js-filter-list">
      
        
  

        
  

        
  
    <li class="
      filter_sort_basic__filter
      
    ">
      
      <div class="
  filter_button_component
  
  js-filter-button-component
">
  <div
  class="dropdown_component  js-dropdown-component"
  data-path="/http://192.168.0.16:8080//products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.http://192.168.0.16:8080/%2Fproduct%2Fdetail.html%3Fproduct_no%3D1363%26cate_no%3D514%26display_group%3D1&amp;product_code=1363&amp;secure_device_token=V24b7eed425d0c6d447490e1b58bbe71ec73c63034843a059c30522bfbc264d48cacb4cd4b1efdf17d240eb1a107524338&amp;widget_env=100&amp;widget_style="
  data-name="scores"
  data-box-offset-x=""
>
  <div class="
  dropdown_button_component
  js-dropdown-button
">
  
  
    
      별점
    
  
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    
    js-dropdown-box
    hidden
  "
  data-dropdown-type="score"
>
  <div class="dropdown_box_component__item_wrapper">
    
      <div class="
        dropdown_box_component__title
        
      ">
        별점
      </div>
      <div class="
        dropdown_box_component__reset_button
        js-dropdown-box-reset
      ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="dropdown_box_component__reset_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

        <span class="dropdown_box_component__reset_text">
          초기화
        </span>
      </div>
    
    
    
      
  <div
    data-value="5"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div>
    </div>
    아주 좋아요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="4"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    맘에 들어요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="3"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    보통이에요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="2"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    그냥 그래요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="1"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    별로예요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>


    
  </div>
  
    <div class="dropdown_box_component__footer">
      <div class="
        dropdown_box_component__complete_button
        js-dropdown-box-complete-button
      ">
        <span class="dropdown_box_component__complete_text">완료</span>
      </div>
    </div>
  
  
</div>

  </script>
</div>

</div>

    </li>
  

        
 
    </ul>
      <div class="
        filter_sort_basic__filter_navigator
        filter_sort_basic__filter_navigator--left
        js-filter-navigator-left
      ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="filter_sort_basic__filter_navigator_left_arrow">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 22l10-10L7 2"></path>
</svg>

      </div>
      <div class="
        filter_sort_basic__filter_navigator
        filter_sort_basic__filter_navigator--right
        js-filter-navigator-right
      ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="products_reviews_media_summary__show_all_arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

      </div>
    
    <div class="filter_sort_basic__reset_button_wrapper">
      <button class="filter_sort_basic__reset_button js-filters-reset-button">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="filter_sort_basic__reset_button_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

      </button>
    </div>
  </div>
</div>

<div
  class="
    js-reviews_manager
    reviews_manager_v2
    reviews_manager_v2--right_align
    hidden
  "
>
  
    
    <div class="
  toggle_button_component
  js-toggle-button-component
  js-locale-filter
  js-toggle-button
  
">
  
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="toggle_button_component__icon toggle-check-off">
    <rect width="18.5" height="18.5" x="2.75" y="2.75" stroke-width="1.5" rx="9.25"></rect>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 12l4 4 6-7"></path>
</svg>

      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="toggle_button_component__icon toggle-check-on">
    <rect width="12.333" height="12.333" x="1.833" y="1.833" rx="6.167"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M4.667 8l2.666 2.667 4-4.667"></path>
</svg>

    
  <span>한국어만 보기</span>
</div>

  

  
    <div class="reviews_manager_v2__translation_wrapper js-translation-button">
      
      <div class="
  toggle_button_component
  js-toggle-button-component
  reviews_manager__button
  
  
">
  
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="toggle_button_component__icon toggle-check-off">
    <rect width="18.5" height="18.5" x="2.75" y="2.75" stroke-width="1.5" rx="9.25"></rect>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 12l4 4 6-7"></path>
</svg>

      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="toggle_button_component__icon toggle-check-on">
    <rect width="12.333" height="12.333" x="1.833" y="1.833" rx="6.167"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M4.667 8l2.666 2.667 4-4.667"></path>
</svg>

    
  <span>번역하기</span>
</div>

    </div>
  
</div>


      <div class="widget_reviews__body products_reviews_list__body">
        <div class="page">
  <div class="products_reviews__no_data_message js-renewed-no-data-content hidden">
    <div class="no_reviews_message_v2">
  <div class="no_reviews_message_v2__text">리뷰가 없습니다.<br> <b>리뷰를 작성해 보세요!</b></div>

  
</div>

  </div>
  <ul class="products_reviews__reviews reviews">
  <c:forEach items="${rlist}" var="list">
  
    <li
  class="
    review_list_v2 review_list_v2--collapsed
    renewed_review
    
    js-review-container
  "
  data-message-initial-rows="3"
  data-review-content-height="54"
  data-nonmember-review-check-edit-url="/http://192.168.0.16:8080//nonmember_reviews/edit_popup?id=17863&amp;widget_env=100&amp;widget_id=2"
  data-nonmember-review-check-delete-url="/http://192.168.0.16:8080//nonmember_reviews/delete_popup?id=17863&amp;widget_env=100"
  id="review_17863"
>
	
  <div class="review_list_v2__review_lcontent">
    <div class="review_list_v2__review_container">
      

      <div class="review_list_v2__score_section">
        
          <div class="review_list_v2__score_container">
            <div class="review_list_v2__score_star">
           
              <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="star" style="fill: #000000">
      
     <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
    
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="star" style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="star" style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="star" style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="star" style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg> 
	
</div>
	
			${list.num}
			
</div>
			<span class="visually-hidden">${list.rating}</span>
            </div>
            <div class="review_list_v2__score_text">${list.title}</div>
            
          </div>
        
        <div class="review_list_v2__edit_container">
          
		<div class="review_list_v2__date">${list.created}</div>
         <div class="review_list_v2__date1">${list.updated}</div>
          
        </div>
      </div>
		
      
			
      
      
        <div class="review_list_v2__content_section">
          <div class="review_list_v2__content_container review_content  js-review-content-container">
            <div class="review_list_v2__content review_content__collapsed">
              <div class="review_list_v2__message_container">
                <div class="review_list_v2__expand_link js-renewal-review-message-link js-renewal-link-expand disabled">
                  <div class="review_list_v2__message js-collapsed-review-content js-translate-text" style="max-height: 54px">
                   	<div class="review_list_v2__score_text">${list.content}</div>
                   	
                  </div>
                  <div class="mall-link-color review_list_v2__message_link_button">
                    <span class="review_list_v2__expand_link_text">리뷰 더보기</span>
                    <span class="review_list_v2__expand_icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="review_list_v2__see_more_arrow_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>
</span>
                  </div>
                </div>
              </div>
            </div>

       
          </div>
        </div>
      

      
        <div class="review_list_v2__image_section">
          <div class="review_media_v2">
 		 <ul class="review_media_v2__media">
    

      <li class="review_media_v2__medium">
        <a class="js-link-fullscreen-popup" data-url="img/${list.img}">
        <img src="img/${list.img}" style="width:100px;">
          <div class="
            review_media_v2__medium_container
            
          ">
           
          </div>
          <script>
            fimg('img', function(dw){return (dw - 17) * 0.25 - 8;}, 215, 237);
          </script>
        </a>
      </li>
    
  </ul>
</div>

        </div>
      

      
      

      

      <div class="review_list_v2__like_section">
        


        
          
          <div class="review_list_v2__comments_info">
            <a class="review_list_v2__comments_expand_link js-comments-link">
              
            <span class="review_list_v2__comments_text">댓글</span>
            <span class="review_list_v2__comments_count js-comments-count">1</span>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="review_list_v2__small_arrow_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

          
            </a>
          </div>
        
      </div>

      
        <div class="review_list_v2__comments_container js-review-comments-container">
          <div class="comments_v2 js-comments-container">
  <ul class="comments_v2__comments_list">
    
      <li class="comment_v2" id="comment_1">
  <div class="comment_v2__user_name notranslate" title="운영자">운영자</div>
  <div class="comment_v2__message_container">
    <div class="comment_v2__message js-translate-text">안녕하세요 운영자 입니다.<br><br>고객님께서 만족하셨다니 저희도 기분이 좋습니다!<br><br>이용해 주셔서 감사합니다. 오늘도 행복한 하루 되세요 :)</div>
    
  </div>
  
</li>

    
  </ul>

  <div class="comments_v2__new_comment pc js-comment-form-container js-new-comment">
    <form
      novalidate="novalidate"
      class="comments_v2__new_comment_form"
      data-login-required="true"
      data-enable-user-comments="true"
      data-enable-user-comments-alert="관리자만 댓글을 작성할 수 있습니다."
      action="/http://192.168.0.16:8080//comments?renewed_comments=false&amp;widget_env=100&amp;widget_id=2"
      accept-charset="UTF-8"
      data-remote="true"
      method="post"
    >
      <div class="comments_v2__new_comment_container">
        <input name="utf8" type="hidden" value="✓">
        <input value="17863" type="hidden" name="comment[review_id]">
        <input type="hidden" name="tracking_id">
        <textarea
          name="comment[message]"
          class="comments_v2__new_comment_input js-new-comments-input js-input-block"
          placeholder="댓글을 작성해 주세요."
          rows="1"
          autocomplete="off"
        ></textarea>
        
      </div>
      <div class="comments_v2__new_comment_buttons_container js-new-comment-buttons">
        <span class="comments_v2__new_comment_buttons">
          <button class="comments_v2__cancel_button js-new-comment-cancel" type="button">취소</button>
          <button class="comments_v2__submit_button comment_submit_button">등록</button>
        </span>
      </div>
    </form>
  </div>
</div>

        </div>
      
    </div>
  </div>
  <div class="review_list_v2__review_rcontent">
  <div class="review_list_v2__user_name_message">
        
        <b>${list.writer}</b>님의 리뷰입니다.
      </div>
      </div>
      </c:forEach>
  <div class="review_list_v2__review_separator"></div>
</li>

</ul>
</div>      
<div class="products_reviews__footer">
        <div
  class="
    widget_reviews__footer
  ">
      <div class="pagination">
    <a class="pagination__button pagination__button--prev pagination__button--disabled">&lt;</a>

          <a class="pagination__button pagination__button--active" href="">${pagestr}</a>

          <!-- <a class="pagination__button" data-remote="true" href="">2</a> -->

          <!-- <a class="pagination__button" data-remote="true" href="">3</a>  -->

    <a class="pagination__button pagination__button--next" href="" data-remote="true">&gt;</a>

  </div>


</div>


      </div>
</div>  </div>


    </div>
    

    <script src="https://assets6.cre.ma/latte/assets/pc/application-c3bdd66ec532e67a21be397d6f96ca4552094b06893ea426332c6951aab5d49f.js"></script>
    
    <script>	
      var ajax_setup_args = {cache: true, dataType: "script", accepts: {
        script: "text/javascript, application/javascript"
      }};
      $.ajaxSetup(ajax_setup_args);
      

	</script>

    <form id="form-upload-image" class="hidden" data-type="json" enctype="multipart/form-data" action="/http://192.168.0.16:8080//preview_images/upload?widget_env=100" accept-charset="UTF-8" data-remote="true" method="post">
  <div id="upload-fields-container"></div>
  
  
</form>
</body>

</html>

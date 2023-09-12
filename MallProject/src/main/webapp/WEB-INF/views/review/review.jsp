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
 </head>
 
 <body class="unknown unknown-116 windows_os products reviews ko-KR renewed_widget" lang="ko-KR" data-action="reviews" data-brand-code="http://192.168.0.16:8080/gologin" data-controller="products" data-enable-nonmember-evaluation="true" data-event-base-url="https://events6.cre.ma" data-facebook-app-id="339825122890117" data-facebook-sdk-version="v2.9" data-gaq-account="UA-45818307-11" data-iframe-id="crema-product-reviews-1" data-is-logged-in="false" data-is-refreshable="true" data-loader-url="//assets6.cre.ma/m/widgets/loader.gif" data-login-alert="로그인이 필요한 서비스입니다. 로그인 하시겠습니까?" data-mall-login-url="http://192.168.0.16:8080/gologin" data-no-popstate="false" data-need-ios-video-hack="false" data-parent-url="http://192.168.0.16:8080/" data-rails-env="production" data-redirect-directly-without-close-url="false" data-review-message-all-exposed="false" data-review-message-all-collapsed="false" data-shop-builder="cafe24" data-login-redirect-parameter="" data-widget-custom-width="" data-widget-id="2" data-widget-margin-style="margin-top: 50px; margin-bottom: 50px;" data-widget-renewed="true" data-default-translate-button-status="on" data-use-translate-button="true" data-use-google-translation="true" data-transparent-image-url="//assets6.cre.ma/m/widgets/transparent.png" data-fixed-top-menu-height="0" data-device="pc">
    <div class="navbar">
    	<div id="content">
    		<div class="products_reviews_list">
    			<div class="widget_reviews js-pagination-list ">
  					<div class="widget_header_basic">
						<div class="widget_header_basic__title_container">
    
					      <span class="widget_header_basic__title js-translate-text">
					        REVIEW
					      </span>
    
					      <span class="widget_header_basic__reviews_count js-widget-header-basic-reviews-count">
					        ( ${reviewSize} )
					      </span>
    
						   <div class="widget_header_basic__description">
						      <span>총 리뷰 수</span>
						   </div>
  						</div>
					</div>

					<div class="js-renewed-products-reviews-summary">
  						<div class="products_reviews_summary_v2">
    						<div class="products_reviews_summary_v2__summary_container">
      							<div class="products_reviews_summary_v2__lcontent">
        							<div class="products_reviews_summary_v2__score">
							          <span class="products_reviews_summary_v2__score_icon">
								          <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'>
								          	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
								    		<defs>
										        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
										    </defs>
								    		<use xlink:href="#star-full"></use>
								    		</svg>		
								    	</div>
									</span>
        						  </div>
        						  <c:if test="${ratingAvg == 0}">
        						  <div class="products_reviews_summary_v2__score_percentage">
						            <b>리뷰가 없습니다.</b>
						          </div>
        						  </c:if>
        						  <c:if test="${ratingAvg != 0}">
						          <div class="products_reviews_summary_v2__score_percentage">
						         	<h1>${ratingAvg}</h1>
						            <b>${like}%</b>의 구매자가 이 상품을 좋아합니다.
						          </div>
						         </c:if>
      						</div>

      						<div class="products_reviews_summary_v2__rcontent">
						        <ul class="products_reviews_summary_v2__score_filters">
						        
						            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted">
						            
						              <div class="products_reviews_summary_v2__score_title">아주 좋아요</div>
						              
						              <div class="products_reviews_summary_v2__score_gauge">
						                <div style="width: max(${rating5}%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
						              </div>
						              <div class="products_reviews_summary_v2__score_count">
						              ★★★★★<br>5 (${rating5}%)
						              </div>
						              
						            </li>
						          
						            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted">
						              <div class="products_reviews_summary_v2__score_title">맘에 들어요</div>
						              <div class="products_reviews_summary_v2__score_gauge">
						                <div style="width: max(${rating4}%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
						              </div>
						              <div class="products_reviews_summary_v2__score_count">
						              ★★★★<br>4 (${rating4}%)
						              </div>
						            </li>
						          
						            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted ">
						              <div class="products_reviews_summary_v2__score_title">보통이에요</div>
						              <div class="products_reviews_summary_v2__score_gauge">
						                <div style="width: max(${rating3}%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
						              </div> 
						              <div class="products_reviews_summary_v2__score_count">
						              ★★★<br>3 (${rating3}%)
						              </div>
						            </li>
						          
						            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted">
						              <div class="products_reviews_summary_v2__score_title">그냥 그래요</div>
									 <div class="products_reviews_summary_v2__score_gauge">
						                <div style="width: max(${rating2}%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
						              </div>
						              <div class="products_reviews_summary_v2__score_count">
						              ★★<br>2 (${rating2}%)
						              </div>
						            </li>
						          
						            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted ">
						              <div class="products_reviews_summary_v2__score_title">별로예요</div>
						              
								<div class="products_reviews_summary_v2__score_gauge">
									<div style="width: max(${rating1}%, 0px)" class="products_reviews_summary_v2__score_percentile"></div>
						      	</div>
						              <div class="products_reviews_summary_v2__score_count">
						              ★<br>1 (${rating1}%)
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
        포토
      </span>
      <span class="products_reviews_media_summary__media_count">
      ( ${photoSize} )
      </span>
      <a
        data-url="http://192.168.0.16:8080/"
        class="js-link-fullscreen-popup"
      >
        <div class="products_reviews_media_summary__show_all" id=showAll>
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
        	<c:if test="${list.img != ''}">
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
        	</c:if>
        </c:forEach>
      </ul>
    </div>
  </div>


<div class="filter_sort_basic menu">
  <ul class="filter_sort_basic__sort_search_list filter_sort_basic__sort_search_list--review_searchable">
    <li class="filter_sort_basic__sort">
        <ul class="filter_sort_basic__sort_list js-review-sort-list" data-path="/http://192.168.0.16:8080//products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.http://192.168.0.16:8080/%2Fproduct%2Fdetail.html%3Fproduct_no%3D1363%26cate_no%3D514%26display_group%3D1&amp;product_code=1363&amp;secure_device_token=V24b7eed425d0c6d447490e1b58bbe71ec73c63034843a059c30522bfbc264d48cacb4cd4b1efdf17d240eb1a107524338&amp;widget_env=100&amp;widget_style=">
  
    <li class="filter_sort_basic__sort_list_item filter_sort_basic__sort_list_item--selected js-review-sort-list-item" data-value="20">
      <span id="orderByDate">최신순</span>
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘최신순’ 정렬은 최신 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
    </li>
  
    <li class="filter_sort_basic__sort_list_item js-review-sort-list-item" data-value="30">
     <span id="orderByRating">별점순</span> 
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

      

      <div class="dropdown_component filter_sort_basic__sort_dropdown js-dropdown-component"
  data-path="/http://192.168.0.16:8080//products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.http://192.168.0.16:8080/%2Fproduct%2Fdetail.html%3Fproduct_no%3D1363%26cate_no%3D514%26display_group%3D1&amp;product_code=1363&amp;secure_device_token=V24b7eed425d0c6d447490e1b58bbe71ec73c63034843a059c30522bfbc264d48cacb4cd4b1efdf17d240eb1a107524338&amp;widget_env=100&amp;widget_style="
  data-name="sort"
  data-box-offset-x="8">
  <div class="dropdown_button_component js-dropdown-button">
      최신순
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
	</svg>
	</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script"></script>
    <div
  class="
    dropdown_box_component
    filter_sort_basic__sort_dropdown
    js-dropdown-box
    hidden
  "
  data-dropdown-type="radio">
  <div class="dropdown_box_component__item_wrapper">
  <div
    data-value="10"
    class="dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate"
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
    ">
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
    <span>별점순</span>
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

</div>

    </li>
    
      <li class="
        filter_sort_basic__search
        js-filter-search-component
        js-search-toggle
        
      ">
        
          
  <div class="filter_sort_basic__search_input_container">
    
    
    <input
    	id="keyword"
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
    <a id=search
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
        

          <div class="toggle_button_component js-toggle-button-component
           filter_sort_basic__toggle_button js-toggle-button" id=photo>
  
      <svg id=check xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="toggle_button_component__icon toggle-check-off">
    <rect width="18.5" height="18.5" x="2.75" y="2.75" stroke-width="1.5" rx="9.25"></rect>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 12l4 4 6-7"></path>
</svg>

      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="toggle_button_component__icon toggle-check-on">
    <rect width="12.333" height="12.333" x="1.833" y="1.833" rx="6.167"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M4.667 8l2.666 2.667 4-4.667"></path>
</svg>

    
  <span>포토 먼저 보기</span>
</div>


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
    <div class="reviews_manager_v2__translation_wrapper js-translation-button">
      
      <div class="
  toggle_button_component
  js-toggle-button-component
  reviews_manager__button
  
  
">
  
</div>

    </div>
  
</div>
  </div>
  <ul class="products_reviews__reviews reviews">
    <div name=reviewDiv>
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
		<input type=hidden value="${list.rating}" name=rating>
           <div class="review_list_v2__score_star" name=star>

		</div>
		
</div><br>
            <div class="review_list_v2__score_text"><h1 name=title>${list.title}</h1></div>
            
          </div>
        
        <div class="review_list_v2__edit_container">

		<div class="review_list_v2__date" name=created><h1>${list.created}</h1></div>
         <div class="review_list_v2__date1" name=updated><h1>${list.updated}</h1></div>
               <div class="review_list_v2__user_name_message">  
     			<b name=writer>${list.writer}</b>님의 리뷰입니다.
  			</div>
        </div>
      </div>
<%--       <input type=hidden name=imgCheck value="${list.img}"> --%>
<!--       	<div name=imgDiv> -->
	  <div name=imgDiv>
      	<c:if test="${list.img != '' }">
		    <div class="review_list_v2__image_section">
		      <div class="review_media_v2">
		 		 <ul class="review_media_v2__media">
				      <li class="review_media_v2__medium">
				        <img name=img src="img/${list.img}" style="width:100px;">
				      </li>
		 	 	</ul>
			</div>
		   </div>
		  </c:if>
		</div>
<!-- 		 </div> -->
        <div class="review_list_v2__content_section">
          <div class="review_list_v2__content_container review_content  js-review-content-container">
            <div class="review_list_v2__content review_content__collapsed">
              <div class="review_list_v2__message_container">
                <div class="review_list_v2__expand_link js-renewal-review-message-link js-renewal-link-expand disabled">
                  <div class="review_list_v2__message js-collapsed-review-content js-translate-text" style="max-height: 54px">
                   	<div class="review_list_v2__score_text" name=content>${list.content}</div>
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
  </div>
 </li>
</c:forEach>
 </div>
    </div>
  </div>
   <div class="pagination" style="text-align:center;">

    <a class="pagination__button pagination__button--prev pagination__button--disabled">&lt;</a>

           <a class="pagination__button pagination__button--active" href="">${pagestr}</a> 

    <a class="pagination__button pagination__button--next" href="" data-remote="true">&gt;</a>

</div>
  <div class="review_list_v2__review_rcontent">
  </div>
  <div class="review_list_v2__review_separator">

  </div>
     
	<div class="products_reviews__footer">
   	<div class="widget_reviews__footer"></div>
	</div>
</div> 
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/review.js"></script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>neocom</title>
	<!-- SEO Meta Tags-->
	<meta name="description" content="Unishop - Universal E-Commerce Template">
	<meta name="keywords" content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
	<meta name="author" content="Rokaux">
	<!-- Favicon and Apple Icons-->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.ico">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.png">
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone.png">
	<link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad.png">
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone-retina.png">
	<link rel="apple-touch-icon" sizes="167x167" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad-retina.png">
	<!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
	<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
	<!-- Main Template Styles-->
	<link id="mainStyles" rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
	<!-- Modernizr-->
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>상품디테일</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Shop</a></li>
				<li class="separator">&nbsp;</li>
				<li>Product Detail</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->

<div class="container padding-bottom-3x">
<div class="row">
	<!-- 상품이미지 -->
	
	<div class="col-md-6">
		<div class="product-gallery">
			<div class="gallery-wrapper">
				<div class="gallery-item video-btn text-center">
					<button class="btn btn-outline-secondary btn-sm btn-wishlist"><i class="icon-heart"></i>&nbsp; 관심상품</button>
				</div>
			</div>
			
			<div class="product-carousel owl-carousel gallery-wrapper">
			
				<div class="gallery-item" data-hash="one">
					<a href="${pageContext.request.contextPath}/static/frontend/assets/img/shop/single/01.jpg" data-size="1000x667"><img src="<c:url value='/upload/${list[0].img_name_save}' />" alt="<c:url value='/upload/${img.img_name_save}' />"/></a>
				</div>
				
			
				
			</div>
			
			
		</div>
	</div>
	<!-- 상품정보 -->
	<div class="col-md-6"> 
		<div class="padding-top-2x mt-2 hidden-md-up"></div>
		<div class="sp-categories pb-3">
			<i class="icon-tag"></i>상품분류
		</div>
		<h2 class="mb-3">${goods.product_name }</h2>
		<span class="h3 d-block"><del class="text-muted"><fmt:formatNumber pattern="###,###,###" value="${goods.selling_price }"/>원</del>&nbsp; 할인가</span>
		<p class="text-muted">////////////// 상품정보 간단하게 요약해서 두 줄 정도로 요약 //////////////</p>
		<div class="row margin-top-2x">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="productColor" style="font-size:15px;">색상</label>
					<select class="form-control" id="productColor">
						<option>색상1</option>
						<option>색상2</option>
					</select>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="spec" style="font-size:15px;">제품사양</label>
					<select class="form-control" id="spec">
						<option>옵션1</option>
						<option>옵션2</option>
						<option>옵션3</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row align-items-end pb-4">
			<div class="col-sm-6">
				<div class="form-group mb-0">
					<label for="quantity" style="font-size:15px;">수량</label>
					<input type="number" class="form-control" id="quantity" value="1" min="1" max="100">
				</div>
			</div>
		</div>
		<div class="mb-4"></div>
		<div class="row">
			<div class="col-sm-6">
				<button class="btn btn-primary btn-block m-1">구매하기</button>
			</div>
			<div class="col-sm-6">
				<button class="btn btn-secondary btn-block m-1">장바구니</button>
			</div>
		</div>
		<div class="pt-1 mb-4"></div>
		<hr class="mb-2">
		<div class="d-flex flex-wrap justify-content-between"></div>
	</div>
</div>
</div>


<!-- 상품설명 -->
<div class="bg-secondary padding-top-3x padding-bottom-2x mb-3" id="details">
<div class="container">
<div class="row">
	<div class="col-md-11">
		<h3 class="h4">상품정보</h3>
		
		<img src="<c:url value='/upload/${list[1].img_name_save}' />" alt="<c:url value='/upload/${img.img_name_save}' />"/>
	</div>
	
</div>
</div>
</div>

<!-- 상품리뷰 -->
<div class="container padding-top-2x">
<div class="row">
<div class="col-md-4 mb-4">
	<div class="card border-default">
		<div class="card-body">
			<div class="text-center">
				<div class="d-inline align-baseline display-3 mr-1">4.0</div>
				<div class="d-inline align-baseline text-sm text-warning mr-1">
					<div class="rating-stars">
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star"></i>
					</div>
				</div>
			</div>
			<div class="pt-3">
				<!-- 5점 -->
				<label class="text-medium text-sm">5stars <span class="text-muted"> --- 20</span></label>
				<div class="progress margin-bottom-1x">
					<div class="progress-bar bg-warning" role="progressbar" style="width:70%; height:2px;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<!-- 4점 -->
				<label class="text-medium text-sm">4stars <span class="text-muted"> --- 14</span></label>
				<div class="progress margin-bottom-1x">
					<div class="progress-bar bg-warning" role="progressbar" style="width:20%; height:2px;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<!-- 3점 -->
				<label class="text-medium text-sm">3stars <span class="text-muted"> --- 10</span></label>
				<div class="progress margin-bottom-1x">
					<div class="progress-bar bg-warning" role="progressbar" style="width:7%; height:2px;" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<!-- 2점 -->
				<label class="text-medium text-sm">2stars <span class="text-muted"> --- 8</span></label>
				<div class="progress margin-bottom-1x">
					<div class="progress-bar bg-warning" role="progressbar" style="width:3%; height:2px;" aria-valuenow="3" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
				<!-- 1점 -->
				<label class="text-medium text-sm">1stars <span class="text-muted"> --- 2</span></label>
				<div class="progress mb-2">
					<div class="progress-bar bg-warning" role="progressbar" style="width:0%; height:2px;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
				</div>
			</div>
			<div class="pt-2">
				<a class="btn btn-warning btn-block" href="#">후기 남기기</a>
			</div>
		</div>
	</div>
</div>

<div class="col-md-8">
	<h3 class="padding-bottom-1x">최신 후기</h3>
	<div class="comment">
		<div class="comment-author-ava"></div>
		<div class="comment-body">
			<div class="comment-header d-flex flex-wrap justify-content-between">
				<h4 class="comment-title">후기1........</h4>
				<div class="mb-2">
					<div class="rating-stars">
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star"></i>
					</div>
				</div>
			</div>
			<p class="comment-text"></p>
			<div class="comment-footer"><span class="comment-meta">작성자</span></div>
		</div>
	</div>
	<div class="comment">
		<div class="comment-author-ava"></div>
		<div class="comment-body">
			<div class="comment-header d-flex flex-wrap justify-content-between">
				<h4 class="comment-title">후기2........</h4>
				<div class="mb-2">
					<div class="rating-stars">
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star filled"></i>
						<i class="icon-star"></i>
					</div>
				</div>
			</div>
			<p class="comment-text"></p>
			<div class="comment-footer"><span class="comment-meta">작성자</span></div>
		</div>
	</div>
	<a class="btn btn-secondary btn-block" href="#">더보기</a>
</div>
</div>
</div>
<div class="mb-4"></div>
<!-- 페이지 컨텐트 끝 -->


<!-- footer -->
<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp"/>

	<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
</body>
</html>
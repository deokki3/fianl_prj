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
<meta name="description"
	content="Unishop - Universal E-Commerce Template">
<meta name="keywords"
	content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
<meta name="author" content="Rokaux">
<!-- Favicon and Apple Icons-->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.ico">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.png">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="167x167"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad-retina.png">
<!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
<!-- Main Template Styles-->
<link id="mainStyles" rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
<!-- Modernizr-->
<script
	src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
</head>
<body>

	<!-- header -->

	<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp" />


	<!-- 메인 슬라이더 -->
	<section class="hero-slider"
		style="background-image: url(${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/main-bg.jpg);">
		<div class="owl-carousel large-controls dots-inside"
			data-owl-carousel="{ &quot;nav&quot;: true, &quot;dots&quot;: true, &quot;loop&quot;: true, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 5000 }">
			<div class="item">
				<div class="container padding-top-3x">
					<div class="row justify-content-center align-items-center">
						<div
							class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center">
							<!-- 제품 브랜드 로고 이미지 여기 -->
							<div class="from-bottom">
								<img class="d-inline-block w-150 mb-4"
									src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/sony-logo.png"
									alt="">
								<div class="h2 text-body mb-2 pt-1">제품명 여기</div>
								<div class="h2 text-body mb-4 pb-1">
									최저가 <span class="text-medium">100,000 원</span>
								</div>
							</div>
							<a class="btn btn-primary scale-up delay-1" href="#">제품
								보러가기&nbsp;<i class="icon-arrow-right"></i>
							</a>
						</div>
						<!-- 슬라이더 전체이미지 여기 -->
						<div class="col-md-6 padding-bottom-2x mb-3">
							<img class="d-block mx-auto"
								src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/sony-headphone-iu4.jpg"
								alt="">
						</div>
					</div> 
				</div>
			</div>
			<div class="item">
				<div class="container padding-top-3x">
					<div class="row justify-content-center align-items-center">
						<div
							class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center">
							<!-- 제품 브랜드 로고 이미지 여기 -->
							<div class="from-bottom">
								<img class="d-inline-block w-150 mb-4"
									src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/sony-logo.png"
									alt="">
								<div class="h2 text-body mb-2 pt-1">제품명 여기</div>
								<div class="h2 text-body mb-4 pb-1">
									최저가 <span class="text-medium">100,000 원</span>
								</div>
							</div>
							<a class="btn btn-primary scale-up delay-1" href="#">제품
								보러가기&nbsp;<i class="icon-arrow-right"></i>
							</a>
						</div>
						<!-- 슬라이더 전체이미지 여기 -->
						<div class="col-md-6 padding-bottom-2x mb-3">
							<img class="d-block mx-auto"
								src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/sony-headphone-iu1.jpg"
								alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="container padding-top-3x">
					<div class="row justify-content-center align-items-center">
						<div
							class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center">
							<!-- 제품 브랜드 로고 이미지 여기 -->
							<div class="from-bottom">
								<img class="d-inline-block w-150 mb-4"
									src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/sony-logo.png"
									alt="">
								<div class="h2 text-body mb-2 pt-1">제품명 여기</div>
								<div class="h2 text-body mb-4 pb-1">
									최저가 <span class="text-medium">100,000 원</span>
								</div>
							</div>
							<a class="btn btn-primary scale-up delay-1" href="#">제품
								보러가기&nbsp;<i class="icon-arrow-right"></i>
							</a>
						</div>
						<!-- 슬라이더 전체이미지 여기 -->
						<div class="col-md-6 padding-bottom-2x mb-3">
							<img class="d-block mx-auto"
								src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/sony-headphone-iu2.jpg"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 메인 슬라이더 끝 -->


	<!-- deals 
<section class="container padding-top-3x">

</section>
 deals 끝 -->


	<!-- New Arrivals -->

	<section class="container padding-top-3x padding-bottom-2x mb-2">
		<h2 class="h3 pb-3 text-center">New Arrivals</h2>
		<div class="row">
			<c:forEach var="vo" items="${list }">
				
		<div class="col-lg-3 col-md-4 col-sm-6">
			<div class="product-card mb-30">
				<a class="product-thumb" href="${pageContext.request.contextPath}/shop/product_detail?n=${vo.product_id}">
				
				<img src="<c:url value='/upload/${vo.img_name_save}' />" alt="<c:url value='/upload/${vo.img_name_save}' />" />
				</a>
				<div class="product-card-body">
					<div class="product-category">
						<a href="#">${vo.brand }</a>
					</div>
					<h3 class="product-title">
						<a href="#">${vo.product_name }</a>
						
					</h3>
					<h4 class="product-price"><fmt:formatNumber pattern="###,###,###" value="${vo.selling_price }"/>원</h4>
				</div>
				<div class="product-button-group">
					<a class="product-button btn-wishlist" href="#"><i
						class="icon-heart"></i><span>관심상품</span></a> <a class="product-button"
						href="#" data-toast data-toast-type="success"
						data-toast-position="topRight" data-toast-icon="icon-check-circle"
						data-toast-title=" " data-toast-message="장바구니에 상품을 담았습니다!"> <i
						class="icon-shopping-cart"></i><span>장바구니</span>
					</a>
				</div>
			</div>
		</div>
		</c:forEach>
		</div>
		<div class="text-center">
			<a class="btn btn-outline-secondary" href="#">신상품 보러가기</a>
		</div>
	</section>



	<!-- 쇼핑몰 서비스 -->
	<section class="container padding-top-3x padding-bottom-2x">
		<div class="row">
			<div class="col-md-4 col-sm-6 text-center mb-30">
				<a href="#"><img
					class="d-block w-90 img-thumbnail rounded mx-auto mb-4"
					src="${pageContext.request.contextPath}/static/frontend/assets/img/services/02.png"
					alt=""></a>
				<h6 class="mb-2">교환/환불</h6>
			</div>
			<div class="col-md-4 col-sm-6 text-center mb-30">
				<a href="#"><img
					class="d-block w-90 img-thumbnail rounded mx-auto mb-4"
					src="${pageContext.request.contextPath}/static/frontend/assets/img/services/03.png"
					alt=""></a>
				<h6 class="mb-2">고객센터</h6>
			</div>
			<div class="col-md-4 col-sm-6 text-center mb-30">
				<a href="#"><img
					class="d-block w-90 img-thumbnail rounded mx-auto mb-4"
					src="${pageContext.request.contextPath}/static/frontend/assets/img/services/04.png"
					alt=""></a>
				<h6 class="mb-2">결제</h6>
			</div>
		</div>
	</section>
	<!-- 쇼핑몰 서비스 끝 -->


	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp" />


	<!-- Back To Top Button-->
	<a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script
		src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1>네오컴 소개</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">About Us</a></li>
				<li class="separator">&nbsp;</li>
				<li>Introduce</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-2x mb-2">
	<div class="row align-items-center padding-bottom-2x">
		<div class="col-md-5">
			<img class="d-block m-auto img-thumbnail" src="${pageContext.request.contextPath}/static/frontend/assets/img/banners/introduction1.png" alt="e-commerce">
		</div>
		<div class="col-md-7 text-md-left text-center">
			<div class="mt-30 hidden-md-up"></div>
			<h2>다양한 컴퓨터 용품을 한 곳에 모아</h2>
			<p class="text-muted">
				양질의 쇼핑정보를 제공하여 소비자의 구매결정을 돕고, 다양한 커뮤니티를 통해 <br> 
				소비자로 하여금 자발적으로 정보와 토론의 장을 형성하게 하며 <br>
				알찬 쇼핑 콘텐츠와 서비스 제공을 통한 고객 만족을 가장 큰 목표로 하고있습니다.
			</p>
			<a class="text-decoration-none" href="${pageContext.request.contextPath }/shop/product_grid?category_id=20000">상품 보러가기 &nbsp;
				<i class="icon-arrow-right d-inline-block align-middle"></i>
			</a>
		</div>
	</div>
	<hr>
	<div class="row align-items-center padding-top-2x padding-bottom-2x">
		<div class="col-md-5 order-md-2">
			<img class="d-block m-auto img-thumbnail" src="${pageContext.request.contextPath}/static/frontend/assets/img/banners/introduction2.png" alt="advice">
		</div>
		<div class="col-md-7 order-md-1 text-md-left text-center">
			<div class="mt-30 hidden-md-up"></div>
			<h2>나만의 PC를 구성하는 가장 쉬운 방법! <br> PC 견적에서 결제까지 간편하게!</h2>
			<p class="text-muted"></p>
			<a class="text-decoration-none" href="${pageContext.request.contextPath }/service/advboard_list">견적 문의하기 &nbsp;
				<i class="icon-arrow-right d-inline-block align-middle"></i>
			</a>
		</div>
	</div>
	<hr>
	<div class="row align-items-center padding-top-2x padding-bottom-2x">
		<div class="col-md-5">
			<img class="d-block m-auto img-thumbnail" src="${pageContext.request.contextPath}/static/frontend/assets/img/banners/introduction3.png" alt="community">
		</div>
		<div class="col-md-7 text-md-left text-center">
			<div class="mt-30 hidden-md-up"></div>
			<h2>컴퓨터에 관심이 많은 수많은 회원들이 모여 <br> 양질의 PC 구매정보를 공유하는 커뮤니티</h2>
			<p class="text-muted"></p>
			<a class="text-decoration-none" href="${pageContext.request.contextPath }/community/freeboard_list">커뮤니티 가기 &nbsp;
				<i class="icon-arrow-right d-inline-block align-middle"></i>
			</a>
		</div>
	</div>

	<hr>
	<div class="text-center padding-top-3x mb-30">
		<h2 class="mb-3">Team. 네오컴</h2>
		<p class="text-muted">고객 만족을 위해 최선을 다하겠습니다.</p>
	</div>
	<div class="row">
		<div class="col-md-4 col-sm-6 mb-30 text-center">
			<img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2" src="${pageContext.request.contextPath}/static/frontend/assets/img/team/01.jpg" alt="">
			<h6>오문형</h6>
			<p class="text-muted mb-2">Neocom</p>
		<!--<div class="social-bar">
				<a class="social-button shape-circle sb-facebook" href="#" data-toggle="tooltip" data-placement="top" title="Facebook">
					<i class="socicon-facebook"></i>
				</a>
				<a class="social-button shape-circle sb-twitter" href="#" data-toggle="tooltip" data-placement="top" title="Twitter">
					<i class="socicon-twitter"></i>
				</a>
				<a class="social-button shape-circle sb-google-plus" href="#" data-toggle="tooltip" data-placement="top" title="Google +">
					<i class="socicon-googleplus"></i>
				</a>
			</div> -->
		</div>
		<div class="col-md-4 col-sm-6 mb-30 text-center">
			<img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2" src="${pageContext.request.contextPath}/static/frontend/assets/img/team/02.jpg" alt="">
			<h6>김동찬</h6>
			<p class="text-muted mb-2">Neocom</p>
		<!--<div class="social-bar">
				<a class="social-button shape-circle sb-skype" href="#" data-toggle="tooltip" data-placement="top" title="Skype">
					<i class="socicon-skype"></i>
				</a>
				<a class="social-button shape-circle sb-facebook" href="#" data-toggle="tooltip" data-placement="top" title="Facebook">
					<i class="socicon-facebook"></i>
				</a>
				<a class="social-button shape-circle sb-paypal" href="#" data-toggle="tooltip" data-placement="top" title="PayPal">
					<i class="socicon-paypal"></i>
				</a>
			</div> -->
		</div>
		<div class="col-md-4 col-sm-6 mb-30 text-center">
			<img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2" src="${pageContext.request.contextPath}/static/frontend/assets/img/team/03.jpg" alt="">
			<h6>나세곤</h6>
			<p class="text-muted mb-2">Neocom</p>
		<!--<div class="social-bar">
				<a class="social-button shape-circle sb-twitter" href="#" data-toggle="tooltip" data-placement="top" title="Twitter">
					<i class="socicon-twitter"></i>
				</a>
				<a class="social-button shape-circle sb-google-plus" href="#" data-toggle="tooltip" data-placement="top" title="Google +">
					<i class="socicon-googleplus"></i>
				</a>
				<a class="social-button shape-circle sb-email" href="#" data-toggle="tooltip" data-placement="top" title="Email">
					<i class="socicon-mail"></i>
				</a>
			</div> -->
		</div>
		<div class="col-md-4 col-sm-6 mb-30 text-center">
			<img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2" src="${pageContext.request.contextPath}/static/frontend/assets/img/team/04.jpg" alt="">
			<h6>박덕기</h6>
			<p class="text-muted mb-2">Neocom</p>
		<!--<div class="social-bar">
				<a class="social-button shape-circle sb-behance" href="#" data-toggle="tooltip" data-placement="top" title="Behance">
					<i class="socicon-behance"></i>
				</a>
				<a class="social-button shape-circle sb-dribbble" href="#" data-toggle="tooltip" data-placement="top" title="Dribbble">
					<i class="socicon-dribbble"></i>
				</a>
				<a class="social-button shape-circle sb-instagram" href="#" data-toggle="tooltip" data-placement="top" title="Instagram">
					<i class="socicon-instagram"></i>
				</a>
			</div> -->
		</div>
		<div class="col-md-4 col-sm-6 mb-30 text-center">
			<img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2" src="${pageContext.request.contextPath}/static/frontend/assets/img/team/05.jpg" alt="">
			<h6>윤인용</h6>
			<p class="text-muted mb-2">Neocom</p>
		<!--<div class="social-bar">
				<a class="social-button shape-circle sb-behance" href="#" data-toggle="tooltip" data-placement="top" title="Behance">
					<i class="socicon-behance"></i>
				</a>
				<a class="social-button shape-circle sb-dribbble" href="#" data-toggle="tooltip" data-placement="top" title="Dribbble">
					<i class="socicon-dribbble"></i>
				</a>
				<a class="social-button shape-circle sb-instagram" href="#" data-toggle="tooltip" data-placement="top" title="Instagram">
					<i class="socicon-instagram"></i>
				</a>
			</div> -->
		</div>
		<div class="col-md-4 col-sm-6 mb-30 text-center">
			<img class="d-block w-150 mx-auto img-thumbnail rounded-circle mb-2" src="${pageContext.request.contextPath}/static/frontend/assets/img/team/05.jpg" alt="">
			<h6>최원빈</h6>
			<p class="text-muted mb-2">Neocom</p>
		<!--<div class="social-bar">
				<a class="social-button shape-circle sb-behance" href="#" data-toggle="tooltip" data-placement="top" title="Behance">
					<i class="socicon-behance"></i>
				</a>
				<a class="social-button shape-circle sb-dribbble" href="#" data-toggle="tooltip" data-placement="top" title="Dribbble">
					<i class="socicon-dribbble"></i>
				</a>
				<a class="social-button shape-circle sb-instagram" href="#" data-toggle="tooltip" data-placement="top" title="Instagram">
					<i class="socicon-instagram"></i>
				</a>
			</div> -->
		</div>
	</div>
</div>
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
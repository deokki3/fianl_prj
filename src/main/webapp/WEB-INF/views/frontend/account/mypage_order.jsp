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
<style>
.table tbody tr td {
	height: 100px;
	vertical-align: middle;
}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>마이페이지</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li>My Page</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
<div class="row">
	<!-- 마이페이지 사이드바 -->
	<div class="col-lg-3">
		<aside class="user-info-wrapper">
			<div class="user-cover" style="background-image: url(${pageContext.request.contextPath}/static/frontend/assets/img/account/user-cover-img.jpg);">
				<!-- 뱃지 -->
			</div>
			<div class="user-info">
				<!-- 프로필이미지 부분 
				<div class="user-avatar">
					<a class="edit-avatar" href="#"></a><img src="" alt="">
				</div>
				프로필이미지 부분 -->
				<div class="user-data">
					<h4 class="h5">OOO 회원님</h4><span>가나다라마바사</span>
				</div>
			</div>
		</aside>
		<nav class="list-group">
			<a class="list-group-item with-badge active" href="${pageContext.request.contextPath }/account/mypage_order">주문내역</a>
			<a class="list-group-item" href="${pageContext.request.contextPath }/account/mypage_delivery">배송지 관리</a>
			<a class="list-group-item" href="#">문의내역</a>
			<a class="list-group-item" href="#">관심상품</a>
			<a class="list-group-item" href="#">나의 리뷰</a>
			<a class="list-group-item" href="#">개인 정보 관리</a>
		</nav>
	</div>
	
	<!-- 주문내역 -->
	<div class="col-lg-9 col-md-8 order-md-2">
		<h6 class="text-muted text-lg text-uppercase">주문내역</h6>
		<hr class="margin-bottom-1x">
		<div class="table-responsive wishlist-table mb-0">
			<table class="table">
				<thead>
					<tr>
						<th>주문번호</th>
						<th class="text-center"><a class="btn btn-sm btn-outline-info" href="#">상세보기</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<div class="product-item"><a class="product-thumb" href="#"><img src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/cart/01.jpg" alt=""></a>
							<div class="product-info">
							<h4 class="product-title"><a href="#">상품명</a></h4>
								<div class="text-lg mb-1">가격</div>
									<div class="text-sm">개수 :
										<div class="d-inline">1</div>
									</div>
								</div>
							</div>
						</td>
						<td class="text-center"><button class="btn btn-link-secondary">후기작성</button></td>
					</tr>
					<tr>
						<td>
						<div class="product-item"><a class="product-thumb" href="#"><img src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/cart/02.jpg" alt=""></a>
							<div class="product-info">
							<h4 class="product-title"><a href="#">상품명</a></h4>
								<div class="text-lg mb-1">가격</div>
									<div class="text-sm">개수 :
										<div class="d-inline">1</div>
									</div>
								</div>
							</div>
						</td>
						<td class="text-center"><button class="btn btn-link-secondary">후기작성</button></td>
					</tr>
					<tr>
						<td>
						<div class="product-item"><a class="product-thumb" href="#"><img src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/cart/03.jpg" alt=""></a>
							<div class="product-info">
							<h4 class="product-title"><a href="#">상품명</a></h4>
								<div class="text-lg mb-1">가격</div>
									<div class="text-sm">개수 :
										<div class="d-inline">1</div>
									</div>
								</div>
							</div>
						</td>
						<td class="text-center"><button class="btn btn-link-secondary">후기작성</button></td>
					</tr>
				</tbody>
			</table>
		</div>
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
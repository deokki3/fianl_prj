<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.table-responsive a {width:120px;}
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
	<!-- mypage_sidebar -->
	<jsp:include page="/WEB-INF/views/frontend/account/inc/mypage_sidebar.jsp"/>
	
	<!-- 주문내역 -->
	<div class="col-lg-9 col-md-8 order-md-2">
		<h6 class="text-muted text-lg text-uppercase">주문내역</h6>
		<hr class="margin-bottom-1x">
		<div class="table-responsive wishlist-table mb-0">
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">주문번호</th>
						<th class="text-center">이미지</th>
						<th class="text-center">주문상품</th>
						<th class="text-center">주문일시</th>
						<th class="text-center">주문금액</th>
						<th class="text-center">상태</th>
						<th class="text-center"></th>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="vo" items="${myOrderList }">
				   	
						<tr>
											<td class="text-center text-lg">${vo.order_no }</td>
								<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/${vo.img_name_save}' />" alt="<c:url value='/upload/product_img/${vo.img_name_save}' />" /></td>
								<td class="text-center text-lg">${vo.product_name }</td>
								<td class="text-center text-lg">${vo.order_date }</td>
								<td class="text-center text-lg">${vo.tot_price }</td>
								<td class="text-center text-lg">${vo.order_status }</td>
								<c:if test="${vo.order_status !='배송 완료'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>배송조회</a>
										<a class="btn btn-sm btn-outline-info" href="#">주문취소</a></td>
									<td class="text-center text-lg"></td>
									
								</c:if>
								<c:if test="${vo.order_status =='배송 완료'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>배송조회</a>
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>교환,반품 신청</a>
										<a class="btn btn-sm btn-outline-success" href="#">후기 작성하기</a></td>
									<td class="text-center text-lg"></td>
								</c:if>

						</tr>
					
					</c:forEach>
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
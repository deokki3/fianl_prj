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
.table {
	margin-left:auto;
	margin-right:auto;
}
.table tbody tr td{
	height:60px;
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
			<h1>공지사항</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Community</a></li>
				<li class="separator">&nbsp;</li>
				<li>Notice Board</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
<div class="row">
	<!-- 커뮤니티 사이드바 
	<div class="col-lg-2">
		<nav class="list-group">
			<a class="list-group-item with-badge active" href="${pageContext.request.contextPath }/community/notice_board">공지사항</a>
			<a class="list-group-item" href="#">자유게시판</a>
			<a class="list-group-item" href="#">Q&A</a>
			<a class="list-group-item" href="#">갤러리</a>
		</nav>
	</div>
	 커뮤니티 사이드바 끝 -->
	
	<!-- 공지사항 테이블 -->
	<div class="col-lg-12 col-md-10 order-md-2 text-center">
		<hr class="margin-bottom-1x">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width:100px;">#</th>
						<th>컬럼명</th>
						<th>컬럼명</th>
						<th>컬럼명</th>
						<th>컬럼명</th>
					</tr>
				</thead>
				<tbody>
					<!-- forEach 구문 시작 라인 -->
					<tr>
						<td>1</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>2</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>3</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>4</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>5</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>6</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>7</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>8</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>9</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
					</tr>
					<tr>
						<td>10</td>
						<td>데이터1</td>
						<td>데이터2</td>
						<td>데이터3</td>
						<td>데이터4</td>
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
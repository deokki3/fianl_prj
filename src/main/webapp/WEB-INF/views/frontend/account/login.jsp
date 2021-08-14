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
			<h1>로그인</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li>Login</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<form class="card" method="post">
				<div class="card-body">
					<div class="row margin-bottom-1x">
						<div class="col-xl-4 col-md-6 col-sm-4">
							<a class="btn btn-sm btn-block facebook-btn" href="#">
								<i class="socicon-facebook"></i>&nbsp; Facebook login
							</a>
						</div>
						<div class="col-xl-4 col-md-6 col-sm-4">
							<a class="btn btn-sm btn-block google-btn" href="#">
								<i class="socicon-google"></i>&nbsp; Google login
							</a>
						</div>
						<div class="col-xl-4 col-md-6 col-sm-4">
							<a class="btn btn-sm btn-block google-btn" href="#">
								<i class="socicon-googleplus"></i>&nbsp; Google+ login
							</a>
						</div>
					</div>
					<h4 class="margin-bottom-1x text-center">로그인 하기</h4>
					<div class="form-group input-group">
						<input class="form-control" type="text" name="id" placeholder="id" required>
					</div>
					<div class="form-group input-group">
						<input class="form-control" type="password" name="pwd" placeholder="pwd" required>
					</div>
					
					 <div class="d-flex flex-wrap justify-content-between padding-bottom-1x">
						<!-- 로그인 이력 저장 기능 구현하면 넣고 아니면 빼기 -->
						<div class="custom-control custom-checkbox">
							<input class="custom-control-input" type="checkbox" id="remember_login">
							<label class="custom-control-label" for="remember_login">로그인 저장</label>
						</div>
						<!-- 아이디/비밀번호 찾기 -->
						<a class="navi-link" href="#">아이디/비밀번호 찾기</a>
					</div>
					<div class="text-center text-sm-right">
						<button class="btn btn-primary margin-bottom-none" type="submit">로그인</button>
							<div style='color:red;'>${errMsg }</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-3"></div>
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
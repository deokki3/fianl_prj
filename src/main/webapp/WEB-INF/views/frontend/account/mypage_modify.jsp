
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
.form-control,.card-body {
	width: 600px;
	margin: auto;
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
	<!-- mypage_sidebar -->
	<jsp:include page="/WEB-INF/views/frontend/account/inc/mypage_sidebar.jsp"/>
	
	<!-- 나의정보수정 여기서부터 -->
	<div class="col-lg-9 col-md-8 order-md-2">
		<h6 class="text-muted text-lg text-uppercase">개인 정보 관리</h6>
		<hr class="margin-bottom-1x">
		
		<div class="card-body">
		<form action="${pageContext.request.contextPath }/account/update" method="post">
		<div class="form-group input-group">
			아이디
			<input style="cursor:default" class="form-control" type="text" name="id" readonly="readonly" value="${vo.id }">
		</div>
		<div class="form-group input-group">
			닉네임
			<input class="form-control" type="text" name="nickname" value="${vo.nickname }">
		</div>
		<div class="form-group input-group">
			이름
			<input class="form-control" type="text" name="name" value="${vo.name }">
		</div>
		<div class="form-group input-group">
			이메일
			<input class="form-control" type="text" name="email" value="${vo.email }">
		</div>
		<div class="form-group input-group">
			휴대폰번호
			<input class="form-control" type="text" name="phone" value="${vo.phone }">
		</div>
		<div class="form-group input-group">
			생년월일
			<input style="cursor:default" class="form-control" type="text" name="birthday" readonly="readonly" value="${vo.birth_date }">
		</div>
		<div class="form-group input-group">
			가입일
			<input style="cursor:default" class="form-control" type="text" name="regdate" readonly="readonly" value="${vo.reg_date }">
		</div>
		
		
		<div class="text-center text-sm-right">
			<button class="btn btn-primary margin-bottom-none" type="submit">회원정보 저장</button>
		</div>
		</form>	
		<form action="${pageContext.request.contextPath }/account/pwdmodify">
		<div class="text-center text-sm-right">					
			<input class="form-control" type="hidden" name="id" readonly="readonly" value="${vo.id }">
			<input class="form-control" type="hidden" name="password" readonly="readonly" value="${vo.password }">		
			<button class="btn btn-primary margin-bottom-none" type="submit">비밀번호변경</button>
		</div>	
		</form>	
		<form action="${pageContext.request.contextPath }/account/memberDel">
		<div class="text-center text-sm-right">
			<input class="form-control" type="hidden" name="id" readonly="readonly" value="${vo.id }">
			<input class="form-control" type="hidden" name="password">
			<button class="btn btn-primary margin-bottom-none" type="submit">회원 탈퇴</button>
		</div>
		</form>		

					

	</div>	
	<hr class="mt-2 mb-3">
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
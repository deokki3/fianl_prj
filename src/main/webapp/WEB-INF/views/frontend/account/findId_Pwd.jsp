<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
	<!-- SEO Meta Tags-->
	<meta name="description" content="Unishop - Universal E-Commerce Template">
	<meta name="keywords" content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
	<meta name="author" content="Rokaux">
	<!-- Favicon and Apple Icons-->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/favicon.ico">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/favicon.png">
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
	<style type="text/css">
            .errormsg {
                color: red;
            }
        </style>
</head>
<body>
	
	<!-- footer -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>
	
	
	<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>아이디/비밀번호찾기</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li>가입</li>
			</ul>
		</div>
	</div>
</div>
	<!-- 페이지 타이틀 끝 -->
	
	<!-- 페이지  컨텐트 -->
<div class="container padding-bottom-3x mb-2">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		
			<form class="card" method="post" action="${pageContext.request.contextPath }/account/findId">
				<div class="card-body">
					<h4 class="margin-bottom-1x text-center">아이디 찾기</h4>
					<div class="form-group input-group">
						이메일
						<input class="form-control" type="text" id="email" name="email" placeholder="가입한 이메일을 입력하세요"/>
					</div>					
					<div class="text-center text-sm-right">
						<button class="btn btn-primary margin-bottom-none" type="submit">아이디찾기</button>
					</div>
				</div>
			</form>
		</div>		
	</div>	
	
	<h6 class="text-muted text-lg text-uppercase"></h6>
		
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		
			<form class="card" method="post" action="${pageContext.request.contextPath }/account/findPwd">
				<div class="card-body">
					<h4 class="margin-bottom-1x text-center">비밀번호 찾기</h4>
					<div class="form-group input-group">
						아이디
						<input class="form-control" type="text" path="id" id="id" name="id" placeholder="가입한 아이디를 입력하세요"/>												
					</div>					
					<div class="text-center text-sm-right">
						<button class="btn btn-primary margin-bottom-none" type="submit">비밀번호찾기</button>
					</div>
				</div>
			</form>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	
</script>

</body>
</html>
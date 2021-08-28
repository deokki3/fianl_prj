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
.form-control {
	margin-left: auto;
	margin-right: auto;
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
			<h1>문의게시판</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Community</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">QnA Board</a></li>
				<li class="separator">&nbsp;</li>
				<li>No.${vo.qna_board_no }</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
<div class="row">
	<div class="col-xl-10 offset-xl-1">
		<blockquote class="margin-top-1x margin-bottom-1x">
			<div style="margin-bottom:20px;"></div>
			<form id="pwdForm">
				<span>
				비밀글은 작성자와 관리자만 열람이 가능합니다.<br>
				비밀번호를 입력해주세요.
				</span>
				<div class="p-2"></div>
					<input type="password" class="form-control col-sm-2 p-1" name="qna_password" id="qna_password" style="text-align:center;">
					<div class="p-1"></div>
					<button type="button" class="form-control col-sm-1 p-1" onclick="clickBtn(pwdForm)">확인</button>
				
				<div style="margin-bottom:20px;"></div>
			</form>
		</blockquote>
		
		<div class="single-post-footer" style="margin-bottom:30px;">
			<div class="entry-navigation">
				<div class="column text-left"></div>
				<div class="column">
					<a class="btn btn-outline-secondary view-all" href="${pageContext.request.contextPath }/community/qnaboard_list">
						<i class="icon-menu"></i>
					</a>
				</div>
				<div class="column text-right"></div>
			</div>
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
<script>
	function clickBtn(formName){
		var password = "${map.qna_password}";
		if($("#qna_password").val() != password) {
			alert("비밀번호가 일치하지 않습니다.");
			$(this).focus();
		}else {
			formName.action = "${pageContext.request.contextPath}/community/qnaboard_detailLock?qna_board_no=${map.qna_board_no}";
			formName.method = "post";
			formName.submit();
		}
	}
	
</script>
</body>
</html>
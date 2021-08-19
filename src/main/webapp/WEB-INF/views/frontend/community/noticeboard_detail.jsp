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
.table tbody tr td p {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 100px;
	margin-right: 100px;
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
				<li><a href="#">Notice Board</a></li>
				<li class="separator">&nbsp;</li>
				<li>No.${vo.n_board_no }</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
	<div class="row justify-content-center">
		<div class="col-lg-12">
			<table class="table text-center">
				<colgroup>
					<col width="8%"/>
					<col width="8%"/>
					<col width="8%"/>
					<col width="56%"/>
					<col width="8%"/>
					<col width="12%"/>
				</colgroup>
				<thead class="thead-default">
					<tr>
						<th scope="row">글번호</th>
						<td>${vo.n_board_no }</td>
						<th scope="row">제목</th>
						<td>${vo.n_title }</td>
						<th scope="row">조회수</th>
						<td>${vo.n_hit }</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="10">
							<p>${vo.n_content }</p>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="single-post-footer" style="margin-bottom:50px;">
				<div class="entry-navigation">
					<div class="column text-left">
						<a class="btn btn-outline-secondary btn-sm" id="prevAtag" href="${pageContext.request.contextPath}/community/noticeboard_detail?n_board_no=${prev.n_board_no}">
							<i class="icon-arrow-left"></i>이전글
						</a>
					</div>
					<div class="column">
						<a class="btn btn-outline-secondary view-all" href="${pageContext.request.contextPath }/community/noticeboard_list">
							<i class="icon-menu"></i>
						</a>
					</div>
					<div class="column text-right">
						<a class="btn btn-outline-secondary btn-sm" id="nextAtag" href="${pageContext.request.contextPath}/community/noticeboard_detail?n_board_no=${next.n_board_no}">
							다음글<i class="icon-arrow-right"></i>
						</a>
					</div>
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
	window.onload=function(){
		var prev = "${prev.n_board_no}";
		var next = "${next.n_board_no}";
		if(prev == 0 || prev == null){
			$("#prevAtag").addClass("disabled");
		}else if(next == 0 || next == null){
			$("#nextAtag").addClass("disabled");
		}
	}
</script>
</body>
</html>
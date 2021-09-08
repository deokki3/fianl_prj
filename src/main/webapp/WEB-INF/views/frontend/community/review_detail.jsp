<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	margin-top: 30px;
	margin-bottom: 30px;
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
			<h1>리뷰</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="${pageContext.request.contextPath }/review_list?product_id=${rvo.product_id}">review</a></li>
				<li class="separator">&nbsp;</li>
				<li>No.${rvo.board_num }</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<table class="table text-center">
				<colgroup>
					<col width="10%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="30%"/>
					<col width="10%"/>
					<col width="20%"/>
				</colgroup>
				<thead class="thead-default">
					
					<tr>
						<th scope="row">글번호</th>
						<td>${rvo.board_num }</td>
						<th scope="row">작성자</th>
						<td>${rvo.nickname }</td>
						<th scope="row">작성일</th>
						<td><fmt:formatDate value="${rvo.regdate }" pattern = "yyyy.MM.dd HH:mm:ss"/></td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3">${rvo.review_title }</td>
						<th scope="row">평점</th>
						<td colspan="2">${rvo.star }
						</td>
						
					</tr>
				</thead>
				<tbody> 
						
					
						
						<tr>
						<td  colspan="3"><img  src="<c:url value='/upload/review_img/${rvo.review_img}' />"
							alt="<c:url value='/upload/product_img/${rvo.review_img}' />" /></td>
						<td colspan="10">
							<p>${rvo.review_content }</p>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="single-post-footer" style="margin-bottom:30px;">
				<div class="entry-navigation">
					<div class="column text-left"></div>
					<div class="column">
						<a class="btn btn-outline-secondary view-all" href="${pageContext.request.contextPath }/review_list?product_id=${rvo.product_id}">
							<i class="icon-menu"></i>
						</a>
					</div>
					<div class="column text-right"></div>
				</div>
			</div>
			
			
			<div class="row" style="margin-bottom:40px;">
				
				<div class="ml-md-auto" style="margin-right:30px;">
					<sec:authorize access="isAuthenticated()">
					
					
					<a class="btn btn-outline-secondary btn-sm" id="nextAtag" href="${pageContext.request.contextPath }/review_update?board_num=${rvo.board_num}">
						수정
					</a>
					<a class="btn btn-outline-secondary btn-sm" id="nextAtag" href="${pageContext.request.contextPath }/review_delete?board_num=${rvo.board_num}&product_id=${rvo.product_id}" >
						삭제
					</a>
					</sec:authorize>
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
	
</body>
</html>
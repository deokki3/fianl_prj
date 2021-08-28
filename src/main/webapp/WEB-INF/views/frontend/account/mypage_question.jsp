<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
a {
	text-decoration: none;
	color: black;
}
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
	<!-- mypage_sidebar -->
	<jsp:include page="/WEB-INF/views/frontend/account/inc/mypage_sidebar.jsp"/>
	
	<!-- 나의 문의내역 -->
	<div class="col-lg-9 col-md-8 order-md-2">
		<h6 class="text-muted text-lg text-uppercase">나의 문의내역</h6>
		<hr class="margin-bottom-1x">
		<div class="table-responsive wishlist-table mb-0">
			<div class="row mb-2" style="margin-left:5px;">
				<!--
				<input value="${startDate }" type="date" id="startDate" name="startDate" class="form-control col-md-3">
				<span>~</span>
				<input value="${endDate }" type="date" id="endDate" name="endDate" class="form-control col-md-3">
				 -->
			</div>
			
			<script>
				function dateCheck(){
					
				}
			</script>
			
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th width="60%" class="text-center">제목</th>
						<th width="25%" class="text-center">등록일자</th>
						<th width="15%" class="text-center">답변상태</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td></td>
						<td>
							<a href="${pageContext.request.contextPath }/community/qnaboard_detail?qna_board_no=${vo.qna_board_no}">
								${vo.qna_title }
							</a>
						</td>
						<td class="text-center"><fmt:parseDate value="${vo.qna_regdate }" var="qna_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${qna_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="text-center">
							<c:choose>
								<c:when test="${vo.qna_status==1 }">
									<button class="btn btn-success btn-sm">답변완료</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-secondary btn-sm" disabled>답변대기</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		
		</div>
	<!--<div class="accordion" id="accordion1" role="tablist">
			<div class="card">
				<div class="card-header" rold="tab">
					<h6><a href="#collapseOne" data-toggle="collapse">collapse</a></h6>
				</div>
				<div class="collapse show" id="collapseOne" data-parent="#">
				
				</div>
			</div>	
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
<script>

</script>
</body>
</html>
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
			<h1>문의게시판</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Community</a></li>
				<li class="separator">&nbsp;</li>
				<li>QnA Board</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
<div class="row">
	<!-- 문의게시판 테이블 -->
	<div class="col-lg-12 col-md-10 order-md-2 text-center">
		<!-- <hr class="margin-bottom-1x"> -->
		<div>
			<form action="${pageContext.request.contextPath}/community/qnaboard_list" method="post">
				<div class="row">
					<div class="p-2"></div>
						<select class="form-control col-sm-2 p-2" name="field" >
							<option value="nickname" <c:if test="${field=='nickname'}">selected</c:if> >작성자</option>
							<option value="qna_title" <c:if test="${field=='qna_title'}">selected</c:if> >제목</option>
							<option value="qna_content" <c:if test="${field=='qna_content'}">selected</c:if> >내용</option>
						</select>
					<input type="text" class="form-control col-sm-3 p-1" value="${keyword}" name="keyword" >
					<button type="submit" class="form-control col-sm-1 w-1 p-2">검색</button>
					<div class="ml-md-auto" style="margin-right:20px;">
						<button type="button" id="insertBtn" class="form-control btn-sm btn-outline-info" onclick="location.href='${pageContext.request.contextPath}/community/qnaboard_insert'">문의하기 <i class="icon-arrow-right-circle"></i></button>
					</div>
				</div>
			</form>
		</div>
		<div class="mb-3"></div>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width:100px;">글번호</th>
						<th style="width:500px;">제목</th>
						<th style="width:100px;">작성자</th>
						<th style="width:140px;">등록일시</th>
						<th style="width:100px;">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.qna_board_no }</td>
						<td class="text-left"><a href="${pageContext.request.contextPath}/community/qnaboard_detail?qna_board_no=${vo.qna_board_no}">${vo.qna_title }</a></td>
						<td>${vo.Nickname }</td>
						<td><fmt:parseDate value="${vo.qna_regdate }" var="qna_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${qna_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${vo.qna_hit }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
		</div>
		
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum==i }">
					<a href="${pageContext.request.contextPath}/community/qnaboard_list?pageNum=${i }&field=${field}&keyword=${keyword}">
						<span style="color:blue; font-weight:bold">[${i }]</span>
					</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/community/qnaboard_list?pageNum=${i }&field=${field}&keyword=${keyword}">
						<span style="color:gray;">[${i }]</span>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
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
	/*var sessionId = "${id}";
	$("#insertBtn").on("click",function(){
		if(sessionId!=null) {
			function clickInsert();
		}
	});*/
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	<!-- 관심상품 여기서부터 -->
	<div class="col-lg-9 col-md-8 order-md-2">
		<h6 class="text-muted text-lg text-uppercase">관심상품</h6>
		<hr class="margin-bottom-1x">
		<table class="table text-center" style="display:table;">
			<thead>
			<tr>
			<!--<th width="10%"><input type="checkbox" name="chkAll" id="chkAll"></th> -->
				<th>관심상품 리스트</th>
				<th width="10%">삭제</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="vo" items="${list }">
			<tr>
			<!--<td><input type="checkbox" name="chk" id="chk"></td> -->
				<td>
					<div class="product-card product-list mb-30" style="width:800px; display:table-cell; vertical-align:middle;">
						<a class="product-thumb" href="${pageContext.request.contextPath}/shop/product_detail?n=${vo.product_id}&m=${vo.category_id}">
							<img src="<c:url value='/upload/product_img/${vo.uploadPath}/${vo.img_name_save}' />" alt="<c:url value='/upload/product_img/${vo.uploadPath}/${vo.img_name_save}' />">
						</a>
						<div class="product-card-inner">
							<div class="product-card-body">
								<div class="product-category">
									<a>${vo.brand }</a>
								</div>
								<h3 class="product-title">${vo.product_name }</h3>
								<h4 class="product-price">
									<fmt:formatNumber pattern="###,###,###" value="${vo.selling_price }" /> 원
								</h4>
							</div>
						</div>
					</div>
				</td>
				<td>
					<a class="remove-form-cart" 
					   style="text-decoration:none; color:black;" 
					   href="${pageContext.request.contextPath}/account/mypage_wishdelete?product_id=${vo.product_id }"
					   data-toggle="tooltip" 
					   title="관심상품 삭제">
						<i class="icon-x"></i>
					</a>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<hr class="margin-bottom-1x">
		
	<!-- 페이징 -->
	<nav class="pagination text-center" style="margin-top:20px;">
		<div class="column">
			<c:choose>
				<c:when test="${pu.prevPage }">
					<a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/account/mypage_wishlist?pageNum=${pu.pageNum-1 }"><i class="icon-chevron-left"></i> 이전</a>
				</c:when>
				<c:otherwise>
					<a class="btn btn-outline-secondary btn-sm disabled"><i class="icon-chevron-left"></i> 이전</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="column">
		<ul class="pages" style="margin-top:20px;">
		
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum==i }">
					<li class="active">
						<a href="${pageContext.request.contextPath}/account/mypage_wishlist?pageNum=${i }">${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="${pageContext.request.contextPath}/account/mypage_wishlist?pageNum=${i }">${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</ul>
		</div>
		<div class="column">
			<c:choose>
				<c:when test="${pu.nextPage }">
					<a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/account/mypage_wishlist?pageNum=${pu.pageNum+1 }">다음 <i class="icon-chevron-right"></i></a>
				</c:when>
				<c:otherwise>
					<a class="btn btn-outline-secondary btn-sm disabled">다음 <i class="icon-chevron-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
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
/*	$("#chkAll").click(function(){
		if($("#chkAll").prop("checked")){
			$("input[name=chk]").prop("checked",true);
		}else{
			$("input[name=chk]").prop("checked",false);
		}
	}); */
</script>
</body>
</html>
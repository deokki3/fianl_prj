<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var currentPage=1;
function list(pageNum){
	currentPage=pageNum;
	$("#commList").empty();
	$.ajax({
		url:"${pageContext.request.contextPath}/shop/product_list",
		data:{"pageNum":pageNum,"order":order},
		dataType:"json",
		success:function(data){
			//alert(data);
			///data.list[0].num
			$(data.list).each(function(i,d){
				
				
				let id=d.id;
				let comments=d.comments;
				let num=d.num;			
				const idx="comm"+ i;
				const data={num:num,id:id,comments:comments,idx:idx};
				const param=JSON.stringify(data);
				let html="<div class='comm1' id='"+ idx +"'>";
				html += "아이디:" + id +"<br>";
				html += "영화평:" + comments +"<br>";
				html += "<input type='button' value='삭제' onclick='removeComm("+ num + ")'>";
				html += "<input type='button' value='수정' onclick='modifyForm(" + param +")'>";
				html +="</div>";					
				$("#commList").append(html);					
			});
			//페이징 처리
			let startPage=data.startPageNum;
			let endPage=data.endPageNum;
			
			let pageCount=data.totalPageCount;
			let pageHtml="";
			if(startPage>5){
				pageHtml += "<a href='javascript:list("+ (startPage-1) + ")'>이전</a>";
			}
			for(let i=startPage;i<=endPage;i++){
				if(i==pageNum){
					pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:blue' >"+ i + "</span></a> ";
				}else{
					pageHtml += "<a href='javascript:list("+ i + ")'><span style='color:gray' >"+ i + "</span></a> ";
				}	
			}
			if(endPage<pageCount){
				pageHtml += "<a href='javascript:list("+ (endPage+1) + ")'>다음</a>";
			}
			$("#page").html(pageHtml);
		}		
	});		
}
</script>
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>상품리스트</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Shop</a></li>
				<li class="separator">&nbsp;</li>
				<li>Goods list</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-top-3x padding-bottom-2x mb-2">
<div class="row">
	<!-- ///////////////////// 상품리스트 그리드 ///////////////////// -->
	<div class="col-lg-9 order-lg-2">
		<!-- 정렬순서 -->
		<div class="shop-toolbar padding-bottom-1x mb-2">
			<div class="column">
				<div class="shop-sorting">
					 
					<label for="sorting">정렬 순서</label>
					<select class="form-control" id="order">
						<option value="product_id"><c:if test="${order=='product_id' }">selected</c:if>신상품순</option>
						<option value="selling_price"><c:if test="${order=='selling_price' }">selected</c:if>낮은가격순</option>
						<option value="selling_price"><c:if test="${order=='selling_price' }">selected</c:if>높은가격순</option>
						<option value="product_name"><c:if test="${order=='product_name' }">selected</c:if>이름순-오름차순</option>
						<option value="product_name"><c:if test="${order=='product_name' }">selected</c:if>이름순-내림차순</option>
					</select>
				</div>
			</div>
			<div class="column">
				<!-- grid / list 두가지 버전 구현 가능할 때 쓰기 
				<div class="shop-view">
					<a class="grid-view active" href="#"><span></span><span></span><span></span></a>
					<a class="list-view" href="#"><span></span><span></span><span></span></a>
				</div>
				-->
			</div>
		</div>
		<!-- 상품리스트 -->
		
		<div class="row">
		<c:forEach var="vo" items="${list }">
			
			<!-- forEach 시작 부분 -->
			<div class="col-md-3 col-sm-6">
				<div class="product-card mb-30">
					<a class="product-thumb" href="${pageContext.request.contextPath}/shop/product_detail?n=${vo.product_id}&m=${vo.category_id}">
						<img src="<c:url value='/upload/${vo.img_name_save}' />" alt="<c:url value='/upload/${vo.img_name_save}' />" />
					</a>
					<div class="product-card-body">
						<div class="product-category"><a href="#">${vo.brand }</a></div>
						<h3 class="product-title"><a href="#">${vo.product_name }</a></h3>
						<h4 class="product-price"><fmt:formatNumber pattern="###,###,###" value="${vo.selling_price }"/>원</h4>
					</div>
					<div class="product-button-group">
						<!-- 위시리스트 토스트 수정은 scripts.min.js 파일 -->
						<a class="product-button btn-wishlist" href="#"><i class="icon-heart"></i><span>관심상품</span></a>
						<a class="product-button" href="#" 
							data-toast 
							data-toast-type="success" 
							data-toast-position="topRight" 
							data-toast-icon="icon-check-circle" 
							data-toast-title=" " 
							data-toast-message="장바구니에 상품을 담았습니다!">
							<i class="icon-shopping-cart"></i><span>장바구니</span>
						</a>
					</div>
				</div>
			</div>
			</c:forEach>	
			<!-- forEach 끝 부분 -->
		</div>
		
	</div>
	<!-- ///////////////////// 상품리스트 그리드 끝 ///////////////////// -->
	
	<!-- ///////////////////// 상품리스트 사이드바 ///////////////////// -->
	<div class="col-lg-3 order-lg-1">
		<div class="sidebar-toggle position-left">
			<i class="icon-filter"></i>
		</div>
		<aside class="sidebar sidebar-offcanvas position-left">
			<span class="sidebar-close"><i class="icon-x"></i></span>
			<!-- 카테고리 -->
			<section class="widget widget-categories">
			<h3 class="widget-title">카테고리</h3>
			<ul>
				<li class="has-children expanded"><a href="#">종류1</a><span>(100)</span>
					<ul>
						<li><a href="#">상품분류1</a><span>(수량)</span>
							<ul>
								<li><a href="#">상품1</a></li>
								<li><a href="#">상품2</a></li>
								<li><a href="#">상품3</a></li>
							</ul>
						</li>
						<li><a href="#">상품분류2</a><span>(수량)</span>
							<ul>
								<li><a href="#">상품1</a></li>
								<li><a href="#">상품2</a></li>
								<li><a href="#">상품3</a></li>
							</ul>
						</li>
						<li><a href="#">상품분류3</a><span>(수량)</span>
							<ul>
								<li><a href="#">상품1</a></li>
								<li><a href="#">상품2</a></li>
								<li><a href="#">상품3</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li class="has-children"><a href="#">종류2</a><span>(100)</span>
					<ul>
						<li><a href="#">상품분류1</a><span>(수량)</span>
							<ul>
								<li><a href="#">상품1</a></li>
								<li><a href="#">상품2</a></li>
								<li><a href="#">상품3</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li class="has-children"><a href="#">종류3</a><span>(100)</span>
					<ul>
						<li><a href="#">상품분류1</a><span>(수량)</span>
							<ul>
								<li><a href="#">상품1</a></li>
								<li><a href="#">상품2</a></li>
								<li><a href="#">상품3</a></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
			</section>
			<!-- 가격 범위 -->
			<section class="widget widget-categories">
			<h3 class="widget-title">가격</h3>
				<form 
				class="price-range-slider" method="post" 
				data-start-min="0"
				data-start-max="10000000"
				data-min="0"
				data-max="10000000"
				data-step="10000">
					<div class="ui-range-slider"></div>
					<footer class="ui-range-slider-footer">
						<div class="column">
							<button class="btn btn-outline-primary btn-sm" type="submit">적용</button>
						</div>
						<div class="column">
							<div class="ui-range-values mb-3">
								<div class="ui-range-value-min">
									￦<span></span> <input type="hidden">
								</div>
								&nbsp;-&nbsp;
								<div class="ui-range-value-max">
									￦<span></span> <input type="hidden">
								</div>
							</div>
						</div>
					</footer>
				</form>
			</section>
			<!-- 브랜드 필터 -->
			<section class="widget">
			<h3 class="widget-title">브랜드</h3>
				<div class="custom-control ustom-checkbox">
					<input class="custom-control-input" type="checkbox" id="brand1">
					<label class="custom-control-label" for="brand1">
						brand1 &nbsp;<span class="text-muted">(100)</span>
					</label>
				</div>
				<div class="custom-control ustom-checkbox">
					<input class="custom-control-input" type="checkbox" id="brand2">
					<label class="custom-control-label" for="brand2">
						brand2 &nbsp;<span class="text-muted">(200)</span>
					</label>
				</div>
				<div class="custom-control ustom-checkbox">
					<input class="custom-control-input" type="checkbox" id="brand3">
					<label class="custom-control-label" for="brand3">
						brand3 &nbsp;<span class="text-muted">(300)</span>
					</label>
				</div>
				<div class="custom-control ustom-checkbox">
					<input class="custom-control-input" type="checkbox" id="brand4">
					<label class="custom-control-label" for="brand4">
						brand4 &nbsp;<span class="text-muted">(400)</span>
					</label>
				</div>
			</section>
		</aside>
	</div>
	<!-- ///////////////////// 상품리스트 사이드바 끝 ///////////////////// -->
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
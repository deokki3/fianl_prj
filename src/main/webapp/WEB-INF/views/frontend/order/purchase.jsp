<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product.jsp</title>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <!-- SEO Meta Tags-->
    <meta name="description" content="Unishop - Universal E-Commerce Template">
    <meta name="keywords" content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
    <meta name="author" content="Rokaux">
    <!-- Mobile Specific Meta Tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- Favicon and Apple Icons-->
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="apple-touch-icon" href="touch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="180x180" href="touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="167x167" href="touch-icon-ipad-retina.png">
    <!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
    <!-- Main Template Styles-->
    <link id="mainStyles" rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
    <!-- Modernizr-->
    <script src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>

<style>
	#order_product {
		width:850px;
	}
	.sidebar {
		position: absolute;
	}
	#sidebar{
		height: 200px;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>
	
	 <!-- Page Title-->
    <div class="page-title">
      <div class="container">
        <div class="column">
          <h1>주문서 작성/결제</h1>
        </div>
        <div class="column">
          <ul class="breadcrumbs">
            <li><a href="index.html">Home</a>
            </li>
            <li class="separator">&nbsp;</li>
            <li>주문/결제</li>
          </ul>
        </div>
      </div>
    </div>
    <!-- Page Content-->
	
	
	
	<!-- Page Content-->
	
	
	<div class="container padding-bottom-3x mb-2" style=margin-top:80px;>
	<form name="sub1" method="post" action="${pageContext.request.contextPath }/purchase">
		<h3 class="widget-title" id="order_product">주문 제품(Order Product)</h3>
		<div class="row">
			<div class="col-xl-9  col-lg-8">
			
			<table class="table table-hover">
	        	<thead class="thead-default">
	           	 	<tr>
	            		<th class="text-center">이미지</th>
	           			<th class="text-center">상품명</th>
	            		<th class="text-center">상품금액</th>
	            		<th class="text-center">수량</th>
	            		<th class="text-center">주문금액</th>
	       	    	</tr>
	       	    	<c:choose>
	       	    
		       	    	<c:when test="${!empty purchaseList }">
		       	  
		       	    		<c:forEach var="vo" items="${purchaseList }"  varStatus="i">
			       	    		<tr>	
			       	    			<td><img width=45; height=45; src="<c:url value='/upload/product_img/${vo.img_name_save}' />" alt="<c:url value='/upload/product_img/${vo.img_name_save}' />" /></td>
				       	    		<td>${vo.product_name }</td>
				       	    		<td>${vo.selling_price }</td>
				       	    		<td>${cnt[i.index] }</td>
				       	    		<td>${vo.selling_price * vo.product_count }</td>
				       	    		
			       	    		</tr>
			       	    		<input type="hidden" name="product_id" value="${vo.product_id }">
			       	    		<input type="hidden" name="product_count" value="${cnt[i.index] }">
			       	    	</c:forEach>
			       	    		
		       	    	</c:when>
		       	        	<c:otherwise>
			       	    	<tr>
			       	    		<td></td>
			       	    		<td>${product_name }</td>
			       	    		<td>${selling_price }</td>
			       	    		<td>${product_count }</td>
			       	    		<td>${selling_price * product_count }</td>
			       	    	</tr>
		       	    	</c:otherwise>
	       	    	</c:choose>
	            </thead>
	      	</table>
	</div>
	
	
	
			<!-- Checkout Adress-->
			<div class="col-xl-9 col-lg-8">
				<div class="steps flex-sm-nowrap mb-5">
					<a class="step active" href="checkout-address.html">
						<h4 class="step-title">1. 주소</h4>
					</a><a class="step" href="${pageContext.request.contextPath }/purchase2">
						<h4 class="step-title">2. 배송</h4>
					</a><a class="step" href="checkout-payment.html">
						<h4 class="step-title">3. 결제</h4>
					</a><a class="step" href="checkout-review.html">
						<h4 class="step-title">4. 리뷰</h4>
					</a>
				</div>
				<h4>주문 정보</h4>

					<input type="hidden" name="product_id" value="${product_id }">
					<input type="hidden" name="tot_price" value="${selling_price*product_count }">
					<!--  <input type="hidden" name="product_id" value="${product_id }">-->
					<input type="hidden" name="product_count" value="${product_count }">
					
					
					<hr class="padding-bottom-1x">
					<div class="row">
						
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-name">주문자 이름</label> <input
									class="form-control" type="text"
									name="orderer_name" id="orderer_name">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-ln">할인코드</label> <input
									class="form-control" type="text" 
									name="discount_ref_no" id="discount_ref_no">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-email">수령인 이름</label> <input
									class="form-control" type="text" 
									name="recipient_name" id="recipient_name">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-">배송비</label> <input
									class="form-control" type="text" 
									name="delevery_cost" id="delevery_cost">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-zip_code">주소</label> <input
									class="form-control" type="text" 
									name="zip_code" id="zip_code">
									<input class="form-control" type="text"
									name="order_address" id="order_address">
									<input	class="form-control" type="text"
									name="order_address_detail" id="order_address_detail">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-country">Country</label> <select
									class="form-control" id="checkout-country">
									<option>Choose country</option>
									<option>Australia</option>
									<option>Canada</option>
									<option>France</option>
									<option>Germany</option>
									<option>Switzerland</option>
									<option>USA</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-city">City</label> <select
									class="form-control" id="checkout-city">
									<option>Choose city</option>
									<option>Amsterdam</option>
									<option>Berlin</option>
									<option>Geneve</option>
									<option>New York</option>
									<option>Paris</option>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-zip">ZIP Code</label> <input
									class="form-control" type="text" id="checkout-zip">
							</div>
						</div>
					</div>
					<div class="row padding-bottom-1x">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-address1">Address 1</label> <input
									class="form-control" type="text" id="checkout-address1">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-address2">Address 2</label> <input
									class="form-control" type="text" id="checkout-address2">
							</div>
						</div>
					</div>
					<h4>Shipping Address</h4>
					<hr class="padding-bottom-1x">
					<div class="form-group">
						<div class="custom-control custom-checkbox">
							<input class="custom-control-input" type="checkbox"
								id="same_address" checked> <label
								class="custom-control-label" for="same_address">Same as
								billing address</label>
						</div>
					</div>
					<div class="d-flex justify-content-between paddin-top-1x mt-4">
						<a class="btn btn-outline-secondary" href="cart.html"><i
							class="icon-arrow-left"></i><span class="hidden-xs-down">&nbsp;Back
								To Cart</span></a><button onclick="payment()" class="btn btn-primary" 
								type="button"><span
							class="hidden-xs-down">결제하기&nbsp;</span><i
							class="icon-arrow-right"></i></button>
					</div>
				
			</div>
			
			<!-- Sidebar          -->
			<div class="col-xl-3 col-lg-4" id="sidebar">
				<aside class="sidebar" >
					<div class="padding-top-2x hidden-lg-up"></div>
					<!-- Order Summary Widget-->
					<section class="widget widget-order-summary">
						<h3 class="widget-title">주문정보(Order Summary)</h3>
						<table class="table">
							<tr>
								<td>총 결제금액 : </td>
								<td class="text-gray-dark">${selling_price*product_count } 원</td>
							</tr>
							<tr>
								<td>배송비(Shipping):  </td>
								<td class="text-gray-dark">0원</td>
							</tr>
							<tr>
								<td>추정세(Estimated tax):</td>
								<td class="text-gray-dark">$9.72</td>
							</tr>
							<tr>
								<td></td>
								<td class="text-lg text-gray-dark">$2,584.72</td>
							</tr>
						</table>
					</section>
					<!-- Featured Products Widget-->
					<section class="widget widget-featured-products">
						<h3 class="widget-title">최근 본 상품</h3>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html"><img src="img/shop/widget/01.jpg"
									alt="Product"></a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">GoPro Hero4 Silver</a>
								</h4>
								<span class="entry-meta">150000 원</span>
							</div>
						</div>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html"><img src="img/shop/widget/02.jpg"
									alt="Product"></a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">키보드</a>
								</h4>
								<span class="entry-meta">250000 원</span>
							</div>
						</div>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html"><img src="img/shop/widget/03.jpg"
									alt="Product"></a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">HP OfficeJet Pro 8710</a>
								</h4>
								<span class="entry-meta">$89.70</span>
							</div>
						</div>
						<!-- Entry-->
						<div class="entry pb-2">
							<div class="entry-thumb">
								<a href="shop-single.html"><img src="img/shop/widget/05.jpg"
									alt="Product"></a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">iPhone X 256 GB Space Gray</a>
								</h4>
								<span class="entry-meta">$1,450.00</span>
							</div>
						</div>
					</section>
					<!-- Promo Banner-->
					<a class="card border-0 bg-secondary" href="shop-grid-ls.html">
						<div class="card-body">
							<span class="d-block text-lg text-thin mb-2">Limited Time
								Deals</span>
							<h3>Surface Pro 4</h3>
							<p class="d-inline-block bg-warning text-white">
								&nbsp;&nbsp;Shop Now&nbsp;<i
									class="icon-chevron-right d-inline-block align-middle"></i>&nbsp;
							</p>
						</div>
						<img class="d-block mx-auto" src="img/shop/widget/promo.jpg"
						alt="Surface Pro">
					</a>
				</aside>
			</div>
	
			
		</div>
		</form>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp" />


	<!-- Back To Top Button-->
	<a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	

	function payment() {
	        if (document.getElementById("orderer_name").value == "") {
	            alert("이름을 입력하세요.");
	            return false;
	  }else
	   document.sub1.submit();
	}
	
	
	$(function(){
		const scrollHeight = 260;
		var body = document.body,

	    html = document.documentElement;
		var height = Math.max( body.scrollHeight, body.offsetHeight, 
			 html.clientHeight, html.scrollHeight, html.offsetHeight );
		$(".sidebar").css({
			"top":-height+1703
		});
		var endScroll=height-1221
		var endPx=height-1471
		//사이드바 스크롤

		function sidebar(){
			if($(window).scrollTop()>endScroll){
				document.getElementById('sidebar').style.top = endPx + 'px';
			}else if($(window).scrollTop() > scrollHeight){
				let top = $(window).scrollTop() - scrollHeight + 10;
				document.getElementById('sidebar').style.top = top + 'px';
				console.log($(window).scrollTop());
				console.log(height);
			}else if($(window).scrollTop()<scrollHeight){
				document.getElementById('sidebar').style.top = '0px';
			}
		}

		sidebar();

		$(window).scroll(()=>{
			sidebar();
		});

	});

</script>

</html>
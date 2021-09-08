<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>장바구니</title>
<!-- SEO Meta Tags-->
<meta name="description"
	content="Unishop - Universal E-Commerce Template">
<meta name="keywords"
	content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
<meta name="author" content="Rokaux">
<!-- Mobile Specific Meta Tag-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- Favicon and Apple Icons-->
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="icon" type="image/png" href="favicon.png">
<link rel="apple-touch-icon" href="touch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="167x167"
	href="touch-icon-ipad-retina.png">
<!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
<!-- Main Template Styles-->
<link id="mainStyles" rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
<!-- Modernizr-->
<script
	src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
</head>
<!-- Body-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@500&display=swap"
	rel="stylesheet">
<style>
.fl {
	float: left;
}

#cartform {
	font-family: 'Nanum Pen Script', cursive;
	font-family: 'Noto Serif KR', serif;
}
</style>
<body>

	<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp" />

	<!-- Toolbar ( Put toolbar here only if you enable sticky navbar )-->
	<div class="toolbar">
		<div class="toolbar-inner">

			<div class="toolbar-dropdown cart-dropdown widget-cart">
				<!-- Entry-->
				<div class="entry">
					<div class="entry-thumb">
						<a href="shop-single.html"><img src="#" alt="Product"></a>
					</div>
					<div class="entry-content">
						<h4 class="entry-title">
							<a href="shop-single.html">Canon EOS M50 Mirrorless Camera</a>
						</h4>
						<span class="entry-meta">1 x $910.00</span>
					</div>
					<div class="entry-delete">
						<i class="icon-x"></i>
					</div>
				</div>
				<!-- Entry-->
				<div class="entry">
					<div class="entry-thumb">
						<a href="shop-single.html"><img src="#" alt="Product"></a>
					</div>
					<div class="entry-content">
						<h4 class="entry-title">
							<a href="shop-single.html">Apple iPhone X 256 GB Space Gray</a>
						</h4>
						<span class="entry-meta">1 x $1,450.00</span>
					</div>
					<div class="entry-delete">
						<i class="icon-x"></i>
					</div>
				</div>
				<!-- Entry-->
				<div class="entry">
					<div class="entry-thumb">
						<a href="shop-single.html"><img src="#" alt="Product"></a>
					</div>
					<div class="entry-content">
						<h4 class="entry-title">
							<a href="shop-single.html">HP LaserJet Pro Laser Printer</a>
						</h4>
						<span class="entry-meta">1 x $188.50</span>
					</div>
					<div class="entry-delete">
						<i class="icon-x"></i>
					</div>
				</div>
				<div class="text-right">
					<p class="text-gray-dark py-2 mb-0">
						<span class='text-muted'>Subtotal:</span> &nbsp;$2,548.50
					</p>
				</div>
				<div class="d-flex">
					<div class="pr-2 w-50">
						<a class="btn btn-secondary btn-sm btn-block mb-0"
							href="cart.html">Expand Cart</a>
					</div>
					<div class="pl-2 w-50">
						<a class="btn btn-primary btn-sm btn-block mb-0"
							href="checkout.html">Checkout</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 페이지 타이틀 부분-->
	<div class="page-title">
		<div class="container">
			<div class="column">
				<h1>장바구니</h1>
			</div>
			<div class="column">
				<ul class="breadcrumbs">
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li class="separator">&nbsp;</li>
					<li>장바구니</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 타이틀끝 컨텐츠 부분 -->
	<div class="container padding-bottom-3x mb-1">
		<!-- Alert-->
		<div class="alert alert-info alert-dismissible fade show text-center"
			style="margin-bottom: 30px; font-weight:bolder;">
			<span class="alert-close" data-dismiss="alert"></span><i
				class="icon-award"></i>&nbsp;&nbsp;제품의 품절로 상품발송이 부득이하게 이루어지지 못하는 경우가 있으므로 이점 미리 양해해주시기 바랍니다. 빠른 배송을 위해 최선을 다하겠습니다.
			<span class='text-medium'></span>
		</div>
		<!-- Shopping Cart-->
		<div class="table-responsive shopping-cart" id="checkbox_group">

			<!-- /////////////////////////////////////// -->
			<table class="table">
				<thead>
					<tr>
						<th class="text-center"><input type="checkbox" name="allchk"
							id="allchk"></th>
						<th class="text-center">상품이미지</th>
						<th class="text-center">상품명</th>
						<th class="text-center">상품금액</th>
						<th class="text-center">수량</th>
						<th class="text-center">주문금액</th>
						<th class="text-center">삭제</th>
					</tr>
				</thead>
				<tbody id="cart_list">
					<c:forEach var="vo" items="${cart }">
						<tr>
							<td class="text-center"><input type="checkbox"
								name="cart_no" class="cart_nos" value="${vo.cart_no}"></td>
							<td class="text-center text-lg"><img width=100; height=100;
								src="<c:url value='/upload/product_img/${vo.uploadPath}/${vo.img_name_save}' />"
								alt="<c:url value='/upload/product_img/${vo.uploadPath}/${vo.img_name_save}' />" />
							</td>
							<td class="text-center text-lg" style="font-size: 15px;">
								${vo.product_name }</td>
							<td class="text-center text-lg" style="font-size: 15px;">${vo.selling_price } 원</td>
							<td class="text-center">
								<div class="count-input">
									<p style="display: table; margin: 0 auto;">
										<input
											style="width: 22px; height: 20px; border: 1px solid #c8c8c8;"
											class="cart_no_cnt fl" type="text"
											id="product_count_${vo.cart_no}" name="product_count"
											value="${vo.product_count }" size="2" maxlength="2">
										<img class="fl"
											src="https://ftp.coitcom.co.kr/img/btn_cnt2.gif">
									</p>
									<a href="javascript:update(${vo.cart_no})"> <img
										src="https://ftp.coitcom.co.kr/img/cart_change_btn.png"
										style="margin-top: 5px;">
									</a>
								</div>
							</td>
							<td class="text-center text-lg" style="font-size: 15px;">${vo.product_count*vo.selling_price } 원</td>
							<td class="text-center text-lg"><a class="remove-from-cart"
								onclick="remove(${vo.cart_no})"  ><i
									class="icon-x"></i></a></td>
							</form>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- /////////////////////////////////////// -->

		</div>
		<div class="shopping-cart-footer">
			<div class="column">
				<form class="coupon-form" method="post">
					<input class="form-control form-control-sm" type="text"
						placeholder="쿠폰 번호" required>
					<button class="btn btn-outline-primary btn-sm" type="submit">쿠폰 조회
						</button>
				</form>
			</div>


			<div class="column text-lg">
				<span class="text-muted">총액 :&nbsp;<input type="text"
					size="10" id="tot_sum" name="tot_sum" value="" readonly>&nbsp;원
				</span><span class="text-gray-dark"></span>
			</div>
		</div>
		<div class="shopping-cart-footer">
			<div class="column">
				<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop/product_list?category_id=20000"><i
					class="icon-arrow-left"></i>&nbsp;쇼핑 계속하기</a>
			</div>
			<div class="column">
				<!--   <a class="btn btn-secondary" href="#" data-toast
					data-toast-type="success" data-toast-position="topRight"
					data-toast-icon="icon-check-circle" data-toast-title="Your cart"
					data-toast-message="is updated successfully!">Update Cart</a>-->

				<form id="cart_nos_form" method="post"
					action="${pageContext.request.contextPath}/member/purchase1">
					<input type="submit" id="purchase_btn" class="btn btn-primary" value="구매하기">
				</form>
			</div>


		</div>

		<!-- Related Products Carousel-->
		<h2 class="text-center padding-top-2x mt-2 padding-bottom-1x">★★추천
			상품★★</h2>
		<!-- Carousel-->
		<div class="owl-carousel"
			data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: true, &quot;margin&quot;: 30, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;576&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;991&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}} }">
			<!-- Product-->
			<div class="product-card">
				<div class="product-badge bg-danger">Sale</div>
				<a class="product-thumb" href="shop-single.html">
					<img width=100; height=100; src="<c:url value='/upload/product_img/2021\08\31/f442b9b8-1c62-469c-b960-6de0ef97d5fb_이엠텍 REDBIT 280 ARGB.jpg' />"
					alt="<c:url value='/upload/product_img/2021\08\31/f442b9b8-1c62-469c-b960-6de0ef97d5fb_이엠텍 REDBIT 280 ARGB.jpg' />" />
					
				</a>
				<div class="product-card-body">
					<div class="product-category">
						<a href="#">슈퍼 세일!</a>
					</div>
					<h3 class="product-title">
						<a href="shop-single.html">이엠텍 REDBIT 280 ARGB</a>
					</h3>
					<h4 class="product-price">
						<del>5900 원</del>
						590원
					</h4>
				</div>
				<div class="product-button-group">
					<a class="product-button btn-wishlist" href="#"><i
						class="icon-heart"></i><span>Wishlist</span></a><a
						class="product-button" href="#" data-toast
						data-toast-type="success" data-toast-position="topRight"
						data-toast-icon="icon-check-circle" data-toast-title="Product"
						data-toast-message="successfuly added to cart!"><i
						class="icon-shopping-cart"></i><span>To Cart</span></a>
				</div>
			</div>
			<!-- Product-->
			<div class="product-card">
				<a class="product-thumb" href="shop-single.html">
					<img width=100; height=100; src="<c:url value='/upload/product_img/2021\08\31/067403be-cdbb-49c0-b67b-91a4c7554a57_GIGABYTE AORUS Master 지포스 RTX 3090 D6X 24GB 피씨디렉트.jpg' />"
					alt="<c:url value='/upload/product_img/2021\08\31/067403be-cdbb-49c0-b67b-91a4c7554a57_GIGABYTE AORUS Master 지포스 RTX 3090 D6X 24GB 피씨디렉트.jpg' />" />
			
				</a>
				<div class="product-card-body">
					<div class="product-category">
						<a href="#">NVIDIA</a>
					</div>
					<h3 class="product-title">
						<a href="shop-single.html">지포스 RTX 3090 D6X 24GB 피씨디렉트</a>
					</h3>
					<h4 class="product-price">50 원</h4>
				</div>
				<div class="product-button-group">
					<a class="product-button btn-wishlist" href="#"><i
						class="icon-heart"></i><span>Wishlist</span></a><a
						class="product-button" href="#" data-toast
						data-toast-type="success" data-toast-position="topRight"
						data-toast-icon="icon-check-circle" data-toast-title="Product"
						data-toast-message="successfuly added to cart!"><i
						class="icon-shopping-cart"></i><span>To Cart</span></a>
				</div>
			</div>
			<!-- Product-->
			<div class="product-card">
				<div class="rating-stars">
					<i class="icon-star filled"></i><i class="icon-star filled"></i><i
						class="icon-star filled"></i><i class="icon-star filled"></i><i
						class="icon-star filled"></i>
				</div>
				<a class="product-thumb" href="shop-single.html">
					<img width=100; height=100; src="<c:url value='/upload/product_img/2021\08\31/4ea4d78d-8e25-464b-bc5b-b2214987c40f_삼성전자 노트북 DDR4 16G PC4-25600 (정품).jpg' />"
					alt="<c:url value='/upload/product_img/2021\08\31/4ea4d78d-8e25-464b-bc5b-b2214987c40f_삼성전자 노트북 DDR4 16G PC4-25600 (정품).jpg' />" />
			
				
				</a>
				<div class="product-card-body">
					<div class="product-category">
						<a href="#">삼성전자</a>
					</div>
					<h3 class="product-title">
						<a href="shop-single.html">삼성전자 노트북 DDR4 16G PC4-25600</a>
					</h3>
					<h4 class="product-price">50000 원</h4>
				</div>
				<div class="product-button-group">
					<a class="product-button btn-wishlist" href="#"><i
						class="icon-heart"></i><span>Wishlist</span></a><a
						class="product-button" href="#" data-toast
						data-toast-type="success" data-toast-position="topRight"
						data-toast-icon="icon-check-circle" data-toast-title="Product"
						data-toast-message="successfuly added to cart!"><i
						class="icon-shopping-cart"></i><span>To Cart</span></a>
				</div>
			</div>
			<!-- Product-->
			<div class="product-card">
				<a class="product-thumb" href="shop-single.html">
				<img width=100; height=100; src="<c:url value='/upload/product_img/2021\08\31/4b58c1f1-5a25-4ff7-b110-423ea70cd892_AMD 라이젠7-4세대 5800X (버미어) (멀티팩).jpg' />"
					alt="<c:url value='/upload/product_img/2021\08\31/4b58c1f1-5a25-4ff7-b110-423ea70cd892_AMD 라이젠7-4세대 5800X (버미어) (멀티팩).jpg' />" />
			
				
				</a>
				<div class="product-card-body">
					<div class="product-category">
						<a href="#">AMD</a>
					</div>
					<h3 class="product-title">
						<a href="shop-single.html">AMD 라이젠7-4세대 5800X (버미어)</a>
					</h3>
					<h4 class="product-price">5500 원</h4>
				</div>
				<div class="product-button-group">
					<a class="product-button btn-wishlist" href="#"><i
						class="icon-heart"></i><span>Wishlist</span></a><a
						class="product-button" href="#" data-toast
						data-toast-type="success" data-toast-position="topRight"
						data-toast-icon="icon-check-circle" data-toast-title="Product"
						data-toast-message="successfuly added to cart!"><i
						class="icon-shopping-cart"></i><span>To Cart</span></a>
				</div>
			</div>
			<!-- Product-->
			<div class="product-card">
				<div class="product-badge bg-secondary border-default text-body">Out
					of stock</div>
				<a class="product-thumb" href="shop-single.html"><img src="#"
					alt="Product"></a>
				<div class="product-card-body">
					<div class="product-category">
						<a href="#">컴퓨터</a>
					</div>
					<h3 class="product-title">
						<a href="shop-single.html">시리즈 3</a>
					</h3>
					<h4 class="product-price">500 원</h4>
				</div>
				<div class="product-button-group">
					<a class="product-button btn-wishlist" href="#"><i
						class="icon-heart"></i><span>Wishlist</span></a><<a
						class="product-button" href="shop-single.html"><i
						class="icon-arrow-right"></i><span>Details</span></a>
				</div>
			</div>
			<!-- Product-->
			<div class="product-card">
				<div class="rating-stars">
					<i class="icon-star filled"></i><i class="icon-star filled"></i><i
						class="icon-star filled"></i><i class="icon-star filled"></i><i
						class="icon-star"></i>
				</div>
				<a class="product-thumb" href="shop-single.html"><img src="#"
					alt="Product"></a>
				<div class="product-card-body">
					<div class="product-category">
						<a href="#">A &amp; B</a>
					</div>
					<h3 class="product-title">
						<a href="shop-single.html">게이밍 키보드</a>
					</h3>
					<h4 class="product-price">9900원</h4>
				</div>
				<div class="product-button-group">
					<a class="product-button btn-wishlist" href="#"><i
						class="icon-heart"></i><span>Wishlist</span></a><a
						class="product-button" href="#" data-toast
						data-toast-type="success" data-toast-position="topRight"
						data-toast-icon="icon-check-circle" data-toast-title="Product"
						data-toast-message="successfuly added to cart!"><i
						class="icon-shopping-cart"></i><span>To Cart</span></a>
				</div>
			</div>
			<!-- Product-->
			<div class="product-card">
				<div class="product-badge bg-danger">Sale</div>
				<a class="product-thumb" href="shop-single.html"><img src="#"
					alt="Product"></a>
				<div class="product-card-body">
					<div class="product-category">
						<a href="#">램</a>
					</div>
					<h3 class="product-title">
						<a href="shop-single.html">16gb 램</a>
					</h3>
					<h4 class="product-price">
						<del>1200 원</del>
						990원
					</h4>
				</div>
				<div class="product-button-group">
					<a class="product-button btn-wishlist" href="#"><i
						class="icon-heart"></i><span>Wishlist</span></a><a
						class="product-button" href="#" data-toast
						data-toast-type="success" data-toast-position="topRight"
						data-toast-icon="icon-check-circle" data-toast-title="Product"
						data-toast-message="successfuly added to cart!"><i
						class="icon-shopping-cart"></i><span>To Cart</span></a>
				</div>
			</div>
		</div>
	</div>

	<!-- Site Footer-->
	<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp" />
	<!-- Back To Top Button-->
	<a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>

	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script
		src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>

	<script type="text/javascript">
		$(function(){
			$('#tot_sum').val("0");
			$("#checkbox_group").on("click", "#allchk",function(){
				checked=$(this).is(":checked");	
				if(checked){
					$('input[name="cart_no"]').prop("checked", true).change();
				}else{
					$('input[name="cart_no"]').prop("checked", false).change();
				}
			});
		
			$("#checkbox_group").on("change","input[name='cart_no']",function(){ 
				var sum = 0;
				var checkbox = $("input[name=cart_no]:checked");
				var cart_nos = new Array();
				// 체크된 체크박스 값을 가져온다
				checkbox.each(function(i) {
					// 총액 계산
					let selling_price=parseInt(checkbox.parent().parent().eq(i).children().eq(5).text());
					sum += selling_price;

					// 가져온 값을 배열에 담는다.
					console.log("장바구니 번호:"+$(this).val());
					cart_nos.push($(this).val());
				});

				$('#tot_sum').val(sum);
				console.log("장바구니 번호 목록 :" + cart_nos);
				$("#cart_nos_form").find(':hidden').remove();
				$.each(cart_nos,function(index,item){
					console.log("배열안의 값들 : "+item);
					$("#cart_nos_form").append(
						`<input type="hidden" name="cart_nos" value="\${item}">`
					);

				});
			});

		});
		
		$("#purchase_btn").on("click",function(){
			var chked=$("input:checkbox[name=cart_no]:checked").length;
			if(chked==0){
				alert("장바구니 품목을 하나 이상 체크하세요.");
				return false;
			};
		});
				

			/*	// 구매하기 버튼 클릭했을때
				$("#purchase_btn").on("click",function(){
					console.log("버튼클릭!");
					var length = $('input[name=cart_nos]').length;
					var cart_nos= new Array(length);
					for(var i=0; i<length; i++){                          
						cart_nos[i] = $('input[name=cart_nos]').eq(i).val();        
					}
					console.log(cart_nos);
					if(cart_vo_list==null)
						alert("구입할 목록을 선택해 주세요.");
					
					$.ajax({
						url:"${pageContext.request.contextPath}/purchase1", // 어디로 보낼지 모르겠어서...
						data:{"cart_no": ""},
						dataType: "json", // 서버(컨트롤러)에서 파라미터를 아마 List<CartVo> cart_vo_list 이렇게 받음될거에여
						type: "post",
						success:function(data){ // 통신에 성공했을 때 실행하는 callback함수, data는 controller에서 설정해준 @ResponseBody 타입으로 와여...
							console.log(data);
							//location.href("url");     // 3개 다 페이지 이동할 때 쓰는건데 자세한건 구글링해보셈 ㅋ
							// location.replace("url");
							// history.pushState(""); 
						},
						error:function(request, status, error){ // 서버랑 통신하는거 실패했을때 실행하는 callback함수
							alert("에러 발생"+error);
							alert("code:"+request.status+"\n"+"error:"+error);

						},
						complete:function(){ // success나 error callback함수가 실행되고 난 후, 실행되는 callback 함수. 비워도 상관없음

						}
					}); 
				});	*/
	
		function list(){
			$("#cart_list").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/member/cart2",
				dataType:"json",
				success:function(data){
					data.list[0].num
					$(data.list).each(function(i,d){
						let product_id=d.product_id;
						let product_name=d.product_name;
						let selling_price=d.selling_price;
						let product_count=d.product_count;
						let img_name_save=d.img_name_save;
						let uploadPath=d.uploadPath;
						cart_no=d.cart_no;
							$("#cart_list").append(
							`		
							<tr>
									<td class="text-center"><input type="checkbox" name="cart_no" class="cart_nos" value="\${cart_no}" ></td>
									<td class="text-center text-lg">
										<img width=100px; height=100px; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" />
									</td>
									<td class="text-center text-lg"  style="font-size: 15px;">
										<input type="hidden" name="product_name" class="product_names" value="\${product_name}">
										\${product_name }
									</td>
									<td class="text-center text-lg" style="font-size: 15px;">\${selling_price } 원</td>								
									<td class="text-center">
										<div class="count-input">
											<p style="display:table;margin:0 auto;">
												<input style="width:22px; height:20px; border:1px solid #c8c8c8;" class="cart_no_cnt fl" type="text"
												id="product_count_\${cart_no}" name="product_count" value="\${product_count }" size="2" maxlength="2">
												<img class="fl" src="https://ftp.coitcom.co.kr/img/btn_cnt2.gif" ">
											</p>
											<a href="javascript:update(\${cart_no})" >	
												<img src="https://ftp.coitcom.co.kr/img/cart_change_btn.png" style="margin-top:5px;">
											</a>	
										</div>
									</td>
									<td class="text-center text-lg" style="font-size: 15px;">\${product_count*selling_price } 원</td>
									<td class="text-center text-lg">
										<a class="remove-from-cart" onclick="remove(\${cart_no})"><i class="icon-x"></i></a>
									</td>	
							</tr>					
							`
						);
						
					});
				}
			});
		}

		function update(cart_no){
			var product_count=$("#product_count_" + cart_no).val();	
			console.log(product_count , cart_no)
				$.ajax({
					url:"${pageContext.request.contextPath}/updateC",
					dataType:"json",
					data:{"product_count" : product_count, "cart_no" : cart_no},
					Type:'post',
					success:function(data){
						
						list();	
					}
				});

		};

		function remove(cart_no){
			$.ajax({
				url:"${pageContext.request.contextPath}/deleteC?cart_no="+cart_no,
				dataType:"json",
				success:function(data){
					alert('삭제 완료');
					
					list();
				}
			});
		};

		
	</script>
</body>
</html>
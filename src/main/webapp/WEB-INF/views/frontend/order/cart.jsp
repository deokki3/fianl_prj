<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>장바구니
    </title>
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
  </head>
  <!-- Body-->
<body>

  <jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>
  		  		
        <!-- Toolbar ( Put toolbar here only if you enable sticky navbar )-->
        <div class="toolbar">
          <div class="toolbar-inner">
        
              <div class="toolbar-dropdown cart-dropdown widget-cart">
                <!-- Entry-->
                <div class="entry">
                  <div class="entry-thumb"><a href="shop-single.html"><img src="img/shop/widget/04.jpg" alt="Product"></a></div>
                  <div class="entry-content">
                    <h4 class="entry-title"><a href="shop-single.html">Canon EOS M50 Mirrorless Camera</a></h4><span class="entry-meta">1 x $910.00</span>
                  </div>
                  <div class="entry-delete"><i class="icon-x"></i></div>
                </div>
                <!-- Entry-->
                <div class="entry">
                  <div class="entry-thumb"><a href="shop-single.html"><img src="img/shop/widget/05.jpg" alt="Product"></a></div>
                  <div class="entry-content">
                    <h4 class="entry-title"><a href="shop-single.html">Apple iPhone X 256 GB Space Gray</a></h4><span class="entry-meta">1 x $1,450.00</span>
                  </div>
                  <div class="entry-delete"><i class="icon-x"></i></div>
                </div>
                <!-- Entry-->
                <div class="entry">
                  <div class="entry-thumb"><a href="shop-single.html"><img src="img/shop/widget/06.jpg" alt="Product"></a></div>
                  <div class="entry-content">
                    <h4 class="entry-title"><a href="shop-single.html">HP LaserJet Pro Laser Printer</a></h4><span class="entry-meta">1 x $188.50</span>
                  </div>
                  <div class="entry-delete"><i class="icon-x"></i></div>
                </div>
                <div class="text-right">
                  <p class="text-gray-dark py-2 mb-0"><span class='text-muted'>Subtotal:</span> &nbsp;$2,548.50</p>
                </div>
                <div class="d-flex">
                  <div class="pr-2 w-50"><a class="btn btn-secondary btn-sm btn-block mb-0" href="cart.html">Expand Cart</a></div>
                  <div class="pl-2 w-50"><a class="btn btn-primary btn-sm btn-block mb-0" href="checkout.html">Checkout</a></div>
                </div>
              </div>
            </div>
          </div>

    <!-- Page Title-->
    <div class="page-title">
      <div class="container">
        <div class="column">
          <h1>장바구니</h1>
        </div>
        <div class="column">
          <ul class="breadcrumbs">
            <li><a href="${pageContext.request.contextPath}/">Home</a>
            </li>
            <li class="separator">&nbsp;</li>
            <li>장바구니</li>
          </ul>
        </div>
      </div>
    </div>
    <!-- Page Content-->
    <div class="container padding-bottom-3x mb-1">
      <!-- Alert-->
      <div class="alert alert-info alert-dismissible fade show text-center" style="margin-bottom: 30px;"><span class="alert-close" data-dismiss="alert"></span><i class="icon-award"></i>&nbsp;&nbsp;With this purchase you will earn <span class='text-medium'>2,549</span> Reward Points.</div>
	      <!-- Shopping Cart-->
	        <div class="table-responsive shopping-cart" id="checkbox_group">
				 
				<!-- /////////////////////////////////////// -->
				
				<table class="table">
					<thead>	
						<tr>
							<th class="text-center"><input type="checkbox" id="allchk" checked="checked"></th>
							<th class="text-center">상품이미지</th>
							<th class="text-center">상품명</th>
							<th class="text-center">상품금액</th>
							<th class="text-center">수량</th>
							<th class="text-center">주문금액</th>
							<th class="text-center">삭제</th>
						</tr>
					</thead>
					<tbody id="tbody">
				   	<c:forEach var="vo" items="${cart }">
				   	
						<tr>
							<td class="text-center"><input type="checkbox" class="normal" checked="checked"></td>
								<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/${vo.img_name_save}' />" alt="<c:url value='/upload/product_img/${vo.img_name_save}' />" /></td>
								<td class="text-center text-lg">${vo.product_name }</td>
								<td class="text-center text-lg">${vo.selling_price }</td>
								
								
								<td class="text-center">
									<div class="count-input">
					                	<p style=margin-bottom:0><input type="text" id="${vo.cart_no }" value="${vo.product_count }" size="2" maxlength="2">
					                	</p>
						                <a href="">
						                	 <input type="button" value="수정" onclick="update(${vo.cart_no})">
						                	<img src="https://ftp.coitcom.co.kr/img/cart_change_btn.png" style="margin-top:5px;">
						                </a>	
					                </div>
								</td>
								<td class="text-center">
									${vo.product_count}x${vo.selling_price } = ${vo.product_count*vo.selling_price }
								</td>
								 <td class="text-center"><a class="remove-from-cart" onclick="remove(${vo.cart_no})" 
								 data-toggle="tooltip" title="삭제"><i class="icon-x"></i></a>
								 </td>
							
						</tr>
					
					</c:forEach>
					</tbody>
	       		 </table>
	        <!-- /////////////////////////////////////// -->
	        
	      </div>
	      <div class="shopping-cart-footer">
	        <div class="column">
	          <form class="coupon-form" method="post">
	            <input class="form-control form-control-sm" type="text" placeholder="Coupon code" required>
	            <button class="btn btn-outline-primary btn-sm" type="submit">Apply Coupon</button>
	          </form>
	        </div>
	        <div class="column text-lg"><span class="text-muted">총액 (?):&nbsp; </span><span class="text-gray-dark"></span></div>
	      </div>
	      <div class="shopping-cart-footer">
	        <div class="column"><a class="btn btn-outline-secondary" href="shop-grid-ls.html"><i class="icon-arrow-left"></i>&nbsp;쇼핑 계속하기</a></div>
	        <div class="column"><a class="btn btn-secondary" href="#" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-check-circle" data-toast-title="Your cart" data-toast-message="is updated successfully!">Update Cart</a><a class="btn btn-primary" href="checkout-address.html">구매하기</a></div>
	      </div>
	      
	      
	      <!-- Related Products Carousel-->
	      <h3 class="text-center padding-top-2x mt-2 padding-bottom-1x">너가 또 좋아할 만한것들(You May Also Like)</h3>
	      <!-- Carousel-->
	      <div class="owl-carousel" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: true, &quot;margin&quot;: 30, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;576&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;991&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}} }">
	        <!-- Product-->
	        <div class="product-card">
	          <div class="product-badge bg-danger">Sale</div><a class="product-thumb" href="shop-single.html"><img src="img/shop/products/01.jpg" alt="Product"></a>
	          <div class="product-card-body">
	            <div class="product-category"><a href="#">Smart home</a></div>
	            <h3 class="product-title"><a href="shop-single.html">무선 마우스</a></h3>
	            <h4 class="product-price">
	              <del>$62.00</del>$49.99
	            </h4>
	          </div>
	          <div class="product-button-group"><a class="product-button btn-wishlist" href="#"><i class="icon-heart"></i><span>Wishlist</span></a><a class="product-button btn-compare" href="#"><i class="icon-repeat"></i><span>Compare</span></a><a class="product-button" href="#" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-check-circle" data-toast-title="Product" data-toast-message="successfuly added to cart!"><i class="icon-shopping-cart"></i><span>To Cart</span></a></div>
	        </div>
	        <!-- Product-->
	        <div class="product-card"><a class="product-thumb" href="shop-single.html"><img src="img/shop/products/11.jpg" alt="Product"></a>
	          <div class="product-card-body">
	            <div class="product-category"><a href="#">헤드폰</a></div>
	            <h3 class="product-title"><a href="shop-single.html">헤드폰 W855BT Bluetooth</a></h3>
	            <h4 class="product-price">$99.75</h4>
	          </div>
	          <div class="product-button-group"><a class="product-button btn-wishlist" href="#"><i class="icon-heart"></i><span>Wishlist</span></a><a class="product-button btn-compare" href="#"><i class="icon-repeat"></i><span>Compare</span></a><a class="product-button" href="#" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-check-circle" data-toast-title="Product" data-toast-message="successfuly added to cart!"><i class="icon-shopping-cart"></i><span>To Cart</span></a></div>
	        </div>
	        <!-- Product-->
	        <div class="product-card">
	            <div class="rating-stars"><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i>
	            </div><a class="product-thumb" href="shop-single.html"><img src="img/shop/products/06.jpg" alt="Product"></a>
	          <div class="product-card-body">
	            <div class="product-category"><a href="#">lg 모니터</a></div>
	            <h3 class="product-title"><a href="shop-single.html">LG 최신모니터</a></h3>
	            <h4 class="product-price">$298.99</h4>
	          </div>
	          <div class="product-button-group"><a class="product-button btn-wishlist" href="#"><i class="icon-heart"></i><span>Wishlist</span></a><a class="product-button btn-compare" href="#"><i class="icon-repeat"></i><span>Compare</span></a><a class="product-button" href="#" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-check-circle" data-toast-title="Product" data-toast-message="successfuly added to cart!"><i class="icon-shopping-cart"></i><span>To Cart</span></a></div>
	        </div>
	        <!-- Product-->
	        <div class="product-card"><a class="product-thumb" href="shop-single.html"><img src="img/shop/products/07.jpg" alt="Product"></a>
	          <div class="product-card-body">
	            <div class="product-category"><a href="#">스피커</a></div>
	            <h3 class="product-title"><a href="shop-single.html">최신 스피커</a></h3>
	            <h4 class="product-price">$839.99</h4>
	          </div>
	          <div class="product-button-group"><a class="product-button btn-wishlist" href="#"><i class="icon-heart"></i><span>Wishlist</span></a><a class="product-button btn-compare" href="#"><i class="icon-repeat"></i><span>Compare</span></a><a class="product-button" href="#" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-check-circle" data-toast-title="Product" data-toast-message="successfuly added to cart!"><i class="icon-shopping-cart"></i><span>To Cart</span></a></div>
	        </div>
	        <!-- Product-->
	        <div class="product-card">
	          <div class="product-badge bg-secondary border-default text-body">Out of stock</div><a class="product-thumb" href="shop-single.html"><img src="img/shop/products/12.jpg" alt="Product"></a>
	          <div class="product-card-body">
	            <div class="product-category"><a href="#">컴퓨터</a></div>
	            <h3 class="product-title"><a href="shop-single.html">시리즈 3</a></h3>
	            <h4 class="product-price">$329.10</h4>
	          </div>
	          <div class="product-button-group"><a class="product-button btn-wishlist" href="#"><i class="icon-heart"></i><span>Wishlist</span></a><a class="product-button btn-compare" href="#"><i class="icon-repeat"></i><span>Compare</span></a><a class="product-button" href="shop-single.html"><i class="icon-arrow-right"></i><span>Details</span></a></div>
	        </div>
	        <!-- Product-->
	        <div class="product-card">
	            <div class="rating-stars"><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star filled"></i><i class="icon-star"></i>
	            </div><a class="product-thumb" href="shop-single.html"><img src="img/shop/products/10.jpg" alt="Product"></a>
	          <div class="product-card-body">
	            <div class="product-category"><a href="#">A &amp; B</a></div>
	            <h3 class="product-title"><a href="shop-single.html">세트</a></h3>
	            <h4 class="product-price">$249.50</h4>
	          </div>
	          <div class="product-button-group"><a class="product-button btn-wishlist" href="#"><i class="icon-heart"></i><span>Wishlist</span></a><a class="product-button btn-compare" href="#"><i class="icon-repeat"></i><span>Compare</span></a><a class="product-button" href="#" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-check-circle" data-toast-title="Product" data-toast-message="successfuly added to cart!"><i class="icon-shopping-cart"></i><span>To Cart</span></a></div>
	        </div>
	        <!-- Product-->
	        <div class="product-card">
	          <div class="product-badge bg-danger">Sale</div><a class="product-thumb" href="shop-single.html"><img src="img/shop/products/09.jpg" alt="Product"></a>
	          <div class="product-card-body">
	            <div class="product-category"><a href="#">램</a></div>
	            <h3 class="product-title"><a href="shop-single.html">16gb 램</a></h3>
	            <h4 class="product-price">
	              <del>$74.00</del>$68.00
	            </h4>
	          </div>
	          <div class="product-button-group"><a class="product-button btn-wishlist" href="#"><i class="icon-heart"></i><span>Wishlist</span></a><a class="product-button btn-compare" href="#"><i class="icon-repeat"></i><span>Compare</span></a><a class="product-button" href="#" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-check-circle" data-toast-title="Product" data-toast-message="successfuly added to cart!"><i class="icon-shopping-cart"></i><span>To Cart</span></a></div>
	        </div>
	      </div>
	    </div>
   
    <!-- Site Footer-->
   <jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp"/>
    <!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
    <!-- Backdrop-->
    <div class="site-backdrop"></div>
    <!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
    <script src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$("#checkbox_group").on("click", "#allchk",function(){
	var checked=$(this).is(":checked");	
		if(checked){
			$(this).parents("#checkbox_group").find('input').prop("checked", true);
		}else{
			$(this).parents("#checkbox_group").find('input').prop("checked", false);
		}
	});
	// 체크박스 개별 선택
	$("#checkbox_group").on("click", ".normal", function() {
	    var is_checked = true;
	    $("#checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	    $("#allchk").prop("checked", is_checked);
	    update(999);
	});

		
		
		function list(mem_no){
			$("#tbody").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/cart2?mem_no="+mem_no,
				dataType:"json",
				success:function(data){
					//data.list[0].num
					$(data.list).each(function(i,d){
						let product_name=d.product_name;
						let selling_price=d.selling_price;
						let product_count=d.product_count;
						let img_name_save=d.img_name_save;
						cart_no=d.cart_no;

							html =	"<tr>";
							html +=	"<td class='text-center'><input type='checkbox' class='normal' checked='checked'></td>";
							html +=		"<td class='text-center text-lg'><img src='static/frontend/assets/img/"+img_name_save+"' width='100' height='100'></td>";
							html +=		"<td class='text-center text-lg'>"+product_name+"</td>";
							html +=		"<td class='text-center text-lg'>"+selling_price+"</td>";
							
							
							html +=		"<td class='text-center'>";
							html +=		"<div class='count-input'>";
							html +=	    	"<p style=margin-bottom:0><input type='text' value='"+product_count+"' size='2' maxlength='2'>";
							html +=	    	"</p>";
							html +=	        "<a href='#'>";
							html +=	        	"<img src='https://ftp.coitcom.co.kr/img/cart_change_btn.png' style='margin-top:5px;'>";
							html +=	         "</a>";
							html +=	     "</div>";
							html +=	"</td>";
							html +=	"<td class='text-center'>";
							html +=		product_count+"x"+selling_price +"="+ product_count*selling_price;
							html +=		"</td>";
							html +=		"<td class='text-center'><a class='remove-from-cart'";
							html +=		"href='${pageContext.request.contextPath }/deleteCart?cart_no="+cart_no+ "data-toggle='tooltip' title='Remove item'><i class='icon-x'></i></a>";
							html +=	"<input type='button' value='삭제' onclick='remove("+cart_no + ")'></td>";
						
						html +=	"</tr>";
							
							$(".table").append(html);
					});
				}
			});
		}
		
		function update(cart_no){
			var product_count=$("#"+cart_no).val();	
				$.ajax({
					url:"${pageContext.request.contextPath}/updateC?product_count="+product_count+"&cart_no="+cart_no,
					dataType:"json",
					success:function(data){
						alert('success');
						
						list();	
					}
				});

		};
		
		function remove(cart_no){
			$.ajax({
				url:"${pageContext.request.contextPath}/deleteC?cart_no="+cart_no,
				dataType:"json",
				success:function(data){
					alert('success');
					
					list();
				}
			});
		};

		
	</script>  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>결제완료
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
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
  <style>
  	.fl {
  		float:left;
  	}
  	
  	#cartform {
  		font-family: 'Nanum Pen Script', cursive;
font-family: 'Noto Serif KR', serif;
  	}
  </style>
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

    <!-- 페이지 타이틀 부분-->
   <div class="page-title">
      <div class="container">
        <div class="column">
          <h1>결제 완료</h1>
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
    <div class="container padding-bottom-3x mb-2">
      <div class="card text-center">
        <div class="card-body padding-top-2x">
          <h3 class="card-title">결제에 실패하였습니다.</h3>
          <p class="card-text">주문번호 : <span class="text-medium">${order_no }</span></p>
          <p class="card-text">마이 페이지 에서 다시 결제 하실수 있습니다. 
          </p>
          <div class="padding-top-1x padding-bottom-1x"><a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop/product_list?category_id=20000">계속 쇼핑하기</a><a class="btn btn-outline-primary" href="${pageContext.request.contextPath }/account/mypage_order">마이페이지로</a></div>
        </div>
      </div>
    </div>
 
    <!-- Site Footer-->
   <jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp"/>
    <!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
    <!-- Backdrop-->
    <div class="site-backdrop"></div>

<script src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
<script src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>  
</body>
</html>
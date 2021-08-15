<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath }/resources/css/vendor.min.css">
 <link id="mainStyles" rel="stylesheet" media="screen" href="${pageContext.request.contextPath }/resources/css/styles.min.css">

<style>
header{
	width: 100%;
	height: 100px;
	background-color: #ffcc00;
	border: 1px solid;	
	margin: 10px autog;
}
section{
	
	width: 80%; height: 500px; 
	margin-left: 20%;margin-right: 20%;
	margin-bottom: 300px;
}
#box1{
	width: 50%;
	height: 60%;
	float: left;
}
#box2{
	width: 50%;
	height: 60%;
	float: left;
}
footer{
	width:100%;
	height: 5px;
}
</style>
</head>
<body>

<section>
<div id="box1">
<h1>카테고리 수정하기</h1>

<form method="post" action="${pageContext.request.contextPath }/admin/cate/cateupdate">
 	<input type="hidden" name="category_id" value="${vo.category_id }"><br>
	카테고리 명<br>
	<input type="text" name="category_name" value="${vo.category_name }"><br>
	상위 카테고리 코드<br>
	<input type="text" name="category_parent" value="${vo.category_parent }"><br>
	카테고리 정렬순서<br>
	<input type="text" name="category_order" value="${vo.category_order }"><br>
	<br>
	<input type="submit" value="수정">
</form>
</div>
<div id="box2">
<h2>참고하세요</h2>
<h5>상위 카테고리 코드 설명</h5>
<ul style=list-style:none;>
	
	<li>부품코드는 1</li>
	<li>cpu 코드: 3 메인보드 코드: 4 램 코드: 5</li>
	<li>그래픽카드(vga) 코드: 6 ssd 코드: 7 hdd: 8 power 코드: 9</li>
	<li>주변기기는 2</li>
	<li>쿨러 코드: 10 컨트롤러 코드: 11</li>
	<li>외장하드 코드: 12 케이블 코드: 13 hdd: 8 USB 코드: 14</li>
	<li> 상위 카테고리 코드에 필시 적으세요</li>
	<li style=font-size:20px;>정렬순서 : 1->최상위 부품 
	<li style=font-size:20px;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2-> 카테고리별 분류 항목 </li>
	<li style=font-size:20px;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3-> 세부 항목</li>
</ul>
<a href="${pageContext.request.contextPath }/admin/cate/catelist">자세히 보기</a>
</div>
</section>

<!-- footer 부분 -->
 <!-- Site Footer-->
      <footer class="site-footer" style="height:150%;">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6">
              <!-- Contact Info-->
              <section class="widget widget-light-skin">
                <h3 class="widget-title">Get In Touch With Us</h3>
                <p class="text-white">Phone: 00 33 169 7720</p>
                <ul class="list-unstyled text-sm text-white">
                  <li><span class="opacity-50">Monday-Friday:</span>9.00 am - 8.00 pm</li>
                  <li><span class="opacity-50">Saturday:</span>10.00 am - 6.00 pm</li>
                </ul>
                <p><a class="navi-link-light" href="#">support@neocom.com</a></p><a class="social-button shape-circle sb-facebook sb-light-skin" href="#"><i class="socicon-facebook"></i></a><a class="social-button shape-circle sb-twitter sb-light-skin" href="#"><i class="socicon-twitter"></i></a><a class="social-button shape-circle sb-instagram sb-light-skin" href="#"><i class="socicon-instagram"></i></a><a class="social-button shape-circle sb-google-plus sb-light-skin" href="#"><i class="socicon-googleplus"></i></a>
              </section>
            </div>
            <div class="col-lg-3 col-md-6">
              <!-- Mobile App Buttons-->
              <section class="widget widget-light-skin">
                <h3 class="widget-title">Our Mobile App</h3><a class="market-button apple-button mb-light-skin" href="#"><span class="mb-subtitle">Download on the</span><span class="mb-title">App Store</span></a><a class="market-button google-button mb-light-skin" href="#"><span class="mb-subtitle">Download on the</span><span class="mb-title">Google Play</span></a><a class="market-button windows-button mb-light-skin" href="#"><span class="mb-subtitle">Download on the</span><span class="mb-title">Windows Store</span></a>
              </section>
            </div>
            <div class="col-lg-3 col-md-6">
              <!-- About Us-->
              <section class="widget widget-links widget-light-skin">
                <h3 class="widget-title">About Us</h3>
                <ul>
                  <li><a href="#">Careers</a></li>
                  <li><a href="#">About Unishop</a></li>
                  <li><a href="#">Our Story</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">Our Blog</a></li>
                </ul>
              </section>
            </div>
            <div class="col-lg-3 col-md-6">
              <!-- Account / Shipping Info-->
              <section class="widget widget-links widget-light-skin">
                <h3 class="widget-title">Account &amp; Shipping Info</h3>
                <ul>
                  <li><a href="#">Your Account</a></li>
                  <li><a href="#">Shipping Rates & Policies</a></li>
                  <li><a href="#">Refunds & Replacements</a></li>
                  <li><a href="#">Taxes</a></li>
                  <li><a href="#">Delivery Info</a></li>
                  <li><a href="#">Affiliate Program</a></li>
                </ul>
              </section>
            </div>
          </div>
          <hr class="hr-light mt-2 margin-bottom-2x">
          <div class="row">
            <div class="col-md-7 padding-bottom-1x">
              <!-- Payment Methods-->
              <div class="margin-bottom-1x" style="max-width: 615px;"><img src="${pageContext.request.contextPath }/resources/img/payment_methods.png" alt="Payment Methods">
              </div>
            </div>
            <div class="col-md-5 padding-bottom-1x">
              <div class="margin-top-1x hidden-md-up"></div>
              <!--Subscription-->
              <form class="subscribe-form" action="//rokaux.us12.list-manage.com/subscribe/post?u=c7103e2c981361a6639545bd5&amp;amp;id=1194bb7544" method="post" target="_blank" novalidate>
                <div class="clearfix">
                  <div class="input-group input-light">
                    <input class="form-control" type="email" name="EMAIL" placeholder="Your e-mail"><span class="input-group-addon"><i class="icon-mail"></i></span>
                  </div>
                  <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                  <div style="position: absolute; left: -5000px;" aria-hidden="true">
                    <input type="text" name="b_c7103e2c981361a6639545bd5_1194bb7544" tabindex="-1">
                  </div>
                  <button class="btn btn-primary" type="submit"><i class="icon-check"></i></button>
                </div><span class="form-text text-sm text-white opacity-50">Subscribe to our Newsletter to receive early discount offers, latest news, sales and promo information.</span>
              </form>
            </div>
          </div>
          <!-- Copyright-->
          <p class="footer-copyright">© All rights reserved. Made with &nbsp;<i class="icon-heart text-danger"></i><a href="http://rokaux.com/" target="_blank"> &nbsp;by rokaux</a></p>
        </div>
      </footer>
    <!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-arrow-up"></i></a>
    <!-- Backdrop-->
    <div class="site-backdrop"></div>
    <!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
    <script src="${pageContext.request.contextPath }/resources/js/vendor.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/scripts.min.js"></script>

</body>
</html>
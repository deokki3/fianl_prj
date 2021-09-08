<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>neocom</title>
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
	
	
	<div class="container padding-bottom-3x mb-2" style=margin-top:80px;>
	<form name="sub1" method="post" action="${pageContext.request.contextPath }/purchase">
		<h3 class="widget-title" id="order_product">주문 제품(Order Product)</h3>
		<div class="row">
			<div class="col-xl-9  col-lg-8">
			
			<table class="table table-hover">
	        	<thead class="thead-default">
	           	 	<tr>
	            		<th class="text-center">이미지</th>
	           			<th class="text-center col-md-6">상품명</th>
	            		<th class="text-center">상품금액</th>
	            		<th class="text-center">수량</th>
	            		<th class="text-center">주문금액</th>
	       	    	</tr>
	       	    	<c:choose>
	       	    
		       	    	<c:when test="${!empty purchaseList }">
		       	  			
		       	  			
		       	    		<c:forEach var="vo" items="${purchaseList }"  varStatus="i">
			       	    		<tr>	
			       	    			<td class="text-center"><img width=45; height=45; src="<c:url value='/upload/product_img/${vo.uploadPath}/${vo.img_name_save}' />" alt="<c:url value='/upload/product_img/${vo.uploadPath}/${vo.img_name_save}' />" /></td>
				       	    		<td class="text-center">${vo.product_name }</td>
				       	    		<td class="text-center">${vo.selling_price } 원</td>
				       	    		<td class="text-center">${vo.product_count }</td>
				       	    		<td class="text-center">${vo.selling_price * vo.product_count} 원</td>
				       	    		
			       	    		</tr>
			       	    		<c:set var= "total" value="${total + vo.selling_price * vo.product_count }"/>
			       	    		<input type="hidden" name="product_id" value="${vo.product_id }">
			       	    		<input type="hidden" name="product_count" value="${vo.product_count }">
			       	    		<input type="hidden" name="order_price" value="${vo.selling_price*vo.product_count }">
			       	    		
			       	    	</c:forEach>
			       	    		<c:forEach items="${cart_no }" varStatus="i">
			       	    			<input type="hidden" name="cart_no" value=${cart_no[i.index] }>
			       	    		</c:forEach>
		       	    	</c:when>
		       	        	<c:otherwise>
			       	    	<tr>
			       	    		<td class="text-center"><img width=45; height=45; src="<c:url value='/upload/product_img/${uploadPath}/${img_name_save}' />" alt="<c:url value='/upload/product_img/${uploadPath}/${img_name_save}' />" /></td>
			       	    		<td class="text-center">${product_name }</td>
			       	    		<td class="text-center">${selling_price }</td>
			       	    		<td class="text-center">${product_count }</td>
			       	    		<td class="text-center">${selling_price * product_count }</td>
			       	    	</tr>
			       	    	<c:set var= "total" value="${total + selling_price * product_count }"/>
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
					</a><a class="step" href="checkout-review.html">
						<h4 class="step-title">2. 결제</h4>
					</a>
				</div>
				<h4>주문 정보</h4>

					<input type="hidden" name="product_id" value="${product_id }">
					<input type="hidden" name="order_price" value="${selling_price*product_count }">
					<input type="hidden" name="payment_status" value="결제 전">
					<input type="hidden" name="product_count" value="${product_count }">
					<input type="hidden" name="order_status" value="결제 대기">
					<input type="hidden" name="tot_price" value="${total}">

					
					
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
								<label for="checkout-ln">수령인 이름</label> <input
									class="form-control" type="text" 
									name="recipient_name" id="recipient_name">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-email">전화번호</label> <input
									class="form-control" type="text" 
									name="phone" id="phone">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-">배송비</label> <input
									class="form-control" type="text" readonly="readonly" style="cursor:default"
									name="delevery_cost" value="0원" id="delevery_cost">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-zip_code">주소</label> <input
									class="form-control" placeholder="우편번호" type="text" 
									name="zip_code" id="sample2_postcode" style="margin:5px;" onclick="sample2_execDaumPostcode()">
									<input class="form-control" type="text" placeholder="주소"
									name="order_address" id="sample2_address" style="margin:5px;">
									<input	class="form-control" type="text" placeholder="상세주소"
									name="order_address_detail" id="sample2_detailAddress" style="margin:5px;">
							</div>
							<!-- 주소 api 뜨는 창 -->
							<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
							<label for="checkout-city">배송지 선택</label>
								<select class="form-control" id="select" onchange="selectMyAddr();" style="margin-bottom:50px;">
									<option value='noselect' selected>-- 배송지 선택 --</option>
									<c:forEach var="vo" items="${myAddrList }">
										<option class="option">${vo.address_name }</option>
										
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
		
						
						
					  <div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-city">배송시 요청사항</label>
								<textarea class="form-control" name="request_item" id="request_item" rows="3" cols="30"></textarea>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="checkout-zip">쿠폰 번호 입력</label> <input
									class="form-control" type="text" id="checkout-zip">
							</div>
						</div>
					</div>
					<!--  <div class="row padding-bottom-1x">
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
					</div>-->
					
					<hr class="padding-bottom-2x" style="margin-top:50px;">
					<div class="form-group">
						
					</div>
					<div class="d-flex justify-content-between paddin-top-1x mt-4">
						<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath }/member/cart"><i
							class="icon-arrow-left"></i><span class="hidden-xs-down">&nbsp;장바구니로
							</span></a><button onclick="payment()" class="btn btn-primary" 
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
								<td class="text-gray-dark">${total} 원</td>
							</tr>		
							<tr>
								<td>배송비(Shipping):  </td>
								<td class="text-gray-dark">0원</td>
							</tr>
							<tr>
								<td></td>
								<td class="text-lg text-gray-dark">${total} 원</td>
							</tr>
						</table>
					</section>
					<!-- Featured Products Widget-->
					<section class="widget widget-featured-products">
						<h3 class="widget-title">최근 본 상품</h3>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html">
									<img   src="<c:url value='/upload/product_img/2021\08\31/0531dcae-2721-4cdf-afe2-f4a5fe205420_ASRock B560M PRO4 에즈윈.jpg' />"
									alt="<c:url value='/upload/product_img/2021\08\31/0531dcae-2721-4cdf-afe2-f4a5fe205420_ASRock B560M PRO4 에즈윈.jpg' />" />
								</a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">ASRock B560M PRO4 에즈윈</a>
								</h4>
								<span class="entry-meta">150000 원</span>
							</div>
						</div>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html">
									<img   src="<c:url value='/upload/product_img/2021\08\31/f11b59b4-b7e1-422d-8473-396a5720877a_삼성전자 DDR4 8G PC4-25600 (정품).jpg' />"
									alt="<c:url value='/upload/product_img/2021\08\31/f11b59b4-b7e1-422d-8473-396a5720877a_삼성전자 DDR4 8G PC4-25600 (정품).jpg' />" />
								</a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">삼성전자 DDR4 8G PC4-25600 (정품)</a>
								</h4>
								<span class="entry-meta">250000 원</span>
							</div>
						</div>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html">
									<img   src="<c:url value='/upload/product_img/2021\08\31/1c8a65ae-e3db-4641-91be-28d2e25ec077_MSI 지포스 GTX1050 Ti OC D5 4GB 윈드스톰.jpg' />"
									alt="<c:url value='/upload/product_img/2021\08\31/1c8a65ae-e3db-4641-91be-28d2e25ec077_MSI 지포스 GTX1050 Ti OC D5 4GB 윈드스톰.jpg' />" />
								</a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">MSI 지포스 GTX1050 Ti OC D5 4GB 윈드스톰.jpg</a>
								</h4>
								<span class="entry-meta">410400원</span>
							</div>
						</div>
					</section>
					<!-- Promo Banner-->
					<a class="card border-0 bg-secondary" href="shop-grid-ls.html">
						<div class="card-body">
							<span class="d-block text-lg text-thin mb-2">Limited Time
								Deals</span>
								<img   src="<c:url value='/upload/product_img/2021\08\31/a7cdfca9-ca62-4dd8-a53a-f98eaf2d655e_잘만 CNPS9X OPTIMA WHITE LED.jpg' />"
									alt="<c:url value='/upload/product_img/2021\08\31/a7cdfca9-ca62-4dd8-a53a-f98eaf2d655e_잘만 CNPS9X OPTIMA WHITE LED.jpg' />" />
							
							<p class="d-inline-block bg-warning text-white">
								&nbsp;&nbsp;Shop Now&nbsp;<i
									class="icon-chevron-right d-inline-block align-middle"></i>&nbsp;
							</p>
						</div>
							
						
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
			"top":-height+1670
		});
		var endScroll=height-1321
		var endPx=height-1571
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

	// 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   // document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                  //  document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
	
    function selectMyAddr(){
    	var select=$("#select option:selected").text();
    	console.log(select);
    	$.ajax({
    		url:"${pageContext.request.contextPath}/searchAddr",
			dataType:"json",
			data:{"address_name" : select },
			Type:'post',
			success:function(data){
				$("#sample2_postcode").val(data.vo.zip_code);
				$("#sample2_address").val(data.vo.address);
				$("#sample2_detailAddress").val(data.vo.adress_detail);
				
			}
    		
    	});
    }
    
    
</script>

</html>
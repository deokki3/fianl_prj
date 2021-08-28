<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
<!-- Main Template Styles-->
<link id="mainStyles" rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
<!-- Modernizr-->
<script src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
	<div class="col-xl-9 col-md-12">
		<div class="steps flex-sm-nowrap mb-5">
			<a class="step" href="checkout-address.html">
				<h4 class="step-title">
					<i class="icon-check-circle"></i>1. Address
				</h4>
			</a><a class="step active" href="checkout-shipping.html">
				<h4 class="step-title">2. Shipping</h4>
			</a><a class="step" href="checkout-payment.html">
				<h4 class="step-title">3. Payment</h4>
			</a><a class="step" href="checkout-review.html">
				<h4 class="step-title">4. Review</h4>
			</a>
		</div>
		<h4>Choose Shipping Method</h4>
		<hr class="padding-bottom-1x">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead class="thead-default">
					<tr>
						<th></th>
						<th>Shipping method</th>
						<th>Delivery time</th>
						<th>Handling fee</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="courier"
									name="shipping-method" checked> <label
									class="custom-control-label" for="courier"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Courier</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone), United States & Canada</span></td>
						<td class="align-middle">2 - 4 days</td>
						<td class="align-middle">$26.50</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="local"
									name="shipping-method"> <label
									class="custom-control-label" for="local"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Local
								Shipping</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone), United States & Canada</span></td>
						<td class="align-middle">up to one week</td>
						<td class="align-middle">$10.00</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="flat"
									name="shipping-method"> <label
									class="custom-control-label" for="flat"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-darkm">Flat
								Rate</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone)</span></td>
						<td class="align-middle">5 - 7 days</td>
						<td class="align-middle">$33.85</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="ups"
									name="shipping-method"> <label
									class="custom-control-label" for="ups"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">UPS
								Ground Shipping</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone)</span></td>
						<td class="align-middle">4 - 6 days</td>
						<td class="align-middle">$18.00</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="pickup"
									name="shipping-method"> <label
									class="custom-control-label" for="pickup"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Local
								Pickup from store</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone)</span></td>
						<td class="align-middle">&mdash;</td>
						<td class="align-middle">$0.00</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="locker"
									name="shipping-method"> <label
									class="custom-control-label" for="locker"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Pick
								Up at Unishop Locker</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone), United States & Canada</span></td>
						<td class="align-middle">&mdash;</td>
						<td class="align-middle">$9.99</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="global"
									name="shipping-method"> <label
									class="custom-control-label" for="global"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Unishop
								Global Export</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone), outside United States</span></td>
						<td class="align-middle">3 - 4 days;</td>
						<td class="align-middle">$25.00</td>
					</tr>
				</tbody>	
			</table>
				<div>
					주문번호 보내기<input type="text" id="order_no" value="${order_no }">
					결제자<input type="text" id="orderer_name" value="${orderer_name }">
					결제자<input type="text" id="zip_code" value="${zip_code }">
					결제자<input type="text" id="order_address" value="${order_address }">
					결제자<input type="text" id="order_address_detail" value="${order_address_detail }">
				</div>
			
				<div class="d-flex justify-content-between paddin-top-1x mt-4">
					<a class="btn btn-outline-secondary" href="cart.html"><i
						class="icon-arrow-left"></i><span class="hidden-xs-down">&nbsp;Back
							To Cart</span></a><button id="check_module" class="btn btn-primary" 
							type="button"><span
						class="hidden-xs-down">결제하기&nbsp;</span><i
						class="icon-arrow-right"></i></button>
				</div>
				<form method="post">
				<input type="text" name="ab">ab
				</form>
		</div>
	</div>
	<button type="button" onclick="cancelPay()">aaaa</button>
</body>


<script>
	$("#check_module").click(function() {
		var IMP = window.IMP; // 생략가능
		var order_no=$("#order_no").val();
		var orderer_name=$("#orderer_name").val();
		console.log(order_no);
		IMP.init('imp55782149');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			/*
			 'kakao':카카오페이,
			 html5_inicis':이니시스(웹표준결제)
			 'nice':나이스페이
			 'jtnet':제이티넷
			 'uplus':LG유플러스
			 'danal':다날
			 'payco':페이코
			 'syrup':시럽페이
			 'paypal':페이팔
			 */

			pay_method : 'card',
			/*
			 'samsung':삼성페이,
			 'card':신용카드,
			 'trans':실시간계좌이체,
			 'vbank':가상계좌,
			 'phone':휴대폰소액결제
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/*
			 merchant_uid에 경우
			 https://docs.iamport.kr/implementation/payment
			 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 참고하세요.
			 나중에 포스팅 해볼게요.
			 */
			name : '상품',
			//결제창에서 보여질 이름
			amount : 100,
			//가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '${orderer_name }',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		/*
		 모바일 결제시,
		 결제가 끝나고 랜딩되는 URL을 지정
		 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		 */
		}, function(rsp) {
			
			console.log(rsp);
			if (rsp.success) {
				jQuery.ajax({
					url:"${pageContext.request.contextPath}/paymentInsert",
					
					data:{
						imp_uid : rsp.imp_uid,
						"pg" :rsp.pg,
						"pay_method":rsp.card,
			            "order_no":order_no,
			            "payment_amount":rsp.paid_amount,
			            "payer_name":orderer_name,
			            "payment_status":rsp.status,
			            "mid_num":rsp.merchant_uid
			        },
					type:"post",
					dataType:"json",
				}).done(function(data) {
					//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( rsp.success ) {
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						msg += 'pay_method : ' + rsp.pay_method;
						
						alert(msg);
						location.href = "${pageContext.request.contextPath}/paymentSuccess?order_no="+order_no;
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				location.href = "${pageContext.request.contextPath}/paymentFail?order_no="+order_no;
			}
			alert(msg);
		});
	});
	
	
		
</script>
</html>
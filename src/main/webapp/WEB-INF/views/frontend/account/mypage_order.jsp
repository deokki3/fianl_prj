<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.table-responsive a {width:120px;}
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
	
	<!-- 주문내역 -->
	
	<div class="col-lg-9 col-md-8 order-md-2" id="parent">
		<div id="order_cc">
		<h6 class="text-muted text-lg text-uppercase">주문내역</h6>
		<hr class="margin-bottom-1x">
		<!--  <div class="table-responsive wishlist-table mb-0">-->
		<div class="table-responsive mb-0">
			<table class="table" >
				<thead>
					<tr>
						<th class="text-center col-md-1">주문번호</th>
						<th class="text-center col-md-2">이미지</th>
						<th class="text-center col-md-2">주문상품</th>
						<th class="text-center col-md-2">주문일시</th>
						<th class="text-center col-md-1">주문금액</th>
						<th class="text-center col-md-2">상태</th>
						<th class="text-center col-md-2"></th>
					</tr>
				</thead>
				<tbody id="myOrderList">
						<c:forEach var="vo" items="${myOrderList }">
				   	<!--  
						<tr>
								<td class="text-center text-lg">${vo.order_no }</td>
								<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/${vo.img_name_save}' />" alt="<c:url value='/upload/product_img/${vo.img_name_save}' />" /></td>
								<td class="text-center text-lg">${vo.product_name }</td>
								<td class="text-center text-lg">${vo.order_date }</td>
								<td class="text-center text-lg">${vo.tot_price }</td>
								<td class="text-center text-lg">${vo.order_status }</td>
								<c:if test="${vo.order_status =='결제 대기'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>결제하기</a>
										<a class="btn btn-sm btn-outline-info" id="order_cc" onclick="delchk(${vo.order_no})" >주문취소</a></td>
									<td class="text-center text-lg"></td>
									
								</c:if>
								<c:if test="${vo.order_status =='배송 준비중'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>주문조회</a>
										<a class="btn btn-sm btn-outline-info" id="order_cc2" href="#">주문취소</a></td>
									<td class="text-center text-lg"></td>
									
								</c:if>
								<c:if test="${vo.order_status =='배송중'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>배송조회</a>
										<a class="btn btn-sm btn-outline-info" href="#">주문취소</a></td>
									<td class="text-center text-lg"></td>
									
								</c:if>
								<c:if test="${vo.order_status =='배송 완료'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>배송조회</a>
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>교환,반품 신청</a>
										<a class="btn btn-sm btn-outline-success" href="#">후기 작성하기</a></td>
									<td class="text-center text-lg"></td>
								</c:if>
								<c:if test="${vo.order_status =='주문 취소'}">
									<td class="text-center text-lg">
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>취소 상세 보기</a>
										
									<td class="text-center text-lg"></td>
								</c:if>
								
						</tr>-->
						
					</c:forEach>
					<tr>	
						<td>
						<div class="product-item"><a class="product-thumb" href="#"><img src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/cart/01.jpg" alt=""></a>
							<div class="product-info">
							<h4 class="product-title"><a href="#">상품명</a></h4>
								<div class="text-lg mb-1">가격</div>
									<div class="text-sm">개수 :
										<div class="d-inline">1</div>
									</div>
								</div>
							</div>
						</td>
						<td class="text-center"><button class="btn btn-link-secondary">후기작성</button></td>
					</tr>
				</tbody>
			</table>
			</div>
			
		</div>
	</div>
	
</div>
	<div>
				<iframe title="하단광고" scrolling="no" frameborder="0" marginheight="0" parginwidth="0"
				width="100%" src="http://ad.danawa.com/RealMedia/ads/adstream_sx.ads/www.danawa.com/blog_BABY@Middle1"></iframe>
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
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script type="text/javascript">
	
	function order_cc(order_no){
		var result = confirm("주문을 취소하시겠습니까?");
		if (result) {
			$.ajax({
				url:"${pageContext.request.contextPath}/OrderCC",
				dataType:"json",
				data:{"order_no" : order_no},
				Type:'post',
				success:function(data){
				
					alert("주문이 취소되었습니다.");
					list();
				},error:function(request, status, error){

					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

				}
			});
		} else {
			   event.preventDefault ();
		}
		
	};
	
	//주문 취소 페이지
	function order_payment_cc(order_no){
		var result = confirm("주문 취소 페이지로 이동하시겠습니까?");
		var order_cc_schedule_date="";
		var today=moment().format("YYYY-MM-DD");
		if (result) {
			$(".col-lg-9").empty();
			$(".table").empty(); 
			$("#myOrderList").empty();
			$(".text-muted").empty(); 
			$.ajax({
				url:"${pageContext.request.contextPath}/OrderPaymentCC",
				dataType:"json",
				data:{"order_no" : order_no},
				Type:'post',
				success:function(data){
					
					$(".col-lg-9").append(
						`
						<h6 class="text-muted text-lg text-uppercase">주문취소</h6>
								<hr class="margin-bottom-1x">
						<form style="margin-bottom:80px;" id="order_cc_sub" name="order_cc_sub" class="card" method="post" action="${pageContext.request.contextPath }/abcd">
							<h4 class="margin-bottom-3x text-center" style="margin-top:50px;">주문취소 test</h4>
							<div class="table-responsive mb-0">
								<h5 class="text-muted text-lg text-uppercase" style="margin-left:20px;">주문상세 정보</h5>
								<table class="table" >
								</table>
								<div id="order_cc">
								</div>
							</div>
							<input type="hidden" name="order_no" value="\${order_no}">
							<input type="hidden" name="od_cc_application_date" value="\${today}">
						</form>
						`
					);
					
					
					$(".table").append(
							`
							<thead>
								<tr>
									<th class="text-center col-md-1">주문번호</th>
									<th class="text-center col-md-2">이미지</th>
									<th class="text-center col-md-2">주문상품</th>
									<th class="text-center col-md-2">주문일시</th>
									<th class="text-center col-md-1">주문금액</th>
									<th class="text-center col-md-2">상태</th>
								</tr>
							</thead>
							<tbody id="myOrderList">
							</tbody>
							`
					);
					
						$(data.searchOrder).each(function(i,d){
							
							let product_name=d.product_name;
							let img_name_save=d.img_name_save;
							let order_date=moment(d.order_date).format("YYYY-MM-DD");
							let order_cc_date=moment(moment(), "HHmmss").add(3, 'days').toDate();
							order_cc_schedule_date=moment(order_cc_date).format("YYYY-MM-DD");
							console.log(order_cc_schedule_date);
							let product_count=d.product_count;
							let tot_price=d.tot_price;
							let order_status=d.order_status;
							
								
							
							$("#myOrderList").append(
									`
									<tr>
										<td class="text-center text-lg">\${order_no}</td>
										<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${img_name_save}' />" /></td>
										<td class="text-center text-lg">\${product_name}</td>
										<td class="text-center text-lg">\${order_date}</td>
										<td class="text-center text-lg">\${tot_price}</td>
										<td class="text-center text-lg">\${order_status}</td>
									</tr>	
									`
							);
							
							
						
						
						});
						
						
						
						$("#order_cc").append(
							`
							<div class="col-lg">
								<div class="row">
									<div class="col-md">
									
											<div class="card-body" style="margin-top:10px;">
												
												<div class="form-group input-group">
												<h5 class="margin-bottom-2x text-center">주문취소 사유 선택</h5>	
													<select class="form-control" id="select" onchange="changeSelect();" style="margin-bottom:50px;">
														<option value='noselect' selected>-- 취소사유 선택 --</option>
														<option value='단순 변심'>단순 변심</option>
														<option value='상품 품절'>상품 품절</option>
														<option value='다른 상품 재주문'>다른 상품 재주문</option>
														<option value='직접 입력'>직접 입력</option>
													</select>
													<h5 class="margin-bottom-2x text-center">주문취소 사유</h5>
													<textarea name="od_cc_reason" style="margin-bottom:50px;" class="form-control" cols="500" rows="10" 
													 id="cancelReason" style="margin-top:10px;" readonly="readonly" placeholder=""/></textarea>
													<form:errors path="id" cssClass="errormsg" />
												</div>
												<div class="form-group input-group" style="margin-bottom:50px;">
													<h5 class="margin-bottom-2x text-center" style="margin-top:50px;">주문취소 처리 예정일</h5>
													<input class="form-control" type="text" readonly="readonly" path="test" value="\${order_cc_schedule_date}" placeholder=""/>
													<errors path="password" cssClass="errormsg" />
												</div>
												<div class="form-group input-group">
													
													<input class="form-control" type="hidden" path="mem_no"/>
													
												</div>
												<div class="text-center text-sm-right">
													<button class="btn btn-primary margin-bottom-none" id="order_cc_btn">주문 취소</button>
												</div>
											</div>
									
									</div>
								</div>
							</div>
							`
						);
				},error:function(request, status, error){
	
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	
					}
				});
		} else {
			   event.preventDefault ();
		}
		
	};
	
	function purchase(order_no){
		location.href="${pageContext.request.contextPath}/purchase2?order_no="+order_no;
	}

	
	window.onload = function () { 
		list();
	}

	
	
	function list(){
		console.log("here");
		$("#myOrderList").empty();
		$.ajax({
			url:"${pageContext.request.contextPath}/account/mypage_order2",
			dataType:"json",
			success:function(data){
				console.log("success");
				//data.myOrderList[0].num
				$(data.myOrderList).each(function(i,d){
						let order_no=d.order_no;
						let product_name=d.product_name;
						let img_name_save=d.img_name_save;
						let order_date=moment(d.order_date).format("YYYY-MM-DD");
						let product_count=d.product_count;
						let tot_price=d.tot_price;
						let order_status=d.order_status;
						if(order_status=="결제 대기"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${img_name_save}' />" /></td>
									<td class="text-center text-lg">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
									
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" onclick="purchase(\${order_no})" style=margin-bottom:5px;>결제하기</a>
									<a class="btn btn-sm btn-outline-info" id="order_cc" onclick="order_cc(\${order_no})" >주문취소</a></td>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						if(order_status=="배송 완료"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${img_name_save}' />" /></td>
									<td class="text-center text-lg">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
	
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>배송조회</a>
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>교환,반품 신청</a>
										<a class="btn btn-sm btn-outline-success" href="#">후기 작성하기</a></td>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						if(order_status=="배송 준비중"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${img_name_save}' />" /></td>
									<td class="text-center text-lg">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
									
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>주문조회</a>
										<a class="btn btn-sm btn-outline-info" id="order_payment_cc" onclick="order_payment_cc(\${order_no})">주문취소</a></td>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						
						if(order_status=="배송중"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${img_name_save}' />" /></td>
									<td class="text-center text-lg">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
										
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>배송조회</a>
										<a class="btn btn-sm btn-outline-info" href="#">주문취소</a></td>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}

						if(order_status=="취소 완료"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${img_name_save}' />" /></td>
									<td class="text-center text-lg">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
										
									<td class="text-center text-lg">
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>상세 보기</a>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						
						if(order_status=="취소 접수"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${img_name_save}' />" /></td>
									<td class="text-center text-lg">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
										
									<td class="text-center text-lg">
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>상세 보기</a>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
				});
			},error:function(request, status, error){

				alert("code:"+request.status+"error:"+error);

			}
		});
	}
	
	function changeSelect(){
		var select=$("#select option:selected").text();
		if(select=="-- 취소사유 선택 --"){
			$("#cancelReason").val("").prop("selected", true);
			document.getElementById("cancelReason").readOnly= true;
		}
		if(select=="단순 변심"){
			$("#cancelReason").val("단순 변심").prop("selected", true);
			document.getElementById("cancelReason").readOnly= true;
		}
		if(select=="상품 품절"){
			$("#cancelReason").val("상품 품절").prop("selected", true);
			document.getElementById("cancelReason").readOnly= true;
		}
		if(select=="다른 상품 재주문"){
			$("#cancelReason").val("다른 상품 재주문").prop("selected", true);
			document.getElementById("cancelReason").readOnly= true;
		}
		if(select=="직접 입력"){
			document.getElementById("cancelReason").readOnly= false;
			$("#cancelReason").val("");
			document.getElementById("cancelReason").focus();
		}
		
	}
	$("#parent").on('click',"#order_cc_btn",function(){
		if($("#cancelReason").val()==""){
			alert("주문 취소 사유를 입력하세요.");
			return false;
		}else{
			alert($("#cancelReason").val());
			console.log($("#order_cc_sub"));
			$("#order_cc_sub").submit();
		}
	});

	
	/*function cancelSubmit(){
		alert(document.getElementById("order_cc_sub"));
		document.order_cc_sub.submit();
	}*/
	</script>
</body>
</html>
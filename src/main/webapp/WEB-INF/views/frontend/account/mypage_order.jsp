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
	#cancelReason{
		cursor:default;
	}
	
	#returnReason{
		cursor:default;
	}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


<!-- ????????? ????????? -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>???????????????</h1>
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
<!-- ????????? ????????? ??? -->


<!-- ????????? ????????? -->
<div class="container padding-bottom-3x mb-2">
<div class="row">
	<!-- mypage_sidebar -->
	<jsp:include page="/WEB-INF/views/frontend/account/inc/mypage_sidebar.jsp"/>
	
	<!-- ???????????? -->
	
	<div class="col-lg-9 col-md-8 order-md-2" id="parent">
		<div id="order_cc">
		<h6 class="text-muted text-lg text-uppercase">????????????</h6>
		<hr class="margin-bottom-1x">
		<!--  <div class="table-responsive wishlist-table mb-0">-->
		<div class="table-responsive mb-0">
			<table class="table" id="t">
				<thead>
					<tr>
						<th class="text-center col-md-1">????????????</th>
						<th class="text-center col-md-2">?????????</th>
						<th class="text-center col-md-2">????????????</th>
						<th class="text-center col-md-2">????????????</th>
						<th class="text-center col-md-1">????????????</th>
						<th class="text-center col-md-2">??????</th>
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
								<c:if test="${vo.order_status =='?????? ??????'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>????????????</a>
										<a class="btn btn-sm btn-outline-info" id="order_cc" onclick="delchk(${vo.order_no})" >????????????</a></td>
									<td class="text-center text-lg"></td>
									
								</c:if>
								<c:if test="${vo.order_status =='?????? ?????????'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>????????????</a>
										<a class="btn btn-sm btn-outline-info" id="order_cc2" href="#">????????????</a></td>
									<td class="text-center text-lg"></td>
									
								</c:if>
								<c:if test="${vo.order_status =='?????????'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>????????????</a>
										<a class="btn btn-sm btn-outline-info" href="#">????????????</a></td>
									<td class="text-center text-lg"></td>
									
								</c:if>
								<c:if test="${vo.order_status =='?????? ??????'}">
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>????????????</a>
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>??????,?????? ??????</a>
										<a class="btn btn-sm btn-outline-success" href="#">?????? ????????????</a></td>
									<td class="text-center text-lg"></td>
								</c:if>
								<c:if test="${vo.order_status =='?????? ??????'}">
									<td class="text-center text-lg">
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>?????? ?????? ??????</a>
										
									<td class="text-center text-lg"></td>
								</c:if>
								
						</tr>-->
						
					</c:forEach>
					
				</tbody>
			</table>
				<div id="paging"></div>
			</div>
			
		</div>
	</div>
	
	
</div>
	
	<div>
		<iframe title="????????????" scrolling="no" frameborder="0" marginheight="0" parginwidth="0"
		width="100%" style="margin-top:50px;" src="http://ad.danawa.com/RealMedia/ads/adstream_sx.ads/www.danawa.com/blog_BABY@Middle1"></iframe>
	</div>
</div>
<!-- ????????? ????????? ??? -->


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
		var result = confirm("????????? ?????????????????????????");
		if (result) {
			$.ajax({
				url:"${pageContext.request.contextPath}/OrderCC",
				dataType:"json",
				data:{"order_no" : order_no},
				Type:'post',
				success:function(data){
				
					alert("????????? ?????????????????????.");
					list();
				},error:function(request, status, error){

					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

				}
			});
		} else {
			   event.preventDefault ();
		}
		
	};
	
	//?????? ?????? ?????????
	function order_cc_info(order_no){
			$(".col-lg-9").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/orderCCInfo",
				dataType:"json",
				data:{"order_no" : order_no},
				Type:'post',
				success:function(data){
					$(".col-lg-9").append(
							`
							<h6 class="text-muted text-lg text-uppercase">?????? ??????</h6>
									<hr class="margin-bottom-1x">
							<h4 class="margin-bottom-3x text-center" style="margin-top:50px;">?????? ??????</h4>
								<div class="table-responsive mb-0">
									<h5 class="text-muted text-lg text-uppercase" style="margin-left:20px;">?????? ?????? ??????</h5>
									<table class="table" >
									</table>
									<div id="order_cc">
									</div>
								</div>
							`
					)}
					
				})
		
	}
	
	//?????? ?????????
	function order_return(order_no){
		var result = confirm("?????? ?????? ???????????? ?????????????????????????");
		var return_schedule_date="";
		var today=moment().format("YYYY-MM-DD");
		if (result) {
			$(".col-lg-9").empty();
			$(".table").empty(); 
			$("#myOrderList").empty();
			$(".text-muted").empty(); 
			$.ajax({
				url:"${pageContext.request.contextPath}/orderReturn",
				dataType:"json",
				data:{"order_no" : order_no},
				Type:'post',
				success:function(data){
					
					$(".col-lg-9").append(
						`
						<h6 class="text-muted text-lg text-uppercase">?????? ??????</h6>
								<hr class="margin-bottom-1x">
						<form style="margin-bottom:80px;" id="return_sub" name="return_sub" class="card" method="post" action="${pageContext.request.contextPath }/orderReturnSuccess">
							<h4 class="margin-bottom-3x text-center" style="margin-top:50px;">?????? ??????</h4>
							<div class="table-responsive mb-0">
								<h5 class="text-muted text-lg text-uppercase" style="margin-left:20px;">???????????? ??????</h5>
								<table class="table" >
								</table>
								<div id="order_cc">
								</div>
							</div>
							<input type="hidden" name="order_no" value="\${order_no}">
							<input type="hidden" name="return_application_date" value="\${today}">
						</form>
						`
					);
					
					
					$(".table").append(
							`
							<thead>
								<tr>
									<th class="text-center col-md-1">????????????</th>
									<th class="text-center col-md-2">?????????</th>
									<th class="text-center col-md-2">????????????</th>
									<th class="text-center col-md-2">????????????</th>
									<th class="text-center col-md-1">????????????</th>
									<th class="text-center col-md-2">??????</th>
								</tr>
							</thead>
							<tbody id="myOrderList">
							</tbody>
							`
					);
					
						$(data.searchOrder).each(function(i,d){
							
							let product_name=d.product_name;
							let img_name_save=d.img_name_save;
							let uploadPath=d.uploadPath;
							let order_date=moment(d.order_date).format("YYYY-MM-DD");
							let return_date=moment(moment(), "HHmmss").add(3, 'days').toDate();
							return_schedule_date=moment(return_date).format("YYYY-MM-DD");
							console.log(return_schedule_date);
							let product_count=d.product_count;
							let tot_price=d.tot_price;
							let order_status=d.order_status;
							
								
							
							$("#myOrderList").append(
									`
									<tr>
										<td class="text-center text-lg">\${order_no}</td>
										<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
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
												<h5 class="margin-bottom-2x text-center">?????? ?????? ??????</h5>	
													<select class="form-control" id="returnSelect" onchange="returnReason2();" style="margin-bottom:50px;">
														<option value='noselect' selected>-- ???????????? ?????? --</option>
														<option value='?????? ??????'>?????? ??????</option>
														<option value='??????/?????????/?????? ??????'>??????/?????????/?????? ??????</option>
														<option value='??????/????????? ?????? ??????'>??????/????????? ?????? ??????</option>
														<option value='?????? ??????/??????'>?????? ??????/??????</option>
														<option value='???????????? ??????'>???????????? ??????</option>
														<option value='?????? ??????'>?????? ??????</option>
													</select>
													<h5 class="margin-bottom-2x text-center">???????????? ??????</h5>
													<textarea name="return_reason" style="margin-bottom:50px;" class="form-control" cols="500" rows="10" 
													 id="returnReason" style="margin-top:10px;" readonly="readonly"
													 placeholder=""/></textarea>
													<form:errors path="id" cssClass="errormsg" />
												</div>
												<div class="form-group input-group" style="margin-bottom:50px;">
													<h5 class="margin-bottom-2x text-center" style="margin-top:50px;">???????????? ?????? ?????????</h5>
													<input class="form-control" type="text" readonly="readonly" style="cursor:default"
													 path="test" value="\${return_schedule_date}" placeholder=""/>
													<errors path="password" cssClass="errormsg" />
												</div>
												<div class="form-group input-group">
													
													<input class="form-control" type="hidden" path="mem_no"/>
													
												</div>
												<div class="text-center text-sm-right">
													<button class="btn btn-primary margin-bottom-none" id="return_btn">?????? ??????</button>
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
	}
	
	
	//?????? ?????? ?????????
	function order_payment_cc(order_no){
		var result = confirm("?????? ?????? ???????????? ?????????????????????????");
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
						<h6 class="text-muted text-lg text-uppercase">????????????</h6>
								<hr class="margin-bottom-1x">
						<form style="margin-bottom:80px;" id="order_cc_sub" name="order_cc_sub" class="card" method="post" action="${pageContext.request.contextPath }/orderCancelSuccess">
							<h4 class="margin-bottom-3x text-center" style="margin-top:50px;">????????????</h4>
							<div class="table-responsive mb-0">
								<h5 class="text-muted text-lg text-uppercase" style="margin-left:20px;">???????????? ??????</h5>
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
									<th class="text-center col-md-1">????????????</th>
									<th class="text-center col-md-2">?????????</th>
									<th class="text-center col-md-2">????????????</th>
									<th class="text-center col-md-2">????????????</th>
									<th class="text-center col-md-1">????????????</th>
									<th class="text-center col-md-2">??????</th>
								</tr>
							</thead>
							<tbody id="myOrderList">
							</tbody>
							`
					);
					
						$(data.searchOrder).each(function(i,d){
							
							let product_name=d.product_name;
							let img_name_save=d.img_name_save;
							let uploadPath = d.uploadPath;
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
										<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
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
												<h5 class="margin-bottom-2x text-center">???????????? ?????? ??????</h5>	
													<select class="form-control" id="select" onchange="changeSelect();" style="margin-bottom:50px;">
														<option value='noselect' selected>-- ???????????? ?????? --</option>
														<option value='?????? ??????'>?????? ??????</option>
														<option value='?????? ??????'>?????? ??????</option>
														<option value='?????? ?????? ?????????'>?????? ?????? ?????????</option>
														<option value='?????? ??????'>?????? ??????</option>
													</select>
													<h5 class="margin-bottom-2x text-center">???????????? ??????</h5>
													<textarea name="od_cc_reason" style="margin-bottom:50px;" class="form-control" cols="500" rows="10" 
													 id="cancelReason" style="margin-top:10px;" readonly="readonly" style="cursor:default"
													 placeholder=""/></textarea>
													<form:errors path="id" cssClass="errormsg" />
												</div>
												<div class="form-group input-group" style="margin-bottom:50px;">
													<h5 class="margin-bottom-2x text-center" style="margin-top:50px;">???????????? ?????? ?????????</h5>
													<input class="form-control" type="text" style="cursor:default"
													 readonly="readonly" path="test" value="\${order_cc_schedule_date}" placeholder=""/>
													<errors path="password" cssClass="errormsg" />
												</div>
												<div class="form-group input-group">
													
													<input class="form-control" type="hidden" path="mem_no"/>
													
												</div>
												<div class="text-center text-sm-right">
													<button class="btn btn-primary margin-bottom-none" id="order_cc_btn">?????? ??????</button>
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
	
	var pageNum=1;
	
	function list(){
		console.log("here");
		$("#myOrderList").empty();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/account/mypage_order2?pageNum="+pageNum,
			dataType:"json",
			success:function(data){
				console.log("success");
				//data.myOrderList[0].num
					$(data.pu).each(function(i,d){
						console.log("aa");
						let startPageNum=d.startPageNum;
						let endPageNum=d.endPageNum;
						pageNum=d.pageNum;
						console.log(d.pageNum);
						let prevPage=d.prevPage;
						let nextPage=d.nextPage;
						console.log(startPageNum);
						console.log(nextPage);
						console.log(prevPage);
						$("#paging").append(
								`	
								<!-- ????????? -->
								<nav class="pagination" style="margin-top:20px;">
									<div class="column">
										<c:choose>
											<c:when test="\${prevPage }">
												<a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/account/mypage_order2?pageNum=\${pu.pageNum-1 }"><i class="icon-chevron-left"></i> ??????</a>
											</c:when>
											<c:otherwise>
												<a class="btn btn-outline-secondary btn-sm disabled"><i class="icon-chevron-left"></i> ??????</a>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="column">
									<ul class="pages" style="margin-top:20px;">
									</ul>
									`
									);
									 for(var i=startPageNum;i<endPageNum;i++){
										if(pageNum==i){
											$(".pages").append(
											`
											<li class="active">
											<a href="${pageContext.request.contextPath}/account/mypage_order3?pageNum=\${i }">\${i }</a>
											</li>
											`
											);
										}else{
											$(".pages").append(
											`
											<li>
												<a href="${pageContext.request.contextPath}/account/mypage_order3?pageNum=\${i }">\${i }</a>
											</li>
											`
											);
										}
									}
									+
									`
									
									
									</ul>
									</div>
									<div class="column">
										<c:choose>
											<c:when test="\${pu.nextPage }">
												<a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/account/mypage_order2?pageNum=\${pu.pageNum+1 }">?????? <i class="icon-chevron-right"></i></a>
											</c:when>
											<c:otherwise>
												<a class="btn btn-outline-secondary btn-sm disabled">?????? <i class="icon-chevron-right"></i></a>
											</c:otherwise>
										</c:choose>
									</div>
								</nav>
								`
							
					});
	
				$(data.myOrderList).each(function(i,d){
						let order_no=d.order_no;
						let product_name=d.product_name;
						let img_name_save=d.img_name_save;
						let uploadPath=d.uploadPath;
						let order_date=moment(d.order_date).format("YYYY-MM-DD");
						let product_count=d.product_count;
						let tot_price=d.tot_price;
						let product_id=d.product_id;
						let category_id=d.category_id;
						let order_status=d.order_status;
						if(order_status=="?????? ??????"){
							
							$("#myOrderList").append(
								`
								<tr>
									<td class="od_no text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
									<td class="text-center text-lg" style="font-size:12px;">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
									
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" onclick="purchase(\${order_no})" style=margin-bottom:5px;>????????????</a>
									<a class="btn btn-sm btn-outline-info" id="order_cc" onclick="order_cc(\${order_no})" >????????????</a></td>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						if(order_status=="?????? ??????"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
									<td class="text-center text-lg" style="font-size:12px;">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
	
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>????????????</a>
										<a class="btn btn-sm btn-outline-info" onclick="order_return(\${order_no})" style=margin-bottom:5px;>?????? ??????</a>
										<a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/shop/product_detail?n=\${product_id}&m=\${category_id}">?????? ????????????</a></td>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						if(order_status=="?????? ?????????"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
									<td class="text-center text-lg" style="font-size:12px;">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
									
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>????????????</a>
										<a class="btn btn-sm btn-outline-info" id="order_payment_cc" onclick="order_payment_cc(\${order_no})">????????????</a></td>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						
						if(order_status=="?????????"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
									<td class="text-center text-lg" style="font-size:12px;">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
										
									<td class="text-center text-lg"><a class="btn btn-sm btn-outline-warning" href="#" style=margin-bottom:5px;>????????????</a>
										<a class="btn btn-sm btn-outline-info" href="#">????????????</a></td>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}

						if(order_status=="?????? ??????"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
									<td class="text-center text-lg" style="font-size:12px;">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
										
									<td class="text-center text-lg">
										<a class="btn btn-sm btn-outline-info" href="${pageContext.request.contextPath}/orderCCInfo?order_no=\${order_no }" style=margin-bottom:5px;>?????? ??????</a>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						
						if(order_status=="?????? ??????"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
									<td class="text-center text-lg" style="font-size:12px;">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
										
									<td class="text-center text-lg">
										<a class="btn btn-sm btn-outline-info" href="#" style=margin-bottom:5px;>?????? ??????</a>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						
						if(order_status=="?????? ??????"){
							$("#myOrderList").append(
								`
								<tr>
									<td class="text-center text-lg">\${order_no }</td>
									<td class="text-center text-lg"><img width=100; height=100; src="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" alt="<c:url value='/upload/product_img/\${uploadPath}/\${img_name_save}' />" /></td>
									<td class="text-center text-lg" style="font-size:12px;">\${product_name }</td>
									<td class="text-center text-lg">\${order_date }</td>
									<td class="text-center text-lg">\${tot_price }</td>
									<td class="text-center text-lg">\${order_status }</td>
										
									<td class="text-center text-lg">
										<a class="btn btn-sm btn-outline-info" href="${pageContext.request.contextPath}/orderCCInfo?order_no=\${order_no }" style=margin-bottom:5px;>?????? ??????</a>
									<td class="text-center text-lg"></td>
								</tr>
								`
							);
						}
						
						$('.table').rowspan(0);
				});
			},error:function(request, status, error){

				alert("code:"+request.status+"error:"+error);

			}
		});
	}
	
	//?????? ?????? ??????
	function changeSelect(){
		var select=$("#select option:selected").text();
		if(select=="-- ???????????? ?????? --"){
			$("#cancelReason").val("").prop("selected", true);
			document.getElementById("cancelReason").readOnly= true;
		}
		if(select=="?????? ??????"){
			$("#cancelReason").val("?????? ??????").prop("selected", true);
			document.getElementById("cancelReason").readOnly= true;
		}
		if(select=="?????? ??????"){
			$("#cancelReason").val("?????? ??????").prop("selected", true);
			document.getElementById("cancelReason").readOnly= true;
		}
		if(select=="?????? ?????? ?????????"){
			$("#cancelReason").val("?????? ?????? ?????????").prop("selected", true);
			document.getElementById("cancelReason").readOnly= true;
		}
		if(select=="?????? ??????"){
			document.getElementById("cancelReason").readOnly= false;
			$("#cancelReason").val("");
			document.getElementById("cancelReason").focus();
			document.getElementById("cancelReason").style.cursor="text";
		}
		
	}
	
	//?????? ??????
	function returnReason2(){
		var select=$("#returnSelect option:selected").text();
		if(select=="-- ???????????? ?????? --"){
			$("#returnReason").val("").prop("selected", true);
			document.getElementById("returnReason").readOnly= true;
			document.getElementById("returnReason").style.cursor="default";
		}
		if(select=="?????? ??????"){
			$("#returnReason").val("?????? ??????").prop("selected", true);
			document.getElementById("returnReason").readOnly= true;
			document.getElementById("returnReason").style.cursor="default";
		}
		if(select=="??????/?????????/?????? ??????"){
			$("#returnReason").val("??????/?????????/?????? ??????").prop("selected", true);
			document.getElementById("returnReason").readOnly= true;
			document.getElementById("returnReason").style.cursor="default";
		}
		if(select=="??????/????????? ?????? ??????"){
			$("#returnReason").val("??????/????????? ?????? ??????").prop("selected", true);
			document.getElementById("returnReason").readOnly= true;
			document.getElementById("returnReason").style.cursor="default";
		}
		if(select=="?????? ??????/??????"){
			$("#returnReason").val("?????? ??????/??????").prop("selected", true);
			document.getElementById("returnReason").readOnly= true;
			document.getElementById("returnReason").style.cursor="default";
		}
		if(select=="???????????? ??????"){
			$("#returnReason").val("???????????? ??????").prop("selected", true);
			document.getElementById("returnReason").readOnly= true;
			document.getElementById("returnReason").style.cursor="default";
		}
		if(select=="?????? ??????"){
			document.getElementById("returnReason").readOnly= false;
			$("#returnReason").val("");
			document.getElementById("returnReason").focus();
			document.getElementById("returnReason").style.cursor="text";
		}
		
	}
	
	$("#parent").on('click',"#order_cc_btn",function(){
		if($("#cancelReason").val()==""){
			alert("?????? ?????? ????????? ???????????????.");
			return false;
		}else{
			var result = confirm("????????? ?????? ?????? ???????????????????");
			if(reult){
				$("#order_cc_sub").submit();
				alert("?????? ?????? ????????? ?????????????????????.");
			}else{
				event.preventDefault ();
			}
		}
	});
	
	$.fn.rowspan = function(colIdx, isStats) {       
	    return this.each(function(){      
	        var that;     
	        $('tr', this).each(function(row) {      
	            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
	                 
	                if ($(this).html() == $(that).html()
	                    && (!isStats 
	                            || isStats && $(this).prev().html() == $(that).prev().html()
	                            )
	                    ) {            
	                    rowspan = $(that).attr("rowspan") || 1;
	                    rowspan = Number(rowspan)+1;
	 
	                    $(that).attr("rowspan",rowspan);
	                    // do your action for the colspan cell here            
	                    $(this).hide();
	                    $(that).parent().children().eq(3).attr("rowspan",rowspan);
	                    $(this).parent().children().eq(3).hide();
	                    $(that).parent().children().eq(4).attr("rowspan",rowspan);
	                    $(this).parent().children().eq(4).hide();
	                    $(that).parent().children().eq(5).attr("rowspan",rowspan);
	                    $(this).parent().children().eq(5).hide();
	                    $(that).parent().children().eq(6).attr("rowspan",rowspan);
	                    $(this).parent().children().eq(6).hide();
                     
	                    //$(this).remove(); 
	                    // do your action for the old cell here
	                     
	                } else {            
	                    that = this;         
	                }          
	                 
	                // set the that if not already set
	                that = (that == null) ? this : that;      
	            });     
	        });    
	    });  
	}; 
	
	$("#parent").on('click',"#return_btn",function(){
		if($("#returnReason").val()==""){
			alert("?????? ????????? ???????????????.");
			return false;
		}else{
			var result = confirm("????????? ?????? ?????? ???????????????????");
			if(reult){
				$("#return_sub").submit();
				alert("?????? ????????? ?????????????????????.");
			}else{
				event.preventDefault ();
			}
		}
	});
	
	window.onload = function () { 
		var a = '${pageNum3}';
		if(a){
			pageNum=a;
		}
		
		list();
		

	}


	/*function cancelSubmit(){
		alert(document.getElementById("order_cc_sub"));
		document.order_cc_sub.submit();
	}*/
	</script>
</body>
</html>
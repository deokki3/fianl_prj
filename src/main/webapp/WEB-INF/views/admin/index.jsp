<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>ADMIN</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN core-css ================== -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/css/vendor.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
	
	<!-- ================== BEGIN page-css ================== -->
	<link href="${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/plugins/nvd3/build/nv.d3.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
	<!-- ================== END page-css ================== -->
	
</head>
<body>
	<!-- BEGIN #loader -->
	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	<!-- END #loader -->
	<!-- BEGIN #app -->
	<div id="app" class="app app-header-fixed app-sidebar-fixed">
	<jsp:include page="inc/header.jsp" />

		<jsp:include page="inc/sidebar.jsp" />
		
		<!-- BEGIN #content -->
		<div id="content" class="app-content">
			<!-- BEGIN page-header -->
			<h1 class="page-header mb-3">DASHBOARD</h1>
			<!-- END page-header -->
			<!-- BEGIN daterange-filter -->
			<div class="d-sm-flex align-items-center mb-3">
				<a href="#" class="btn btn-inverse me-2 text-truncate" id="daterange-filter">
					<i class="fa fa-calendar fa-fw text-white-transparent-5 ms-n1"></i> 
					<span></span>
					<b class="caret ms-1 opacity-5"></b>
				</a>
			</div>
			<!-- END daterange-filter -->
			<!-- BEGIN row -->
			<div class="row">
				<!-- BEGIN col-6 -->
				<div class="col-xl-6">
					<!-- BEGIN card -->
					<div class="card border-0 mb-3 overflow-hidden bg-gray-800 text-white">
						<!-- BEGIN card-body -->
						<div class="card-body">
							<!-- BEGIN row -->
							<div class="row">
								<!-- BEGIN col-7 -->
								<div class="col-xl-7 col-lg-8">
									<!-- BEGIN title -->
									<div class="mb-3 text-gray-500">
										<b>??? ??????</b>
									</div>
									<!-- END title -->
									<!-- BEGIN total-sales -->
									<div class="d-flex mb-1">
										<h2 class="mb-0">???<span id="tot_sales"  data-value="500000">0.00</span></h2>
										<div class="ms-auto mt-n1 mb-n1"><div id="total-sales-sparkline"></div></div>
									</div>
									<!-- END total-sales -->
									<hr class="bg-white-transparent-5" />
									<!-- BEGIN row -->
									<div class="row text-truncate">
										<!-- BEGIN col-6 -->
										<div class="col-6">
											<div class="fs-12px text-gray-500">??? ?????? ???</div>
											<div class="fs-18px mb-5px fw-bold" id="order_count"  data-value="0">0</div>
										</div>
										<!-- END col-6 -->
										<!-- BEGIN col-6 -->
										<div class="col-6">
											<div class="fs-12px text-gray-500">????????? ??????</div>
											<div class="fs-18px mb-5px fw-bold">???<span id="sales_per_order"  data-value="0.0">0.00</span></div>
										</div>
										<!-- END col-6 -->
									</div>
									<!-- END row -->
								</div>
								<!-- END col-7 -->
								<!-- BEGIN col-5 -->
								<div class="col-xl-5 col-lg-4 align-items-center d-flex justify-content-center">
									<img src="${pageContext.request.contextPath}/static/admin/assets/img/svg/img-1.svg" height="150px" class="d-none d-lg-block" />
								</div>
								<!-- END col-5 -->
							</div>
							<!-- END row -->
						</div>
						<!-- END card-body -->
					</div>
					<!-- END card -->
				</div>
				<!-- END col-6 -->
				<!-- BEGIN col-6 -->
				<div class="col-xl-6">
					<!-- BEGIN row -->
					<div class="row">
						<!-- BEGIN col-6 -->
						<div class="col-sm-6">
							<!-- BEGIN card -->
							<div class="card border-0 text-truncate mb-3 bg-gray-800 text-white">
								<!-- BEGIN card-body -->
								<div class="card-body">
									<!-- BEGIN title -->
									<div class="mb-3 text-gray-500">
										<b class="mb-3">?????? ?????? ??????</b> 
									</div>
									<!-- END title -->
									<!-- BEGIN conversion-rate -->
									<div class="d-flex align-items-center mb-1">
										<h2 class="text-white mb-0"><span id="paymentRate" data-value="0">0.00</span>%</h2>
										<div class="ms-auto">
											<div id="conversion-rate-sparkline"></div>
										</div>
									</div>
									<!-- END conversion-rate -->
									<!-- BEGIN percentage -->
									<div class="mb-4 text-gray-500 ">
						
									</div>
									<!-- END percentage -->
									<!-- BEGIN info-row -->
									<div class="d-flex mb-2">
										<div class="d-flex align-items-center">
											<i class="fa fa-circle text-red fs-8px me-2"></i>
											???????????? ??????
										</div>
										<div class="d-flex align-items-center ms-auto">
											<div class="w-50px text-end ps-2 fw-bold"><span id="cartCount" data-value="0">0</span></div>
										</div>
									</div>
									<!-- END info-row -->
									<!-- BEGIN info-row -->
									<div class="d-flex mb-2">
										<div class="d-flex align-items-center">
											<i class="fa fa-circle text-warning fs-8px me-2"></i>
											??? ?????? ???
										</div>
										<div class="d-flex align-items-center ms-auto">
											<div class="w-50px text-end ps-2 fw-bold"><span id="allOrderCount" data-value="0">0</span></div>
										</div>
									</div>
									<!-- END info-row -->
									<!-- BEGIN info-row -->
									<div class="d-flex">
										<div class="d-flex align-items-center">
											<i class="fa fa-circle text-lime fs-8px me-2"></i>
											?????? ??????
										</div>
										<div class="d-flex align-items-center ms-auto">								
											<div class="w-50px text-end ps-2 fw-bold"><span id="cancleCount" data-value="0">0</span></div>
										</div>
									</div>
									<!-- END info-row -->
								</div>
								<!-- END card-body -->
							</div>
							<!-- END card -->
						</div>
						<!-- END col-6 -->
						<!-- BEGIN col-6 -->
						<div class="col-sm-6">
							<!-- BEGIN card -->
							<div class="card border-0 text-truncate mb-3 bg-gray-800 text-white">
								<!-- BEGIN card-body -->
								<div class="card-body">
									<!-- BEGIN title -->
									<div class="mb-3 text-gray-500">
										<b class="mb-3">??? ?????? ???</b> 
									</div>
									<!-- END title -->
									<!-- BEGIN store-session -->
									<div class="d-flex align-items-center mb-1">
										<h2 class="text-white mb-0"><span id="allMemberCount" data-value="0">0</span></h2>
										<div class="ms-auto">
											<div id="store-session-sparkline"></div>
										</div>
									</div>
									<!-- END store-session -->
									<!-- BEGIN percentage -->
									<div class="mb-4 text-gray-500 ">
										
									</div>
									<!-- END percentage -->
									<!-- BEGIN info-row -->
									<div class="d-flex mb-2">
										<div class="d-flex align-items-center">
											<i class="fa fa-circle text-teal fs-8px me-2"></i>
											?????? ??????
										</div>
										<div class="d-flex align-items-center ms-auto">
											<div class="w-50px text-end ps-2 fw-bold"><span id="memberCount" data-value="0">0</span></div>
										</div>
									</div>
									<!-- END info-row -->
									<!-- BEGIN info-row -->
									<div class="d-flex mb-2">
										<div class="d-flex align-items-center">
											<i class="fa fa-circle text-blue fs-8px me-2"></i>
											?????? ?????????
										</div>
										<div class="d-flex align-items-center ms-auto">
											<div class="w-50px text-end ps-2 fw-bold"><span  data-value="0">${visit_count}</span></div>
										</div>
									</div>
									<!-- END info-row -->
									<!-- BEGIN info-row -->
									<div class="d-flex">
										<div class="d-flex align-items-center">
											<i class="fa fa-circle text-cyan fs-8px me-2"></i>
											?????????
										</div>
										<div class="d-flex align-items-center ms-auto">
											<div class="w-50px text-end ps-2 fw-bold"><span  data-value="0">0</span>%</div>
										</div>
									</div>
									<!-- END info-row -->
								</div>
								<!-- END card-body -->
							</div>
							<!-- END card -->
						</div>
						<!-- END col-6 -->
					</div>
					<!-- END row -->
				</div>
				<!-- END col-6 -->
			</div>
			<!-- END row -->
			<!-- BEGIN row -->
			<div class="row">
				<!-- BEGIN col-12 -->
				<div class="col-xl-12 col-lg-6">
					<!-- BEGIN card -->
					<div class="card border-0 mb-3 bg-gray-800 text-white">
						<!-- BEGIN card-body -->
						<div id="topSelling" class="card-body">
							<!-- BEGIN title -->
							<div class="mb-3 text-gray-500">
								<b>???????????? ??????</b>
							</div>
							<!-- END title -->
							
						</div>
						<!-- END card-body -->
					</div>
					<!-- END card -->
				</div>
				<!-- END col-12 -->
			</div>
			<!-- END row -->
		</div>
		<!-- END #content -->
		
		<!-- BEGIN scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top" data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
		<!-- END scroll to top btn -->
	</div>
	<!-- END #app -->
	
	<!-- ================== BEGIN core-js ================== -->
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/js/vendor.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/js/app.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/js/theme/default.min.js"></script>
	<!-- ================== END core-js ================== -->
	
		<!-- ================== BEGIN page-js ================== -->
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/d3/d3.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/nvd3/build/nv.d3.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap-world-mill.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/apexcharts/dist/apexcharts.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/moment/min/moment.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- ================== END page-js ================== -->
	<script>
	var handleDateRangeFilter = function() {
		$('#daterange-filter span').html(moment().subtract(7, 'days').format('YYYY-MM-DD') + ' - ' + moment().format('YYYY-MM-DD'));

		$('#daterange-filter').daterangepicker({
			format: 'YYYY-MM-DD',
			startDate: moment().subtract(7, 'days'),
			endDate: moment(),
			minDate: '2021/08/01',
			maxDate: moment(),
			dateLimit: { days: 60 },
			showDropdowns: true,
			showWeekNumbers: true,
			timePicker: false,
			timePickerIncrement: 1,
			timePicker12Hour: true,
			ranges: {
				'??????': [moment(), moment()],
				'??????': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'?????? 7 ??????': [moment().subtract(6, 'days'), moment()],
				'?????? 30 ??????': [moment().subtract(29, 'days'), moment()],
				'??????': [moment().startOf('month'), moment().endOf('month')],
				'??????': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			},
			opens: 'right',
			drops: 'down',
			buttonClasses: ['btn', 'btn-sm'],
			applyClass: 'btn-primary',
			cancelClass: 'btn-default',
			separator: ' to ',
			locale: {
				applyLabel: '??????',
				cancelLabel: '??????',
				fromLabel: 'From',
				toLabel: 'To',
				customRangeLabel: '????????????',
				daysOfWeek: ['???', '???', '???', '???', '???', '???','???'],
				monthNames: ['1???', '2???', '3???', '4???', '5???', '6???', '7???', '8???', '9???', '10???', '11???', '12???'],
				firstDay: 1
			}
		}, function(start, end, label) {
			$('#daterange-filter span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
			
		});
	};

	var sendDates = function (startDate, endDate) {
		$.ajax({
				url:"${pageContext.request.contextPath}/admin/stats/totsales",
				data:{"startDate":startDate , "endDate":endDate},
				type:"post",
				dataType:"json",
				success:function(result){
					if(result.totSales == null || result.totSales == ""){
						alert("????????? ???????????? ????????? ????????? ????????????.");
						return;
					}
					var tot_sales = $('#tot_sales'); // ??? ??????
					var order_count = $('#order_count'); // ??? ?????????
					var sales_per_order = $('#sales_per_order'); // ????????? ??????
					var paymentRate = $('#paymentRate'); // ???????????? ??????
					var cartCount = $('#cartCount'); // ???????????? ???
					var cancleCount = $('#cancleCount'); // ?????? ??????
					var allOrderCount = $('#allOrderCount'); // ?????? ?????????
					var allMemberCount = $('#allMemberCount'); // ??? ?????????
					var memberCount = $('#memberCount'); // ?????????????????? ???
					var topSelling = $('#topSelling');
					topSelling.find($(".topProduct")).remove();

					tot_sales.html(result.totSales.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					order_count.html(result.orderCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					paymentRate.html((result.orderCount/result.allOrderCount).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					cartCount.html(result.cartCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					cancleCount.html(result.cancleCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					allOrderCount.html(result.allOrderCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					sales_per_order.html((result.totSales/result.orderCount).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					allMemberCount.html(result.allMemberCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					memberCount.html(result.memberCount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
					
					$.each(result.topSellingList, function(index, value) { 
						let div=`
						<div class="topProduct d-flex align-items-center mb-15px">
							<div class="text-truncate">
								<div >\${value.product_name}</div>
							</div>
							<div class="ms-auto text-center">
								<div class="fs-13px"><span  data-value="0">\${value.sellingCount}</span></div>
								<div class="text-gray-500 fs-10px">?????????</div>
							</div>
						</div>
						`
						topSelling.append(div);
					});
					
						
				},
				error: function (e) {  
						console.log("ERROR : ", e);       
						alert("fail");      
				},     
		});
	};

	var Dashboard = function () {
		"use strict";
		return {
			//main function
			init: function () {
				handleDateRangeFilter();
				sendDates(moment().subtract(7, 'days').format('YYYY-MM-DD'), moment().format('YYYY-MM-DD'));
			}
		};
	}();

	$(document).ready(function() {
		Dashboard.init();
		
		$('#daterange-filter').on('apply.daterangepicker', function(ev, picker) {
			var startDate = picker.startDate.format('YYYY-MM-DD');
			var endDate = picker.endDate.format('YYYY-MM-DD');
			sendDates(startDate,endDate);
		});
	});
	</script>
</body>
</html>
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
			<h1 class="page-header">DASHBOARD</h1>
			<!-- END page-header -->
			
			<!-- BEGIN row -->
			<div class="row">
				<!-- BEGIN col-3 -->
				<div class="col-xl-3 col-md-6">
					<div class="widget widget-stats bg-teal">
						<div class="stats-icon stats-icon-lg"><i class="fa fa-globe fa-fw"></i></div>
						<div class="stats-content">
							<div class="stats-title">방문자 수</div>
							<div class="stats-number"></div>
							<div class="stats-progress progress">
								<div class="progress-bar" style="width: 0.0%;"></div>
							</div>
							<div class="stats-desc">저번 주 대비 증가량 (0.0%)</div>
						</div>
					</div>
				</div>
				<!-- END col-3 -->
				<!-- BEGIN col-3 -->
				<div class="col-xl-3 col-md-6">
					<div class="widget widget-stats bg-blue">
						<div class="stats-icon stats-icon-lg"><i class="fa fa-dollar-sign fa-fw"></i></div>
						<div class="stats-content">
							<div class="stats-title">순이익</div>
							<div class="stats-number"></div>
							<div class="stats-progress progress">
								<div class="progress-bar" style="width: 40.0%;"></div>
							</div>
							<div class="stats-desc">저번 주 대비 증가량 (40.0%)</div>
						</div>
					</div>
				</div>
				<!-- END col-3 -->
				<!-- BEGIN col-3 -->
				<div class="col-xl-3 col-md-6">
					<div class="widget widget-stats bg-indigo">
						<div class="stats-icon stats-icon-lg"><i class="fa fa-archive fa-fw"></i></div>
						<div class="stats-content">
							<div class="stats-title">주문 증가</div>
							<div class="stats-number"></div>
							<div class="stats-progress progress">
								<div class="progress-bar" style="width: 50.0%;"></div>
							</div>
							<div class="stats-desc">저번 주 대비 증가량 (50.0%)</div>
						</div>
					</div>
				</div>
				<!-- END col-3 -->
				<!-- BEGIN col-3 -->
				<div class="col-xl-3 col-md-6">
					<div class="widget widget-stats bg-dark">
						<div class="stats-icon stats-icon-lg"><i class="fa fa-comment-alt fa-fw"></i></div>
						<div class="stats-content">
							<div class="stats-title">게시글 등록수</div>
							<div class="stats-number"></div>
							<div class="stats-progress progress">
								<div class="progress-bar" style="width: 70.0%;"></div>
							</div>
							<div class="stats-desc">저번 주 대비 증가량 (70.0%)</div>
						</div>
					</div>
				</div>
				<!-- END col-3 -->
			</div>
			<!-- END row -->
			<!-- BEGIN row -->
			<div class="row">
				<!-- BEGIN col-8 -->
				<div class="col-xl-8">
					<div class="widget-chart with-sidebar inverse-mode">
						<div class="widget-chart-content bg-dark">
							<h4 class="chart-title">
								카테고리별 판매량
								<small></small>
							</h4>
							<div id="visitors-line-chart" class="widget-chart-full-width nvd3-inverse-mode" style="height: 260px;"></div>
						</div>
						<div class="widget-chart-sidebar bg-gray-900">
							<div class="chart-number">
								5,000,000
								<small>총 순이익</small>
							</div>
							<div class="flex-grow-1 d-flex align-items-center">
								<div id="visitors-donut-chart" class="nvd3-inverse-mode" style="height: 180px"></div>
							</div>
							<ul class="chart-legend fs-11px">
								<li><i class="fa fa-circle fa-fw text-blue fs-9px me-5px t-minus-1"></i> 30.0% <span>CPU</span></li>
								<li><i class="fa fa-circle fa-fw text-teal fs-9px me-5px t-minus-1"></i> 60.0% <span>VGA</span></li>
								<li><i class="fa fa-circle fa-fw text-teal fs-9px me-5px t-minus-1"></i> 10.0% <span>RAM</span></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- END col-8 -->
				<!-- BEGIN col-4 -->
				<div class="col-xl-4">
					<div class="panel panel-inverse" data-sortable-id="index-1">
						<div class="panel-heading">
							<h4 class="panel-title">
								카테고리별 판매량
							</h4>
						</div>
						<div id="visitors-map" class="bg-gray-900" style="height: 170px;"></div>
						<div class="list-group">
							<a href="javascript:;" class="list-group-item rounded-0 list-group-item-action list-group-item-inverse d-flex justify-content-between align-items-center text-ellipsis">
								1. VGA
								<span class="badge bg-teal fs-10px">60.00%</span>
							</a>
							<a href="javascript:;" class="list-group-item list-group-item-action list-group-item-inverse d-flex justify-content-between align-items-center text-ellipsis">
								2. CPU
								<span class="badge bg-blue fs-10px">30.00%</span>
							</a>
							<a href="javascript:;" class="list-group-item list-group-item-action list-group-item-inverse d-flex justify-content-between align-items-center text-ellipsis">
								3. RAM
								<span class="badge bg-gray-600 fs-10px">10.00%</span>
							</a>
						</div>
					</div>
				</div>
				<!-- END col-4 -->
			</div>
			<!-- END row -->
			<!-- BEGIN row -->
			<div class="row">
			  
				<!-- BEGIN col-4 -->
				<div class="col-xl-4 col-lg-6">
					<!-- BEGIN panel -->
					<div class="panel panel-inverse" data-sortable-id="index-3">
						<div class="panel-heading">
							<h4 class="panel-title">오늘의 일정</h4>
						</div>
						<div id="schedule-calendar" class="bootstrap-calendar"></div>
						<hr class="m-0 bg-gray-500" />
						<div class="list-group list-group-flush">
							<a href="javascript:;" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center text-ellipsis">
								판매 리포팅
								<span class="badge bg-teal fs-10px">09:00</span>
							</a> 
							<a href="javascript:;" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center text-ellipsis rounded-bottom">
								판매부서와 미팅
								<span class="badge bg-blue fs-10px">14:25</span>
							</a>
						</div>
					</div>
					<!-- END panel -->
				</div>
				<!-- END col-4 -->
				<!-- BEGIN col-4 -->
				<div class="col-xl-4 col-lg-6">
					<!-- BEGIN panel -->
					<div class="panel panel-inverse" data-sortable-id="index-4">
						<div class="panel-heading">
							<h4 class="panel-title">오늘의 신규 가입자</h4>
							<span class="badge bg-teal">15</span>
						</div>
						<%-- <ul class="registered-users-list">
							<li>
								<h4 class="username text-ellipsis">
									Savory Posh
									<small>Algerian</small>
								</h4>
							</li>
						</ul> --%>
						<div class="panel-footer text-center">
							<a href="javascript:;" class="text-decoration-none text-inverse">View All</a>
						</div>
					</div>
					<!-- END panel -->
				</div>
				<!-- END col-4 -->
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
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/bootstrap-calendar/js/bootstrap_calendar.min.js"></script>
	<!-- ================== END page-js ================== -->
</body>
</html>
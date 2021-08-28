<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<jsp:include page="../../inc/header.jsp" />

		<jsp:include page="../../inc/sidebar.jsp" />
		
		<!-- BEGIN #content -->
		<div id="content" class="app-content">

			<!-- BEGIN row -->
			<div class="row">
				<!-- BEGIN col-12 -->
				<div class="col-xl-12">
					<!-- BEGIN panel -->
					<div class="panel panel-inverse">
						<!-- BEGIN panel-heading -->
						<div class="panel-heading">
							<h4 class="panel-title">공지사항 등록</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<!-- END panel-heading -->
						<!-- BEGIN panel-body -->
						<div class="panel-body">
							<form method="post" action="${pageContext.request.contextPath }/admin/community/noticeboard_insert">
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">제목</label>
									<div class="col-md-9">
										<input type="text" name="n_title" class="form-control mb-5px" placeholder="제목" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">내용</label>
									<div class="col-md-9">
									<!--<input type="text" name="n_content" class="form-control mb-5px" placeholder="내용" />-->
										<textarea rows="15" cols="4000" name="n_content" id="n_content" class="form-control mb-5px" placeholder="내용"></textarea>
									</div>
								</div>
							<!--<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">공개여부</label>
									<div class="col-md-9 pt-2">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="inlineRadio1" name="n_secret_chk" value="0" />
											<label class="form-check-label" for="inlineRadio1">전체공개</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="customRadio2" name="n_secret_chk" value="1" />
											<label class="form-check-label" for="customRadio2">비공개</label>
										</div>
									</div>
								</div> -->
								<div class="row mb-15px">
									<div class="col-md-12 text-center"> 
    									<input type="submit" class="btn btn-primary" value="등록">
									</div>
								</div>
							</form>
							
	    
						<!-- END panel-body -->
					</div>
					<!-- END panel -->

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
	<script src="${pageContext.request.contextPath}/static/admin/assets/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/admin/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/admin/assets/js/app.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/admin/assets/js/theme/default.min.js"></script>
	<!-- ================== END core-js ================== -->
	
	<!-- ================== BEGIN page-js ================== -->
	<script src="${pageContext.request.contextPath}/static/admin/assets/plugins/d3/d3.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/admin/assets/plugins/nvd3/build/nv.d3.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap-world-mill.js"></script>
	<!-- ================== END page-js ================== -->
    <!-- script -->
    <script>

    </script>
</body>
</html>
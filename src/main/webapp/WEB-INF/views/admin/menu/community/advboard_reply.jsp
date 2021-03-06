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
			
			
				<!-- BEGIN col-6 -->
				<div class="col-xl-6">
					<!-- BEGIN panel -->
					<div class="panel panel-inverse">
						<!-- BEGIN panel-heading -->
						<div class="panel-heading">
							<h4 class="panel-title">????????? ??????</h4>
						</div>
						<!-- END panel-heading -->
						<!-- BEGIN panel-body -->
						<div class="panel-body">
						
							<form method="post" name="qnaForm" action="#">
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">?????????</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" value="${map.adv_board_no }" readonly />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">?????????</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" value="${map.Nickname }" readonly />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">??????</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" value="${map.adv_title }" readonly />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">??????</label>
									<div class="col-md-9">
									<!--<input type="text" name="n_content" class="form-control mb-5px" placeholder="??????" />-->
										<textarea rows="18" cols="4000" class="form-control mb-5px" readonly >${map.adv_content }</textarea>
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">?????????</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" value="<fmt:parseDate value="${map.adv_regdate }" var="adv_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${adv_regdate }" pattern="yyyy-MM-dd HH:mm:ss" />" readonly />
									</div>
								</div>
								
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">????????????</label>
									<div class="col-md-9 pt-2">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="radio_all" name="radio_all"/>
											<label class="form-check-label" for="radio_all">????????????</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="radio_secret" name="radio_secret"/>
											<label class="form-check-label" for="radio_secret">?????????</label>
										</div>
									</div>
								</div>
							</form>
							
	    				</div>
						<!-- END panel-body -->
					</div>
					<!-- END panel -->
				</div>
				<!-- END col-6 -->
				
				
				<div class="col-xl-6">
					<!-- BEGIN panel -->
					<div class="panel panel-inverse">
						<!-- BEGIN panel-heading -->
						<div class="panel-heading">
							<h4 class="panel-title">????????????</h4>
						</div>
						<!-- END panel-heading -->
						<!-- BEGIN panel-body -->
						<div class="panel-body">
							<form method="post" name="advForm" action="${pageContext.request.contextPath }/admin/community/advboard_reply?adv_board_no=${map.adv_board_no }">
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">??????</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" placeholder="??????" name="adv_title" id="adv_title" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">??????</label>
									<div class="col-md-9">
									<!--<input type="text" name="n_content" class="form-control mb-5px" placeholder="??????" />-->
										<textarea rows="26" cols="4000" class="form-control mb-10px" placeholder="??????" name="adv_content" id="adv_content" ></textarea>
									</div>
								</div>
								<div class="row mb-15px">
								<!--<label class="form-label col-form-label col-md-3">????????????</label>
									<div class="col-md-9">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" name="adv_secret_chk" id="adv_secret_chk" />
											<label class="form-check-label" for="adv_secret_chk">?????????</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-control" type="password" name="adv_password" id="adv_password" />
										</div>
									</div> -->
								</div>
								<div class="row mb-15px">
									<div class="col-md-12 text-center"> 
	   									<button type="submit" class="btn btn-primary" onclick="clickAdd(event,advForm)">??????</button>
	   									<button type="button" class="btn btn-white" onclick="clickCancel()">??????</button>
									</div>
								</div>
							</form>
							
	    				</div>
						<!-- END panel-body -->
					</div>
					<!-- END panel -->
				</div>
				<!-- END col-6 -->
				
				
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
	function clickAdd(e,formName) {
	if(!confirm("????????? ?????????????????????????")) {
		e.preventDefault();
			return false;
		}else {
			formName.action = "${pageContext.request.contextPath }/admin/community/advboard_reply?adv_board_no=${map.adv_board_no }";
			formName.method = "post";
			formName.submit();
		}
	}
		
	function clickCancel() {
		if(!confirm("????????? ?????????????????????????")) {
			return false;
		}else {
			location.href = "${pageContext.request.contextPath }/admin/community/board_list";
		}
	}
	
	if(${map.adv_secret_chk==false}) {  //???????????? ??????????????? ??????
		$("#radio_all").prop("checked",true);
		$("#radio_secret").prop("disabled",true);
	}else if(${map.adv_secret_chk==true}) {  //???????????? ???????????? ??????
		$("#radio_secret").prop("checked",true);
		$("#radio_all").prop("disabled",true);
	}
	
/*	$("#qna_password").attr("disabled",true);
	$("#qna_secret_chk").on("click",function(){
		var chk = $("input:checkbox[id='qna_secret_chk']").is(":checked");
		if(chk==true){
			$("#qna_password").prop("disabled",false);
			$(this).val(1);
		}else{
			$("#qna_password").prop("disabled",true);
			$(this).val(0);
		}
	}); */
	
    </script>
</body>
</html>
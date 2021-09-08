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
<style>
.table thead tr td img{
	width: 20px;
}
.table tbody tr td p {
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 100px;
	margin-right: 100px;
	vertical-align: middle;
}
</style>
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
			<div class="col-xl-12 col-md-12">
				<!-- BEGIN panel -->
				<div class="panel panel-inverse">
					<!-- BEGIN panel-heading -->
					<div class="panel-heading">
						<h4 class="panel-title">문의 내용</h4>
					</div>
					<!-- END panel-heading -->
					<!-- BEGIN panel-body -->
					<div class="panel-body col-xl-6 col-md-9" style="margin-left:auto; margin-right:auto;">
						<div class="table-responsive">
						
							<table class="table center">
								<colgroup>
									<col width="10%"/>
									<col width="15%"/>
									<col width="15%"/>
									<col width="30%"/>
									<col width="10%"/>
									<col width="20%"/>
								</colgroup>
								<thead class="thead-default">
									<tr>
										<th scope="row">글번호</th>
										<td>${map.adv_board_no }</td>
										<th scope="row">작성자</th>
										<td>${map.Nickname }</td>
										<th scope="row">작성일</th>
										<td><fmt:parseDate value="${map.adv_regdate }" var="adv_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${adv_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td colspan="3">${map.adv_title }
											<c:if test="${map.adv_secret_chk==true }">
												<img src="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/lockicon.png" class="lock_img">
											</c:if>
										</td>
										<th scope="row">조회수</th>
										<td>${map.adv_hit }</td>
									</tr>
								</thead>
								<tbody> 
									<tr> 
										<td colspan="10">
											<p>${map.adv_content }</p>
										</td>
									</tr>
								</tbody>
							</table>
							<a href="${pageContext.request.contextPath }/admin/community/board_list" class="btn btn-sm btn-white w-120px me-1">목록가기</a>
							<a href="${pageContext.request.contextPath }/admin/community/advboard_reply?qna_board_no=${map.adv_board_no}" class="btn btn-sm btn-success w-120px me-1" style="float:right;">답변하기</a>
						</div>
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
	    
    </script>
</body>
</html>
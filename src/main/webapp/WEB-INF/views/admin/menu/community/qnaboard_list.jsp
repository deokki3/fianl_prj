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
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/css/vendor.min.css" rel="stylesheet" />
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
	
	<!-- ================== BEGIN page-css ================== -->
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet" />
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/nvd3/build/nv.d3.css" rel="stylesheet" />
    <link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
	<!-- ================== END page-css ================== -->
<style>
.table tbody tr td img{
	width: 20px;
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
	<!-- BEGIN col-12 -->
	<div class="col-xl-12">
	<!-- BEGIN panel -->
	<div class="panel panel-inverse">
		<!-- BEGIN panel-heading -->
		<div class="panel-heading">
			<h4 class="panel-title">문의게시판 목록</h4>
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
			<table id="data-table-responsive-qq" class="table table-striped table-bordered align-middle">
				<thead>
					<tr>
						<th width="10%">글번호</th>
						<th width="50%" data-orderable="true">제목</th>
						<th class="text-nowrap">게시일</th>
						<th class="text-nowrap">조회수</th>
						<th width="5%"></th>
						<th width="5%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qvo" items="${qq_list }" varStatus="status">
					<tr>
					<c:choose>
						<c:when test="${qvo.qna_show == 1 && vo.qna_group_depth == 0}">
							<td>${qvo.qna_board_no }</td>
							<td style="height:30px;">
								작성자에 의해 삭제된 글 입니다.
							</td>
							<td></td>
							<td></td>
						</c:when>
						<c:when test="${qvo.qna_show == 1 }">
							<td>[삭제]</td>
							<td style="height:30px;">
								<c:forEach var="i" begin="2" end="${vo.qna_group_depth }">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								[Re]작성자에 의해 삭제된 글 입니다.
							</td>
							<td></td>
							<td></td>
						</c:when>
						<c:when test="${qvo.qna_group_order >0 }">
							<td></td>
							<td>
								<c:forEach var="i" begin="2" end="${qvo.qna_group_depth }">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								[Re]&nbsp; ${qvo.qna_title }
								<c:if test="${qvo.qna_secret_chk==true }">
									<img src="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/lockicon.png" class="lock_img">
								</c:if>
							</td>
							<td><fmt:parseDate value="${qvo.qna_regdate }" var="qna_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${qna_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${qvo.qna_hit }</td>
						</c:when>
						<c:otherwise>
							<td>${qvo.qna_board_no }</td>
							<td>${qvo.qna_title }
								<c:if test="${qvo.qna_secret_chk==true }">
									<img src="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/lockicon.png" class="lock_img">
								</c:if>
							</td>
							<td><fmt:parseDate value="${qvo.qna_regdate }" var="qna_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${qna_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${qvo.qna_hit }</td>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${qvo.mem_no==1 || qvo.mem_no==2 }">
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/qnaboard_delete?qna_board_no=${qvo.qna_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a>
							</td>
							<td>
								<a href="#modal-dialog-qq" class="open_modal btn btn-sm btn-white w-60px" data-bs-toggle="modal" 
								data-id="${qvo.qna_board_no}" data-name="${qvo.qna_title}" data-parent="${qvo.qna_content}"
								data-order="<fmt:parseDate value="${qvo.qna_regdate }" var="qna_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${qna_regdate }" pattern="yyyy-MM-dd HH:mm:ss" />">수정</a>
							</td>
						</c:when>
						<c:otherwise>
							<td class="text-center">
								<c:if test="${qvo.qna_show != 1 }">
									<a href="${pageContext.request.contextPath }/admin/community/qnaboard_detail?qna_board_no=${qvo.qna_board_no}" class="btn btn-sm btn-success w-60px me-1">읽기</a>
								</c:if>
							</td>
							<td></td>
						</c:otherwise>
					</c:choose>
					
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
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

	<!-- #modal-dialog -->
	<div class="modal fade" id="modal-dialog-qq">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">카테고리 수정</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
		</div>
		<div class="modal-body">
			<form method="post" id="category" action="${pageContext.request.contextPath}/admin/cate/update">
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">글번호</label>
						<div class="col-md-9">
							<input type="text" id="qna_board_no" name="qna_board_no" class="form-control mb-5px" readonly/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">글제목</label>
						<div class="col-md-9">
							<input type="text" id="qna_title" name="qna_title" class="form-control mb-5px"/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">내용</label>
						<div class="col-md-9">
							<input type="text" id="qna_content" name="qna_content" class="form-control mb-5px"/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">게시일</label>
						<div class="col-md-9">
							<input type="text" id="qna_regdate" class="form-control mb-5px" readonly/>
						</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">닫기</a>
			<a href="javascript:;" class="btn btn-success">수정</a>
		</div>
		</div>
	</div>
	</div>
	
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
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	<!-- ================== END page-js ================== -->
    <!-- script -->
    <script>
		$(document).on("click", ".open_modal", function () {
			var id = $(this).data('id');
			var name = $(this).data('name');
			var parent = $(this).data('parent');
			var order = $(this).data('order');
			console.log(id, name, parent, order);
			$("#qna_board_no").val(id);
			$("#qna_title").val(name);
			$("#qna_content").val(parent);
			$("#qna_regdate").val(order);
		});

		$(document).on("click", "" , function (){

		});
		
    	$('#data-table-responsive-qq').DataTable({
        	responsive: true,
			lengthMenu: [10,20,30,50],
			language: {
            emptyTable: "데이터가 없습니다.",
            lengthMenu: "페이지당 _MENU_ 개씩 보기",
            info: "현재 _START_ - _END_ / _TOTAL_건",
            infoEmpty: "데이터 없음",
            infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
            search: "",
            zeroRecords: "일치하는 데이터가 없습니다.",
            loadingRecords: "로딩중...",
            processing: "잠시만 기다려 주세요.",
            paginate: {
              next: "다음",
              previous: "이전",
            },
          	},
    	});

    </script>
</body>
</html>
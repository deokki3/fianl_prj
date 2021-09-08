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
	
	
	<!-- ///////////////////////////// 공지사항 ///////////////////////// -->
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
			<h4 class="panel-title">공지사항 목록</h4>
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
			<table id="data-table-responsive-nn" class="table table-striped table-bordered align-middle">
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
				<c:forEach var="nvo" items="${nn_list }" varStatus="status">
				<tr>
					<td>${nvo.n_board_no }</td>
					<td>${nvo.n_title }</td>
					<td><fmt:parseDate value="${nvo.n_regdate }" var="n_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${n_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${nvo.n_hit }</td>
					<td><a href="${pageContext.request.contextPath }/admin/community/noticeboard_delete?n_board_no=${nvo.n_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a></td>
					<td><a href="#modal-dialog-nn" class="open_modal btn btn-sm btn-white w-60px" data-bs-toggle="modal" 
					data-id="${nvo.n_board_no}" data-name="${nvo.n_title}" data-parent="${nvo.n_content}"
					data-order="<fmt:parseDate value="${nvo.n_regdate }" var="n_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${n_regdate }" pattern="yyyy-MM-dd HH:mm:ss" />">수정</a></td>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			<div class="panel-title">
				<button class="btn btn-success btn-sm" style="width:140px;" onclick="location.href='${pageContext.request.contextPath }/admin/community/noticeboard_insert';">글쓰기</button>
			</div>
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
	
	
	<!-- #modal-dialog -->
	<div class="modal fade" id="modal-dialog-nn">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">공지사항 내용 수정</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
		</div>
		<div class="modal-body">
			<form method="post" id="nn_category" action="${pageContext.request.contextPath }/admin/community/noticeboard_update">
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">글번호</label>
						<div class="col-md-9">
							<input type="text" id="n_board_no" name="n_board_no" class="form-control mb-5px" readonly/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">글제목</label>
						<div class="col-md-9">
							<input type="text" id="n_title" name="n_title" class="form-control mb-5px"/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">내용</label>
						<div class="col-md-9">
						<!--<input type="text" id="n_content" class="form-control mb-5px"/> -->
							<textarea rows="15" cols="4000" id="n_content" name="n_content" class="form-control mb-5px"></textarea>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">게시일</label>
						<div class="col-md-9">
							<input type="text" id="n_regdate" class="form-control mb-5px" readonly/>
						</div>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">닫기</a>
				<!--<a href="javascript:;" class="btn btn-success">수정</a> -->
					<button type="submit" class="btn btn-success">수정</button>
				</div>
			</form>
		</div>
		</div>
	</div>
	</div>
	<!-- ///////////////////////////// 공지사항 끝 ///////////////////////// -->
	
	
	
	
	<!-- ///////////////////////////// 문의게시판 ///////////////////////// -->
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
						<th class="text-nowrap">작성자 닉네임</th>
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
						<c:when test="${qvo.qna_show == 1 }">
							<td>${qvo.qna_board_no }</td>
							<td style="color:gray; height:30px;">
								<c:if test="${qvo.qna_group_depth > 0 }">
									<c:forEach var="i" begin="1" end="${qvo.qna_group_depth }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
									[Re]&nbsp;
								</c:if>
								작성자에 의해 삭제된 글 입니다.
							</td>
							<td></td>
							<td></td>
							<td></td>
						</c:when>
						<c:otherwise>
							<td>${qvo.qna_board_no }</td>
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/qnaboard_detail?qna_board_no=${qvo.qna_board_no}" style="text-decoration:none; color:black;">
									<c:if test="${qvo.qna_group_order >0 }">
										<c:forEach var="i" begin="1" end="${qvo.qna_group_depth }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:forEach>
										[Re]&nbsp;
									</c:if>
									${qvo.qna_title }
									<c:if test="${qvo.qna_secret_chk==true }">
										<img src="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/lockicon.png" class="lock_img">
									</c:if>
								</a>
							</td>
							<td>${qvo.Nickname }</td>
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
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/qnaboard_delete?qna_board_no=${qvo.qna_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a>
							</td>
							<td>
								<c:if test="${qvo.qna_show != 1 }">
									<a href="${pageContext.request.contextPath }/admin/community/qnaboard_reply?qna_board_no=${qvo.qna_board_no}" class="btn btn-sm btn-success w-60px me-1">답변</a>
								</c:if>
							</td>
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
	

	<!-- #modal-dialog -->
	<div class="modal fade" id="modal-dialog-qq">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">답변 내용 수정</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
		</div>
		<div class="modal-body">
			<form method="post" id="qq_category" action="${pageContext.request.contextPath }/admin/community/qnaboard_update">
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
						<!--<input type="text" id="qna_content" name="qna_content" class="form-control mb-5px"/> -->
							<textarea rows="15" cols="4000" id="qna_content" name="qna_content" class="form-control mb-5px"></textarea>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">게시일</label>
						<div class="col-md-9">
							<input type="text" id="qna_regdate" class="form-control mb-5px" readonly/>
						</div>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">닫기</a>
				<!--<a href="javascript:;" class="btn btn-success">수정</a> -->
					<button type="submit" class="btn btn-success">수정</button>
				</div>
			</form>
		</div>
		</div>
	</div>
	</div>
	<!-- ///////////////////////////// 문의게시판 끝 ///////////////////////// -->
		
	
	
	<!-- ///////////////////////////// 자유게시판 ///////////////////////// -->
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
			<h4 class="panel-title">자유게시판 목록</h4>
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
			<table id="data-table-responsive-ff" class="table table-striped table-bordered align-middle">
				<thead>
					<tr>
						<th width="10%">글번호</th>
						<th width="50%" data-orderable="true">제목</th>
						<th class="text-nowrap">작성자 닉네임</th>
						<th class="text-nowrap">게시일</th>
						<th class="text-nowrap">조회수</th>
						<th width="5%"></th>
						<th width="5%"></th>
						<th width="5%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="fvo" items="${ff_list }" varStatus="status">
					<tr>
					<c:choose>
					<c:when test="${fvo.free_show == 1 }">
						<td>${fvo.free_board_no }</td>
						<td style="color:gray; height:30px;">
							<c:if test="${fvo.free_group_depth > 0 }">
								<c:forEach var="i" begin="1" end="${fvo.free_group_depth }">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								[Re]
							</c:if>
							작성자에 의해 삭제된 글 입니다.
						</td>
						<td></td>
						<td></td>
						<td></td>
					</c:when>
					<c:when test="${fvo.free_show == 2 }">
						<td>${fvo.free_board_no }</td>
						<td style="color:gray; height:30px;">
							<a href="${pageContext.request.contextPath }/admin/community/freeboard_detail?free_board_no=${fvo.free_board_no}" style="text-decoration:none; color:gray;">
								<c:if test="${fvo.free_group_depth  >0 }">
									<c:forEach var="i" begin="1" end="${fvo.free_group_depth }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
									[Re]
								</c:if>
								관리자에 의해 블라인드 처리된 글 입니다.
							</a>
						</td>
						<td>${fvo.Nickname }</td>
						<td><fmt:parseDate value="${fvo.free_regdate }" var="free_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${free_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${fvo.free_hit }</td>
					</c:when>
					<c:otherwise>
						<td>${fvo.free_board_no }</td>
						<td>
							<a href="${pageContext.request.contextPath }/admin/community/freeboard_detail?free_board_no=${fvo.free_board_no}" style="text-decoration:none; color:black;">
								<c:if test="${fvo.free_group_depth > 0 }">
									<c:forEach var="i" begin="1" end="${fvo.free_group_depth }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
									[Re]&nbsp;
								</c:if>
								${fvo.free_title }
							</a>
						</td>
						<td>${fvo.Nickname }</td>
						<td><fmt:parseDate value="${fvo.free_regdate }" var="free_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${free_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${fvo.free_hit }</td>
					</c:otherwise>
					</c:choose>
					
					<c:choose>
					<c:when test="${fvo.mem_no == 1 || fvo.mem_no == 2 }">
						<td>
							<a href="${pageContext.request.contextPath }/admin/community/freeboard_delete?free_board_no=${fvo.free_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a>
						</td>
						<td>
							<c:choose>
							<c:when test="${fvo.free_show == 0 }">
								<a href="${pageContext.request.contextPath }/admin/community/freeboard_blind?free_board_no=${fvo.free_board_no }" class="btn btn-sm btn-success w-60px me-1">숨기기</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/admin/community/freeboard_showpost?free_board_no=${fvo.free_board_no }" class="btn btn-sm btn-secondary w-60px me-1">보이기</a>
							</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a href="#modal-dialog-ff" class="open_modal btn btn-sm btn-white w-60px" data-bs-toggle="modal" 
							data-id="${fvo.free_board_no}" data-name="${fvo.free_title}" data-parent="${fvo.free_content}"
							data-order="<fmt:parseDate value="${fvo.free_regdate }" var="free_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${free_regdate }" pattern="yyyy-MM-dd HH:mm:ss" />">수정</a>
						</td>
					</c:when>
					<c:otherwise>
						<c:choose>
						<c:when test="${fvo.free_show == 1 }">
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/freeboard_delete?free_board_no=${fvo.free_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a>
							</td>
							<td></td>
							<td></td>
						</c:when>
						<c:when test="${fvo.free_show == 2 }">
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/freeboard_delete?free_board_no=${fvo.free_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/freeboard_showpost?free_board_no=${fvo.free_board_no }" class="btn btn-sm btn-secondary w-60px me-1">보이기</a>
							</td>
							<td>
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/freeboard_delete?free_board_no=${fvo.free_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a>
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/freeboard_blind?free_board_no=${fvo.free_board_no }" class="btn btn-sm btn-success w-60px me-1">숨기기</a>
							</td>
							<td>
							</td>
						</c:otherwise>
						</c:choose>
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
	

	<!-- #modal-dialog -->
	<div class="modal fade" id="modal-dialog-ff">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">작성 내용 수정</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
		</div>
		<div class="modal-body">
			<form method="post" id="ff_category" action="${pageContext.request.contextPath }/admin/community/freeboard_update">
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">글번호</label>
						<div class="col-md-9">
							<input type="text" id="free_board_no" name="free_board_no" class="form-control mb-5px" readonly/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">글제목</label>
						<div class="col-md-9">
							<input type="text" id="free_title" name="free_title" class="form-control mb-5px"/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">내용</label>
						<div class="col-md-9">
						<!--<input type="text" id="qna_content" name="qna_content" class="form-control mb-5px"/> -->
							<textarea rows="15" cols="4000" id="free_content" name="free_content" class="form-control mb-5px"></textarea>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">게시일</label>
						<div class="col-md-9">
							<input type="text" id="free_regdate" class="form-control mb-5px" readonly/>
						</div>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">닫기</a>
				<!--<a href="javascript:;" class="btn btn-success">수정</a> -->
					<button type="submit" class="btn btn-success">수정</button>
				</div>
			</form>
		</div>
		</div>
	</div>
	</div>
	<!-- ///////////////////////////// 자유게시판 끝 ///////////////////////// -->
	
	
	
	<!-- ///////////////////////////// 견적게시판 ///////////////////////// -->
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
			<h4 class="panel-title">견적문의게시판 목록</h4>
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
			<table id="data-table-responsive-aa" class="table table-striped table-bordered align-middle">
				<thead>
					<tr>
						<th width="10%">글번호</th>
						<th width="50%" data-orderable="true">제목</th>
						<th class="text-nowrap">작성자 닉네임</th>
						<th class="text-nowrap">게시일</th>
						<th class="text-nowrap">조회수</th>
						<th width="5%"></th>
						<th width="5%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="avo" items="${aa_list }" varStatus="status">
					<tr>
					<c:choose>
						<c:when test="${avo.adv_show == true } ">
							<td>${avo.adv_board_no }</td>
							<td style="color:gray; height:30px;">
								<c:if test="${avo.adv_group_order > 1 }">
									<c:forEach var="i" begin="2" end="${avo.adv_group_depth }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
									[Re]&nbsp;
								</c:if>
								작성자에 의해 삭제된 글 입니다.
							</td>
							<td></td>
							<td></td>
							<td></td>
						</c:when>
						<c:otherwise>
							<td>${avo.adv_board_no }</td>
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/advboard_detail?adv_board_no=${avo.adv_board_no}" style="text-decoration:none; color:black;">
									<c:if test="${avo.adv_group_order > 1 }">
										<c:forEach var="i" begin="2" end="${avo.adv_group_depth }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:forEach>
										[Re]&nbsp;
									</c:if>
									${avo.adv_title }
									<c:if test="${avo.adv_secret_chk==true }">
										<img src="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/lockicon.png" class="lock_img">
									</c:if>
								</a>
							</td>
							<td>${avo.Nickname }</td>
							<td><fmt:parseDate value="${avo.adv_regdate }" var="adv_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${adv_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${avo.adv_hit }</td>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${avo.mem_no==1 || avo.mem_no==2 }">
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/advboard_delete?adv_board_no=${avo.adv_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a>
							</td>
							<td>
								<a href="#modal-dialog-aa" class="open_modal btn btn-sm btn-white w-60px" data-bs-toggle="modal" 
								data-id="${avo.adv_board_no}" data-name="${avo.adv_title}" data-parent="${avo.adv_content}"
								data-order="<fmt:parseDate value="${avo.adv_regdate }" var="adv_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${adv_regdate }" pattern="yyyy-MM-dd HH:mm:ss" />">수정</a>
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<a href="${pageContext.request.contextPath }/admin/community/advboard_delete?adv_board_no=${avo.adv_board_no }" class="btn btn-sm btn-secondary w-60px me-1">삭제</a>
							</td>
							<td>
								
									<a href="${pageContext.request.contextPath }/admin/community/advboard_reply?adv_board_no=${avo.adv_board_no}" class="btn btn-sm btn-success w-60px me-1">답변</a>
								
							</td>
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
	

	<!-- #modal-dialog -->
	<div class="modal fade" id="modal-dialog-aa">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title">답변 내용 수정</h4>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
		</div>
		<div class="modal-body">
			<form method="post" id="aa_category" action="${pageContext.request.contextPath }/admin/community/advboard_update">
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">글번호</label>
						<div class="col-md-9">
							<input type="text" id="adv_board_no" name="adv_board_no" class="form-control mb-5px" readonly/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">글제목</label>
						<div class="col-md-9">
							<input type="text" id="adv_title" name="adv_title" class="form-control mb-5px"/>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">내용</label>
						<div class="col-md-9">
						<!--<input type="text" id="adv_content" name="adv_content" class="form-control mb-5px"/> -->
							<textarea rows="15" cols="4000" id="adv_content" name="adv_content" class="form-control mb-5px"></textarea>
						</div>
				</div>
				<div class="row mb-15px">
					<label class="form-label col-form-label col-md-3">게시일</label>
						<div class="col-md-9">
							<input type="text" id="adv_regdate" class="form-control mb-5px" readonly/>
						</div>
				</div>
				<div class="modal-footer">
					<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">닫기</a>
				<!--<a href="javascript:;" class="btn btn-success">수정</a> -->
					<button type="submit" class="btn btn-success">수정</button>
				</div>
			</form>
		</div>
		</div>
	</div>
	</div>
	<!-- ///////////////////////////// 견적게시판 끝 ///////////////////////// -->
	
	
	
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
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	<!-- ================== END page-js ================== -->
    <!-- script -->
    <script>
    	/* 공지사항 */
		$(document).on("click", ".open_modal", function () {
			var nn_id = $(this).data('id');
			var nn_name = $(this).data('name');
			var nn_parent = $(this).data('parent');
			var nn_order = $(this).data('order');
			console.log(nn_id, nn_name, nn_parent, nn_order);
			$("#n_board_no").val(nn_id);
			$("#n_title").val(nn_name);
			$("#n_content").val(nn_parent);
			$("#n_regdate").val(nn_order);
		});
		
    	$('#data-table-responsive-nn').DataTable({
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
          	ordering : false
    	});
    	
    	
    	/* 문의게시판 */
    	$(document).on("click", ".open_modal", function () {
			var qq_id = $(this).data('id');
			var qq_name = $(this).data('name');
			var qq_parent = $(this).data('parent');
			var qq_order = $(this).data('order');
			console.log(qq_id, qq_name, qq_parent, qq_order);
			$("#qna_board_no").val(qq_id);
			$("#qna_title").val(qq_name);
			$("#qna_content").val(qq_parent);
			$("#qna_regdate").val(qq_order);
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
          	ordering : false
    	});
    	
    	function openReply(){
    		window.open("${pageContext.request.contextPath }/community/qnaboard_insertReply?qna_board_no=${qvo.qna_board_no}");
    	}
    	
    	
    	/* 자유게시판 */
    	$(document).on("click", ".open_modal", function () {
			var ff_id = $(this).data('id');
			var ff_name = $(this).data('name');
			var ff_parent = $(this).data('parent');
			var ff_order = $(this).data('order');
			console.log(ff_id, ff_name, ff_parent, ff_order);
			$("#free_board_no").val(ff_id);
			$("#free_title").val(ff_name);
			$("#free_content").val(ff_parent);
			$("#free_regdate").val(ff_order);
		});
    	
    	$('#data-table-responsive-ff').DataTable({
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
          	ordering : false
    	});
    	
    	
    	/* 견적게시판 */
    	$(document).on("click", ".open_modal", function () {
			var aa_id = $(this).data('id');
			var aa_name = $(this).data('name');
			var aa_parent = $(this).data('parent');
			var aa_order = $(this).data('order');
			console.log(aa_id, aa_name, aa_parent, aa_order);
			$("#adv_board_no").val(aa_id);
			$("#adv_title").val(aa_name);
			$("#adv_content").val(aa_parent);
			$("#adv_regdate").val(aa_order);
		});
    	
    	$('#data-table-responsive-aa').DataTable({
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
          	ordering : false
    	});
    	
    </script>
</body>
</html>
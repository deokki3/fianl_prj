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
							<h4 class="panel-title">상품 목록</h4>
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
							<table id="data-table-responsive" class="table table-striped table-bordered align-middle">
								<thead>
									<tr>
										<th width="10%">고유번호</th>
										<th width="5%" data-orderable="true">이미지</th>
										<th width="15%" data-orderable="true">상품코드</th>
										<th class="text-nowrap">분류</th>
										<th class="text-nowrap">상품명</th>
										<th class="text-nowrap">브랜드</th>
										<th class="text-nowrap">제조사</th>
										<th class="text-nowrap">판매가</th>
										<th class="text-nowrap">재고</th>
										<th class="text-nowrap">등록일</th>
										<th class="text-nowrap">판매여부</th>
										<th width="5%"></th>
										<th width="5%"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product_vo" items="${product_list }" varStatus="status">
										<tr>
											<td>${product_vo.product_id }</td>
											<c:forEach var="img_vo" items="${img_list}">
												<c:choose>
												   <c:when test="${product_vo.product_id == img_vo.product_id and img_vo.img_category == 'main'}">
														<td class="text-center"><img class="rounded h-30px" src="<c:url value='/upload/product_img/${img_vo.uploadPath}/${img_vo.img_name_save}' />" alt="<c:url value='/upload/product_img/${img_vo.uploadPath}/${img_vo.img_name_save}'/>" /></td>
												   </c:when>
												   <c:otherwise>
												   </c:otherwise>
												</c:choose>
											</c:forEach>
											<td>${product_vo.product_code }</td>
											<td>${product_vo.category_id }</td>
											<td>${product_vo.product_name }</td>
											<td>${product_vo.brand }</td>
											<td>${product_vo.manufacturer }</td>
											<td>${product_vo.selling_price }</td>
											<td>${product_vo.stock }</td>
											<td>${product_vo.regdate }</td>
											<td>${product_vo.availability }</td>
											<td class="text-center"><a href="${pageContext.request.contextPath }/admin/product/delete?product_id=${product_vo.product_id }" class="btn btn-sm btn-primary w-60px me-1">삭제</a></td>
											<td class="text-center"><a href="#modal-dialog" class="open_modal btn btn-sm btn-white w-60px" data-bs-toggle="modal" 
											data-product_id="${product_vo.product_id}" data-category_id="${product_vo.category_id}" data-product_code="${product_vo.product_code}}" 
											data-product_name="${product_vo.product_name}" data-brand="${product_vo.brand}" data-manufacturer="${product_vo.manufacturer}"
											data-supply_price="${product_vo.supply_price}" data-consumer_price="${product_vo.consumer_price}" data-tax="${product_vo.tax}"
											data-selling_price="${product_vo.selling_price}" data-stock="${product_vo.stock}" data-regdate="${product_vo.regdate}"
											data-availability="${product_vo.availability}" >수정</a></td>
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
		<div class="modal fade" id="modal-dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">상품 수정</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
			</div>
			
			<div class="modal-body">
				<form method="post" id="product_form" action="${pageContext.request.contextPath}/admin/product/update">
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">고유번호</label>
							<div class="col-md-9">
								<input type="text" id="product_id" name="product_id" class="form-control mb-5px" readonly/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">카테고리 코드</label>
							<div class="col-md-9">
								<input type="text" id="category_id" name="category_id" class="form-control mb-5px" readonly/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">제품코드</label>
							<div class="col-md-9">
								<input type="text" id="product_code" name="product_code" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">상품명</label>
							<div class="col-md-9">
								<input type="text" id="product_name" name="product_name" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">브랜드</label>
							<div class="col-md-9">
								<input type="text" id="brand" name="brand" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">제조사</label>
							<div class="col-md-9">
								<input type="text" id="manufacturer" name="manufacturer" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">공급가</label>
							<div class="col-md-9">
								<input type="text" id="supply_price" name="supply_price" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">소비가</label>
							<div class="col-md-9">
								<input type="text" id="consumer_price" name="consumer_price" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">세금비율</label>
							<div class="col-md-9">
								<input type="text" id="tax" name="tax" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">판매가</label>
							<div class="col-md-9">
								<input type="text" id="selling_price" name="selling_price" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">재고</label>
							<div class="col-md-9">
								<input type="text" id="stock" name="stock" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">등록날짜</label>
							<div class="col-md-9">
								<input type="text" id="regdate" name="regdate" class="form-control mb-5px" readonly/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">판매여부</label>
							<div class="col-md-9">
								<input type="text" id="availability" name="availability" class="form-control mb-5px"/>
							</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">닫기</a>
				<a href="#" id="submitBtn" class="btn btn-success">수정</a>
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
			var product_id = $(this).data('product_id');
			var category_id = $(this).data('category_id');
			var product_code = $(this).data('product_code');
			var product_name = $(this).data('product_name');
			var brand = $(this).data('brand');
			var manufacturer = $(this).data('manufacturer');
			var supply_price = $(this).data('supply_price');
			var consumer_price = $(this).data('consumer_price');
			var tax = $(this).data('tax');
			var selling_price = $(this).data('selling_price');
			var stock = $(this).data('stock');
			var regdate = $(this).data('regdate');
			var availability = $(this).data('availability');
			$("#product_id").val(product_id);
			$("#category_id").val(category_id);
			$("#product_code").val(product_code);
			$("#product_name").val(product_name);
			$("#brand").val(brand);
			$("#manufacturer").val(manufacturer);
			$("#supply_price").val(supply_price);
			$("#consumer_price").val(consumer_price);
			$("#tax").val(tax);
			$("#selling_price").val(selling_price);
			$("#tax").val(tax);
			$("#stock").val(stock);
			$("#regdate").val(regdate);
			$("#availability").val(availability);

		});

		$(document).on("click", "#submitBtn" , function (){
			$("#product_form").submit();
		});
		
    	$('#data-table-responsive').DataTable({
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
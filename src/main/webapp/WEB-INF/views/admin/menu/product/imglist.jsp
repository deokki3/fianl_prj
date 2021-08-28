<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Color Admin | HTML Startup</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- ================== BEGIN core-css ================== -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/static/admin/assets/css/vendor.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/static/admin/assets/css/default/app.min.css"
	rel="stylesheet" />
<!-- ================== END core-css ================== -->

<style>
section {
	width: 100%;
	height: 500px;
	margin-left: 10%;
	margin-right: 10%;
	margin-bottom: 300px;
}

#box1 {
	width: 50%;
	height: 60%;
	float: left;
}

#box2 {
	width: 50%;
	height: 60%;
	float: left;
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
		<!-- BEGIN #header -->
		<div id="header" class="app-header">
			<!-- BEGIN navbar-header -->
			<div class="navbar-header">
				<a href="index.html" class="navbar-brand"><span
					class="navbar-logo"></span> <b>Color</b> Admin</a>
				<button type="button" class="navbar-mobile-toggler"
					data-toggle="app-sidebar-mobile">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<!-- END navbar-header -->

			<!-- BEGIN header-nav -->
			<div class="navbar-nav">
				<div class="navbar-item navbar-form">
					<form action="" method="POST" name="search">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter keyword" />
							<button type="submit" class="btn btn-search">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
				<div class="navbar-item dropdown">
					<a href="#" data-bs-toggle="dropdown"
						class="navbar-link dropdown-toggle fs-14px"> <i
						class="fa fa-bell"></i> <span class="badge">0</span>
					</a>
					<div class="dropdown-menu media-list dropdown-menu-end">
						<div class="dropdown-header">NOTIFICATIONS (0)</div>
						<div class="text-center w-300px py-3">No notification found
						</div>
					</div>
				</div>
				<div class="navbar-item navbar-user dropdown">
					<a href="#"
						class="navbar-link dropdown-toggle d-flex align-items-center"
						data-bs-toggle="dropdown">
						<div class="image image-icon bg-gray-800 text-gray-600">
							<i class="fa fa-user"></i>
						</div> <span class="d-none d-md-inline">Adam Schwartz</span> <b
						class="caret ms-10px"></b>
					</a>
					<div class="dropdown-menu dropdown-menu-end me-1">
						<a href="javascript:;" class="dropdown-item">Edit Profile</a> <a
							href="javascript:;" class="dropdown-item"><span
							class="badge badge-danger float-end">2</span> Inbox</a> <a
							href="javascript:;" class="dropdown-item">Calendar</a> <a
							href="javascript:;" class="dropdown-item">Setting</a> <a
							href="${pageContext.request.contextPath }/admin/cate/cateinsert"
							class="dropdown-item">카테고리추가</a> <a
							href="${pageContext.request.contextPath }/admin/product/productInsert"
							class="dropdown-item">상품추가</a>
						<div class="dropdown-divider"></div>
						<a href="javascript:;" class="dropdown-item">Log Out</a>
					</div>
				</div>
			</div>
			<!-- END header-nav -->
		</div>
		<!-- END #header -->
		<!-- BEGIN #sidebar -->
		<div id="sidebar" class="app-sidebar">
			<!-- BEGIN scrollbar -->
			<div class="app-sidebar-content" data-scrollbar="true"
				data-height="100%">
				<!-- BEGIN menu -->
				<div class="menu">
					<div class="menu-profile">
						<a href="javascript:;" class="menu-profile-link"
							data-toggle="app-sidebar-profile"
							data-target="#appSidebarProfileMenu">
							<div class="menu-profile-cover with-shadow"></div>
							<div
								class="menu-profile-image menu-profile-image-icon bg-gray-900 text-gray-600">
								<i class="fa fa-user"></i>
							</div>
							<div class="menu-profile-info">
								<div class="d-flex align-items-center">
									<div class="flex-grow-1">Sean Ngu</div>
									<div class="menu-caret ms-auto"></div>
								</div>
								<small>Front end developer</small>
							</div>
						</a>
					</div>
					<div id="appSidebarProfileMenu" class="collapse">
						<div class="menu-item pt-5px">
							<a href="javascript:;" class="menu-link">
								<div class="menu-icon">
									<i class="fa fa-cog"></i>
								</div>
								<div class="menu-text">Settings</div>
							</a>
						</div>
						<div class="menu-item">
							<a href="javascript:;" class="menu-link">
								<div class="menu-icon">
									<i class="fa fa-pencil-alt"></i>
								</div>
								<div class="menu-text">Send Feedback</div>
							</a>
						</div>
						<div class="menu-item pb-5px">
							<a href="javascript:;" class="menu-link">
								<div class="menu-icon">
									<i class="fa fa-question-circle"></i>
								</div>
								<div class="menu-text">Helps</div>
							</a>
						</div>
						<div class="menu-divider m-0"></div>
					</div>
					<div class="menu-header">Navigation</div>
					<div class="menu-item active">
						<a href="index.html" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-th-large"></i>
							</div>
							<div class="menu-text">Home</div>
						</a>
					</div>

					<div class="menu-item has-sub">
						<a href="javascript:;" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-align-left"></i>
							</div>
							<div class="menu-text">Menu Level</div>
							<div class="menu-caret"></div>
						</a>
						<div class="menu-submenu">
							<div class="menu-item has-sub">
								<a href="javascript:;" class="menu-link">
									<div class="menu-text">Menu 1.1</div>
									<div class="menu-caret"></div>
								</a>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<div class="menu-text">Menu 2.1</div>
											<div class="menu-caret"></div>
										</a>
										<div class="menu-submenu">
											<div class="menu-item">
												<a href="javascript:;" class="menu-link"><div
														class="menu-text">Menu 3.1</div></a>
											</div>
											<div class="menu-item">
												<a href="javascript:;" class="menu-link"><div
														class="menu-text">Menu 3.2</div></a>
											</div>
										</div>
									</div>
									<div class="menu-item">
										<a href="javascript:;" class="menu-link"><div
												class="menu-text">Menu 2.2</div></a>
									</div>
									<div class="menu-item">
										<a href="javascript:;" class="menu-link"><div
												class="menu-text">Menu 2.3</div></a>
									</div>
								</div>
							</div>
							<div class="menu-item">
								<a href="javascript:;" class="menu-link"><div
										class="menu-text">Menu 1.2</div></a>
							</div>
							<div class="menu-item">
								<a href="javascript:;" class="menu-link"><div
										class="menu-text">Menu 1.3</div></a>
							</div>
						</div>
					</div>

					<!-- BEGIN minify-button -->
					<div class="menu-item d-flex">
						<a href="javascript:;" class="app-sidebar-minify-btn ms-auto"
							data-toggle="app-sidebar-minify"><i
							class="fa fa-angle-double-left"></i></a>
					</div>
					<!-- END minify-button -->

				</div>
				<!-- END menu -->
			</div>
			<!-- END scrollbar -->
		</div>
		<div class="app-sidebar-bg"></div>
		<div class="app-sidebar-mobile-backdrop">
			<a href="#" data-dismiss="app-sidebar-mobile" class="stretched-link"></a>
		</div>
		<!-- END #sidebar -->

		<!-- BEGIN #content -->
		<div id="content" class="app-content">
			<!-- BEGIN breadcrumb -->
			<ol class="breadcrumb float-xl-end">
				<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
				<li class="breadcrumb-item"><a href="javascript:;">Library</a></li>
				<li class="breadcrumb-item active">Data</li>
			</ol>
			<!-- END breadcrumb -->
			<!-- BEGIN page-header -->
			<h1 class="page-header">
				Page Header <small>header small text goes here...</small>
			</h1>
			<!-- END page-header -->

			<!-- BEGIN panel -->
			<div class="panel panel-inverse">
				<div class="panel-heading">
					<h4 class="panel-title">Panel Title here</h4>
					<div class="panel-heading-btn">
						<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
							data-toggle="panel-expand"><i class="fa fa-expand"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-success"
							data-toggle="panel-reload"><i class="fa fa-redo"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-warning"
							data-toggle="panel-collapse"><i class="fa fa-minus"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-danger"
							data-toggle="panel-remove"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="panel-body">

					<h1>파일목록</h1>
					<a href="${pageContext.request.contextPath }/admin/imglist">파일리스트</a><br>
					<table border="1">
						<tr>
							<th>상품코드</th>
							<th>상품명</th>
							<th>파일번호</th>
							<th>상품번호</th>
							<th>이미지 카테고리</th>
							<th>이미지 저장명</th>
							<th>본 이미지명</th>
							<th>이미지 경로</th>
							<th>이미지 크기</th>



						</tr>
						<c:forEach var="vo" items="${list }">
							<tr>
								<td>${vo.product_code }</td>
								<td>${vo.product_name }</td>
								<td>${vo.product_img_no }</td>
								<td>${vo.product_id }</td>
								<td>${vo.img_category }</td>
								<td>${vo.img_name_save }</td>
								<td>${vo.img_name_origin }</td>
								<td>${vo.img_path }</td>
								<td>${vo.img_size }</td>
								<td><a href="${pageContext.request.contextPath }/admin/product/addimg?product_id=${vo.product_id}">이미지 추가</a></td>
								<td><a
									href="${pageContext.request.contextPath }/imgupdate?product_img_no=${vo.product_img_no }">수정</a></td>
								<td><a
									href="${pageContext.request.contextPath }/imgdelete?product_img_no=${vo.product_img_no }">삭제</a></td>
								<td><a
									href="${pageContext.request.contextPath }/imgdownload?product_img_no=${vo.product_img_no }">다운로드</a>
							</tr>
						</c:forEach>


					</table>



					
				</div>
				<div>
					<c:if test="${pu.prevPage }">
						<a
							href="${pageContext.request.contextPath }/admin/product/productlist?pageNum=${pu.pageNum-1}&field=${field}&keyword=${keyword}"><span>이전</span></a>
					</c:if>
					<c:forEach var="i" begin="${pu.startPageNum }"
						end="${pu.endPageNum }">

						<c:choose>
							<c:when test="${pu.pageNum==i }">
								<!-- 현재페이지 -->
								<a
									href="${pageContext.request.contextPath }/admin/product/productlist?pageNum=${i }&field=${field}&keyword=${keyword}">
									<span style='color: blue; font-weight: bold'>[${i }]</span>
								</a>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath }/admin/product/productlist?pageNum=${i }&field=${field}&keyword=${keyword}">
									<span style='color: gray;'>[${i }]</span>
								</a>


							</c:otherwise>
						</c:choose>


					</c:forEach>
					<c:if test="${pu.nextPage }">
						<a
							href="${pageContext.request.contextPath }/admin/product/productlist?pageNum=${pu.pageNum+1 }&field=${field}&keyword=${keyword}"><span>다음</span></a>
					</c:if>



				</div>
				<div>
					<form method="post"
						action="${pageContext.request.contextPath }/admin/product/productlist">
						<select name="field">
							<option value="product_id"
								<c:if test="${field=='product_name' }">selected</c:if>>상품이름</option>
							<option value="category_id"
								<c:if test="${field=='category_name' }">selected</c:if>>카테고리 번호</option>
							<option value="availability"
								<c:if test="${field=='availability' }">selected</c:if>>판매여부</option>
							<option value="img_category"
								<c:if test="${field=='img_category' }">selected</c:if>>이미지 카테고리</option>	
						</select> <input type="text" name="keyword" value="${keyword }"> <input
							type="submit" value="검색">
					</form>
				</div>
				<a href="${pageContext.request.contextPath }/admin/">메인</a>
			</div>
			<!-- END panel -->
		</div>
		<!-- END #content -->

		<!-- BEGIN scroll to top btn -->
		<a href="javascript:;"
			class="btn btn-icon btn-circle btn-success btn-scroll-to-top"
			data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
		<!-- END scroll to top btn -->
	</div>
	<!-- END #app -->

	<!-- ================== BEGIN core-js ================== -->
	<script
		src="${pageContext.request.contextPath }/static/admin/assets/js/vendor.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/static/admin/assets/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/static/admin/assets/js/theme/default.min.js"></script>
	<!-- ================== END core-js ================== -->
	<script>
		
	</script>
</body>
</html>
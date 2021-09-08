<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
.table tbody tr td p {
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 100px;
	margin-right: 100px;
	vertical-align: middle;
}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>자유게시판</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Community</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Community Board</a></li>
				<li class="separator">&nbsp;</li>
				<li>No.${map.free_board_no }</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
	<div class="row justify-content-center">
		<div class="col-lg-10">
			<table class="table text-center">
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
						<td>${map.free_board_no }</td>
						<th scope="row">작성자</th>
						<td>${map.Nickname }</td>
						<th scope="row">작성일</th>
						<td><fmt:parseDate value="${map.free_regdate }" var="free_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${free_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3">${map.free_title }</td>
						<th scope="row">조회수</th>
						<td>${map.free_hit }</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="10">
							<p>${map.free_content }</p>
						</td>
					</tr>
					<tr>
						<td>
							<c:forEach var="filemap" items="${filemap }">
								<a href="${pageContext.request.contextPath }/community/freeboard_filedownload?file_num=${filemap.file_num}">
									${filemap.file_name_org }
								</a>
							</c:forEach>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="single-post-footer" style="margin-bottom:20px;">
				<div class="entry-navigation">
					<div class="column text-left">
						<a class="btn btn-outline-secondary btn-sm" id="prevAtag" href="${pageContext.request.contextPath}/community/freeboard_detail?free_board_no=${prev.free_board_no}">
							<i class="icon-arrow-left"></i>이전글
						</a>
					</div>
					<div class="column">
						<a class="btn btn-outline-secondary view-all" href="${pageContext.request.contextPath }/community/freeboard_list">
							<i class="icon-menu"></i>
						</a>
					</div>
					<div class="column text-right">
					<c:if test="${next.free_board_no!=0 }">
						<a class="btn btn-outline-secondary btn-sm" id="nextAtag" href="${pageContext.request.contextPath}/community/freeboard_detail?free_board_no=${next.free_board_no}">
							다음글<i class="icon-arrow-right"></i>
						</a>
					</c:if>
					</div>
				</div>
			</div>
			
			<div class="row" style="margin-bottom:40px;">
				<div style="margin-left:30px;">
					<a class="btn btn-outline-info btn-sm" id="prevAtag" href="${pageContext.request.contextPath }/community/freeboard_reply?free_board_no=${map.free_board_no}">
						답글달기
					</a>
				</div>
				<c:if test="${map.mem_no == mvo.mem_no }">
				<div class="ml-md-auto" style="margin-right:30px;">
					<a class="btn btn-outline-secondary btn-sm" id="nextAtag" href="${pageContext.request.contextPath }/community/freeboard_update?free_board_no=${map.free_board_no}">
						수정
					</a>
					<button class="btn btn-outline-secondary btn-sm" id="nextAtag"
					   data-toggle="modal" data-target="#deleteModal" 
					   type="button">
						삭제
					</button>
				</div>
				</c:if>
			</div>
			
		</div>
	</div>
</div>
<!-- 페이지 컨텐트 끝 -->


	<!-- modal -->
	<div class="modal fade" id="deleteModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">confirm</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
				</div>
				<div class="modal-body">
					<p>게시글을 정말로 삭제 하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-info btn-sm" onclick="location.href='${pageContext.request.contextPath }/community/freeboard_delete?free_board_no=${map.free_board_no}'">Yes</button>
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="return false;">No</button>
				</div>
			</div>
		</div>
	</div>


<!-- footer -->
<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp"/>

	<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
<script>
	window.onload=function(){
		var prev = "${prev.free_board_no}";
		var next = "${next.free_board_no}";
		if(prev.trim() == '' || prev == 0 ){
			$("#prevAtag").addClass("disabled");
		}
		if(next.trim() == '' || next == 0){
			$("#nextAtag").addClass("disabled");
		}
	}
</script>
</body>
</html>
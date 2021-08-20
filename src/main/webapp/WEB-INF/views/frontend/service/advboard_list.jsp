<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>견적문의</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<!-- 페이지 경로 넣어주세요 -->
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Service</a></li>
				<li class="separator">&nbsp;</li>
				<li>Advice Board</li> 
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
<div class="row">
	<div class="col-lg-12 col-md-10 order-md-2 text-center">
    	<div>
        <div>
         <form action="" method="post">
            <div class="row">
               <div class="p-2"></div>
                  <select class="form-control col-sm-2 p-2" name="field" id="field">
                     <option value=""  >제목</option>
                     <option value=""  >내용</option> 
                  </select>
               <input type="text" class="form-control col-sm-3 p-1" value="" name="keyword" id="keyword">
               <button type="submit" class="form-control col-sm-1 w-1 p-2">검색</button>
               <div class="ml-md-auto" style="margin-right:20px;">
						<button type="button" id="insertBtn" class="form-control btn-sm btn-outline-info" onclick="location.href='${pageContext.request.contextPath}/service/advboard_insert'">문의하기 <i class="icon-arrow-right-circle"></i></button>
					</div>
               
            </div>    
         </form> 
      </div>
    	</div>
    		<div class="mb-3"></div>
    			<div class="table-responsive">
    			<table class="table table-hover">
    			<thead>
    			<tr>
					<th>글번호</th>
					<th>회원번호</th>
					<th>비밀번호</th>
					<th>비밀글여부</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>글삭제</th>
					<th>글수정</th>
    			</tr>
    			</thead>
    			<tbody> 
    			<c:forEach items="${advboardlist}" var="item">
    			<tr>
    			    <td>${item.adv_board_no}</td>
					<td>${item.mem_no}</td>
					<td>${item.adv_password}</td>
					<td>${item.adv_secret_chk}</td>
					<td>${item.adv_title}</td>
					<td>${item.adv_content}</td>
					<td><a href="/neocom/advboard/delete?adv_board_no=${item.adv_board_no}">삭제</a><td>
					<td><a href="/neocom/advboard/update?adv_board_no=${item.adv_board_no}">수정</a><td>
    			</tr>
    			</c:forEach>
    			</tbody> 
    			</table>  
    			</div>
    			<div >
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${pu.pageNum==i }"><!-- 현재페이지 -->
				<a href="${pageContext.request.contextPath }/service/advboard_list?pageNum=${i }&field=${field}&keyword=${keyword}">
				<span style='color:blue;font-weight: bold'>[${i }]</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath }/service/advboard_list?pageNum=${i }&field=${field}&keyword=${keyword}">
				<span style='color:gray;'>[${i }]</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
</div>
</div>
</div>

<!-- 페이지 컨텐트 끝 -->


<!-- footer -->
<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp"/>

	<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
</body>
</html>
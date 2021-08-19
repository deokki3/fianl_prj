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
.form-control{
padding:0 18px 3px;
border:1px solid #dbe2e8;
border-radius:22px;
background-color:#fff;
color:#606975;
font-family:"Maven Pro",Helvetica,Arial,sans-serif;
font-size:14px;
-webkit-appearance:none;
-moz-appearance:none;
appearance:none;
}
.form-control:not(textarea){
height:44px;
}
.form-control:focus{
border-color:#0da9ef;
outline:none;
color:#606975;
box-shadow:none !important;
}
.form-control[type='color']{
padding-bottom:0 !important;
}
.form-control:disabled,.form-control[readonly]{
background-color:#f5f5f5;
cursor:not-allowed;
}
.form-group{
margin-bottom:20px !important;
}
.form-group label{
margin-bottom:8px;
padding-left:18px;
font-size:13px;
font-weight:500;
cursor:pointer;
}
.form-group label.col-form-label{
-ms-flex-item-align:center !important;
align-self:center !important;
margin-bottom:0;
}
.form-control-lg{
border-radius:27px;
font-size:16px;
}
.form-control-lg:not(textarea){
height:54px;
}
.form-control-lg.form-control-rounded{
border-radius:7px;
}
.form-control-lg.form-control-square{
border-radius:0;
}
select.form-control.form-control-lg:not([size]):not([multiple]){
height:54px;
}
.form-control-sm{
padding-bottom:2px;
border-radius:18px;
}
.form-control-sm:not(textarea){
height:36px;
}
.form-control-sm.form-control-rounded{
border-radius:3px;
}
.form-control-sm.form-control-square{
border-radius:0;
}
.form-text{
padding-left:18px;
}
.btn-primary{
background-color:#0da9ef;
display: inline-block;
position: relative;
height: 44px;
border: 1px solid transparent;
border-radius: 22px;
width:100px;
}
.btn{
border-radius: 22px;
width:100px;
}
input[type="radio"], input[type="checkbox"]{
box-sizing: border-box;
padding: 0;
}
.custom-control-input{
position: absolute;
z-index: -1;
opacity: 0;
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
			<h1>문의게시판</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Community</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">QnA Board</a></li>
				<li class="separator">&nbsp;</li>
				<li>Write</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-2">
<div class="row">
	<!-- 문의게시판 글작성 -->
	<div class="col-lg-8" style="margin-left:auto; margin-right:auto;">
		<div class="padding-top-2x mt-2 hidden-lg-up"></div>
		<h4>문의하기</h4>
		<hr class="padding-bottom-1x">
		
		<form class="row" name="qnaForm" method="post" action="${pageContext.request.contextPath}/community/qnaboard_insert">
		<!-- <input type="hidden" name="qna_group_no" value="${vo.qna_group_no }">
			<input type="hidden" name="qna_group_order" value="${vo.qna_group_order }">
			<input type="hidden" name="qna_group_depth" value="${vo.qna_group_depth }">  
			<input type="hidden" name="Nickname" value="${mvo.Nickname }">-->
			<div class="col-md-12">
				<div class="form-group">
					<label for="qna_title">제목</label>
					<input type="text" class="form-control" name="qna_title" id="qna_title">
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<label for="qna_content">내용</label>
					<textarea rows="15" cols="4000" class="form-control" name="qna_content" id="qna_content"></textarea>
				</div>
			</div>
			<div class="col-12 padding-top-1x">
				
				<div class="custom-control custom-checkbox d-block">
					<input class="custom-control-input" type="checkbox" name="qna_secret_chk" id="qna_secret_chk">
					<label class="custom-control-label" for="qna_secret_chk">비밀글 &nbsp;</label>
					<input type="password" name="qna_password" id="qna_password">
				</div>
				<div class="padding-bottom-1x"></div>
				<hr class="margin-top-1x margin-bottom-1x">
				<div class="text-right">
					<button class="btn btn-primary margin-bottom-none" data-toggle="modal" data-target="#add" type="button">등록</button>
					<button class="btn btn-outline-secondary margin-bottom-none" data-toggle="modal" data-target="#cancel" type="button">취소</button>
				</div>
			</div>
		</form>
		
	</div>
</div>
</div>
<!-- 페이지 컨텐트 끝 -->

	<!-- modal add -->
	<div class="modal fade" id="add">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">confirm</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
				</div>
				<div class="modal-body">
					<p>작성한 내용을 등록 하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="return false;">No</button>
					<button type="submit" class="btn btn-info btn-sm" onclick="clickAdd(qnaForm)">Yes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal cancel -->
	<div class="modal fade" id="cancel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">confirm</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
				</div>
				<div class="modal-body">
					<p>작성을 취소 하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="return false;">No</button>
					<button type="button" class="btn btn-info btn-sm" onclick="location.href='${pageContext.request.contextPath}/community/qnaboard_list'">Yes</button>
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
	function clickAdd(formName){
		formName.action = "${pageContext.request.contextPath}/community/qnaboard_insert";
		formName.method = "post";
		formName.submit();
	}

	$("#qna_password").attr("disabled",true);
		$("#qna_secret_chk").on("click",function(){
			var chk = $("input:checkbox[id='qna_secret_chk']").is(":checked");
			if(chk==true){
				$("#qna_password").prop("disabled",false);
				$(this).val(1);
			}else{
				$("#qna_password").prop("disabled",true);
				$(this).val(0);
			}
		});
</script>
</body>
</html>
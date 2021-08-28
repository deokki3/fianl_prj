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
							<h4 class="panel-title">문의한 내용</h4>
						</div>
						<!-- END panel-heading -->
						<!-- BEGIN panel-body -->
						<div class="panel-body">
						
							<form method="post" name="qnaForm" action="#">
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">글번호</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" value="${map.qna_board_no }" readonly />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">작성자</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" value="${map.Nickname }" readonly />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">제목</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" value="${map.qna_title }" readonly />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">내용</label>
									<div class="col-md-9">
									<!--<input type="text" name="n_content" class="form-control mb-5px" placeholder="내용" />-->
										<textarea rows="18" cols="4000" class="form-control mb-5px" readonly >${map.qna_content }</textarea>
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">게시일</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" value="<fmt:parseDate value="${map.qna_regdate }" var="qna_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${qna_regdate }" pattern="yyyy-MM-dd HH:mm:ss" />" readonly />
									</div>
								</div>
								
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">공개여부</label>
									<div class="col-md-9 pt-2">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="radio_all" name="radio_all"/>
											<label class="form-check-label" for="radio_all">전체공개</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="radio_secret" name="radio_secret"/>
											<label class="form-check-label" for="radio_secret">비공개</label>
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
							<h4 class="panel-title">답변하기</h4>
						</div>
						<!-- END panel-heading -->
						<!-- BEGIN panel-body -->
						<div class="panel-body">
							<form method="post" name="qnaForm" action="${pageContext.request.contextPath }/admin/community/qnaboard_reply?qna_board_no=${map.qna_board_no }">
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">제목</label>
									<div class="col-md-9">
										<input type="text" class="form-control mb-5px" placeholder="제목" name="qna_title" id="qna_title" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">내용</label>
									<div class="col-md-9">
									<!--<input type="text" name="n_content" class="form-control mb-5px" placeholder="내용" />-->
										<textarea rows="26" cols="4000" class="form-control mb-10px" placeholder="내용" name="qna_content" id="qna_content" ></textarea>
									</div>
								</div>
								<div class="row mb-15px">
								<!--<label class="form-label col-form-label col-md-3">공개여부</label>
									<div class="col-md-9">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" name="qna_secret_chk" id="qna_secret_chk" />
											<label class="form-check-label" for="qna_secret_chk">비밀글</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-control" type="password" name="qna_password" id="qna_password" />
										</div>
									</div> -->
								</div>
								<div class="row mb-15px">
									<div class="col-md-12 text-center"> 
	   									<button type="submit" class="btn btn-primary" onclick="clickAdd(qnaForm)">등록</button>
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
	    function clickAdd(formName) {
	        if(!confirm("답변을 등록하시겠습니까?")) {
	            return false;
	        }else {
	        	formName.action = "${pageContext.request.contextPath }/admin/community/qnaboard_reply?qna_board_no=${map.qna_board_no }";
				formName.method = "post";
				formName.submit();
	        }
	    }
	    
	    if(${map.qna_secret_chk==false}) {  //문의글이 전체공개일 경우
	    	$("#radio_all").prop("checked",true);
	    	$("#radio_secret").prop("disabled",true);
	    }else if(${map.qna_secret_chk==true}) {  //문의글이 비공개일 경우
	    	$("#radio_secret").prop("checked",true);
	    	$("#radio_all").prop("disabled",true);
	    }
	    
/*	    $("#qna_password").attr("disabled",true);
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
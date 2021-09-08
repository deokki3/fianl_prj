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
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/css/imgShow.css" rel="stylesheet" />
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
							<h4 class="panel-title">이미지 추가/수정/삭제</h4>
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
										<%-- <th width="8%" data-orderable="true">메인이미지</th> --%>
										<th class="text-nowrap">상품명</th>
										<th width="15%"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product_vo" items="${product_list }" varStatus="status">
										<tr>
											<td>${product_vo.product_id }</td>
											<c:forEach var="img_vo" items="${img_list}">
												<c:choose>
												   <c:when test="${product_vo.product_id == img_vo.product_id and img_vo.img_category == 'main'}">
														<%-- <td><img class="rounded h-30px" src="<c:url value='/upload/product_img/${img_vo.uploadPath}/${img_vo.img_name_save}' />" alt="<c:url value='/upload/product_img/${img_vo.uploadPath}/${img_vo.img_name_save}' />" /></td> --%>
												   </c:when>
												   <c:otherwise>
												   </c:otherwise>
												</c:choose>
											</c:forEach>
											<td>${product_vo.product_name }</td>
											<td class="text-center"><a href="#modal-dialog" class="open_modal btn btn-sm btn-white w-60px" data-bs-toggle="modal" 
											data-id="${product_vo.product_id}" data-name="${product_vo.product_name}">수정</a></td>
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
				<h4 class="modal-title">이미지 수정</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
			</div>
			<div class="modal-body">
				<form action="#" id="fileUploadForm" enctype="multipart/form-data">
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">상품 고유번호</label>
							<div class="col-md-9">
								<input type="text" id="product_id" name="product_id" class="form-control mb-5px" readonly/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">상품명</label>
							<div class="col-md-9">
								<input type="text" id="product_name" name="product_name" class="form-control mb-5px" readonly/>
							</div>
					</div>
					<div class ="uploadDiv row mb-15px">
						<label for="main_img" class="form-label">메인이미지선택</label>
  						<input class="prd_imgs form-control" type="file" name="main_img" id="main_img">
						<label for="description_img" class="form-label">설명이미지선택</label>
  						<input class="prd_imgs form-control" type="file" name="description_img" id="description_img">
					</div>
					<div class="row">
        				<div class="col-lg-12">
            				<div class="card shadow mb-4">
                				<div class="card-header py-3">
                    				<h4 class="m-0 font-weight-bold text-primary">이미지</h4>
                				</div>
                				<div class="card-body">
                    				<div class="uploadResult">
                        				<ul></ul>
                   					 </div>
                				</div>
            				</div>
        				</div>
    				</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">닫기</a>
				<a href="javascript:;" id="submitBtn" class="btn btn-success">수정</a>
			</div>
			</div>
		</div>
		<div class='bigPictureWrapper'>
			<div class='bigPicture'></div>
		</div>
		</div>
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
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	<!-- ================== END page-js ================== -->
    <!-- script -->
    <script>

		function showImage(fileCallPath) {
				$(".bigPictureWrapper").css("display","flex").show();  //화면 가운데 배치
        		$(".bigPicture")
        		.html("<img src='${pageContext.request.contextPath}/admin/product/imgdisplay?fileName="+fileCallPath+"'>")  //<img>추가
        		.show({width:'100%', height:'100%'}, 1000);				
    	}


		$(document).ready(function(e){
			$(".uploadResult").on("click", "li", function(e){
				console.log("view image");
				var liObj = $(this);
				var path = encodeURIComponent("C:/final_project/uploads/product_img/"+liObj.data("path")+"/"+liObj.data("save"));

				showImage(path.replace(new RegExp(/\\/g), "/"));

			});
		

			// 원본 이미지 창 닫기
			$(".bigPictureWrapper").on("click", function(e){
				$(".bigPictureWrapper").hide();
			});


			$(document).on("click", ".open_modal", function () {
				var id = $(this).data('id');
				var name = $(this).data('name');
				$("#product_id").val(id);
				$("#product_name").val(name);

				$.getJSON("${pageContext.request.contextPath}/admin/product/getAttachList", {'product_id' : id}, function(arr){
					console.log(arr);

					var str="";
        
					$(arr).each(function(i,attach) {
						var fileCallPath = encodeURIComponent("C:/final_project/uploads/product_img/"+attach.uploadPath+"/s_"+attach.img_name_save);
						str += "<li style='cursor:pointer' data-path='"+attach.uploadPath+"'  data-type='image'";
						str += " data-save='"+attach.img_name_save +"' data-origin='"+attach.img_name_origin+"'";
						str += "<div>";
						str += "<figure class='figure'>";
						str += "<img src='${pageContext.request.contextPath}/admin/product/imgdisplay?fileName=" + fileCallPath + "'>";
						str += "<figcaption class='figure-caption text-center'>"+ attach.img_category +"</figcaption></figure>";
						str += "</div>";
						str += "</li>";

					});
					$(".uploadResult ul").html(str);
				});			
			});

			$(".bigPictureWrapper").on("click", function(e){
      			$(".bigPictureWrapper").hide();
			});


			// 업로드 파일 확장자 필터링
			var regex = new RegExp("\\.(bmp|gif|jpg|jpeg|png)$");  //정규식
			var maxSize = 5242880;  //5MB
			
			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
				
				if (!regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			
			
			var uploadResult = $(".uploadResult ul");

			function showUploadedFile(uploadResultArr) {

				if (!uploadResultArr || uploadResultArr.length == 0) {return;}

   				var str = "";
   
   				$(uploadResultArr).each(function(i, obj) {
					var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.img_name_save);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='"+obj.uploadPath+"'";
					str += " data-save='"+obj.img_name_save+"' data-origin='"+obj.img_name_origin+"' data-type='image'";
					str += " data-category='"+ obj.img_category +"' ><div>";
					str += "<span> " + obj.img_category + ", " + obj.img_name_origin + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'"
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='${pageContext.request.contextPath}/admin/product/imgdisplay?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
   				});
   
   				uploadResult.append(str);
			}

			var cloneObj = $(".uploadDiv").clone(); 

			$(document).on("change", $("input[type='file']") , function(e){
				var inputFile = $("input[type='file']");
				var files = inputFile[0].files;

				for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
				}

				// Get form         
				var form = $('#fileUploadForm')[0];
				// Create an FormData object          
				var formData = new FormData(form);  	 
				
				// FormData의 값 확인
				for (var pair of formData.entries()) { 
					var filechk=pair[1];
					if(filechk.size==0){
						formData.delete(pair[0]);
					}
				}
				for (var pair of formData.entries()) { 
					console.log(pair[0] + "," + pair[1]);
				}

			
			$.ajax({             
				type: "POST",          
				enctype: 'multipart/form-data',  
				url: "${pageContext.request.contextPath}/admin/product/addimg",        
				data: formData,
				enctype: "multipart/form-data",
				processData: false,    
				contentType: false,      
				cache: false,           
				timeout: 600000,       
				success: function (result) {        
							
					showUploadedFile(result);

					$(".uploadDiv").html(cloneObj.html());

				},          
				error: function (e) {  
					console.log("ERROR : ", e);       
					alert("fail");      
				}     
			});
		});

			
		$("#submitBtn").click(function () {                 
			var formObj = $("#fileUploadForm");
			console.log("submit clicked");
			console.log("formObj");
				
			// 추가
			var str = "";
			$(".uploadResult ul li").each(function(i,obj){
				var jobj = $(obj);
				console.dir(jobj);
					
				str += "<input type='hidden' name='img_List["+i+"].img_name_origin' value='"+jobj.data("origin")+"'>";
				str += "<input type='hidden' name='img_List["+i+"].img_name_save' value='"+jobj.data("save")+"'>";
				str += "<input type='hidden' name='img_List["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='img_List["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			formObj.append(str).submit();

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
	});



    </script>
</body>
</html>
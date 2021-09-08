<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>ADMIN</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<sec:csrfMetaTags />
	
	<!-- ================== BEGIN core-css ================== -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/css/vendor.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
	
	<!-- ================== BEGIN page-css ================== -->
	<link href="${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/static/admin/assets/plugins/nvd3/build/nv.d3.css" rel="stylesheet" />
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
							<h4 class="panel-title">상품 추가</h4>
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
							<form id="productInsertForm" method="post" action="${pageContext.request.contextPath }/admin/product/productInsert">
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">상품코드</label>
									<div class="col-md-9">
										<input type="text" name="product_code" class="form-control mb-5px" placeholder="Product Code" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">상품명</label>
									<div class="col-md-9">
										<input type="text" name="product_name" class="form-control mb-5px" placeholder="Product Name" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">카테고리</label>
									<div class="col-md-9">
										<select name="category_id" class="form-select" id="category_id">
											<option value="3">CPU</option>
											<option value="4">메인보드</option>
											<option value="5">RAM</option>
											<option value="6">VGA</option>
											<option value="7">SSD</option>
											<option value="8">HHD</option>
											<option value="9">파워</option>
											<option value="10">쿨러</option>
											<option value="11">컨트롤러</option>
											<option value="12">외장하드</option>
											<option value="13">케이블</option>
											<option value="14">USB</option>
										</select>
										<div id="lower_category" class="row mb-15px">
										</div>
									</div>		
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">브랜드</label>
									<div class="col-md-9">
										<input type="text" name="brand" class="form-control mb-5px" placeholder="Brand" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">제조사</label>
									<div class="col-md-9">
										<input type="text" name="manufacturer" class="form-control mb-5px" placeholder="Manufacturer" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">공급가</label>
									<div class="col-md-9">
										<input type="text" name="supply_price" class="form-control mb-5px" placeholder="Supply Price" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">소비자가</label>
									<div class="col-md-9">
										<input type="text" name="consumer_price" class="form-control mb-5px" placeholder="Consumer price" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">과세율</label>
									<div class="col-md-9">
										<input type="text" name="tax" class="form-control mb-5px" placeholder="tax" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">판매가</label>
									<div class="col-md-9">
										<input type="text" name="selling_price" class="form-control mb-5px" placeholder="Selling Price" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">재고</label>
									<div class="col-md-9">
										<input type="text" name="stock" class="form-control mb-5px" placeholder="Stock" />
									</div>
								</div>
								<div class="row mb-15px">
									<label class="form-label col-form-label col-md-3">판매여부</label>
									<div class="col-md-9 pt-2">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="inlineRadio1" name="availability" value="0" />
											<label class="form-check-label" for="inlineRadio1">미판매</label>
										</div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" id="customRadio2" name="availability" value="1" />
											<label class="form-check-label" for="customRadio2">판매</label>
										</div>
									</div>
								</div>
								<div class ="uploadDiv row mb-15px">
									<label for="main_img" class="form-label">메인이미지선택</label>
									<input class="prd_imgs form-control" type="file" name="main_img" id="main_img" accept="image/*">
									<label for="description_img" class="form-label">설명이미지선택</label>
									<input class="prd_imgs form-control" type="file" name="description_img" id="description_img" accept="image/*">
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
												<div class='bigPictureWrapper'>
													<div class='bigPicture'></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row mb-15px">
									<div class="col-md-12 text-center"> 
    									<input type="submit" class="btn btn-primary" id="submitBtn" value="등록">
									</div>
								</div>
							</form>
							
	    
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
		$(document).ready(function(e){
			cateList(3);

			$("#category_id").click(function(){
				cateList($("#category_id").val());
			});

			
			$(".bigPictureWrapper").on("click", function(e){
      			$(".bigPictureWrapper").hide();
			});
					
			var uploadResult = $(".uploadResult ul");

			function showUploadedFile(uploadResultArr) {

				if (!uploadResultArr || uploadResultArr.length == 0) {return;}

   				var str = "";
   
   				$(uploadResultArr).each(function(i, obj) {
					var fileCallPath = encodeURIComponent("C:/final_project/uploads/product_img/"+obj.uploadPath+"/s_"+obj.img_name_save);
					console.log(fileCallPath);
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='"+obj.uploadPath+"'";
					str += " data-save='"+obj.img_name_save+"' data-origin='"+obj.img_name_origin+"'data-type='"+obj.image+"'";
					str += " data-category='"+ obj.img_category +"' data-size='"+ obj.img_size +"' ><div>";
					str += "<span> " + obj.img_category + ", " + obj.img_name_origin + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'"
					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
					str += "<img src='${pageContext.request.contextPath}/admin/product/imgdisplay?fileName="+fileCallPath+"'>";
					str += "</div>";
					str += "</li>";
   				});
   
   				uploadResult.append(str);
			}

			$(".uploadResult").on("click","button",function(e){
    			var targetFile = $(this).data("file");
    			var type = $(this).data("type");

				var targetLi = $(this).closest("li");

    			$.ajax({
        			url: '${pageContext.request.contextPath}/admin/product/deleteFile',
        			data: {fileName: targetFile, type: type},
        			dataType: 'text',
        			type: 'POST',
        			success: function(result) {
            			alert(result);
						targetLi.remove();
        			}
    			});
			});

			var cloneObj = $(".uploadDiv").clone(); 

			$(document).bind("change", $(".prd_imgs") , function(e){
				var inputFile = $("input[type='file']");

				var formData = new FormData();

				for(var i = 0; i < inputFile.length ; i++){
					if(inputFile[i].value){
						console.log(inputFile[i].id);
						formData.append(inputFile[i].name, inputFile[i].files[0]);
					}
				}

				// FormData의 값 확인
				for (var pair of formData.entries()) { 
					var key=pair[0];
					var filechk=pair[1];
					
					console.log(key, ", " + filechk);
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
				var formObj = $("#productInsertForm");
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
					str += "<input type='hidden' name='img_List["+i+"].img_category' value='"+jobj.data("category")+"'>";
					str += "<input type='hidden' name='img_List["+i+"].img_size' value='"+jobj.data("size")+"'>";
				});
				formObj.append(str).submit();
			});
		});

		

		function showImage(fileCallPath) {
        	// alert(fileCallPath);
			$(".bigPictureWrapper").css("display","flex").show();  //화면 가운데 배치
    		$(".bigPicture")
	   		.html("<img src='${pageContext.request.contextPath}/admin/product/imgdisplay?fileName="+encodeURI(fileCallPath)+"'>")  //<img>추가
    		.show({width:'100%', height:'100%'}, 1000);

    	}

		function cateList(category_id){
			$("#lower_category").empty();
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/product/findCategories",
				data:{"category_parent":category_id},
				type:"post",
				dataType:"json",
				beforeSend: function (jqXHR, settings) {
           		// var header = $("meta[name='_csrf_header']").attr("content");
           		// var token = $("meta[name='_csrf']").attr("content");
           		// jqXHR.setRequestHeader(header, token);
				},
				success:function(data){
					$.each(data.upperCategoryList,function(index,item){
						$("#lower_category").append(`<label class="form-label col-form-label col-md-3"> \${item.category_name} </label>
						<div class="\${item.category_id}_list col-md-9 pt-2"></div>`);
						$.each(data,function(index2,list){
							$.each(list,function(index3,item2){
								if(item.category_id==item2.category_parent){
									$("#lower_category").find("." + item.category_id + "_list").append(
									`
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="category_ids" value="\${item2.category_id}" />
										<label class="form-check-label" for="category_ids">\${item2.category_name}</label>
									</div>
									`
									);
								}
							});
						});
						
					});
				}
			});
		}

    </script>
</body>
</html>
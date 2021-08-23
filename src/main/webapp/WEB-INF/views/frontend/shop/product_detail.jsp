<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>neocom</title>
<!-- SEO Meta Tags-->
<meta name="description"
	content="Unishop - Universal E-Commerce Template">
<meta name="keywords"
	content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
<meta name="author" content="Rokaux">
<!-- Favicon and Apple Icons-->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.ico">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.png">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="167x167"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad-retina.png">
<!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
<!-- Main Template Styles-->
<link id="mainStyles" rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
<!-- Modernizr-->
<script
	src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp" />


	<!-- 페이지 타이틀 -->
	<div class="page-title">
		<div class="container">
			<div class="column">
				<h1 style="font-size: 50px">${cvo }</h1>
			</div>
			<div class="column">
				<ul class="breadcrumbs">
					<li><a href="${pageContext.request.contextPath}/">Home</a></li>
					<li class="separator">&nbsp;</li>
					<li><a href="#">Shop</a></li>
					<li class="separator">&nbsp;</li>
					<li>Product Detail</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 페이지 타이틀 끝 -->



	<!-- 페이지 컨텐트 -->

	<div class="container padding-bottom-3x">
		<div class="row">
			<!-- 상품이미지 -->

			<div class="col-md-6">
				<div class="product-gallery">
					<div class="gallery-wrapper">
						<div class="gallery-item video-btn text-center">
							<button class="btn btn-outline-secondary btn-sm btn-wishlist">
								<i class="icon-heart"></i>&nbsp; 관심상품
							</button>
						</div>
					</div>

					<div class="product-carousel owl-carousel gallery-wrapper">

						<div class="gallery-item" data-hash="one">
							<a
								href="${pageContext.request.contextPath}/static/frontend/assets/img/shop/single/01.jpg"
								data-size="1000x667"><img
								src="<c:url value='/upload/product_img/${list[0].img_name_save}' />"
								alt="<c:url value='/upload/product_img/${img.img_name_save}' />" /></a>
						</div>



					</div>


				</div>
			</div>
			<!-- 상품정보 -->


			<div class="col-md-6">
				<div class="padding-top-2x mt-2 hidden-md-up"></div>
				<div class="sp-categories pb-3">
					<i class="icon-tag"></i>상품분류
				</div>

				<h2 class="mb-3">${goods.product_name }</h2>
				<span class="h3 d-block"><del class="text-muted">
						<fmt:formatNumber pattern="###,###,###"
							value="${goods.selling_price }" />
						원
					</del>&nbsp; 할인가</span>
				<c:forEach var="clist" items="${clist }">
					<p class="text-muted">${clist.category_name }</p>
				</c:forEach>

				<form name="form1">
					<fieldset>
						<input type="hidden" name="product_id"
							value="${goods.product_id }"> <input type="hidden"
							name="product_name" value="${goods.product_name }"> <input
							type="hidden" name="selling_price"
							value="${goods.selling_price }"> <input type="hidden"
							name="img_name_save" value="${list[0].img_name_save }">


						<!-- ///////옵션을 넣어야함 -->
						<!-- 세션없으면 alert메세지 주기  -->
						<div class="row align-items-end pb-4">
							<div class="col-sm-6">
								<div class="form-group mb-0">
									<label for="quantity" style="font-size: 15px;">수량</label> <input
										type="number" class="form-control" name="product_count"
										id="quantity" value="1" min="1" max="100">
								</div>
							</div>
						</div>
						<div class="mb-4"></div>
						<div class="row">
							<div class="col-sm-6">
								<input type="button" class="btn btn-primary btn-block m-1"
									name=btn1 value="구매하기" onClick="getPost('01')">

							</div>
							<div></div>
							<div class="col-sm-6">
								<sec:authentication property="principal.memberVo" var="memberVo"/>
								<input type="button" class="btn btn-secondary btn-block m-1"
									name=btn2 value="장바구니" onclick="getPost('02')">
							</div>
							<!-- 장바구니 url -->

						</div>
					</fieldset>
				</form>
				<div class="pt-1 mb-4"></div>

				<hr class="mb-2">
				<div class="d-flex flex-wrap justify-content-between"></div>
			</div>


		</div>
	</div>
	<!-- 상품설명 -->
	<div class="bg-secondary padding-top-3x padding-bottom-2x mb-3"
		id="details">
		<div class="container">
			<div class="row">
				<div class="col-md-11">
					<h3 class="h4">상품정보</h3>

					<img
						src="<c:url value='/upload/product_img/${list[1].img_name_save}' />"
						alt="<c:url value='/upload/product_img/${img.img_name_save}' />" />
				</div>

			</div>
		</div>
	</div>


	<!-- 상품리뷰 -->
	<div class="container padding-top-2x">
		<div class="row">
			<div class="col-md-4 mb-4">
				<div class="card border-default">
					<div class="card-body">
						<div class="text-center">
							<div class="d-inline align-baseline display-3 mr-1">4.0</div>
							<div class="d-inline align-baseline text-sm text-warning mr-1">
								<div class="rating-stars">
									<i class="icon-star filled"></i> <i class="icon-star filled"></i>
									<i class="icon-star filled"></i> <i class="icon-star filled"></i>
									<i class="icon-star"></i>
								</div>
							</div>
						</div>

						<div class="pt-3">
							<!-- 5점 -->
							<label class="text-medium text-sm">5stars <span
								class="text-muted"> --- 20</span></label>
							<div class="progress margin-bottom-1x">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 70%; height: 2px;" aria-valuenow="70"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<!-- 4점 -->
							<label class="text-medium text-sm">4stars <span
								class="text-muted"> --- 14</span></label>
							<div class="progress margin-bottom-1x">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 20%; height: 2px;" aria-valuenow="20"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<!-- 3점 -->
							<label class="text-medium text-sm">3stars <span
								class="text-muted"> --- 10</span></label>
							<div class="progress margin-bottom-1x">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 7%; height: 2px;" aria-valuenow="7"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<!-- 2점 -->
							<label class="text-medium text-sm">2stars <span
								class="text-muted"> --- 8</span></label>
							<div class="progress margin-bottom-1x">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 3%; height: 2px;" aria-valuenow="3"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<!-- 1점 -->
							<label class="text-medium text-sm">1stars <span
								class="text-muted"> --- 2</span></label>
							<div class="progress mb-2">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 0%; height: 2px;" aria-valuenow="0"
									aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						
					</div>
				</div>
			</div>

			<div class="col-md-8" >
			<h3 class="padding-bottom-1x">최신 후기</h3>
				<div id="reviewList">
				
				
				<a class="btn btn-secondary btn-block" href="#">더보기</a>
				</div>
				
				
			
			<div id="page"></div>
			<div id="reviewForm" class="card border-default">
				<form id="addreview" enctype="multipart/form-data">
				<input type="hidden" id="product_id" value="${goods.product_id }">
				
				<input type="text" class="d-inline align-baseline display-5 mr-4"name="title" placeholder="간단한 제목을 적어주세요!" >
				<div class="rating-stars">
						
						<i class="icon-star" id="stars1" onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1)></i>
						<i class="icon-star" id="stars2" onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2)></i>
						<i class="icon-star" id="stars3" onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3)></i> 
						<i class="icon-star" id="stars4" onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4)></i>
						<i class="icon-star" id="stars5" onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5)></i>
				</div><br>
				<input type="hidden" id="star" name="star">
				후기<br>
				<textarea class="d-inline align-baseline display-5 mr-4" rows="2" cols="50" id="content" name="review_content"></textarea><br>
				이미지첨부<br>
				<input type="file" name="file1" id="selectImg"><br> 
				<div>
    				   <div class="select_img" >
         				  <img id="" />
     				   </div>
     			</div>
				  <input type="button" class="btn btn-warning btn-block" value="후기 남기기" id="btnAdd">
     		 </form>
				
			
				
     			
				</div>
			</div>
			
			
				
			
		</div>
	</div>
	<div class="mb-4"></div>
	
			<!-- 페이지 컨텐트 끝 -->
			<!-- modal -->
			<div class="modal fade" id="insertModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">로그인이 필요한 서비스입니다.</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">X</span>
							</button>
						</div>
						<div class="modal-body">
							<p>로그인 하시겠습니까?</p>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-info btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/account/login'">Yes</button>
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal" onclick="return false;">No</button>
						</div>
					</div>
				</div>
			</div>




			<!-- footer -->
			<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp" />

			<!-- Back To Top Button-->
			<a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
			<!-- Backdrop-->
			<div class="site-backdrop"></div>
			<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
			<script
				src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
			<script
				src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
			<script type="text/javascript">
				$(function() {
					
					
					
				
					
				
				
					$("#selectImg").change(function(){
						if(this.files && this.files[0]) {
							var reader =new FileReader;
							reader.onload =function(data){
								$(".select_img img").attr("src",data.target.result).width(50);
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				    
					


					$("#btnAdd").click(function(){
						var sessionId = "${sessionScope.id}";
						var file = $("input[name=file1]")[0].files[0];
						var product_id=$("#product_id").val();
						var star=$("#star").val();
						console.log(star);
						

				
						var formData =new FormData();
						formData.append( "file1",file);
						formData.append("review_title",$("input[name=title]").val());
						formData.append("review_content",$("#content").val());
						formData.append("product_id",product_id);
						formData.append("star",star);
						$.ajax({
							url:"${pageContext.request.contextPath}/review/insert",
							data:formData,
							type:"post",
							traditional:true,
							processData : false,
							contentType : false,
							cache:false,
							dataType:"json",
							success:function(data){
								
								if(data.code=='success'){
									alert("글이 등록되었습니다.");
									 $("#addreview").each( function () {
										 this.reset();
									 });

										 
									review(1);
								}else{
									alert("오류가 발생하였습니다. 다시 시도해주세요.");
								}
							}
						});
					});
					review(1);

				});
				
				var locked=0;
				function show(star) {
					if(locked)
						return;
					var i;
					var stars;
					var el;
					
					//이미지 변환
					for(i=1;i<=star;i++){
						stars ='stars'+i;
						el =document.getElementById(stars);
						el.className += " filled"; //처음 별 0개
						
					}
				}


				function noshow(star) {
					if(locked)
						return;
					var i;
					var stars;
					var el;
					
					for(i=1;i<=star;i++) {
						stars ='stars'+i;
						el =document.getElementById(stars);
						el.className = "icon-star"; //처음 별 0개
					}
				}
				function lock(star){
					show(star);
					locked=1;
					
				}
				function mark(star){
					lock(star);
					document.getElementById("star").value=star;
					
					
							
					//별이 클릭되었을 때, lock을 걸고 hidden 타입의 input 태그 value 값에 매개변수로 받은 star를 넘겨주는 식으로 수정
				}
			
				var currentPage=1;
				function review(pageNum){
					var product_id=$("#product_id").val();
					
					console.log(product_id);
					
					currentPage=pageNum;
					$("#reviewList").empty();
					$.ajax({
						url:"${pageContext.request.contextPath}/review/ajaxlist",
						data:{"pageNum":pageNum,"product_id":product_id},
						dataType:"json",
						success:function(data){
							//alert(data);
							///data.list[0].num
							$(data.review).each(function(i,d){
								
						
								let html="<div class='comment'>";
								html+="<div class='comment-author-ava'></div>";
								html+="<div class='comment-body'>";
								html+=	"<div class='comment-header d-flex flex-wrap justify-content-between'>";
								html+=		"<h4 class='comment-title'>"+d.review_title+"</h4>";
								html+=	"	<div class='mb-2'>";
								html+=			"<div class='rating-stars'>";
								
								for(let i=1;i<=d.star;i++){
									
								html+=			"	<i class='icon-star filled'></i>";
								}
								for(let j=1;j<=5-d.star;j++){
								html+=			"	<i class='icon-star'></i>";
								}
								html+=		"	</div>";
								html+=	"	</div>";
								html+="	</div>";
								html+= "<p class='comment-text'>";
								html+="<img width=45px; height=45px; src='<c:url value='/upload/product_img/"+d.review_img +"' />'";
								html+="alt='<c:url value='/upload/product_img/${img.img_name_save}' />' />";
								html+="</p>";
								html+=	"<p class='comment-text'>"+d.review_content+"</p>";
								html+="	<div class='comment-footer'>";
								html+="		<span class='comment-meta'>"+d.Nickname+"</span>";
								html+="	</div>";
								html+="</div>";
								html+="</div>";
									$("#reviewList").append(html);					
							});
							//페이징 처리
							let startPage=data.startPageNum;
							console.log("startPage=="+startPage);
							let endPage=data.endPageNum;
							console.log("endPage=="+endPage);
							let pageCount=data.pagCount;
							console.log("pageCount=="+pageCount);
							let pageHtml="";
							if(startPage>5){
								pageHtml += "<a href='javascript:review("+ (startPage-1) + ")'>이전</a>";
							}
							for(let i=startPage;i<=endPage;i++){
								if(i==pageNum){
									pageHtml += "<a href='javascript:review("+ i + ")'><span style='color:blue' >"+ i + "</span></a> ";
								}else{
									pageHtml += "<a href='javascript:review("+ i + ")'><span style='color:gray' >"+ i + "</span></a> ";
								}	
							}
							if(endPage<pageCount){
								pageHtml += "<a href='javascript:review("+ (endPage+1) + ")'>다음</a>";
							}
							$("#page").html(pageHtml);
						}		
					});		
				}
				
				
				function getPost(mode) {

					if (sessionId != null && sessionId != '') {
						if (mode == "01") {
							theForm.method = "post";

							theForm.action = "${pageContext.request.contextPath}/purchase0";
						} else if (mode == "02") {
							theForm.method = "get";

							theForm.action = "${pageContext.request.contextPath}/cart";

						}
						theForm.submit();

					} else {

						$("#insertModal").modal();

					}
				}
				

				
				
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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
	


</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>상품리스트</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="${pageContext.request.contextPath}/">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="${pageContext.request.contextPath}/shop/product_grid?category_id=20000">Shop</a></li>
				<li class="separator">&nbsp;</li>
				<li>Goods list</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-top-3x padding-bottom-2x mb-2">
<div class="row">
	<!-- ///////////////////// 상품리스트 그리드 ///////////////////// -->
	<div class="col-lg-9 order-lg-2">
		<!-- 정렬순서 -->
		<div class="shop-toolbar padding-bottom-1x mb-2">
			<div class="column">
				<div class="shop-sorting">
					 
					<label for="sorting">정렬 순서</label>
					<select class="form-control" id="order">
						<option value="new"><c:if test="${order=='new' }">selected</c:if>신상품순</option>
						<option value="low"><c:if test="${order=='low' }">selected</c:if>낮은가격순</option>
						<option value="high"><c:if test="${order=='high' }">selected</c:if>높은가격순</option>
						<option value="name_high"><c:if test="${order=='name_high' }">selected</c:if>이름순-오름차순</option>
						<option value="name_low"><c:if test="${order=='name_low' }">selected</c:if>이름순-내림차순</option>
					</select>
				</div>
			</div>
			<div class="column">
				
				<div class="shop-view">
				 	<c:choose>
				 		<c:when test="${keyword ne null }">
							<a class="grid-view active" href="${pageContext.request.contextPath}/shop/product_grid?category_id=${category_id}&keyword=${keyword}"><span></span><span></span><span></span></a>
							<a class="list-view" href="${pageContext.request.contextPath}/shop/product_list?category_id=${category_id}&keyword=${keyword}"><span></span><span></span><span></span></a>		
						</c:when>
						<c:when test="${minPrice1 ne null }">
						 	<a class="grid-view active" href="${pageContext.request.contextPath}/shop/product_grid?category_id=${category_id}&keyword=${keyword}&minPrice=${minPrice1}&maxPrice=${maxPrice1}"><span></span><span></span><span></span></a>
							<a class="list-view" href="${pageContext.request.contextPath}/shop/product_list?category_id=${category_id}&keyword=${keyword}&minPrice=${minPrice1}&maxPrice=${maxPrice1}"><span></span><span></span><span></span></a>		
						</c:when>
						<c:otherwise>
							<a class="grid-view active" href="${pageContext.request.contextPath}/shop/product_grid?category_id=${category_id}"><span></span><span></span><span></span></a>
							<a class="list-view" href="${pageContext.request.contextPath}/shop/product_list?category_id=${category_id}"><span></span><span></span><span></span></a>	
						</c:otherwise>
				
				</c:choose>
				</div>
				
			</div>
		</div>
		<!-- 상품리스트 -->
		<input type="hidden" id="category_id" value="${category_id}" >
		<div class="row" id="commList">
		
		 	
			
			<!-- forEach 끝 부분 -->
		</div>
		<!-- 페이징  -->
			<nav class="pagination" style="margin-top:20px; ">
		<div class="column" id="page"></div>
		<div class="column" id="page1"></div>
		<div class="column" id="page2"></div>
		</nav>
		<div class="mb-4"></div>
	</div>
	<!-- ///////////////////// 상품리스트 그리드 끝 ///////////////////// -->
	
	<!-- ///////////////////// 상품리스트 사이드바 ///////////////////// -->
	<div class="col-lg-3 order-lg-1">
		<div class="sidebar-toggle position-left">
			<i class="icon-filter"></i>
		</div>
		<aside class="sidebar sidebar-offcanvas position-left">
			<span class="sidebar-close"><i class="icon-x"></i></span>
			<!-- 카테고리 -->
			
			
			<section class="widget widget-categories">
			<h3 class="widget-title">카테고리</h3>
			
			<ul class="sec-ul"> 
					<!-- cpu 시작 --> 
				<li class="has-children" id="cpu_li" ><a href="#" >${clist[1].category_name }</a>
					<ul>
						<li><a href="#">${clist[8].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=101">${clist[41].category_name }</a></li> 
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=102">${clist[42].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=103">${clist[43].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=104">${clist[44].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=105">${clist[45].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=106">${clist[46].category_name }</a></li>
							</ul> 
						</li>
				
			
						<li><a href="#">${clist[9].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=107">${clist[47].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=108">${clist[48].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=109">${clist[49].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=110">${clist[50].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[10].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=111">${clist[51].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=112">${clist[52].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=113">${clist[53].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=114">${clist[54].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=115">${clist[55].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=116">${clist[56].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=117">${clist[57].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[11].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=118">${clist[58].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=119">${clist[59].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=120">${clist[60].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=121">${clist[61].category_name }</a></li>
							</ul>
						</li>
						
					</ul>
				</li> 
				<!-- cpu 끝 -->
				<!-- 메인보드 시작 -->
				<li class="has-children" id="main_li"><a href="#">${clist[2].category_name }</a>
					<ul>
						<li><a href="#">${clist[12].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=122">${clist[62].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=123">${clist[63].category_name }</a></li>
								
							</ul>
						</li>
						<li><a href="#">${clist[13].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=124">${clist[64].category_name }</a></li> 
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=125">${clist[65].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=126">${clist[66].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=127">${clist[67].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=128">${clist[68].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=129">${clist[69].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=130">${clist[70].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=131">${clist[71].category_name }</a></li>
							
								
							</ul> 
						</li>
						<li><a href="#">${clist[14].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=132">${clist[72].category_name }</a></li> 
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=133">${clist[73].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=134">${clist[74].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=135">${clist[75].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=136">${clist[76].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=137">${clist[77].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=138">${clist[78].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=139">${clist[79].category_name }</a></li>
								
							</ul> 
						</li>
						<li><a href="#">${clist[15].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=140">${clist[80].category_name }</a></li> 
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=141">${clist[81].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=142">${clist[82].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=143">${clist[83].category_name }</a></li>
								
							</ul> 
						</li>
						<li><a href="#">${clist[16].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=144">${clist[84].category_name }</a></li> 
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=145">${clist[85].category_name }</a></li>
								
								
							</ul> 
						</li>
						
					</ul>
				</li>
				<!-- 메인보드 끝 -->
				<!-- 램 시작-->
				<li class="has-children" id="ram_li"><a href="#">${clist[3].category_name }</a>
					<ul>
						<li><a href="#">${clist[17].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=149">${clist[86].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=150">${clist[87].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[18].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=151">${clist[88].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=152">${clist[89].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=153">${clist[90].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=154">${clist[91].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=155">${clist[92].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=156">${clist[93].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[19].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=157">${clist[94].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=158">${clist[95].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=159">${clist[96].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[20].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=160">${clist[97].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[21].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=161">${clist[98].category_name }</a></li>
								
							</ul>
						</li>
					</ul>
				</li>
				<!-- 램 끝 -->
				<!-- 그래픽카드 시작 -->
				<li class="has-children" id="vga_li"><a href="#">${clist[4].category_name }</a>
					<ul>
						<li><a href="#">${clist[22].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=162">${clist[99].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=163">${clist[100].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[23].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=164">${clist[101].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=165">${clist[102].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=166">${clist[103].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=167">${clist[104].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=168">${clist[105].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=169">${clist[106].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=170">${clist[107].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[24].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=171">${clist[108].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=172">${clist[109].category_name }</a></li>
								
							</ul>
						</li>
						<li><a href="#">${clist[25].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=173">${clist[110].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=174">${clist[111].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=175">${clist[112].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=176">${clist[113].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=177">${clist[114].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[26].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=178">${clist[115].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=179">${clist[116].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=180">${clist[117].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=181">${clist[118].category_name }</a></li>
								
							</ul>
						</li>
					</ul>   
				</li>
				<!-- 그래픽카드 끝 -->
				<!--  ssd 시작 -->
				<li class="has-children" id="ssd_li"><a href="#">${clist[5].category_name }</a>
					<ul>
						<li><a href="#">${clist[27].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=182">${clist[119].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=183">${clist[120].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=184">${clist[121].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[28].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=185">${clist[122].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=186">${clist[123].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[29].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=187">${clist[124].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=188">${clist[125].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=189">${clist[126].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=190">${clist[127].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=191">${clist[128].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=192">${clist[129].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=193">${clist[130].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=194">${clist[131].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=195">${clist[132].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=196">${clist[133].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[30].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=198">${clist[134].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=199">${clist[135].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=200">${clist[136].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[31].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=201">${clist[137].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=202">${clist[138].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=203">${clist[139].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=204">${clist[140].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=205">${clist[141].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=206">${clist[142].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=207">${clist[143].category_name }</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<!-- ssd 끝 -->
				<!-- hdd 시작 -->
				<li class="has-children" id="hdd_li"><a href="#">${clist[6].category_name }</a>
					<ul>
						<li><a href="#">${clist[32].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=208">${clist[144].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=209">${clist[145].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=210">${clist[146].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=211">${clist[147].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=212">${clist[148].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=213">${clist[149].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[33].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=214">${clist[150].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=215">${clist[151].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=216">${clist[152].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=217">${clist[153].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=218">${clist[154].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=219">${clist[155].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=220">${clist[156].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=221">${clist[157].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[34].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=222">${clist[158].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=223">${clist[159].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=224">${clist[160].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[35].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=225">${clist[161].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=226">${clist[162].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=227">${clist[163].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[36].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=228">${clist[164].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=229">${clist[165].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=230">${clist[166].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=231">${clist[167].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=232">${clist[168].category_name }</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<!-- hdd 끝 -->
				<!-- power 시작 -->
				<li class="has-children" id="power_li"><a href="#">${clist[7].category_name }</a>
					<ul>
						<li><a href="#">${clist[37].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=233">${clist[169].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=234">${clist[170].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=235">${clist[171].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=236">${clist[172].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=237">${clist[173].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[38].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=238">${clist[174].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=239">${clist[175].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[39].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=240">${clist[176].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=241">${clist[177].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=242">${clist[178].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=243">${clist[179].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[40].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=244">${clist[180].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=245">${clist[181].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=246">${clist[182].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=247">${clist[183].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=248">${clist[184].category_name }</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<!-- 쿨러 시작 -->
				<li class="has-children" id="cool_li"><a href="#">${all[1].category_name }</a>
					<ul>
						<li><a href="#">${all[6].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=249">${all[24].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=250">${all[25].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=251">${all[26].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=252">${all[27].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=253">${all[28].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=254">${all[29].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=255">${all[30].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=256">${all[31].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=257">${all[32].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=258">${all[33].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=259">${all[34].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=260">${all[35].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=261">${all[36].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=262">${all[37].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=263">${all[38].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=264">${all[39].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=265">${all[40].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=266">${all[41].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=267">${all[42].category_name }</a></li>
								
							
							</ul>
						</li>
						<li><a href="#">${all[7].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=268">${all[43].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=269">${all[44].category_name }</a></li>
								
							</ul>
						</li>
						<li><a href="#">${clist[8].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=270">${all[45].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=271">${all[46].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=272">${all[47].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=273">${all[48].category_name }</a></li>								
							</ul>
						</li>
						<li><a href="#">${all[9].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=274">${all[49].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=275">${all[50].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=276">${all[51].category_name }</a></li>
								
							
							</ul>
						</li>
						<li><a href="#">${all[10].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=277">${all[52].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=278">${all[53].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=279">${all[54].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=280">${all[55].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=281">${all[56].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=282">${all[57].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=283">${all[58].category_name }</a></li>								
							</ul>
						</li>
					</ul>
				</li>
				<!-- 쿨러 끝 -->

			<!-- 컨트롤러 시작 -->
				<li class="has-children" id="con_li"><a href="#">${all[2].category_name }</a>
					<ul>
						<li><a href="#">${all[11].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=284">${all[59].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=285">${all[60].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=286">${all[61].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=287">${all[62].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=288">${all[63].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=289">${all[64].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=290">${all[65].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=291">${all[66].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=292">${all[67].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=293">${all[68].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=294">${all[69].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=295">${all[70].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=296">${all[71].category_name }</a></li>
								
								
							
							</ul>
						</li>
						<li><a href="#">${all[12].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=297">${all[72].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=298">${all[73].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=299">${all[74].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=300">${all[75].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=301">${all[76].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=302">${all[77].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=303">${all[78].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=304">${all[79].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=305">${all[80].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=306">${all[81].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=307">${all[82].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=308">${all[83].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=309">${all[84].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=310">${all[85].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=311">${all[86].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=312">${all[87].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=313">${all[88].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=314">${all[89].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=315">${all[90].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=316">${all[91].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=317">${all[92].category_name }</a></li>
															
							</ul>
						</li>
						<li><a href="#">${clist[13].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=318">${all[93].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=319">${all[94].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=320">${all[95].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=321">${all[96].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=322">${all[97].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=323">${all[98].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=324">${all[99].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=325">${all[100].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=326">${all[101].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=327">${all[102].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=328">${all[103].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=329">${all[104].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=330">${all[105].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=331">${all[106].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=332">${all[107].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=333">${all[108].category_name }</a></li>									
							</ul>
						</li>
						<li><a href="#">${all[14].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=334">${all[109].category_name }</a></li>
							</ul>
						</li>
						
					</ul>
				</li>
				<!-- 컨트롤러 끝 -->

			<!-- 외장하드 시작 -->
				<li class="has-children" id="ext_li"><a href="#">${all[3].category_name }</a>
					<ul>
						<li><a href="#">${all[15].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=335">${all[110].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=336">${all[111].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=337">${all[112].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=338">${all[113].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=339">${all[114].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=340">${all[115].category_name }</a></li>

								
								
							
							</ul>
						</li>
						<li><a href="#">${all[16].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=341">${all[116].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=342">${all[117].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=343">${all[118].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=344">${all[119].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=345">${all[120].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=346">${all[121].category_name }</a></li>
								
															
							</ul>
						</li>
						<li><a href="#">${clist[17].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=347">${all[122].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=348">${all[123].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=349">${all[124].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=350">${all[125].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=351">${all[126].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=352">${all[127].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=353">${all[128].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=354">${all[129].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=355">${all[130].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=356">${all[131].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=357">${all[132].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=358">${all[133].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=359">${all[134].category_name }</a></li>
									
							</ul>
						</li>
						<li><a href="#">${all[18].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=360">${all[135].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=361">${all[136].category_name }</a></li>
							</ul>
						</li>
						
					</ul>
				</li>
				<!-- 외장하드 끝 -->
			<!-- 케이블 시작 -->
				<li class="has-children" id="cab_li"><a href="#">${all[4].category_name }</a>
					<ul>
						<li><a href="#">${all[19].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=362">${all[137].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=363">${all[138].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=364">${all[139].category_name }</a></li>
								

								
								
							
							</ul>
						</li>
						<li><a href="#">${all[20].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=365">${all[140].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=366">${all[141].category_name }</a></li>
								
							</ul>
						</li>
						
						
					</ul>
				</li>
				<!-- 케이블 끝 -->

				<!-- usb 시작 -->
				<li class="has-children" id="usb_li"><a href="#">${all[5].category_name }</a>
					<ul>
						<li><a href="#">${all[21].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=367">${all[142].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=368">${all[143].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=369">${all[144].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=370">${all[145].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=371">${all[146].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=372">${all[147].category_name }</a></li>								
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=373">${all[148].category_name }</a></li>
								
								
							
							</ul>
						</li>
						<li><a href="#">${all[22].category_name }</a>
							<ul>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=374">${all[149].category_name }</a></li>
								<li><a href="${pageContext.request.contextPath }/shop/product_grid?category_id=375">${all[150].category_name }</a></li>
								
							</ul>
						</li>

						
						
					</ul>
				</li>
				<!-- usb 끝 -->
			</ul> 
			
			</section>
			
			
			<c:choose>
				<c:when test="${minPrice1 ne null  }">
			<!-- 가격 범위 --> 
			<section class="widget widget-categories">
			<h3 class="widget-title">가격</h3>
				<form 
				class="price-range-slider" id="priceCheck"
				data-start-min="${minPrice1 }"
				data-start-max="${maxPrice1 }"
				data-min="10"
				data-max="5000000"
				data-step="10000">
					<div class="ui-range-slider"></div>
					<footer class="ui-range-slider-footer">
						<div class="column">
							<input type="hidden" name="category_id" value="${category_id}">
							<input type="hidden" name="keywrod" value="${keyword }">
							<button class="btn btn-outline-primary btn-sm" onclick=check()>적용</button>
						</div>
						<div class="column">
							<div class="ui-range-values mb-3">
								<div class="ui-range-value-min">
									￦<span></span> <input type="hidden" name="minPrice"  >
								</div>
								&nbsp;-&nbsp;
								<div class="ui-range-value-max">
									￦<span></span> <input type="hidden" name="maxPrice"  >
									
								</div>
							</div>
						</div>
					</footer>
				</form>
			</section>
			</c:when>
			<c:otherwise>
			
			<!-- 가격 범위 --> 
			<section class="widget widget-categories">
			<h3 class="widget-title">가격</h3>
				<form 
				class="price-range-slider" id="priceCheck"
				data-start-min="10"
				data-start-max="5000000"
				data-min="10"
				data-max="5000000"
				data-step="10000">
					<div class="ui-range-slider"></div>
					<footer class="ui-range-slider-footer">
						<div class="column">
							<input type="hidden" name="category_id" value="${category_id}">
							<input type="hidden" name="keywrod" value="${keyword }">
							<button class="btn btn-outline-primary btn-sm" onclick=check()>적용</button>
						</div>
						<div class="column">
							<div class="ui-range-values mb-3">
								<div class="ui-range-value-min">
									￦<span></span> <input type="hidden" name="minPrice"  value="${minPrice1 }">
								</div>
								&nbsp;-&nbsp;
								<div class="ui-range-value-max">
									￦<span></span> <input type="hidden" name="maxPrice" value="${maxPrice1 }" >
									
								</div>
							</div>
						</div>
					</footer>
				</form>
			</section>
			
			
			</c:otherwise>
			</c:choose>
			
			
		</aside>
	</div>
	
	<!-- ///////////////////// 상품리스트 사이드바 끝 ///////////////////// -->
</div>
</div>
<!-- 페이지 컨텐트 끝 -->


<!-- footer -->
<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp"/>

	<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
	
	<script type="text/javascript">
	//장바구니 담기
	function insertCart(product_id){
		
		console.log(product_id)
			$.ajax({
				url:"${pageContext.request.contextPath}/member/insertCart",
				dataType:"json",
				data:{"product_id" : product_id},
				Type:'post',
				success:function(data){
					
				},error:function(request, status, error){

					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});	
	};
	
$(function(){
	
	
	var g=${param.category_id}; 
	if(g>=101 && g<=121){
		$("#cpu_li").addClass("expanded");
	}else if(g>=122 && g<=145){
		$("#main_li").addClass("expanded");
	}else if(g>=149 && g<=161){
		$("#ram_li").addClass("expanded");
	}else if(g>=162 && g<=181) {
		$("#vga_li").addClass("expanded");
	}else if(g>=182 && g<=207){
		$("#ssd_li").addClass("expanded");
	}else if(g>=208 && g<=232){
		$("#hdd_li").addClass("expanded");
	}else if(g>=233 && g<=248){
		$("#power_li").addClass("expanded");
	}else if(g>=249 && g<=283) {
		$("#cool_li").addClass("expanded");
	}else if(g>=284 && g<=334){
		$("#con_li").addClass("expanded");
	}else if(g>=335 && g<=361) {
		$("#ext_li").addClass("expanded");
	}else if(g>=362 && g<=366) {
		$("#cab_li").addClass("expanded");
	}else if(g>=367 && g<=375) {
		$("#usb_li").addClass("expanded");
	}else {
		$(".sec-ul li").removeClass("expanded");
	}
	
	
	
	var category_id=$("#category_id").val();
	var a='${param.category_id}';
	var keyword='${param.keyword}';
	var minPrice=$("input[name=minPrice]").val();
	console.log("minPrice===="+minPrice);
	var maxPrice=$("input[name=maxPrice]").val(); 
	function check(){
		var theForm = document.priceCheck;
		
		
		theForm.method = "post";
		theForm.action = "${pageContext.request.contextPath}/shop/product_grid";
	}
	
	if(a=='10000')
		{ 
		list(1,"new",10000,keyword,minPrice,maxPrice);
	
		}
	else 
		list(1,"new",category_id,keyword,minPrice,maxPrice); 
		
	
	$("#order").change(function(){
		
		var order=$(this).val(); 
		
		list(1,order,category_id,keyword,minPrice,maxPrice); 
		   
	}); //option값 가져오기 
	
	
//list(1); 지우니까 오류가없네여
});
	var currentPage=1; 
	function list(pageNum,order,category_id,keyword,minPrice,maxPrice){ 
		Number.prototype.format = function(){
		    if(this==0) return 0;
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		    return n;
		};
		//문자에 대한 기능 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if( isNaN(num) ) return "0"; 
		    return num.format();
		};
		 
		currentPage=pageNum;
	
		$("#commList").empty();
		$.ajax({
			url:"${pageContext.request.contextPath}/shop/ajaxlist",
			data:{"pageNum":pageNum,"order":order,"category_id":category_id,"keyword":keyword,"minPrice":minPrice,"maxPrice":maxPrice},  
			dataType:"json", 
			Type:"GET", 
			success:function(data){ 
				console.log(data.list);	
				if(data.list.length==0) {
					let	html=	"<span> 찾으시는 물품이 없습니다. </span>"		
					
					$("#commList").append(html);
					
				}
				else{
				$(data.list).each(function(i,d){
					
						<!-- forEach 시작 부분 -->
						let	html=	"<div class='col-md-3 col-sm-6'>";			
						html+=	"<div class='product-card mb-30'>";
						html+=		"<a class='product-thumb' href='${pageContext.request.contextPath}/shop/product_detail"+"?n="+d.product_id+"&"+"m="+d.category_id+"'>";
						html+=		"	<img src='<c:url value='/upload/product_img/"+d.uploadPath+"/"+d.img_name_save+"' />' alt='<c:url value='/upload/product_img/"+d.uploadPath+"/"+d.img_name_save+"' />' />";
										html+=	"	</a> ";
										html+=	"	<div class='product-card-body'>";
										html+=		"	<div class='product-category'><a href='#'>"+d.brand+"</a></div>";
										html+=			"<h3 class='product-title'><a href='#'>"+d.product_name +"</a></h3>"; 
										html+=		"	<h4 class='product-price'>"+d.selling_price.format()+'원'+"</h4>";
										html+=		"	</div> ";
										html+=	"	<div class='product-button-group'>";
									<!-- 위시리스트 토스트 수정은 scripts.min.js 파일 -->
							 		html+=			"	<a class='product-button btn-wishlist' href='#'><i class='icon-heart'></i><span>관심상품</span></a>";
									html+=	"	<a class='product-button' href='javascript:insertCart("+d.product_id+");'" ;
										html+=		"	data-toast data-toast-type='success'" ;
											html+=		"	data-toast-position='topRight'" ;
												html+=		"	data-toast-icon='icon-check-circle' " ;
													html+=		"	data-toast-title=' ' " ;
														html+=		"	data-toast-message='장바구니에 상품을 담았습니다!'> ";
									html+=	"	<i class='icon-shopping-cart'></i><span>장바구니</span> ";
									html+=	"	</a>";
									html+=	"</div>";
									html+=	"</div>";
									html+=	"</div>";
									
						<!-- forEach 끝 부분 -->
						html+=	"</div>";
					
						html+=	"</div>	";	
					$("#commList").append(html);					
				});
				}
				//페이징 처리
				$("#page").empty();
				$("#page1").empty();
				$("#page2").empty();
				let startPage=data.startPageNum;
				let endPage=data.endPageNum;
				let prev=data.prev;
				let next=data.next;
				
				
				
				console.log("order=="+order);
				 console.log("minPrice=="+minPrice);
				 console.log("maxPrice=="+maxPrice);
				 console.log("keyword=="+keyword);
				 console.log("category_id=="+category_id)
				let pageCount=data.pageCount;
			
				let pageHtml="";
				let pageHtml2="";
				let pageHtml3="";
				if(keyword==null || keyword==""){
					keyword=undefined;
				}
				if(prev==true){
					pageHtml += "<a class='btn btn-outline-secondary btn-sm' href=\"javascript:list("+ (startPage-1)+",'"+order+"',"+category_id+",'"+keyword+"',"+minPrice+","+maxPrice+");\"><i class='icon-chevron-left'></i>이전</a>";
				}else{
					pageHtml += "<a class='btn btn-outline-secondary btn-sm disabled'><i class='icon-chevron-left'></i> 이전</a>";
				}
				
				pageHtml2 +="<ul class='pages' style='margin-top:20px;'>";
				for(let i=startPage;i<=endPage;i++){
					if(pageNum==i){
						
						pageHtml2 +="<li class='active'>";
						pageHtml2 += "<a href=\"javascript:list("+ i +",'"+order+"',"+category_id+",'"+keyword+"',"+minPrice+","+maxPrice+");\">"+ i + "</a> ";
						pageHtml2 +="</li>";
					}else{
						pageHtml2 +="<li>";
						pageHtml2 += "<a href=\"javascript:list("+ i +",'"+order+"',"+category_id+",'"+keyword+"',"+minPrice+","+maxPrice+");\">"+ i + "</a> ";
						pageHtml2 +="</li>";
					}	
				}
				pageHtml2 +="</ul>";
				
				if(next==true){
					pageHtml3 += "<a class='btn btn-outline-secondary btn-sm' href=\"javascript:list("+ (endPage+1)+",'"+order+"',"+category_id+",'"+keyword+"',"+minPrice+","+maxPrice+");\"><i class='icon-chevron-right'></i>다음</a>";
				}else{
					pageHtml3 += "<a class='btn btn-outline-secondary btn-sm disabled'>다음 <i class='icon-chevron-right'></i></a>";
				}
				$("#page").append(pageHtml);
				$("#page1").append(pageHtml2);
				$("#page2").append(pageHtml3);
			}		
		});	
	}
	
</script>  
</body>
</html>
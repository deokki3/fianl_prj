<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- header -->
<header class="site-header navbar-sticky">
<div class="topbar d-flex justify-content-between">

	<!-- 로고 -->
	<div class="site-branding d-flex">
		<a class="site-logo align-self-center" href="${pageContext.request.contextPath }/">
		<img src="${pageContext.request.contextPath}/static/frontend/assets/img/logo/neocomlogo.png" alt="neocom">
		</a>
	</div>
	
	<!-- 검색 및 카테고리 -->
	<div class="search-box-wrap d-flex">
		<div class="search-box-inner align-self-center">
			<div class="search-box d-flex col-md-10">
				<!-- 카테고리 -->
				<div class="btn-group categories-btn">
					<button class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"><i class="icon-menu text-lg"></i>&nbsp;카테고리</button>
					<div class="dropdown-menu mega-dropdown">
						<div class="row">
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=3"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/cpu.png"><span class="text-gray-dark">CPU</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=4"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/mainboard.png"><span class="text-gray-dark">메인보드</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=5"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/ram.png"><span class="text-gray-dark">RAM</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=6"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/vga.png"><span class="text-gray-dark">그래픽카드</span></a></div>
						</div>
						<div class="row">
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=7"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/ssd.png"><span class="text-gray-dark">SSD</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=8"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/hdd.png"><span class="text-gray-dark">HDD</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=9"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/power.png"><span class="text-gray-dark">파워</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=3"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/peripherals.jpg"><span class="text-gray-dark">주변기기</span></a></div>
						</div>
					</div>
				</div>
				<!-- 카테고리 끝 -->
				<!-- 헤더 검색창 -->

				<form class="input-group" method="get" action="${pageContext.request.contextPath }/shop/product_list">
					<input class="form-control" type="search" placeholder="검색어를 입력하세요." name="keyword" value=${keyword }>
					<input type="hidden" name="category_id" value="10000">
					<span class="input-group-btn">
						<button type="submit"><i class="icon-search"></i></button>
					</span>
				</form>
				<!-- 헤더 검색창 끝 -->
			</div>
		</div>
	</div>
	<!-- 검색 및 카테고리 끝 -->
	
<!-- 툴바 -->
	<div class="toolbar d-flex">
				<sec:authorize access="isAnonymous()">
				<div class="toolbar-item">
					<a href="${pageContext.request.contextPath }/account/join1">
						<div><i class="icon-pocket"></i><span class="text-label">회원가입</span></div>
					</a>
				</div>
				<div class="toolbar-item">
					<a href="${pageContext.request.contextPath }/account/login">
						<div><i class="icon-user"></i><span class="text-label">로그인</span></div>
					</a>
				</div>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
				<c:set var="permission" value="true" scope="session"/>
				<div class="toolbar-item">
					<a href="#">
						<div><i class="icon-user"></i><span class="text-label"><sec:authentication property="principal.memberVo.id"/>님
						</span></div>
					</a>
				</div>
				<div class="toolbar-item">
					<a href="${pageContext.request.contextPath }/account/logout">
						<div><i class="icon-slash"></i><span class="text-label">로그아웃</span></div>
					</a>
				</div>
				<div class="toolbar-item">
					<a href="${pageContext.request.contextPath }/account/mypage_order">
						<div><i class="icon-box"></i><span class="text-label">마이페이지</span></div>
					</a>
				</div>
				</sec:authorize>

		<div class="toolbar-item">
			<a class="" href="${pageContext.request.contextPath }/member/cart">
				<div>
					<span class="cart-icon">
						<i class="icon-shopping-cart"></i>
						<span class="count-label">0</span>
					</span>
					<span class="text-label">장바구니</span>
				</div>
			</a>
			<!-- 장바구니 아이콘 드롭다운(기능 구현 가능하면 유지, 불가할 경우 지우기) -->
			<div class="toolbar-dropdown cart-dropdown widget-cart">
				<div class="entry">
					<div class="entry-thumb"><a href="#"><img src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/widget/04.jpg" alt=""></a></div>
					<div class="entry-content">
						<h4 class="entry-title"><a href="#">캐논카메라</a></h4>
						<span class="entry-meta">1,000,000 ￦</span>
					</div>
					<div class="entry-delete"><i class="icon-x"></i></div>
				</div>
				<div class="entry">
					<div class="entry-thumb"><a href="#"><img src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/widget/05.jpg" alt=""></a></div>
					<div class="entry-content">
						<h4 class="entry-title"><a href="#">아이폰</a></h4>
						<span class="entry-meta">1,000,000 ￦</span>
					</div>
					<div class="entry-delete"><i class="icon-x"></i></div>
				</div>
				<div class="text-right">
					<p class="text-gray-dark py-2 mb-0"><span class="text-muted">총합계:</span>&nbsp; 2,000,000 ￦</p>
				</div>
				<div class="d-flex">
					<div class="pr-2 w-50"><a class="btn btn-secondary btn-sm btn-block mb-0" href="#">버튼1</a></div>
					<div class="pr-2 w-50"><a class="btn btn-primary btn-sm btn-block mb-0" href="#">버튼2</a></div>
				</div>
			</div>
			<!-- 장바구니 아이콘 드롭다운 끝 -->
		</div>
	</div>
	<!-- 툴바 끝 -->
</div>


<!-- Navbar-->
<div class="navbar">
	<!-- navbar 카테고리 -->
	<div class="btn-group categories-btn">
		<button class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"><i class="icon-menu text-lg"></i>&nbsp;카테고리</button>
		<div class="dropdown-menu mega-dropdown">
		<div class="row">
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=3"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/cpu.png"><span class="text-gray-dark">CPU</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=4"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/mainboard.png"><span class="text-gray-dark">메인보드</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=5"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/ram.png"><span class="text-gray-dark">RAM</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=6"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/vga.png"><span class="text-gray-dark">그래픽카드</span></a></div>
		</div>
		<div class="row">
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=7"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/ssd.png"><span class="text-gray-dark">SSD</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=8"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/hdd.png"><span class="text-gray-dark">HDD</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=9"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/power.png"><span class="text-gray-dark">파워</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="${pageContext.request.contextPath }/shop/product_list?category_id=3"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/peripherals.jpg"><span class="text-gray-dark">주변기기</span></a></div>
		</div>
		</div>
	</div>
	<!-- navbar 카테고리 끝 -->
	
	<!-- navbar 메인 네비게이션 -->
	<nav class="site-menu">
		<ul class="nav-ul">
			<li class="has-submenu" id="home-li"><a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="has-megamenu" id="shop-li"><a href="${pageContext.request.contextPath }/shop/product_list?category_id=20000">Shop</a>
				<ul class="mega-menu">
					<li><span class="mega-menu-title">컴퓨터부품</span>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=3">CPU</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=4">메인보드</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=5">RAM</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=6">그래픽카드</a></li>
						</ul>
					</li>
					<li><span class="mega-menu-title">컴퓨터부품</span>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=7">SSD</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=8">HDD</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=9">POWER</a></li>
							
						</ul>
					</li>
					<li><span class="mega-menu-title">주변기기</span>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=10">쿨러</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=11">컨트롤러</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=12">외장하드</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=13">케이블</a></li>
							<li><a href="${pageContext.request.contextPath }/shop/product_list?category_id=14">USB</a></li>
						</ul>
					</li>
					<li><span class="mega-menu-title">월간견적 PC</span>
						<ul class="sub-menu">
							<li><a href="#">소분류1</a></li>
							<li><a href="#">소분류2</a></li>
							<li><a href="#">소분류3</a></li>
							<li><a href="#">소분류4</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li class="has-submenu" id="service-li"><a href="${pageContext.request.contextPath }/service/advboard_list">Service</a>
				<ul class="sub-menu">
					<li><a href="${pageContext.request.contextPath }/service/advboard_list">견적문의</a></li>
				</ul>
			</li>
			<li class="has-submenu" id="community-li"><a href="${pageContext.request.contextPath }/community/noticeboard_list">Community</a>
				<ul class="sub-menu">
					<li><a href="${pageContext.request.contextPath }/community/noticeboard_list">공지사항</a></li>
					<li><a href="${pageContext.request.contextPath }/community/qnaboard_list">Q&A</a></li>
					<li><a href="${pageContext.request.contextPath }/community/freeboard_list">자유게시판</a></li>
					<li><a href="#">갤러리</a></li>
				</ul>
			</li>
			<li class="has-submenu" id="aboutus-li"><a href="${pageContext.request.contextPath }/aboutus/introduce">About Us</a>
			</li>
		</ul>
	</nav>
	<!-- navbar 메인 네비게이션 끝 -->
	
	<!-- navbar 툴바 -->
	<div class="toolbar">
		<div class="toolbar-inner">
				<sec:authorize access="isAnonymous()">
					<div class="toolbar-item">
						<a href="${pageContext.request.contextPath }/account/join1">
							<div><i class="icon-pocket"></i><span class="text-label">회원가입</span></div>
						</a>
					</div>
					<div class="toolbar-item">
						<a href="${pageContext.request.contextPath }/account/login">
							<div><i class="icon-user"></i><span class="text-label">로그인</span></div>
						</a>
					</div>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<div class="toolbar-item">
						<a href="#">
							<div><i class="icon-user"></i><span class="text-label"><sec:authentication property="principal.memberVo.id"/>님</span></div>
						</a>
					</div>
					<div class="toolbar-item">
						<a href="${pageContext.request.contextPath }/account/logout">
							<div><i class="icon-slash"></i><span class="text-label">로그아웃</span></div>
						</a>
					</div>
					<div class="toolbar-item">
						<a href="${pageContext.request.contextPath }/account/mypage_order">
							<div><i class="icon-box"></i><span class="text-label">마이페이지</span></div>
						</a>
					</div>
				</sec:authorize>


			<div class="toolbar-item">
				<a class="" href="${pageContext.request.contextPath }/cart?id=${sessionScope.id}">
					<div>
						<span class="cart-icon">
							<i class="icon-shopping-cart"></i>
							<span class="count-label">0</span>
						</span>
						<span class="text-label">장바구니</span>
					</div>
				</a>
				<!-- 장바구니 아이콘 드롭다운(기능 구현 가능하면 유지, 불가할 경우 지우기) -->
				<div class="toolbar-dropdown cart-dropdown widget-cart">
					<div class="entry">
						<div class="entry-thumb"><a href="#"><img src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/widget/04.jpg" alt=""></a></div>
						<div class="entry-content">
							<h4 class="entry-title"><a href="#">캐논카메라</a></h4>
							<span class="entry-meta">1,000,000 ￦</span>
						</div>
						<div class="entry-delete"><i class="icon-x"></i></div>
					</div>
					<div class="entry">
						<div class="entry-thumb"><a href="#"><img src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/widget/05.jpg" alt=""></a></div>
						<div class="entry-content">
							<h4 class="entry-title"><a href="#">아이폰</a></h4>
							<span class="entry-meta">1,000,000 ￦</span>
						</div>
						<div class="entry-delete"><i class="icon-x"></i></div>
					</div>
					<div class="text-right">
						<p class="text-gray-dark py-2 mb-0"><span class="text-muted">총합계:</span>&nbsp; 2,000,000 ￦</p>
					</div>
					<div class="d-flex">
						<div class="pr-2 w-50"><a class="btn btn-secondary btn-sm btn-block mb-0" href="#">버튼1</a></div>
						<div class="pr-2 w-50"><a class="btn btn-primary btn-sm btn-block mb-0" href="#">버튼2</a></div>
					</div>
				</div>
				<!-- 장바구니 아이콘 드롭다운 끝 -->
			</div>
		</div>
	</div>
	<!-- navbar 툴바 끝 -->
	
</div>
</header>
<!-- end of header -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
<script>
	let pageName = location.pathname.split("/");
	let pageIndex = pageName[2];
	if(pageIndex == ''){
		$("#home-li").addClass("active");
	}else if(pageIndex == 'shop'){
		$("#shop-li").addClass("active");
	}else if(pageIndex == 'service'){
		$("#service-li").addClass("active");
	}else if(pageIndex == 'community'){
		$("#community-li").addClass("active");
	}else if(pageIndex == 'aboutus'){
		$("#aboutus-li").addClass("active");
	}else{
		$(".nav-ul li").removeClass("active");
	}
</script>
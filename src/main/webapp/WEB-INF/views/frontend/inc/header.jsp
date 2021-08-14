<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/01.jpg"><span class="text-gray-dark">분류1</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/02.jpg"><span class="text-gray-dark">분류2</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/03.jpg"><span class="text-gray-dark">분류3</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/04.jpg"><span class="text-gray-dark">분류4</span></a></div>
						</div>
						<div class="row">
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/05.jpg"><span class="text-gray-dark">분류5</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/06.jpg"><span class="text-gray-dark">분류6</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/07.jpg"><span class="text-gray-dark">분류7</span></a></div>
							<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/08.jpg"><span class="text-gray-dark">분류8</span></a></div>
						</div>
					</div>
				</div>
				<!-- 카테고리 끝 -->
				<!-- 헤더 검색창 -->
				<form class="input-group" method="get">
					<input class="form-control" type="search" placeholder="검색어를 입력하세요.">
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
		<div class="toolbar-item">
			<a href="#">
				<div><i class="icon-slash"></i><span class="text-label">로그아웃</span></div>
			</a>
		</div>
		<div class="toolbar-item">
			<a href="${pageContext.request.contextPath }/account/mypage_order">
				<div><i class="icon-box"></i><span class="text-label">마이페이지</span></div>
			</a>
			<c:if test="${sessionScope.id !=null }">
				<a class="#" href="${pageContext.request.contextPath }/memlogout">
					<div>
						<i class="icon-user"></i>
						<span class="text-label">로그아웃</span>
					</div>
				</a>

			</c:if>

		</div>
		<div class="toolbar-item">
			<a class="#" href="${pageContext.request.contextPath }/cartlist?id=${sessionScope.id}">

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
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/01.jpg"><span class="text-gray-dark">분류1</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/02.jpg"><span class="text-gray-dark">분류2</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/03.jpg"><span class="text-gray-dark">분류3</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/04.jpg"><span class="text-gray-dark">분류4</span></a></div>
			</div>
			<div class="row">
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/05.jpg"><span class="text-gray-dark">분류5</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/06.jpg"><span class="text-gray-dark">분류6</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/07.jpg"><span class="text-gray-dark">분류7</span></a></div>
				<div class="col-sm-3"><a class="d-block navi-link text-center mb-30" href="#"><img class="d-block" src="${pageContext.request.contextPath}/static/frontend/assets/img/shop/header-categories/08.jpg"><span class="text-gray-dark">분류8</span></a></div>
			</div>
		</div>
	</div>
	<!-- navbar 카테고리 끝 -->
	
	<!-- navbar 메인 네비게이션 -->
	<nav class="site-menu">
		<ul>
			<li class="has-submenu active"><a href="#">Home</a>
			</li>
			<li class="has-megamenu"><a href="${pageContext.request.contextPath }/shop/product_list">Shop</a>
				<ul class="mega-menu">
					<li><span class="mega-menu-title">대분류1</span>
						<ul class="sub-menu">
							<li><a href="#">소분류1</a></li>
							<li><a href="#">소분류2</a></li>
							<li><a href="#">소분류3</a></li>
							<li><a href="#">소분류4</a></li>
						</ul>
					</li>
					<li><span class="mega-menu-title">대분류2</span>
						<ul class="sub-menu">
							<li><a href="#">소분류1</a></li>
							<li><a href="#">소분류2</a></li>
							<li><a href="#">소분류3</a></li>
							<li><a href="#">소분류4</a></li>
						</ul>
					</li>
					<li><span class="mega-menu-title">대분류3</span>
						<ul class="sub-menu">
							<li><a href="#">소분류1</a></li>
							<li><a href="#">소분류2</a></li>
							<li><a href="#">소분류3</a></li>
							<li><a href="#">소분류4</a></li>
						</ul>
					</li>
					<li><span class="mega-menu-title">대분류3</span>
						<ul class="sub-menu">
							<li><a href="#">소분류1</a></li>
							<li><a href="#">소분류2</a></li>
							<li><a href="#">소분류3</a></li>
							<li><a href="#">소분류4</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li class="has-submenu"><a href="#">Service</a>
				<ul class="sub-menu">
					<li><a href="#">견적문의</a></li>
				</ul>
			</li>
			<li class="has-submenu"><a href="#">Community</a>
				<ul class="sub-menu">
					<li><a href="${pageContext.request.contextPath }/community/notice_board">공지사항</a></li>
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">Q&A</a></li>
					<li><a href="#">갤러리</a></li>
				</ul>
			</li>
			<li class="has-submenu"><a href="#">About Us</a>
			</li>
		</ul>
	</nav>
	<!-- navbar 메인 네비게이션 끝 -->
	
	<!-- navbar 툴바 -->
	<div class="toolbar">
		<div class="toolbar-inner">
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
			<div class="toolbar-item">
			<a href="#">
				<div><i class="icon-slash"></i><span class="text-label">로그아웃</span></div>
			</a>
			</div>
			<div class="toolbar-item">
				<a href="${pageContext.request.contextPath }/account/mypage_order">
					<div><i class="icon-box"></i><span class="text-label">마이페이지</span></div>
				</a>
			</div>
			<div class="toolbar-item">
				<a class="#">
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
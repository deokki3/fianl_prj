<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- BEGIN #sidebar -->
		<div id="sidebar" class="app-sidebar">
			<!-- BEGIN scrollbar -->
			<div class="app-sidebar-content" data-scrollbar="true" data-height="100%">
				<!-- BEGIN menu -->
				<div class="menu">
					<div class="menu-profile">
						<a href="javascript:;" class="menu-profile-link" data-toggle="app-sidebar-profile" data-target="#appSidebarProfileMenu">
							<div class="menu-profile-cover with-shadow"></div>
							<div class="menu-profile-image menu-profile-image-icon bg-gray-900 text-gray-600">
								<i class="fa fa-user"></i>
							</div>
							<div class="menu-profile-info">
								<div class="d-flex align-items-center">
									<div class="flex-grow-1">
										ADMIN
									</div>
									<div class="menu-caret ms-auto"></div>
								</div>
							</div>
						</a>
					</div>
					<div id="appSidebarProfileMenu" class="collapse">
						<div class="menu-item pt-5px">
							<a href="javascript:;" class="menu-link">
								<div class="menu-icon"><i class="fa fa-cog"></i></div>
								<div class="menu-text">Settings</div>
							</a>
						</div>
						<div class="menu-divider m-0"></div>
					</div>
					<div class="menu-header"></div>
					<div class="menu-item active">
						<a href="${pageContext.request.contextPath}/admin/" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-th-large"></i>
							</div>
							<div class="menu-text">DASHBOARD</div>
						</a>
					</div>
					
					<div class="menu-item has-sub">
						<a href="javascript:;" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-align-left"></i>
							</div>
							<div class="menu-text">MENU</div>
							<div class="menu-caret"></div>
						</a>
						<div class="menu-submenu">
							<div class="menu-item has-sub">
								<a href="javascript:;" class="menu-link">
									<div class="menu-text">회원</div>
								</a>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/member/memlist" class="menu-link"><div class="menu-text">회원 목록</div><a>
										</a>
									</div>
								</div>
							</div>
							<div class="menu-item has-sub">
								<a href="javascript:;" class="menu-link">
									<div class="menu-text">상품 카테고리</div>
								</a>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/cate/catelist" class="menu-link"><div class="menu-text">카테고리 목록</div></a>
										</a>
									</div>
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/cate/cateinsert" class="menu-link"><div class="menu-text">카테고리 추가</div></a>
										</a>
									</div>
								</div>
							</div>
							<div class="menu-item has-sub">
								<a href="javascript:;" class="menu-link">
									<div class="menu-text">상품</div>
								</a>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/product/productlist" class="menu-link"><div class="menu-text">상품 목록</div></a>
										</a>
									</div>
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath}/admin/product/productinsert" class="menu-link"><div class="menu-text">상품 추가</div></a>
										</a>
									</div>
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath}/admin/product/addimg" class="menu-link"><div class="menu-text">이미지 추가/수정/삭제</div></a>
										</a>
									</div>
								</div>
							</div>
							<div class="menu-item has-sub">
								<a href="javascript:;" class="menu-link">
									<div class="menu-text">주문</div>
								</a>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/order/orderlist" class="menu-link"><div class="menu-text">전체 주문 목록</div></a>
										</a>
									</div>
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/order/paymentlist" class="menu-link"><div class="menu-text">전체 결제 목록</div></a>
										</a>
									</div>
								</div>
							</div>
							<div class="menu-item has-sub">
								<a href="javascript:;" class="menu-link">
									<div class="menu-text">커뮤니티</div>
								</a>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/comunity/" class="menu-link">전체 게시글 목록<div class="menu-text"></div></a>
										</a>
									</div>
								</div>
							</div>
							<div class="menu-item has-sub">
								<a href="javascript:;" class="menu-link">
									<div class="menu-text">통계</div>
								</a>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/stats/" class="menu-link"><div class="menu-text">매출 통계</div></a>
										</a>
									</div>
								</div>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<a href="${pageContext.request.contextPath }/admin/stats/" class="menu-link"><div class="menu-text">상품 통계</div></a>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- BEGIN minify-button -->
					<div class="menu-item d-flex">
						<a href="javascript:;" class="app-sidebar-minify-btn ms-auto" data-toggle="app-sidebar-minify"><i class="fa fa-angle-double-left"></i></a>
					</div>
					<!-- END minify-button -->
					
				</div>
				<!-- END menu -->
			</div>
			<!-- END scrollbar -->
		</div>
		<div class="app-sidebar-bg"></div>
		<div class="app-sidebar-mobile-backdrop"><a href="#" data-dismiss="app-sidebar-mobile" class="stretched-link"></a></div>
		<!-- END #sidebar -->
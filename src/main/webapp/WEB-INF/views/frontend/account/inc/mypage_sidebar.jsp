<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<!-- 마이페이지 사이드바 -->
	<div class="col-lg-3">
		<aside class="user-info-wrapper">
			<div class="user-cover" style="background-image: url(${pageContext.request.contextPath}/static/frontend/assets/img/account/user-cover-img.jpg);">
				<!-- 뱃지 -->
			</div>
			<div class="user-info">
				<!-- 프로필이미지 부분 
				<div class="user-avatar">
					<a class="edit-avatar" href="#"></a><img src="" alt="">
				</div>
				프로필이미지 부분 -->
				<sec:authorize access="isAuthenticated()">
					<div class="user-data">
						<h4 class="h5"><sec:authentication property="principal.memberVo.id" var="id"/>${id}님</h4><span>환영합니다</span>
					</div>
				</sec:authorize>
			</div>
		</aside>
		<nav class="list-group">
			<a class="list-group-item" id="order" href="${pageContext.request.contextPath }/account/mypage_order">주문내역</a>
			<a class="list-group-item" id="delivery" href="${pageContext.request.contextPath }/account/mypage_delivery">배송지 관리</a>
			<a class="list-group-item" id="question" href="${pageContext.request.contextPath }/account/mypage_question">문의내역</a>
			<a class="list-group-item" id="wishlist" href="${pageContext.request.contextPath }/account/mypage_wishlist">관심상품</a>
			<a class="list-group-item" id="myreview" href="${pageContext.request.contextPath }/account/mypage_myreview">나의 리뷰</a>
			<a class="list-group-item" id="modify" href="${pageContext.request.contextPath }/account/mypage_modify?id=${id}">개인 정보 관리</a>
		</nav>
	</div>
	
	
<script>
	let mypageName = location.pathname.split("/");
	let mypageIndex = mypageName[3];
	if(mypageIndex == 'mypage_order'){
		$("#order").addClass("with-badge active");
	}else if(mypageIndex == 'mypage_delivery'){
		$("#delivery").addClass("with-badge active");
	}else if(mypageIndex == 'mypage_question'){
		$("#question").addClass("with-badge active");
	}else if(mypageIndex == 'mypage_wishlist'){
		$("#wishlist").addClass("with-badge active");
	}else if(mypageIndex == 'mypage_myreview'){
		$("#myreview").addClass("with-badge active");
	}else if(mypageIndex == 'mypage_modify'){
		$("#modify").addClass("with-badge active");
	}else{
		$(".list-group a").removeClass("with-badge active");
	}
</script>
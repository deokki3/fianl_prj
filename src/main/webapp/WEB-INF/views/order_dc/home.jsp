<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/home.jsp</title>
</head>
<body>
<h1>Home!</h1>
<ul>
	<c:if test="${sessionScope.id ==null }">
		<li><a href="${pageContext.request.contextPath }/login">로그인</a></li>

	</c:if>
	
	<c:if test="${sessionScope.id !=null }">
		<li><a href="${pageContext.request.contextPath }/memlogout">로그아웃</a></li>
		<li><a href="${pageContext.request.contextPath }/cartlist?id=${sessionScope.id}">장바구니</a></li>
	</c:if>
	
	
	<li><a href="${pageContext.request.contextPath }/insert">회원추가</a></li>
	<li><a href="${pageContext.request.contextPath }/list">회원목록</a></li>
	<li><a href="${pageContext.request.contextPath }/productlist">상품목록</a></li>
	<li><a href="${pageContext.request.contextPath }/product?id=${sessionScope.id}">상품보기</a></li>
</ul>
</body>
</html>
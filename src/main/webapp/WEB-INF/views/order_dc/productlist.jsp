<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>상품 목록</h1>
<table>
	<tr>
		<th>상품명</th>
		<th>가격</th>
		<th>브랜드</th>
	</tr>
	<c:forEach var="vo" items="${productlist }">
		<tr>
			<td>${vo.product_name }</td>
			<td>${vo.selling_price }</td>
			<td>${vo.brand }</td>
			<td><a href="${pageContext.request.contextPath }/productDetail?mem_no=${sessionScope.mem_no}&product_id=${vo.product_id}">상품보기</a></td>
			
			<td><a href="${pageContext.request.contextPath }/insertCart?mem_no=${sessionScope.mem_no}&
			product_id=${vo.product_id}">장바구니 담기</a></td>
		</tr>
	 </c:forEach>
</table>
<a href="${pageContext.request.contextPath }">메인</a>
</body>
</html>
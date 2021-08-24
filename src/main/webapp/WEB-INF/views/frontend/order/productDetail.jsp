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
<h1>상품 페이지</h1>
	
		<h4>상품 이름:${vo.product_name }</h4>
		<h4>판매 가격:${vo.selling_price }</h4>
		<h4>브랜드명:${vo.brand }</h4>
	
	<!-- 1번 -->
		<form method="get" action="${pageContext.request.contextPath}/purchase0">
			<h4>상품개수:<input type="number" name="product_count" value="1"></h4>
			<input type="hidden" name="product_id" value="${vo.product_id }">
			<input type="hidden" name="product_name" value="${vo.product_name }">
			<input type="hidden" name="selling_price" value="${vo.selling_price }">
			<input type="submit" value="구매">
		</form>
		

</body>

</html>
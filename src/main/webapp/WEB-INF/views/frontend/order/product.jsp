<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product.jsp</title>
</head>
<body>
<h1>컴퓨터1</h1>
<a href="${pageContext.request.contextPath }/purchase?id=${sessionScope.id}&product_id=${vo.product_id}">구매하기</a>
</body>
</html>
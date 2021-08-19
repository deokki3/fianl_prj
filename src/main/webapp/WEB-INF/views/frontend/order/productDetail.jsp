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
		<h4>상품개수:<input type="text" name="${product_count }" id="product_count"></h4>
		<h2><a href="${pageContext.request.contextPath }/purchase?mem_no=${sessionScope.mem_no}
		&product_id=${vo.product_id }&product_name=${vo.product_name}&selling_price=${vo.selling_price }&product_count=">구매하기!</a></h2>
		<button type="button" onclick="location.href='${pageContext.request.contextPath }/purchase?mem_no=${sessionScope.mem_no}&product_id=${vo.product_id }&product_name=${vo.product_name}&selling_price=${vo.selling_price }&selling_price=${vo.selling_price }&product_count=1'" 
		onclick="btnPurchase()">버튼</button>
</body>
<script type="text/javascript">
	function btnPurchase(){
		let product_count= document.getElementById("product_count").value;
		location.href="${pageContext.request.contextPath }/purchase?mem_no=${sessionScope.mem_no}&product_name=${vo.product_name}&selling_price=${vo.selling_price }&product_count=";
		location.href+= product_count;
	}
</script>
</html>
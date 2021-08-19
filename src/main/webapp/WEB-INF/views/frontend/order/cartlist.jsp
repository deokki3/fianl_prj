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
<h1>장바구니</h1>
	<div class="checkbox_group">
		<table>
			<tr>
				<th><input type="checkbox" id="allchk" checked="checked">
				<th>상품이미지</th>
				<th>상품명</th>
				<th>상품금액</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>삭제</th>
			</tr>	
		
			<c:forEach var="vo" items="${cartlist }">
				<tr>
					<td><input type="checkbox" class="normal" checked="checked"></td>
						<td><img src="static/frontend/assets/img/${vo.img_name_save }"></td>
						<td>${vo.product_name }</td>
						<td>${vo.selling_price }</td>
						<td>${vo.product_count }</td>
						<td>
							${vo.product_count}x${vo.selling_price } = ${vo.product_count*vo.selling_price }
						</td>
					<td><a href="${pageContext.request.contextPath }/deleteCart?cart_no=${vo.cart_no}"><input type="button" value="삭제" ></a></td>	
				</tr>
			 </c:forEach>
		</table>
	 </div>
<a href="${pageContext.request.contextPath }">메인</a>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(".checkbox_group").on("click", "#allchk",function(){
		var checked=$(this).is(":checked");
		
		if(checked){
			$(this).parents(".checkbox_group").find('input').prop("checked", true);
		}else{
			$(this).parents(".checkbox_group").find('input').prop("checked", false);
		}
	});
	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
	    var is_checked = true;

	    $(".checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });

	    $("#allchk").prop("checked", is_checked);
	});
</script>
</html>
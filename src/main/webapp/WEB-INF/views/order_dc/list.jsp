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
<h1>회원목록</h1>
<table>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이메일</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.id }</td>
			<td>${vo.pwd }</td>
			<td>${vo.email }</td>
			<td><a href="/spring12/delete?id=${vo.id }">삭제</a></td>
			<td><a href="/spring12/update?id=${vo.id }">수정</a></td>
		</tr>
	 </c:forEach>
</table>
<a href="/${pageContext.request.contextPath }">메인</a>
</body>
</html>
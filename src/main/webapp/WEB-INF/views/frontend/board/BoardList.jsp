<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<html>
<head>
<title>advBoard게시판</title>
</head>
<body>
 
	<div id="root">
		<header>
			<h1>Neocom</h1>
		</header>
		<section id="container">
			<h2>글 목록</h2>

			<table>
				<tr> 
				    <th>글번호</th>
					<th>회원번호</th>
					<th>비밀번호</th>
					<th>비밀글여부</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>글삭제</th>
					<th>글수정</th>
				</tr>

			 
				<c:forEach items="${advboardlist}" var="item">
					<tr>
					    <td>${item.adv_board_no}
						<td>${item.mem_no}</td>
						<td>${item.adv_password}</td>
						<td>${item.adv_secret_chk}</td>
						<td>${item.adv_title}</td>
						<td>${item.adv_content}</td>
						<td><a href="/neocom/advboard/delete?adv_board_no=${item.adv_board_no}">삭제</a><td>
						<td><a href="/neocom/advboard/update?adv_board_no=${item.adv_board_no}">수정</a><td>
						
					</tr>
				</c:forEach>
				

			</table>
<div >
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${pu.pageNum==i }"><!-- 현재페이지 -->
				<a href="/neocom/advboard/list?pageNum=${i }&field=${field}&keyword=${keyword}">
				<span style='color:blue;font-weight: bold'>[${i }]</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="/neocom/advboard/list?pageNum=${i }&field=${field}&keyword=${keyword}">
				<span style='color:gray;'>[${i }]</span>
				</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
		</section>
	</div>
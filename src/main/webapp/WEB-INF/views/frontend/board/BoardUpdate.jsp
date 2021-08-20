<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
<h1>게시글수정하기</h1>
<form method="post" action="${pageContext.request.contextPath }/advboard/update">
    글번호<br>
    <input type="text" name="adv_board_no" value="${vo.adv_board_no}" readonly="readonly"><br>
	회원번호<br>
	<input type="text" name="mem_no" value="${vo.mem_no}" readonly="readonly"><br>
	비밀번호<br>
	<input type="password" name="adv_password" value="${vo.adv_password}"><br>
	비밀글여부<br>
	<input type="text" name="adv_secret_chk" value="${vo.adv_secret_chk }"><br>
	글제목<br>
	<input type="text" name="adv_title" value="${vo.adv_title}"><br>
	글내용<br>
	<textarea rows="5" cols="50" name="adv_content">${vo.adv_content }</textarea>
	<br>
	등록일<br>
	<fmt:formatDate value="${vo.adv_regdate}" var="adv_regdate" pattern="YYYY/MM/dd HH:mm:ss"/>
	<input type="text" name="adv_regdate" value="${vo.adv_regdate}"><br>
	<input type="submit" value="저장">
</form>
</body> 
</html>



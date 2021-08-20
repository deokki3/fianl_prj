<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Neocom</title>
</head>
<body>

	<div id="root">
		<header>
			<h1>Neocom</h1>
		</header>


		<section id="container">

			<form role="form" method="post" action="${pageContext.request.contextPath }/advboard/create">
 
				<p>
					<label for="">비밀번호</label><input type="password" name="adv_password" />
				</p> 
				<p>
					<label for="">비밀글여부</label><input type="text" name="adv_secret_chk" />
				</p>
				<p>
					<label for="">글 제목</label><input type="text" name="adv_title" />
				</p>
				<p>
					<label for="">글 내용</label>
					<textarea name="adv_content"></textarea>
				</p>  
 
				<p>
				
					<button type="submit">작성</button>
				</p>
			</form>

		</section>

		<hr />

		<footer> Neocom </footer>

	</div>

</body>
</html>
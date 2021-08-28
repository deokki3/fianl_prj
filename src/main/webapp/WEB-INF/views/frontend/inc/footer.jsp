<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- footer -->
<footer class="site-footer" style="background-image: url(${pageContext.request.contextPath}/static/frontend/assets/img/footer-bg.png);">
<div class="container">
	<div class="row">
		<!-- 풋터 카테고리 -->
		<div class="col-lg-6">
			<section class="widget widget-links widget-light-skin">
				<h3 class="widget-title">Information</h3>
				<div class="row">
					<div class="col-md-6">
						<ul>
							<li><a href="${pageContext.request.contextPath}/aboutus/introduction">네오컴 소개</a></li>
							<li><a href="${pageContext.request.contextPath}/aboutus/agreement">이용약관</a></li>
							<li><a href="${pageContext.request.contextPath}/aboutus/privacypolicy">개인정보처리방침</a></li>
							<li><a href="${pageContext.request.contextPath }/community/qnaboard_list">고객센터</a></li>
						</ul>
					</div>
					<div class="col-md-6">
					<!--<ul>
							<li><a href="#">footer content5</a></li>
							<li><a href="#">footer content6</a></li>
							<li><a href="#">footer content7</a></li>
							<li><a href="#">footer content8</a></li>
						</ul> -->
					</div>
				</div>
			</section>
		</div>
		<div class="col-lg-1 col-md-1"></div>
		<div class="col-lg-5 col-md-6">
		<!--<section class="widget widget-links widget-light-skin">
				<h3 class="widget-title">footer title2</h3>
				<table>
				<tbody>
					<tr align="right">
						
					</tr>
				</tbody>
				</table> 
				
			</section>-->
			<div style="float:left;width:405px;height:100%;">
				<img src="${pageContext.request.contextPath}/static/frontend/assets/img/footerimage.png" style="max-width:420px;max-height:285px">
			</div>	
		</div>
		<!-- 풋터 카테고리 끝 -->
	</div>
	<div class="mb-4"></div>
	
	<!-- Copyright -->
	<p class="footer-copyright">ⓒ All rights reserved neocom</p>
</div>
</footer>
<!-- end of footer -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
</head>
<body>
	<!-- header -->
	<%-- 	<jsp:include page="header.jsp"></jsp:include> --%>
	<%@include file="header.jsp"%>
	<section>
		<div class="section_top">
			<div class="rolling"></div>
			<div class="top_inner">
				<div class="new_movie_logo">
					<img src="resources/css/new_movie.png">
				</div>
				<div class="new_movie_wrap">
					<div class="new_movie_images">
						<div class="top">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/fU_xpiEwAnQ" frameborder="0"
								allowfullscreen></iframe>
						</div>
						<div class="bottom">botton</div>
					</div>
					<div class="new_movie_info">
						<div class="top">
							<img src="resources/image/movie_imageHLFR7EYI.jpg">
						</div>
						<div class="bottom">
						신기한동물사전<br>
						어드벤처<br>
						2016.11.28개봉<br>
						<p>신기한 동물들 탈출,뉴욕 최대의 위기!<br><br>
						새로운 마법의 시대가 열린다.
						</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 		<div class="section_bottom"> -->
		<!-- 			<div class="bottom_inner"></div> -->
		<!-- 		</div> -->
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
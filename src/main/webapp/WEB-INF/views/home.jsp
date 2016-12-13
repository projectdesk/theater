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
						<div class="top">top</div>
						<div class="bottom">botton</div>
					</div>
					<div class="new_movie_info"><div class="top">rigit_top</div><div class="bottom">rigit_bottom</div></div>
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
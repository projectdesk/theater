<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/lib/jquery.bxslider.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/main_section.css?ver=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="resources/js/lib/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<div class="section_top">
			<div class="top_inner">
				<ul class="bxslider">
					<li><img src="resources/css/rolling_1.jpg" /></li>
					<li><img src="resources/css/rolling_2.jpg" /></li>
				</ul>
				<h1>오늘의 영화</h1>
				<div class="movie_list">
					<img src="resources/image/movie_imageHLFR7EYI.jpg" />
				</div>
				<div class="movie_poster">
					<a href="#" id="video_play"> <img
						src="resources/image/main_movie.jpg">
						<img id="play_btn" src="resources/image/play_btn.png" alt="재생"/>
					</a>
				</div>
				<!--//movie_poster -->
			</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
	<a href="#"><div class="overlay"></div></a>
	<div class="video_wrap">
		<iframe id="movie_video" width="100%" height="100%"
			src="https://www.youtube.com/embed/4f3wL6cgFZ8?enablejsapi=1" frameborder="0"
			allowfullscreen></iframe>
	</div>
</body>
</html>
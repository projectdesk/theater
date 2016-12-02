<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/reservation.js"
	charset='utf-8'></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/reservation.css">
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>
	<section>
		<div class='section_inner'>
			<div class="theater">
				<div>영화관</div>
				<a href="#" value="강남점">강남점</a><a href="#" value="종로점">종로점</a><a
					href="#" value="잠실점">잠실점</a>
			</div>
			<div class="theater_room">
			<div>상영관</div>
			</div>
			<div class='movie'>
			<div>영화</div>
			</div>
			<div class="movie_date">
			<div>날짜</div>
			</div>
			<div class="select_bar">
			<div>좌석선택</div>
				<div class="watching_number">
					어른 : <a href="#" value="1">1</a><a href="#" value="2">2</a><a
						href="#" value="3">3</a><a href="#" value="4">4</a><a href="#"
						value="5">5</a>

					<form name="reservation" action="reservation.do" method="post">
						<input type="hidden" value="" name="theater" /> <input
							type="hidden" value="" name="room" /> <input type="hidden"
							value="" name="viewing_id" /> <input type="hidden" value="0"
							name="howmany" /> <input type="hidden" value="0" name="nownum" />
						<input type="hidden" value="" name="seat" /> <input type="hidden"
							value="" name="room_idx" /> <input type="submit" value="예약하기" />
					</form>
				</div>
			</div>
		</div>
		<!--section_innser -->
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
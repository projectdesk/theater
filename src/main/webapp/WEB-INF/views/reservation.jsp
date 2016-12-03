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
			<div class="reservation_title">예매</div>
			<div class="theater movie_back">
				<div class="title">영화관</div>
				<c:forEach var="theater" items="${theaters}">
					<a href="#" value="${theater}">${theater}</a>
				</c:forEach>
			</div>
			<div class='movie movie_back'>
				<div class="title">영화</div>
				<c:forEach var="movie" items="${movies}">
				<a href="#" value="${movie}">${movie}</a>
				</c:forEach>
			</div>
			<div class="movie_date movie_back">
				<div class="title">날짜</div>
			</div>
			<div class="movie_time movie_back">
				<div class="title">시간</div>
			</div>
			<div class="select_bar movie_back">
				<div class="title">좌석선택</div>
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
				<span class="seat_container"></span>
				
			</div>
		</div>
		<!--section_innser -->
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
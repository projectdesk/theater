<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link href="https://fonts.googleapis.com/css?family=Inconsolata"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/reservation.js"
	charset='utf-8'></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/reservation.css">
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>
	<%-- 	<jsp:include page="header.jsp"></jsp:include> --%>
	<section>

		<div class="top_wrap">
			<div class="top_wrap_inner">
				<div class="top">
					<ul class="left">
						<li><a href="./"><img src="resources/css/home.png"></a></li>
						<li><span>></span></li>
						<li>영화예매</li>
					</ul>
					<ul class="right">
						<li>고객센터 연락처</li>
						<li><span>/</span></li>
						<li>1588-0000</li>
					</ul>
				</div>
			</div>
		</div>



		<div class='section_inner'>
			<h2 class="reservation_title">예매</h2>



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
					인원 : <a href="#" value="1">1</a><a href="#" value="2">2</a><a
						href="#" value="3">3</a><a href="#" value="4">4</a><a href="#"
						value="5">5</a>
					<form name="reservation" action="reservation.do" method="post">
						<input type="hidden" value="" name="howmany" /> <input
							type="hidden" value="" name="nownum" /><br> <input
							type="hidden" value="" name="time_no" /> <input type="hidden"
							value="" name="seat" /><br> <input type="hidden"
							value="${sessionScope.id}" name="user_confirm" /><br> <input
							type="submit" value="예약하기" />
					</form>
				</div>

				<div class="screen">
					<p align="center">screen</p>
				</div>

				<span class="seat_container"></span>

				<div class="price_bottom">
					<p class="price">
						<span>가격 </span>
					</p>
					<p class="icon_span">
						<img src="resources/css/arrow.png">
					</p>
					<p class="price_right">
						<span></span>
					</p>
				</div>
			</div>
		</div>
		<!--section_innser -->
	</section>


	<!-- footer -->
	<%@include file="footer.jsp"%>
	<c:if test="${param.successed==true}">
		<script type="text/javascript">
			alert("예약완료");
		</script>
	</c:if>
</body>
</html>
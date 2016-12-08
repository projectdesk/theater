<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/register.css">
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>
	<section>
		<table>
			<tr>
				<td>극장</td>
				<td>영화이름</td>
				<td>날짜</td>
				<td>시간</td>
				<td>좌석</td>
				<td></td>
			</tr>
			<c:forEach	items="${reservations}" var="reservation">
				<tr>
				<td>${reservation.theater}</td>
				<td>${reservation.name}</td>
				<td>${reservation.date}</td>
				<td>${reservation.time}</td>
				<td>${reservation.seat}</td>
				<td><input type="button" value="예매취소"/></td>
			</tr>
			</c:forEach>
		</table>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
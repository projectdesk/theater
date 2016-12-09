<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.id==null}">
<script>
alert("로그인해야됩니다.");
location.href="./";
</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/myPage.css">
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>
	<section>
		<div class="top_inner">
			<div class="section_left">
				<a href="mypage.do">예매정보</a>
				<a href="moduser.do">개인정보 수정</a>
				<a href="modpass.do">비밀번호 수정</a>
			</div>
			<div class="section_right">
				<table>
					<tr>
						<td>극장</td>
						<td>영화이름</td>
						<td>날짜</td>
						<td>시간</td>
						<td>좌석</td>
						<td></td>
					</tr>
					<c:set var="preNo" value="0"/>
					<c:forEach items="${reservations}" var="reservation">
						<c:set var="no" value="${reservation.no}"/>
						<tr>
							<td>${reservation.theater}</td>
							<td>${reservation.name}</td>
							<td>${reservation.date}</td>
							<td>${reservation.time}</td>
							<td>${reservation.seat}</td>
							<td>취소</td>
						<c:set var="preNo" value="${reservation.no}"/>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
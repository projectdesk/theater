<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/theater.css">
<!-- <link rel="stylesheet" href="resources/css/jquery-ui.css"> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="resources/js/jquery-ui.js"></script> -->
<!-- <script src="resources/js/register.js"></script> -->
<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>
	<section>
		<div class="top_inner">
			<div class="section_left">
				<c:forEach items="${theaters}" var="theater">
					<div>
						<a href="theater.do?theater=${theater.name}">${theater.name}</a>
					</div>
				</c:forEach>
			</div>
			<div class="section_right">
				<c:forEach items="${theaters}" var="theater">
					<c:if test="${param.theater==null}">
						<c:if test="${theater.no==1}">
							${theater.content}
						</c:if>
					</c:if>
					<c:if test="${param.theater==theater.name}">
				${theater.content}
					</c:if>
				</c:forEach>

			</div>

		</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:if test="${sessionScope.id!=null}">
		<script type="text/javascript">
		history.back(-1);
		</script>
</c:if>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/register.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/register.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>
	<section>
		<div class="top_inner">
			<form method="post" action="login.do">
				<table>
					<tr>
						<td>아이디</td><td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td>패스워드</td><td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td></td><td><input type="submit"></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
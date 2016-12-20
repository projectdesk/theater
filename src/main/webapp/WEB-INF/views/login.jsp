<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:if test="${sessionScope.id==null&&loginCheck=='false'}">
	<script>alert("로그인실패")</script>
</c:if>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/register.css"> -->
<link rel="stylesheet" type="text/css"
	href="resources/css/login.css?ver=14">
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
		<div class="top_wrap">
			<div class="top">
				<ul>
					<li><a href="/"><img src="resources/css/home.png"
							width="22"></a></li>
					<li>회원서비스</li>
					<li><span>></span></li>
					<li>로그인</li>
				</ul>
			</div>



			<div class="login_check">
				<form method="post" action="login.do">
					<table>
						<tr>
							<td class="sign">아이디와 패스워드를 입력해주세요.</td>
						</tr>
						<tr>
							<td class="log_form"><input type="text" name="id"></td>
						</tr>
						<tr>
							<td class="log_form"><input type="password" name="password"></td>
						</tr>
						<tr>
							<td class="button_top"><input type="submit" value="로그인"></td>

						</tr>
						<tr>
							<td><span class="button_left"><input type="button"
									value="회원가입" onclick="location.href='register.do'"></span> <span
								class="button_right"><input type="button" value="ID/PW찾기"
									onclick="location.href='findidpw.do'"></span></td>
						</tr>
					</table>
				</form>
			</div>


		</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
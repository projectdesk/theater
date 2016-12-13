<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<%@include file="mypageNav.jsp"%>
			<div class="section_right">
				<form action="mod_userpass.do" method="post">
					<table>
					<tr><td>현재 비밀번호 </td><td><input name="nowPassword" type="password" /></td></tr>
					<tr><td>새로운 비밀번호 </td><td><input name="newPassword" type="password" /></td></tr>
					<tr><td>비밀번호 확인  </td><td><input name="confirmPassword" type="password"/></td></tr>
				   	<tr><td></td><td><input type="submit" value="변경하기" style="float:right"></td></tr>
				   </table>
				</form>
			</div>
		</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertmovie.do" method="post">
		<table>
			<tr>
				<td>영화관</td>
				<td><input type="text" name="theater"></td>
			</tr>
			<tr>
				<td>영화</td>
				<td><input type="text" name="movie"></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><input type="text" name="date"></td>
			</tr>
			<tr>
				<td>시간</td>
				<td><input type="text" name="time"></td>
			</tr>
			<tr>
				<td>상영관</td>
				<td><input type="text" name="room"></td>
			</tr>
			<tr>
				<td>제한인원</td>
				<td><input type="text" name="max"></td>
			</tr>
			<tr><td></td><td><input type="submit"/></td></tr>
		</table>
	</form>
</body>
</html>
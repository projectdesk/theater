<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="resources/css/helpCenter.css">
</head>
<body>
<!-- header -->
	<%@include file="../header.jsp" %>
	<section>
		<form action="delete.do" method="post">
		<input type=hidden name="no" value="${param.no}"/>
		<table>
		<tr><td>정말 삭제하시겠습니까?</td></tr>
			<tr><td colspan="2"><input type="submit" value="삭제" style="float:right"/></td></tr>
				<tr><td colspan="2"><input type="button" onclick="window.location='helpcenter.do'" value="돌아가기" style="float:right"/></td></tr>
		</table>
		</form>
	</section>
	<!--footer-->
	<%@include file="../footer.jsp" %>
</body>
</html>


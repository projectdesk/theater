<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="resources/css/helpCenter.css">
</head>
<body>
<!-- header -->
	<%@include file="header.jsp" %>
	<section>
		<div class="help_section_top"></div>
		<div class="help_section_bottom">
			<div class="help_select"><a href="#">1:1 문의</a><a href="#">자주 묻는 질문</a></div>
			<table>
				<tr><th width="60px">번호</th><th width="150px">날짜</th><th width="600px">제목</th><th>글쓴이</th><th width="60px"></th></tr>
			</table>
		</div>
	</section>
		<!-- footer -->
	<%@include file="footer.jsp" %>
</body>
</html>
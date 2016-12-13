<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/helpCenter.css">
</head>
<body>
	<!-- header -->
	<%@include file="../header.jsp"%>
	<section> <input type="hidden" value="${dto.no}" name="no">
	<div class="help_section_top"></div>
	<div class="help_section_bottom" align="center">
		<div class="help_select">
			<a href="helpcenter.do">1:1 문의</a><a href="ListBest.do">자주 묻는 질문</a>
		</div>
		<div align="left">
			<form action="answer.do" method="post" name="question">
				<table border="1" align="center" width="500px">
					<input type="hidden" name="question_no" value="${param.no}">
					<tr align="center">
						<td width="60">게시자</td>
						<td><input type="text" name="writer" value="운영자"></td>
					</tr>
					<tr align="center">
						<td width="90">제목</td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr align="center">
						<td>질문내용</td>
						<td><textarea name="content" cols="90" rows="23"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="글쓰기"><input type="button" value="게시판"
							onclick="window.location='helpcenter.do'"></input></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<!-- footer -->
	<%@include file="../footer.jsp"%>
</body>
</html>


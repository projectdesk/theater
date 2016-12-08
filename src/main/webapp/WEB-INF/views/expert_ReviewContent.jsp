<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Content</title>
</head>
<body>
<form name="form" method="post">
<input type="hidden" value="${dto.review_no}" name="review_no">
</form>
<script type="text/javascript">
function DeleteOpen(){
	
		var DeleteUrl="expert_ReviewDelete.do?review_no=${param.review_no}";
		var DeleteOption ="width=370,height=360, resizable=no, scrollbars=no, status=no;";
		window.open(DeleteUrl,"",DeleteOption);
	 	document.getElementById('form').submit();
}
</script>
	<div class="wrap">
		<table align="center" width="400" border="1">
			<tr>
				<td>Review_No</td>
				<td>${dto.review_no}</td>
			</tr>
			<tr>
				<td>Movie_No</td>
				<td>${dto.movie_no}</td>
			</tr>
			<tr>
				<td>Grade</td>
				<td>${dto.grade}</td>
			</tr>
			<tr>
				<td>Writer</td>
				<td>${dto.writer}</td>
			</tr>
			<tr>
				<td>Title</td>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<td>Date</td>
				<td>${dto.wdate}</td>
			</tr>
			<tr>
				<td>Content</td>
				<td width="350" height="150">${dto.content}</td>
			</tr>
			<tr>
				<td colspan="2" align="left">
				<input type="button" onclick="window.location='expert_ReviewList.do'" value="목록">
				<input type="button" onclick="DeleteOpen()" value="삭제">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
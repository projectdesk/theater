<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Review_MoiveSelect</title>
</head>
<script type="text/javascript">
function movieCheck(){
	if(document.movieSelect.title.value==""){
		alert("영화 제목을 입력하세요");
		document.movieSelect.title.focus();
		return;
	}
		document.movieSelect.submit();
}
</script>
<body>
	<div class="wrap">영화 찾기</div>
	<div class="wrap">
	<c:if test="${param.sort=='audience'}">
		<form action="review_MovieSelect.do?sort=audience" method="post" name="movieSelect">
	</c:if>
	<c:if test="${param.sort!='audience'}">
		<form action="review_MovieSelect.do" method="post" name="movieSelect">
	</c:if>
	
			<table border="1">
				<tr>
					<td><input type="text" name="title"></td>
					<td><input type="button" value="검색" onclick="movieCheck()">
					</td>
				</tr>
			</table>
			<table border="">
				<tr>
					<td align="center" width="60">No</td>
					<td align="center" width="120">Movie Title</td>
				</tr>
			</table>

			<c:forEach var="item" items="${list}">
				<table>
					<tr>
						<td align="center" width="60">${item.no}</td>
						<td align="center" width="120">
						<c:if test="${param.sort=='audience'}">
					
						 <a href="ReviewWrite.do?sort=audience&no=${item.no}&title=${item.title}">${item.title}</a>
						</c:if>
						<c:if test="${param.sort!='audience'}">
						<a href="ReviewWrite.do?no=${item.no}&title=${item.title}">${item.title}</a>
						</c:if>
						</td>

					</tr>
				</table>
			</c:forEach>
		</form>
	</div>
</body>
</html>
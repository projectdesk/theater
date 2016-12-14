<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Content</title>
</head>
<body>
<script type="text/javascript">
function DeleteOpen(){
	if (confirm("정말 삭제하시겠습니까??") == true){   
	    document.DeleteForm.submit();
	}else{  
	    return;
	}	
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
				<c:if test="${param.sort=='audience'}">
				<input type="button" onclick="window.location='ReviewList.do?sort=audience'" value="목록">
				<form action="ReviewList.do?sort=audience" method="post" name="DeleteForm">
				<input type="hidden" name="review_no" value="${dto.review_no}">
				<input type="button" onclick="DeleteOpen()" value="삭제">
				</form>
				</c:if>
				<c:if test="${param.sort!='audience'}">
				<input type="button" onclick="window.location='ReviewList.do'" value="목록">
				<form action="ReviewList.do" method="post" name="DeleteForm">
				<input type="hidden" name="review_no" value="${dto.review_no}">
				<input type="button" onclick="DeleteOpen()" value="삭제">
				</form>
				</c:if>

			</tr>
		</table>
	</div>
</body>
</html>
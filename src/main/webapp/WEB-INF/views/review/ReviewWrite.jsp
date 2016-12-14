<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Review Write</title>
</head>
<body>
	<div class="wrap">
	<c:if test="${param.sort=='audience'}">
		<form action="ReviewWrite.do?sort=audience" method="post">
	</c:if>
	<c:if test="${param.sort!='audience'}">
		<form action="ReviewWrite.do" method="post">
	</c:if>
			<div>
				영화 : <input type="text" value="${param.title}" disabled="disabled" placeholder="영화 검색" readonly="readonly">
				<input type="hidden" name="movie_no" value="${param.no}">
				<c:if test="${param.sort=='audience'}">
					<input type="button" value="검색" onclick="window.location.href='review_MovieSelect.do?sort=audience'">
				</c:if>
				<c:if test="${param.sort!='audience'}">
					<input type="button" value="검색" onclick="window.location.href='review_MovieSelect.do'">
				</c:if>
			</div>
			<div>
				평점 : <select id="grade" name="grade">
					<option value="">평점</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					</select>
			</div>
			<div>
				제목 : <input type="text" name="title" />
			</div>
			<div>
				글쓴이: <input type="text" name="writer" />
			</div>
			<div>
				내용 : <textarea rows="5" cols="20" name="content"></textarea>
			</div>
			<div>
				<input type="submit" value="등록하기">
				<c:if test="${param.sort=='audience'}">
				<input  type="button" onclick="window.location.href='ReviewList.do?sort=audience'" value="취소">
				</c:if>
				<c:if test="${param.sort!='audience'}">
				<input  type="button" onclick="window.location.href='ReviewList.do'" value="취소">
				</c:if>
				
			</div>
		</form>
	</div>
</body>
</html>
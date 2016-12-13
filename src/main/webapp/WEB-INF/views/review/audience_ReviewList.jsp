<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/register.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/register.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="../header.jsp"%>
	<section>
		<h1 align="center">관객 리뷰</h1>
		<div class="wrap">
			<form action="audience_ReviewSearch.do" method="get">
				<table align="center" width="500">
					<tr>
						<td>
							<table align="center" width="200">
								<tr>
									<td>현재상영작</td>
								</tr>
								<tr>
									<td><select id="CurrentMovies" name="movie_no">
											<option value="">영화선택</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
									</select> <input type="submit" value="조회"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
			<table align="center" width="200">
				<tr>
					<td>관객평</td>
					<td><a href="expert_ReviewList.do">전문가평</a></td>
				</tr>
			</table>
		</div>

		<div class="wrap">
			<table align="center" width="500" border="1">
				<tr>
					<td width="50">No</td>
					<td width="100">평점</td>
					<td width="90">Title</td>
					<td width="90">Writer</td>
					<td width="120">Date</td>
					<td width="60">Hits</td>
				</tr>
			</table>
			<c:forEach var="item" items="${list}">
				<table align="center" width="500" border="1">
					<tr>
						<td width="50">${item.review_no}</td>
						<td width="100">${item.grade}</td>
						<td width="90"><a
							href="audience_ReviewContent.do?review_no=${item.review_no}">${item.title}</a></td>
						<td width="90">${item.writer}</td>
						<td width="120">${item.wdate}</td>
						<td width="60">${item.hit}</td>
					</tr>
				</table>
			</c:forEach>
		</div>
		<div class="wrap">
			<table align="center" width="500" border="1">
				<tr>
					<td align="center"><c:if test="${paging.leftOn==true}">
							<a class="left_on"
								href="audience_ReviewList.do?page=${paging.firstPage-paging.maxPage}"><</a>
						</c:if> <c:if test="${paging.leftOn==false}">
							<a class="left_off"><</a>
						</c:if> <c:forEach var="num" begin="${paging.firstPage}"
							end="${paging.endPage}" step="1">
							<c:if test="${page==num}">
								<a class="page_num page_off">${num}</a>
							</c:if>
							<c:if test="${page!=num}">
								<a class="page_num" page_num="${num}"
									href="audience_ReviewList.do?page=${num}">${num}</a>
							</c:if>

						</c:forEach> <c:if test="${paging.rightOn==true}">
							<a class="right_on"
								href="audience_ReviewList.do?page=${paging.firstPage+paging.maxPage}">></a>
						</c:if> <c:if test="${paging.rightOn==false}">
							<a class="right_off">></a>
						</c:if></td>
				</tr>
			</table>
			<table align="center">
				<tr>
					<td><input type="button"
						onclick="window.location='audience_ReviewWrite.do'" value="글쓰기">
					</td>
				</tr>
			</table>
		</div>

	</section>
	<!-- footer -->
	<%@include file="../footer.jsp"%>
</body>
</html>

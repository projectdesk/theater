<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Review Write</title>
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
<c:if test="${param.sort=='audience'}">
		<c:set var="address" value="ReviewList.do?sort=audience&"/>
			<h1 align="center">관객리뷰</h1>
			<form action="ReviewSearch.do" method="get" name="movieSelect">
			<input type="hidden" name="sort" value="audience">
		</c:if>
		<c:if test="${param.sort!='audience'}">
		<c:set var="address" value="ReviewList.do"/>
			<h1 align="center">전문가 리뷰</h1>
			<form action="ReviewSearch.do" method="get" name="movieSelect">
		</c:if>
<div class="wrap">
	<table align="center" width="500">
		<tr>
		<td>
		<table align="center" width="200">
			<tr>
			<td>현재상영작</td>
			</tr>
			<tr>
			<td><input type="text" name="title"></td>
			<td><input type="button" value="검색" onclick="movieCheck()">
			</tr>
		</table>
		</td>
		</tr>
	</table>
	</form>
	<table align="center" width="200">
		<tr>
		<td><a href="ReviewList.do?sort=audience">관객평</a></td>
		<td><a href="ReviewList.do">전문가평</a></td>
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
    <table align="center" width="500" border="1" >
      <tr>
        <td width="50">${item.review_no}</td>
        <td width="100">${item.grade}</td>
        <td width="90">
        <c:if test="${param.sort=='audience'}">
		<a href="ReviewContent.do?sort=audience&review_no=${item.review_no}">${item.title}</a>
		</c:if>
		<c:if test="${param.sort!='audience'}">
		<a href="ReviewContent.do?&review_no=${item.review_no}">${item.title}</a>
		</c:if>
        </td>
        <td width="90">${item.writer}</td>
        <td width="120">${item.wdate}</td>
        <td width="60">${item.hit}</td> 
      </tr>
    </table>
    </c:forEach>
  </div>
  <div class="page">
			<table align="center" width="500" border="1">
			<tr>
			<td align="center">
				<c:if test="${paging.leftOn==true}">
					<a class="left_on"
						href="${address}?page=${paging.firstPage-paging.maxPage}"><</a>
				</c:if>
				<c:if test="${paging.leftOn==false}">
					<a class="left_off"><</a>
				</c:if>
				<c:forEach var="num" begin="${paging.firstPage}"
					end="${paging.endPage}" step="1">
					<c:if test="${page==num}">
						<a class="page_num page_off">${num}</a>
					</c:if>
					<c:if test="${page!=num}">
						<a class="page_num" page_num="${num}" href="${address}?page=${num}">${num}</a>
					</c:if>

				</c:forEach>
				<c:if test="${paging.rightOn==true}">
					<a class="right_on"
						href="${address}?page=${paging.firstPage+paging.maxPage}">></a>
				</c:if>
				<c:if test="${paging.rightOn==false}">
					<a class="right_off">></a>
				</c:if>
				</td>
				</tr>
				</table>
				    <table align="center">
    <tr>
      <td>
      <c:if test="${param.sort=='audience' }">
      <input  type="button" onclick="window.location.href='ReviewList.do?sort=audience'" value="전체 글">
      <input  type="button" onclick="window.location='ReviewWrite.do?sort=audience'" value="글쓰기">
      </c:if>
      <c:if test="${param.sort!='audience' }">
      <input  type="button" onclick="window.location.href='ReviewList.do'" value="전체 글">
      <input  type="button" onclick="window.location='ReviewWrite.do'" value="글쓰기">
      </c:if>
      </td>
      </tr>
      </table>
		</div>
</body>
</html>
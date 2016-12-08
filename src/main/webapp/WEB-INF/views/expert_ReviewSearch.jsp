<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Review Write</title>
</head>
<body>
<h1 align="center">����and����</h1>
<div class="wrap">
	<form action="expert_ReviewSearch.do" method="get">
	<table align="center" width="500">
		<tr>
		<td>
		<table align="center" width="200">
			<tr>
			<td>�������</td>
			</tr>
			<tr>
			<td>
			<select id="CurrentMovies" name="movie_no">
					<option value="">��ȭ����</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
			</select>
			<input type="submit" value="��ȸ">
			</td>
			</tr>
		</table>
		</td>
		</tr>
	</table>
	</form>
	<table align="center" width="200">
		<tr>
		<td>������</td>
		<td><a href="expert_ReviewList.do">��������</a></td>
		</tr>
	</table>
</div>

  <div class="wrap">
  <table align="center" width="500" border="1">
      <tr>
      <td width="50">No</td>
      <td width="100">����</td>
      <td width="90">Title</td>
      <td width="90">Writer</td>
      <td width="120">Date</td>
      <td width="60">Hits</td>
      </tr>
  </table>
  <c:forEach var="item" items="${slist}">
    <table align="center" width="500" border="1" >
      <tr>
        <td width="50">${item.review_no}</td>
        <td width="100">${item.grade}</td>
        <td width="90"><a href="expert_ReviewContent.do?review_no=${item.review_no}">${item.title}</a></td>
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
						href="expert_ReviewSearch.do?page=${paging.firstPage-paging.maxPage}"><</a>
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
						<a class="page_num" page_num="${num}" href="expert_ReviewSearch.do?page=${num}">${num}</a>
					</c:if>

				</c:forEach>
				<c:if test="${paging.rightOn==true}">
					<a class="right_on"
						href="expert_ReviewSearch.do?page=${paging.firstPage+paging.maxPage}">></a>
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
      <input  type="button" onclick="window.location='expert_ReviewList.do'" value="��ü ��">
      <input  type="button" onclick="window.location='expert_ReviewWrite.do'" value="�۾���">
      </td>
      </tr>
      </table>
		</div>
</body>
</html>
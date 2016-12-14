<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/movie.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<title></title>
<style>
</style>
<input type="text" placeholder ="내용">
</head>
<body>
  <%@include file="header.jsp"%>
    <section>
    <div><a href="movieList.do">전체</a><a href="movieList.do?sort=now">현재상영작</a><a href="movieList.do?sort=comming">개봉예정작</a></div>
    <div class="movie_page">
          <c:forEach var="item" items="${list}" varStatus="status">
              <div class="left">
                <a href="./moviePage.do?no=${item.no}"><img src="resources/image/${item.poster}"></a><br><span class="movie_title">${item.title}</span>
                <br><span>${item.play_date}</span>
              </div>
          </c:forEach>
    </div>
    <div class="paging">
			<c:if test="${paging.leftOn==true}">
				<a class="left_on"
					href="movieList.do?page=${paging.firstPage-paging.maxPage}">◀</a>
			</c:if>
			<c:if test="${paging.leftOn==false}">
				<a class="left_off">◀</a>
			</c:if>
			<c:forEach var="num" begin="${paging.firstPage}"
				end="${paging.endPage}" step="1">
				<c:if test="${page==num}">
					<a class="page_num page_off">${num}</a>
				</c:if>
				<c:if test="${page!=num}">
					<a class="page_num" page_num="${num}"
						href="movieList.do?page=${num}">${num}</a>
				</c:if>

			</c:forEach>
			<c:if test="${paging.rightOn==true}">
				<a class="right_on"
					href="movieList.do?page=${paging.firstPage+paging.maxPage}">▶</a>
			</c:if>
			<c:if test="${paging.rightOn==false}">
				<a class="right_off">▶</a>
			</c:if>
<!--     <div></div> -->
    <div><ul><li>인기순위</li>
    <c:forEach var="item" items="${bestList}" varStatus="status">
    	<li><a href="./movieList.do?no=${item.no}">${item.title}</a></li>
    </c:forEach>
    </ul>
    </div>
    </section>
  <%@include file="footer.jsp"%>
</body>
</html>
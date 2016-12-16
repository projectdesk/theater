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
</head>
<body>
  <%@include file="header.jsp"%>
  <div class="top_wrap">
    <div class="top_wrap_inner">
      <div class="top">
        <ul class="left">
          <li><a href="./"><img src="resources/css/home.png"></a></li>
          <li><span>></span></li>
          <li>영화리스트</li>
        </ul>
        <ul class="right">
          <li>고객센터 연락처</li>
          <li><span>/</span></li>
          <li>1588-0000</li>
        </ul>
      </div>
    </div>
  </div>


  <section>

  <div class="top_title">
    <a href="movieList.do">전체</a><a href="movieList.do?sort=now">현재상영작</a><a
      href="movieList.do?sort=comming">개봉예정작</a>
  </div>


  <div class="movie_body">
    <div class="movie_page">
      <c:forEach var="item" items="${list}" varStatus="status">
        <div class="left">
          <img src="resources/image/${item.poster}"><br> 
           <a href="./moviePage.do?no=${item.no}"><input type="button" value="${item.title}"></a>
        </div>
      </c:forEach>
    </div>
  </div>

<%--  <span>${item.title} <br>${item.play_date} --%>
<!--             <br> -->


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
      <c:if test="${paging.nowPage==num}">
        <a class="page_num page_off">${num}</a>
      </c:if>
      <c:if test="${paging.nowPage!=num}">
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
  </div>




  <div class="best_list">
    <h2>실시간 인기 차트</h2>
    <p align="center" class="top_line"></p>
    <div class="best_inner">
      <ol>
        <c:forEach var="item" items="${bestList}" varStatus="status">
          <li><a href="./moviePage.do?no=${item.no}">${item.title}</a></li>
        </c:forEach>
      </ol>
    </div>
    <p align="center" class="bottom_line"></p>
  </div>



  </section>
  <%@include file="footer.jsp"%>
</body>
</html>
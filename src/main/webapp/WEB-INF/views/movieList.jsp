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
    <div><a href="#">전체</a><a href="#">현재상영작</a><a href="#">개봉예정작</a></div>
    <div class="movie_page">
          <c:forEach var="item" items="${list}" varStatus="status">
              <div class="left">
                <a href="./moviePage.do?no=${item.no}"><img src="resources/image/${item.poster}"></a><br><span class="movie_title">${item.title}</span>
                <br><span>${item.play_date}</span>
              </div>
          </c:forEach>
    </div>
    </section>
  <%@include file="footer.jsp"%>
</body>
</html>
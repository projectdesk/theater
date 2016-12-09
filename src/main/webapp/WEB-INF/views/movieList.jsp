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

  <div id="wrap">
    <section>
    <div class="movie_page">
     <c:set var="i" value="0" /> <c:set var="j" value="3" />
          <c:forEach var="item" items="${list}" varStatus="status">

            <c:if test="${status.count<=3}">
              <div class="left">
                <a href="./moviePage.do?no=${item.no}"><img src="resources/image/${item.poster}" width="200" height="300"></a><br> <span>${item.title}</span>
                <br> <span>${item.play_date}</span>
              </div>
            </c:if>
            <c:if test="${status.count>=3}">
              <div class="left">
                <a href="./moviePage.do?no=${item.no}"><img src="resources/image/${item.poster}" width="200" height="300"></a> <br> <span>${item.title}</span>
                <br> <span>${item.play_date}</span>
              </div>
            </c:if>
            <c:set var="i" value="${i+1}" />
          </c:forEach></li>
    </section>
  </div>
  <%@include file="footer.jsp"%>
</body>
</html>
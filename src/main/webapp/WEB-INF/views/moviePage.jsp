<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/review.css">
<title></title>
</head>
<body>
  <%@include file="header.jsp"%>

  <div class="moviePage_Info">
    <img src="resources/image/${dto.poster}" width="350" height="450">
    <ul>
      <li>영화제목<sapn>${dto.title}</sapn></li>
      <li>개봉날짜<span>${dto.play_date}</span></li>
      <li>감독<span>${dto.director}</span></li>
      <li>배우<span>${dto.actor}</span></li>
      <li>장르<span>${dto.genre}</span></li>
      <li>상영등급<span>${dto.limit}</span></li>
      <li>줄거리${dto.content}</li>
      <li>조회수${dto.hit}</li>
    </ul>


  </div>
  <%@include file="footer.jsp"%>
</body>
</html>
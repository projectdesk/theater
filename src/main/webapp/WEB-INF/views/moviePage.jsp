<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/movie.css">
<title></title>
</head>
<body>
  <%@include file="header.jsp"%>





  <div class="top_wrap">
    <div class="top_wrap_inner">
      <div class="top">
        <ul class="left">
          <li><a href="./"><img src="resources/css/home.png"></a></li>
          <li><span>></span></li>
          <li>마이페이지</li>
          <li><span>></span></li>
          <li>${dto.title}&nbsp;줄거리</li>
        </ul>
        <ul class="right">
          <li>고객센터 연락처</li>
          <li><span>/</span></li>
          <li>1588-0000</li>
        </ul>
      </div>
    </div>
  </div>


  <div class="movieDetail">
    <div class="movieDetail_inner">
      <tr>
        <td><img src="resources/image/${dto.poster}"></td>
      </tr>
      <table>
        <tr>
          <td colspan="2"><h2>${dto.title}</h2></td>
        </tr>
        <tr height="30">
          <td colspan="2"></td>
        </tr>

        <tr>
          <td class="title">개봉날짜</td>
          <td class="story_body">${dto.play_date}</td>
        </tr>
        <tr>
          <td class="title">감독</td>
          <td class="story_body">${dto.director}</td>
        </tr>
        <tr>
          <td class="title">배우</td>
          <td class="story_body">${dto.actor}</td>
        </tr>
        <tr>
          <td class="title">장르</td>
          <td class="story_body">${dto.genre}</td>
        </tr>
        <tr>
          <td class="title">상영등급</td>
          <td class="story_body">${dto.limit}</td>
        </tr>
        <tr>
          <td class="title">조회수</td>
          <td class="story_body">${dto.hit}</td>
        </tr>
        <tr height="30" class="line">
          <td colspan="2"></td>
        </tr>
        <tr>
          <td class="story">줄거리</td>
        </tr>
        <tr>
          <td colspan="2" class="story_body_main">${dto.content}</td>
        </tr>
      </table>
    </div>
  </div>
  <%@include file="footer.jsp"%>
</body>
</html>
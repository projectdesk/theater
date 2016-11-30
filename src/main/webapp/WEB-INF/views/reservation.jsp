<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>HTML5, CSS3 and JavaScript demo</title>
<script type="text/javascript" src="resources/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="resources/js/reservation.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/reservation.css">
</head>
<body>
  <div class="theater">
    <a href="#" value="강남점">강남점</a><a href="#" value="종로점">종로점</a><a href="#" value="잠실점">잠실점</a>
  </div>
  <div class="theater_room">
    <a href="#" class='room'">1</a>
  </div>
  <div class="watching_number">
    어른 : 
    <a href="#"  value="1">1</a><a href="#" value="2">2</a><a href="#"  value="3">3</a><a href="#"  value="4">4</a><a href="#"  value="5">5</a>
 
  몇명<input type="text" value="0" name="howmany"/>
  선택<input type="text" value="0" name="nownum"/>
 <form action="reservation.do" method="post">
  좌석<input type="text" value="" name="seat"/>
  영화관<input type="text" value="" name="theater"/>
  상영관<input type="text" value="" name="room"/>
  <input type="submit" value="예약하기"/>
  </form>
  </div>
  <div class="select_bar">
    

  </div>
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>HTML5, CSS3 and JavaScript demo</title>
<!-- <script type="text/javascript" src="resources/js/jquery-3.1.1.js"></script> -->
<script
  src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/reservation.js" charset='utf-8'></script>
<link rel="stylesheet" type="text/css" href="resources/css/reservation.css">
<meta charset="utf-8"/>
</head>
<body>
  <div class="theater">
    <a href="#" value="강남점">강남점</a><a href="#" value="종로점">종로점</a><a href="#" value="잠실점">잠실점</a>
  </div>
  <div class="theater_room">
    <a href="#" class='room'">1</a>
  </div>
  <div class='movie'></div>
  <div class="watching_number">
    어른 : 
    <a href="#"  value="1">1</a><a href="#" value="2">2</a><a href="#"  value="3">3</a><a href="#"  value="4">4</a><a href="#"  value="5">5</a>
  
 <form name="reservation" action="reservation.do" method="post">
  <input type="hidden" value="" name="theater"/> 
  <input type="hidden" value="" name="room"/> 
  <input type="hidden" value="" name="viewing_id"/>
  <input type="hidden" value="0" name="howmany"/>
  <input type="hidden" value="0" name="nownum"/>
  <input type="hidden" value="" name="seat"/>
  <input type="hidden" value="" name="room_idx"/>
  <input type="submit" value="예약하기"/>
  </form>
  </div>
  <div class="select_bar">
  </div>
 
</body>
</html>
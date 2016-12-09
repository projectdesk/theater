<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
  <%@include file="header.jsp"%>
  <form method="post" action="movieWrite.do"
    enctype="multipart/form-data">
    <div id="wrap">


      <div class="movieInfo">
        <ul>
          <li>영화제목<input type="text" name="title"></li>
          <li><label for="play_date">개봉날짜</label> <input
            type="text" id="play_date" name="play_date"></li>

          <li>감독<input type="text" name="director"></li>
          <li>배우진<input type="text" name="actor"></li>


          <li>장르<select name="genre">
              <option value="장르를 선택해 주세요.">장르를 선택해 주세요.</option>
              <option value="로맨스">로맨스</option>
              <option value="드라마">드라마</option>
              <option value="멜로">멜로</option>
              <option value="SF영화">SF영화</option>
              <option value="스릴러">스릴러</option>
              <option value="공포">공포</option>
              <option value="범죄">범죄</option>
              <option value="미스터리">미스터리</option>
              <option value="판타지">판타지</option>
              <option value="코미디">코미디</option>
              <option value="애니메이션">애니메이션</option>
              <option value="다큐멘터리">다큐멘터리</option>
          </select></li>


          <li>상영등급<select name="limit_play">
              <option value="상영 등급을 선택해 주세요.">상영 등급을 선택해주세요.</option>
              <option value="전체관람등급">전체관람등급</option>
              <option value="12세관람등급">12세관람등급</option>
              <option value="15세관람등급">15세관람등급</option>
              <option value="청소년관람불가">청소년관람불가</option>
          </select></li>


          <li>줄거리<textarea name="content"></textarea></li>
        </ul>

        <ul>
          <li>파일업로드 <input type="file" name="file">
          </li>
        </ul>


        <input type="submit" value="등록"> <input type="button"
          value="메인으로가기">
      </div>




    </div>

    <%@include file="footer.jsp"%>
  </form>
</body>
</html>
<%@ page language="java" pageEncoding="UTF-8"%>
<div id="header_wrap">
  <header>
    <div class="contain">
      <a href="./">
        <div class="logo">logo</div>
      </a>
      <nav>
        <div class="nav_top">
          <div class="nav_bar">
            <ul>
              <li><c:if test="${sessionScope.id==null}">
                  <a href="login.do">로그인</a>
                  <span class="seperate"></span></li>


              <li><a href="register.do">회원가입</a><span></span></li>
              </c:if>
              <c:if test="${sessionScope.id!=null}">
                <a href="logout.do">로그아웃</a>
                <span></span>
                </li>
              </c:if>
              <li><a href="mypage.do">마이페이지</a></li>
            </ul>
          </div>
        </div>



        <div class="nav_top_r">
          <ul>
            <li><a href="#"><img
                src="resources/css/facebook.png"></a></li>
            <li><a href="#"><img
                src="resources/css/instagram.png"></a></li>
            <li><a href="#"><img
                src="resources/css/kakaotalk.png"></a></li>
          </ul>
        </div>


        <div class="nav_bottom">
          <div class="nav_bar">
            <ul>
              <li><a href="movie.do">영화</a></li>
              <li><a href="reservation.do">예매</a></li>
              <li><a href="theater.do">영화관</a></li>
              <li><a href="review.do">리뷰&평점</a></li>
              <li><a href="helpcenter.do">고객센터</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="scroll_content"></div>
    </div>
  </header>
</div>

<!-- <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> -->
<!-- <script src="resources/js/scroll-fixed.js"></script> -->
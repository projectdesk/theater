<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/myPage.css">
</head>
<body>
	<c:if test="${passCheck=='false'}">
	<script>alert("현재 비밀번호가 틀리거나 새로운비밀번호가 이전 비밀번호와 같습니다.");</script>
	</c:if>
	<c:if test="${passCheck=='true'&&passCheck!=null}">
	<script>location.href="mypage.do";</script>
	</c:if>
  <!-- header -->
  <%@include file="header.jsp"%>
  <section>
    <div class="top_wrap">
      <div class="top_wrap_inner">
        <div class="top">
          <ul class="left">
            <li><a href="./"><img src="resources/css/home.png"></a></li>
            <li><span>></span></li>
            <li>마이페이지</li>
            <li><span>></span></li>
            <li>비밀번호 변경</li>
          </ul>
          <ul class="right">
            <li>고객센터 연락처</li>
            <li><span>/</span></li>
            <li>1588-0000</li>
          </ul>
        </div>
      </div>
    </div>

    <div class="top_inner">
      <%@include file="mypageNav.jsp"%>
      <div class="section_right">
        <div class="section_right_inner">
          <form action="mod_userpass.do" method="post">

            <div class="mod_top_subtitle">
              <p>비밀번호는 3개월에 한 번씩 바꿔주세요.</p>
            </div>
            
            
            <div class="mod_pass">
              <ul>
                <li><span class="pass_title">현재 비밀번호</span> <input
                  name="nowPassword" type="password" /></li>
                <li><span class="pass_title">새로운 비밀번호</span> <input
                  name="newPassword" type="password" /></li>
                <li><span class="pass_title">비밀번호 확인</span> <input
                  name="confirmPassword" type="password" /></li>
              </ul>

            </div>
            <div class="mod_pass_button">
              <ul>
                <li></li>
                <li><input type="submit" value="변경하기"></li>
              </ul>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
  <!-- footer -->
  <%@include file="footer.jsp"%>
</body>
</html>
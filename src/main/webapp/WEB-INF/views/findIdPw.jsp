<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:if test="${sessionScope.id!=null}">
  <script type="text/javascript">
			history.back(-1);
		</script>w
</c:if>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/register.css"> -->
<link rel="stylesheet" type="text/css" href="resources/css/login.css?ver=14">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/register.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
  <!-- header -->
  <%@include file="header.jsp"%>
  <section>
    <div class="top_wrap">
      <div class="top">
      <ul>
      <li><a href="/"><img src="resources/css/home.png" width="22"></a></li>
      <li>회원서비스</li>
      <li><span>></span></li>
      <li>아이디,비밀번호 찾기</li>
      </ul>
      </div>

<div class="idcheck">
<c:if test="${id==null}">
  <form method="post" action="findid.do">
        <table>
          <tr>
            <td class="sign">아이디를 찾으세요.</td>
          </tr>
          <tr>
            <td class="idcheck_form"><label for="id">NAME</label></span><input type="text" name="id"></td>
          </tr>
          <tr>
            <td class="idcheck_form"><label for="email">EMAIL</label></span><input type="text"
              name="email"></td>
          </tr>
          <tr>
            <td class="button_top"><input type="submit" value="아이디찾기"></td>
          </tr>
        </table>
         </form>
         </c:if>
         <c:if test="${id!=null&&id!=false}">
         	아이디는 ${id}입니다
         </c:if>
         <c:if test="${id==false}">
         	아이디 찾기 정보가 틀렸습니다.
         </c:if>
</div>
	<div class="pwd_check">
	<c:if test="${password==null}">
  <form method="post" action="findpw.do">
        <table>
          <tr>
            <td class="sign">패스워드를 찾으세요.</td>
          </tr>
          <tr>
            <td class="idcheck_form"><label for="id">ID</label><input type="text" id="id" name="id"></td>
          </tr>
          <tr>
            <td class="idcheck_form"><label for="name">NAME</label><input type="text" id="name" name="name"></td>
          </tr>
          <tr>
            <td class="idcheck_form"><label for="email">EMAIL</label><input type="text" id="email"
              name="email"></td>
          </tr>
          <tr>
            <td class="idcheck_form"><label for="birthday">BIRTHDAY</label><input type="text" id="birthday"
              name="birthday"></td>
          </tr>
          <tr>
            <td class="button_top"><input type="submit" value="비밀번호찾기"></td>
          </tr>
        </table>
         </form>
         </c:if>
         <c:if test="${password!=null&&password!=false}">
         	비밀번호는 ${password} 입니다.
         </c:if>
         <c:if test="${password==false}">
         	비밀번호 찾기 정보가 틀렸습니다.
         </c:if>
</div>

<div class="poster">
<img src="resources/image/movie_image.png" width="350">
</div>
     
    </div>
  </section>
  <!-- footer -->
  <%@include file="footer.jsp"%>
</body>
</html>
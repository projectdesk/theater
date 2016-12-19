<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/register.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/register.js"></script>
<script src="resources/js/user.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
  <!-- header -->
  <%@include file="header.jsp"%>
  <section>
    <div class="top_inner_register">
      <h1>회원가입</h1>
      <form method="post" action="register.do" name="regForm">
        <table cellspacing="0" cellpadding="3">
          <tr>
            <td class="register_title">사용자 ID</td>
            <td class="register_body"><input type="text" name="id"
              size="30" maxlength="12"> <input type="button"
              name="confirm_id" value="ID중복확인" id="idcheck"> <input
              type="hidden" name="idcheck" value=""></td>
          </tr>
          <tr>
            <td class="register_title">비밀번호</td>
            <td class="register_body"><input type="password"
              name="password" size="30" maxlength="12"></td>
          </tr>
          <tr>
            <td class="register_title">비밀번호 확인</td>
            <td class="register_body"><input type="password"
              name="passwordCheck" size="30" maxlength="12"></td>
          </tr>
          <tr>
            <td class="register_title">사용자 이름</td>
            <td class="register_body"><input type="text"
              name="name" size="30" maxlength="10"></td>
          </tr>
          <tr>
            <td class="register_title">생년월일</td>
            <td class="register_body">
            <input type="text" id="year" name="year"  size="4" maxlength="4"/>
            <input type="text" id="month" name="month"  size="2" maxlength="2"/>
            <input type="text" id="date" name="date"  size="2" maxlength="2"/> ex)1992 02 16
            <input type="hidden" id="birthday"
              name="birthday" size="30" id="datepicker"></td>
          </tr>
          <tr>
            <td class="register_title">E-Mail</td>
            <td class="register_body"><input type="email"
              name="email" size="30" maxlength="30"></td>
          </tr>
          <tr>
            <td class="register_title">우편번호</td>
            <td class="register_body"><input type="text"
              name="zipcode" id="zipcode" size="20"
              placeholder=" 우편번호 검색" readonly="readonly"> <input
              type="button" value=" 우편번호찾기" onClick="addressSearch()"></td>
          </tr>
          <tr>
            <td class="register_title">주소</td>
            <td class="register_body"><input type="text"
              name="address1" id="address1" size="70"
              placeholder=" 주소를 검색해주세요." readonly="readonly"></td>
          </tr>
          <tr>
            <td class="register_title">상세 주소</td>
            <td class="register_body"><input type="text"
              name="address2" id="address2" size="70"
              placeholder=" 상세주소를 적어 주세요."></td>
          </tr>
          <tr>
            <td class="register_title">핸드폰 번호</td>
            <td class="register_body">
            <input type="text" id="phone1" name="phone1" size="3" maxlength="3"/>
            <input type="text" id="phone2" name="phone2" size="4" maxlength="4"/>
            <input type="text" id="phone3" name="phone3" size="4" maxlength="4"/> ex)010 1234 1234
            <input type="hidden" id="phone"
              name="phone" size="30" placeholder=" 핸드폰번호를 적어 주세요."></td>
          </tr>
        </table>

        <div class="register_button">
          <input type="button" value="등 록" onclick="inputCheck()">
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="가입안함" onclick="inputForm.jsp">
        </div>
      </form>
    </div>
  </section>
  <!-- footer -->
  <%@include file="footer.jsp"%>

</body>
</html>
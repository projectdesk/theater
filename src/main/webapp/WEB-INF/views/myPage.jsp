<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.id==null}">
  <script>
			alert("로그인해야됩니다.");
			location.href = "./";
		</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/myPage.css">
</head>
<body>
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
            <li>예매정보</li>
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
          <table class="ticket_info">
            <tr class="r_title">
              <td></td>
              <td>극장</td>
              <td>영화이름</td>
              <td>날짜</td>
              <td>시간</td>
              <td>좌석</td>
              <td></td>
              <td></td>
            </tr>
            <%--             <c:set var="preNo" value="0" /> --%>
            <c:forEach items="${reservations}" var="reservation"
              varStatus="loop">
              <c:set var="no" value="${reservation.no}" />
              <tr class="r_body">
                <td>${loop.count}</td>
                <td>${reservation.theater}</td>
                <td>${reservation.name}</td>
                <td>${reservation.date}</td>
                <td>${reservation.time}</td>
                <td>${reservation.seat}</td>
                <td><a href="cancel_reserv.do?no=${reservation.no}">취소</a></td>
                <td><img width="50" src="resources/image/${reservation.poster}"></td>
              </tr>

              <%--  <c:set var="preNo" value="${reservation.no}" /> --%>
            </c:forEach>
          </table>
        </div>
      </div>
    </div>
  </section>
  <!-- footer -->
  <%@include file="footer.jsp"%>
</body>
</html>
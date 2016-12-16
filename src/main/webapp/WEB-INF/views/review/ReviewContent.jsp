<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/notice_side.css">
</head>
<body>
  <!-- header -->
  <%@include file="../header.jsp"%>
  <section>

  <div class="top_wrap">
    <div class="top_wrap_inner">
      <div class="top">
        <ul class="left">
          <li><a href="./"><img src="resources/css/home.png"></a></li>
          <li><span>></span></li>
          <li><a href="helpcenter.do">고객센터</a></li>
          <li><span>></span></li>
          <li><a href="helpcenter.do#helpdesk">1:1 문의</a></li>
          <li><span>></span></li>
          <li><a href="ListBest.do#listBest">자주 묻는 질문</a></li>
        </ul>
        <ul class="right">
          <li>고객센터 연락처</li>
          <li><span>/</span></li>
          <li>1588-0000</li>
        </ul>
      </div>
    </div>
  </div>



  <div class="inner">
    <h1>리뷰 페이지</h1>
    <div class=write_form>
      <input type="hidden" value="${dto.review_no}" name="no">
      <table class="question_page">
        <tr>
          <td class="question_detail">게시자</td>
          <td class="detail_body">${dto.writer}</td>
        </tr>
        <tr>
          <td class="question_detail">날짜</td>
          <td class="detail_body">${dto.wdate}</td>
        </tr>
        <tr>
          <td class="question_detail">제목</td>
          <td class="detail_body">${dto.title}</td>
        </tr>
        <tr>
          <td class="question_detail">본문</td>
          <td class="detail_body">${dto.content}</td>
        </tr>

        <!-- 답변  -->
        <c:if test="${sdto.question_no!=null}">
          <input type="hidden" name="getQuestion_no"
            value="${sdto.question_no}">

          <tr>
            <td class="question_con">제목</td>
            <td>[답변]${sdto.title}</td>
          </tr>
          <tr>
            <td class="question_con">본문</td>
            <td>${sdto.content}</td>
          </tr>
        </c:if>
             
             
      <tr class="button_2">
          <td>
          <input type="button" onclick="window.location='answer.do?no=${param.no}'" value="답글">
          <input type="button" value="게시판" onclick="window.location='helpcenter.do'">
          <input type="button" value="삭제" onclick="location.href='delete.do?no=${param.no}'">
          </td>
      </tr>
      </table>
      


    </div>
  </div>
  </section>



  <!-- footer -->
  <%@include file="../footer.jsp"%>
</body>
</html>
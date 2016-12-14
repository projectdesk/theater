<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css"
  href="resources/css/notice_side.css">
</head>
<body>
  <!-- header -->
  <%@include file="../header.jsp"%>
  <section> <input type="hidden" value="${dto.no}" name="no">

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
    <h1>고객센터:답변쓰기</h1>
    <div class="write_form">
      <form action="answer.do" method="post" name="question">
        <table>
          <input type="hidden" name="question_no" value="${param.no}">
          <tr>
            <td class="con">게시자</td>
            <td class="writer"><input type="text" name="writer"
              value="운영자"></td>
          </tr>
          <tr>
            <td class="con">제목</td>
            <td class="title"><input type="text" name="title"></td>
          </tr>
          <tr>
            <td class="con">질문<br>내용
            </td>
            <td><textarea name="content"></textarea></td>
          </tr>


          <tr class="button">
            <td><input type="submit" value="글쓰기"> <input
              type="button" value="게시판"
              onclick="window.location='helpcenter.do'"></td>
          </tr>
        </table>

      </form>
    </div>
  </div>
  </section>
  <!-- footer -->
  <%@include file="../footer.jsp"%>
</body>
</html>


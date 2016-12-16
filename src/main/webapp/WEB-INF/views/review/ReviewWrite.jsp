<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Review Write</title>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/ReviewWrite.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<script src="resources/js/review.js"></script>
</head>
<body>
<%@include file="../header.jsp"%>

<div class="top_wrap">
    <div class="top_wrap_inner">
      <div class="top">
        <ul class="left">
          <li><a href="./"><img src="resources/css/home.png"></a></li>
          <li><span>></span></li>
          <li><a href="ReviewList.do">리뷰&평점</a></li>
          <li><span>></span></li>
          <li><a href="ReviewList.do">전문가 리뷰</a></li>
          <li><span>></span></li>
          <li><a href="">글쓰기</a></li>
        </ul>
        <ul class="right">
          <li>다른 전문가 리뷰 </li>
          <li><span>/</span></li>
          <li>평점</li>
        </ul>
      </div>
    </div>
  </div>
  
<div class="inner">
    <h1>전문가 리뷰쓰기</h1>
    <div class=write_form>
      <form action="ReviewWrite.do" method="post" name="ReviewWrite"></form>
      
      
	<div class="wrap">
	<c:if test="${param.sort=='audience'}">
		<form action="ReviewWrite.do?sort=audience" method="post" name="reviewForm">
	</c:if>
	<c:if test="${param.sort!='audience'}">
		<form action="ReviewWrite.do" method="post" name="reviewForm">
	</c:if>
	
	 <table class="question_page">
          <tr>
            <td align="center" class="question_con">영화</td>
            <td class="title"><input type="text" value="${param.title}"  placeholder="영화 검색" readonly="readonly" name="name">
				<input type="hidden" name="movie_no" value="${param.no}">
				<c:if test="${param.sort=='audience'}">
					<input type="button" value="검색" onclick="window.location.href='review_MovieSelect.do?sort=audience'">
				</c:if>
				<c:if test="${param.sort!='audience'}">
					<input type="button" value="검색" onclick="window.location.href='review_MovieSelect.do'">
				</c:if>
			</td>
           </tr>
   
           <tr>
             <td class="question_con" align="center">
				평점 <td> <select id="grade" name="grade">
					<option value="">평점</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					</select>
			</td>
			</td>
			</tr>
           <tr>
            <td align="center" class="question_con">제목</td>
           <td class="title"><input type="text" name="title" /> </td>
            </tr> 
          <tr>
            <td align="center" class="question_con">내용
            </td>
            <td><textarea name="content"></textarea></td>
          </tr>
          <tr class="button">
          <td>	<input type="button" value="등록하기" onclick="inputCheck()">
				<c:if test="${param.sort=='audience'}">
				<input  type="button" onclick="window.location.href='ReviewList.do?sort=audience'" value="취소">
				</c:if>
				<c:if test="${param.sort!='audience'}">
				<input  type="button" onclick="window.location.href='ReviewList.do'" value="취소">
				</c:if>
          </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
	</div>
	
</body>
</html>
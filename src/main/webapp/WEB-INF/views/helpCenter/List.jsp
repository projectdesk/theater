<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="resources/css/notice.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/helpCenter.css">
</head>
<body>
	<!-- header -->
	<%@include file="../header.jsp"%>
	<section>
	 <h1>고객센터</h1>

  <div class="search">
      <input type="text" placeholder="FAQ검색">
        <input class="icon" type="button">
  </div>

  <div class="notice_top">
    <ul class="left">
      <li><img src="resources/css/notice_icon.png" width="65"></li>
      <li class="title">고객센터</li>
      <li class="num_ber">1588-0000</li>
      <li class="business">AM 11:00 ~ PM 04:00</li>
    </ul>

    <ul class="center">
      <li><img src="resources/css/notice_icon_1.png" width="65"></li>
      <li class="title"><a href="#">상담내역확인</a></li>
      <li class="body">최근 3개월 내역만,<br>확인할 수 있습니다.
      </li>
    </ul>

    <ul class="right">
      <li><a href="#">멤버쉽 포인트 사용안내</a><span>></span></li>
      <li><a href="#">예매/취소내역조회</a><span>></span></li>
      <li><a href="#">아이디/비밀번호 찾기</a><span>></span></li>
      <li><a href="#">패스워드변경</a><span>></span></li>
      <li><a href="#">회원정보조회</a><span>></span></li>
      <li><a href="#">회원탈퇴</a><span>></span></li>
    </ul>
  </div>
	<div class="help_section_top"></div>
	<div class="help_section_bottom" align="center">
		<div class="help_select">
			<a href="helpcenter.do">1:1 문의</a><a href="ListBest.do">자주 묻는 질문</a>
		</div>
		<div>
			<a href="helpcenter.do">[전체글]</a><a
				href="helpcenter.do?kinds=멤버쉽포인트안내">[멤버쉽포인트안내]</a><a
				href="helpcenter.do?kinds=아이디/비밀번호찾기">[아이디/비밀번호]</a><a
				href="helpcenter.do?kinds=패스워드변경">[패스워드변경]</a><a
				href="helpcenter.do?kinds=예매/관람">[예매관련]</a><a
				href="helpcenter.do?kinds=기타">[기타]</a>
		</div>
		<table>
			<tr>
				<th width="60px">번호</th>
				<th width="150px">날짜</th>
				<th width="500px">제목</th>
				<th width="80px">글쓴이</th>
				<th width="55px">답변</th>
				<th width="110px">질문유형</th>
			</tr>
			<c:forEach var="item" items="${flist}">
				<tr align="center">
					<td width="60px">${item.no}</td>
					<td width="150px">${item.wdate}</td>
					<td width="600px"><a
						href="questionok.do?no=${item.no}&question_no=${item.no}">${item.title}</a></td>
					<td>${item.writer}</td>
					<td width="60px">${item.check_answer}</td>
					<td>${item.kinds}</td>
				</tr>
			</c:forEach>

			<c:forEach var="item" items="${klist}">
				<c:if test="${item!=null}">
					<tr align="center">
						<td width="60px">${item.no}</td>
						<td width="100px">${item.kinds}</td>
						<td width="700px" class="open_nav_link" no="${item.no}"><a>${item.title}</a></td>
						<td width="20px" colspan="2">운영자</td>
					</tr>

				</c:if>
			</c:forEach>

		</table>

		<div>
			<c:if test="${paging.leftOn==true}">
				<a class="left_on"
					href="helpcenter.do?page=${paging.firstPage-paging.maxPage}">◀</a>
			</c:if>
			<c:if test="${paging.leftOn==false}">
				<a class="left_off">◀</a>
			</c:if>
			<c:forEach var="num" begin="${paging.firstPage}"
				end="${paging.endPage}" step="1">
				<c:if test="${page==num}">
					<a class="page_num page_off">${num}</a>
				</c:if>
				<c:if test="${page!=num}">
					<a class="page_num" page_num="${num}"
						href="helpcenter.do?page=${num}">${num}</a>
				</c:if>

			</c:forEach>
			<c:if test="${paging.rightOn==true}">
				<a class="right_on"
					href="helpcenter.do?page=${paging.firstPage+paging.maxPage}">▶</a>
			</c:if>
			<c:if test="${paging.rightOn==false}">
				<a class="right_off">▶</a>
			</c:if>
			<input type="button" style="WIDTH: 60pt; HEIGHT: 20pt" value="글쓰기"
				onclick="window.location='question.do'"></input>
		</div>
	</div>




	</section>
	<!-- footer -->
	<%@include file="../footer.jsp"%>
</body>
</html>


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
	href="resources/css/helpCenter.css">
</head>
<body>
	<!-- header -->
	<%@include file="../header.jsp"%>
	<section>
	<div class="help_section_top"></div>
	<div class="help_section_bottom" align="center">
		<div class="help_select">
			<a href="helpcenter.do">1:1 문의</a><a href="ListBest.do">자주 묻는 질문</a>
		</div>
		<form action="ListSearch.do" method="get">
			<tr align="center">
				<td colspan="2">질문유형을 선택해주세요 <select name="kinds">
						<option value="기타" selected="selected">유형을 선택해주세요</option>
						<option value="멤버쉽포인트안내">멤버쉽 포인트 안내</option>
						<option value="아이디/비밀번호찾기">아이디/비밀번호찾기</option>
						<option value="패스워드변경">패스워드변경</option>
						<option value="예매/관람">예매/관람</option>
						<option value="기타">기타</option></td>
			</tr>
			</select>
			<input type="submit" value="조회">
			<table>
				<tr>
					<th width="60px">번호</th>
					<th width="150px">날짜</th>
					<th width="500px">제목</th>
					<th width="80px">글쓴이</th>
					<th width="55px">답변</th>
					<th width="110px">질문유형</th>
				</tr>
				<c:forEach var="plist" items="${plist}">
					<tr align="center">
						<td width="60px">${plist.no}</td>
						<td width="150px">${plist.wdate}</td>
						<td width="600px"><a href="questionok.do?no=${plist.no}">${plist.title}</a></td>
						<td>${plist.writer}</td>
						<td width="60px"><a href="answerok.do?question_no=${plist.no}">${plist.check_answer}</a></td>
						<td>${plist.kinds}</td>
					</tr>
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
						<a class="page_num" page_num="${num}" href="helpcenter.do?page=${num}">${num}</a>
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
							<input type="button" style="WIDTH: 60pt; HEIGHT: 20pt" value="전체게시판"
					onclick="window.location='helpcenter.do'"></input>
			</div>
	</div>


	</div>


	</section>
	<!-- footer -->
	<%@include file="../footer.jsp"%>
</body>
</html>


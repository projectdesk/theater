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
<head>
<title>자주묻는 질문 게시판</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js">
</script>
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
		<table>
			<tr>
				<th width="60px">번호</th>
				<th>유형</th>
				<th width="700px">제목</th>
				<th colspan="2" width="20px">글쓴이</th>
			</tr>
			<c:forEach var="flist" items="${flist}">

				<tr align="center">
					<td width="60px">${flist.no}</td>
					<td width="100px">${flist.kinds}</td>
					<td width="700px" class="open_nav_link" no="${flist.no}"><a>${flist.title}</a></td>
					<td width="20px" colspan="2">운영자</td>
				</tr>
				<tr class="open_nav" style="display:none;" align="center" no="${flist.no}">
					<td width="700px" colspan="4">${flist.content}</td>
				</tr>

			</c:forEach>
		</table>
		<dr>
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
				onclick="window.location='ListBest_insert.do'"></input>
		</div>
	</div>
	</section>
	<!-- footer -->
	<%@include file="../footer.jsp"%>
	<script type="text/javascript">
	$(".open_nav_link").click(function(){
		no=$(this).attr("no");
		$(".open_nav[no="+no+"]").slideToggle();
	//$("next .open_nav").slideToggle(250); 
});
</script>
</body>
</html>


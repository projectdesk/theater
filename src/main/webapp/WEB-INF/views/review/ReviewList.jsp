<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/review.css">
</head>
<script type="text/javascript">
	function movieCheck() {
		if (document.movieSelect.title.value == "") {
			alert("영화 제목을 입력하세요");
			document.movieSelect.title.focus();
			return;
		}
		document.movieSelect.submit();
	}
</script>
<body>
	<!-- header -->
	<%@include file="../header.jsp"%>
	<section>



		<!-- 상단 바       -->
		<c:if test="${param.sort=='audience'}">
			<div class="top_wrap">
				<div class="top_wrap_inner">
					<div class="top">
						<ul class="left">
							<li><a href="./"><img src="resources/css/home.png"></a></li>
							<li><span>></span></li>
							<li><a href="ReviewList.do">리뷰&평점</a></li>
							<li><span>></span></li>
							<li>관객 리뷰</li>
						</ul>
						<ul class="right">
							<li><a href="#">시네마 운영원칙 보러가기</a></li>
							<li><span>></span></li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${param.sort!='audience'}">
			<div class="top_wrap">
				<div class="top_wrap_inner">
					<div class="top">
						<ul class="left">
							<li><a href="./"><img src="resources/css/home.png"></a></li>
							<li><span>></span></li>
							<li><a href="ReviewList.do">리뷰&평점</a></li>
							<li><span>></span></li>
							<li>전문가 리뷰</li>
						</ul>
						<ul class="right">
							<li><a href="#">시네마 운영원칙 보러가기</a></li>
							<li><span>></span></li>
						</ul>
					</div>
				</div>
			</div>
		</c:if>
		<!--    메인타이틀           -->
		<c:if test="${param.sort=='audience'}">
			<h1 align="center">관객 리뷰</h1>
		</c:if>
		<c:if test="${param.sort!='audience'}">
			<h1 align="center">전문가 리뷰</h1>
			<div class="notice">
				<ul class="n_body">
					<li>전문가 평가에도 다소 개인의 의사가 반영되어, 있음을 양해 부탁드립니다.<br> 게시판 용도에
						맞지 않는 글은 <b>운영자에 의해 삭제될 수 있습니다.</b></li>
				</ul>
			</div>
		</c:if>
		<div class="wrap">
			<form action="ReviewSearch.do" method="get" name="movieSelect">
				<!--    검색           -->
				<div class="search_outline">
					<div class="search">
						<input type="text" name="title" placeholder="영화 제목을 입력하세요.">
						<input class="icon" type="button" onclick="movieCheck()">
					</div>
				</div>
			</form>
			<!--    서브타이틀           -->
			<div class="sub_title">
				<a href="ReviewList.do?sort=audience">관객</a> <a href="ReviewList.do">전문가</a>
			</div>
			<div class="review_body">
				<table>
					<tr class="body_title">
						<td width="25">번호</td>
						<td width="25">평점</td>
						<td width="60">영화제목</td>
						<td width="60">제목</td>
						<td width="180">본문</td>
						<td width="80">날짜</td>
						<td width="35">조회수</td>
					</tr>
					<c:forEach var="item" items="${list}">
						<tr class="body_list">
							<td width="25">${item.review_no}</td>
							<td width="25">${item.grade}</td>
							<!--               여기에다가 영화 제목넣기                                       -->
							<td width="60"></td>
							<!--               여기에다가 영화 제목넣기                                       -->
							<td width="60"><c:if test="${param.sort=='audience'}">
									<a
										href="ReviewContent.do?sort=audience&review_no=${item.review_no}">${item.title}</a>
								</c:if> <c:if test="${param.sort!='audience'}">
									<a href="ReviewContent.do?&review_no=${item.review_no}">${item.title}</a>
								</c:if></td>
							<td width="180">${item.writer}</td>
							<td width="80">${item.wdate}</td>
							<td width="35">${item.hit}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="paging">
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

				<!--       버튼                    -->

				<table>
					<tr>
						<td><c:if test="${param.sort=='audience'}">
								<input type="button"
									onclick="window.location.href='review/ReviewWrite.do?sort=audience'"
									value="글쓰기">
							</c:if> <c:if test="${param.sort!='audience'}">
								<input type="button"
									onclick="window.location.href='./ReviewWrite.do'" value="글쓰기">
							</c:if></td>
					</tr>
				</table>
			</div>
		</div>



	</section>
	<!-- footer -->
	<%@include file="../footer.jsp"%>
</body>
</html>
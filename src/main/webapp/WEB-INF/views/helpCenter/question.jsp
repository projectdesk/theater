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
<script>
function submitCheck(){
	if(question.kinds.value==''){
		alert("질문 종류을 선택하세요.");
		return;
	}
	else if(question.title.value==''){
		alert("제목을 입력하세요.");
		return;
	}
	else if(question.content.value==''){
		alert("내용을 입력하세요.");
		return;
	}
	question.submit();
}
</script>
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
		<h1>고객센터 1:1문의</h1>
		<div class=write_form>
			<form action="question.do" method="post" name="question">

				<div class="top_select">
					<select name="kinds">
						<option value="">질문을 선택해 주세요.</option>
						<option value="멤버쉽포인트안내">멤버쉽 포인트 안내</option>
						<option value="아이디/비밀번호찾기">아이디/비밀번호찾기</option>
						<option value="패스워드변경">패스워드변경</option>
						<option value="예매/관람">예매/관람</option>
						<option value="기타">기타</option>
					</select>
				</div>

				<table class="question_page">
					<tr>
						<td class="writer"><input type="hidden" name="writer"
							value="${sessionScope.id}"></td>
						<td></td>
					</tr>
					<tr>
						<td align="center" class="question_con">제목</td>
						<td class="title"><input type="text" name="title"></td>
					</tr>
					<tr>
						<td align="center" class="question_con">질문<br>내용
						</td>
						<td><textarea name="content"></textarea></td>
					</tr>
					</table>
					<table>
					<tr class="button">
						<td><input type="button" value="글쓰기" onclick="submitCheck()"></td>
						<td><input type="button" value="게시판"
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


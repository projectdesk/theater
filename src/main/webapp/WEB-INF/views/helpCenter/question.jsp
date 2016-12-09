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
		<form action="question.do" method="post" name="question">
			<table>
				<table border="1" align="center" width="500px" height="500px">
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
					<tr align="center">
						<td width="70">게시자</td>
						<td><input type="text" name="writer"></td>
					</tr>
					<tr align="center">
						<td>제목</td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr align="center">
						<td>질문내용</td>
						<td><textarea name="content" cols="47" rows="20"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center" height="10px"><input
							type="submit" value="글쓰기"> <input type="button"
							value="게시판" onclick="window.location='helpcenter.do'"></input></td>
					</tr>
				</table>
			</table>
		</form>
	</div>
	</section>
	<!-- footer -->
	<%@include file="../footer.jsp"%>
</body>
</html>


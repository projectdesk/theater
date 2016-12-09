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
	<section> <input type="hidden" value="${dto.no}" name="no">
	<!-- 	<div class="help_section_top"></div> --> <!-- 	<div class="help_section_bottom" align="center"> -->
	<div class="help_select">
		<a href="helpcenter.do">1:1 문의</a><a href="ListBest.do">자주 묻는 질문</a>
	</div>
	<table>
		<table align="center" border="1" width="500px">
			<tr>
				<td width="70px" align="center">게시자</td>
				<td height="30px" align="center" width="400px">${dto.writer}</td>
			</tr>
			<tr>
				<td align="center">날짜</td>
				<td height="30px" align="center" width="500px">${dto.wdate}</td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td height="30px" align="center">[${dto.kinds}]${dto.title}</td>
			</tr>
			<tr>
				<td align="center">본문</td>
				<td height="200px" align="center">${dto.content}</td>
			</tr>

			<tr>
				<td colspan="2" align="right"><input type="button"
					style="WIDTH: 60pt; HEIGHT: 30pt"
					onclick="window.location='answer.do?no=${param.no}'" value="답글"><input
					type="button" style="WIDTH: 60pt; HEIGHT: 30pt" value="게시판"
					onclick="window.location='helpcenter.do'"></input></input/><input type="button"
					style="WIDTH: 60pt; HEIGHT: 30pt" value="삭제"
					onclick="location.href='delete.do?no=${param.no}'"></td>
			</tr/>
			</table>

			<!-- 답변  -->
              <c:if test="${sdto.question_no!=null}">
			<table align="center" border="1" width="500px">
				<input type=hidden name="getQuestion_no" value="${sdto.question_no}" />
			
				<tr>
					<td width="165px" align="center">제목</td>
					<td height="30px" align="center">[답변]${sdto.atitle}</td>
				</tr>
				<tr>
					<td align="center">본문</td>
					<td height="200px" align="center">${sdto.acontent}</td>
				</tr>
           </table>
           </c:if>
			</div>
			</div>
			</section>
			<!-- footer -->
<%-- 			<%@include file="footer.jsp"%> --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
<link rel="stylesheet" type="text/css"
	href="/blog/resources/css/main.css">
</head>
<body>
<div align="left">
<form action="UpdateAnswer.do" method="post">
  <table border="1" align="center" width="500px" height="500px"> 
    <input type="hidden" name="question_no" value="${param.question_no}">
 <tr align="center"><td width="70">게시자</td><td><input type="text" name="awriter" value="운영자"></td></tr>
 <tr align="center"><td>제목</td><td><input type="text" name="atitle"></td></tr>
 <tr align="center"><td>질문내용</td><td><textarea name="acontent" cols="47" rows="20"></textarea></td></tr>
 <tr><td colspan="2" align="center"><input type="submit" value="수정"> <input type="button" value="게시판" onclick="window.location='helpcenter.do'"></input></td></tr>
 </table>
</form>
</div>
</body>
</html>
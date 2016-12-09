<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객질문센터</title>
</head>
<body>
	<div>
		<form action="ListBest_insert.do" method="post" name="ListBest_insert">
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
						<td><input type="text" name="writer" value="운영자">운영자</td>
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
</body>
</html>
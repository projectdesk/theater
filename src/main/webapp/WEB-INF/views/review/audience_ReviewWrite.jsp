<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Review Write</title>
</head>
<body>
	<div class="wrap">
		<form action="audience_ReviewWrite.do" method="post">
			<div>
				��ȭ : <select id="movie" name="movie_no">
					<option value="">��ȭ����</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<div>
				���� : <select id="grade" name="grade">
					<option value="">����</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					</select>
			</div>
			<div>
				���� : <input type="text" name="title" />
			</div>
			<div>
				�۾���: <input type="text" name="writer" />
			</div>
			<div>
				���� : <textarea rows="5" cols="20" name="content"></textarea>
			</div>
			<div>
				<input type="submit" value="����ϱ�">
				<input  type="button" onclick="history.back()" value="���">
			</div>
		</form>
	</div>
</body>
</html>
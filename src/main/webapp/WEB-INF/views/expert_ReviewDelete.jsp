<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
</head>
<body>

	<div>
		<form action="expert_ReviewDelete.do" method="post">
			<input type="hidden" name="review_no" value="${review_no}" />
			<table>
				<tr>
					<td>���� �����Ͻðڽ��ϱ�?</td>
				</tr>
				<tr>
					<td><input type="submit" value="Ȯ��">
						<input type="button" onclick="window.close()" value="��� ">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
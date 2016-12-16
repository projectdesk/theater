<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/register.css">
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/register.js"></script>
<script src="resources/js/user.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>
	<section>
		<div class="top_inner">
		<h1>회원가입</h1>
			<form method="post" action="register.do" name="regForm">
				<table  cellspacing="0" cellpadding="3"
					align="center">
					<tr>
						<td>사용자 ID</td>
						<td><input type="text" name="id" size="10" maxlength="12">
							<input type="button" name="confirm_id" value="ID중복확인"
							id="idcheck"> <input type="hidden" name="idcheck"
							value=""></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="password"
							size="15" maxlength="12"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="passwordCheck"
							size="15" maxlength="12"></td>
					</tr>
					<tr>
						<td>사용자 이름</td>
						<td><input type="text" name="name" size="15" maxlength="10"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" name="birthday" size="20"
							id="datepicker"></td>
					</tr>
					<tr>
						<td>E-Mail</td>
						<td><input type="email" name="email" size="40" maxlength="30"></td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td><input type="text" name="zipcode" id="zipcode" size="12"
							placeholder=" 우편번호 검색" readonly="readonly"> <input
							type="button" value=" 우편번호찾기" onClick="addressSearch()"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address1" id="address1" size="70"
							placeholder=" 주소를 검색해주세요." readonly="readonly"></td>
					</tr>
					<tr>
						<td>상세 주소</td>
						<td><input type="text" name="address2" id="address2" size="70"
							placeholder=" 상세주소를 적어 주세요."></td>
					</tr>
					<tr>
						<td>핸드폰 번호</td>
						<td><input type="text" name="phone" size="20"
							placeholder=" 핸드폰번호를 적어 주세요."></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button"
								value="등 록" onclick="inputCheck()"> <input type="reset"
							name="reset" value="다시입력"> <input type="button"
							value="가입안함" onclick="inputForm.jsp"></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
	
</body>
</html>
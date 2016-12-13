<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/myPage.css">
<link rel="stylesheet" type="text/css" href="resources/css/modUser.css">
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp"%>
	<section>
		<div class="top_inner">
			<%@include file="mypageNav.jsp"%>
			<c:if test="${passwordCheck==null}">
				<div class="section_right">
					<form action="mod_user.do" method="post">
						<table>
							<tr>
								<td>비밀번호 확인 : <input type="password" name="password" />
								</td>
							</tr>
							<tr>
								<td><input type="submit" /></td>
							</tr>
						</table>
					</form>
				</div>
			</c:if>
			<c:if test="${passwordCheck==true}">
				<form method="post" action="update_user.do">
					<table width="800" border="1" cellspacing="0" cellpadding="3"
						align="center">
						<tr>
							<th colspan="2">개인정보 수정</th>
						</tr>
						<tr>
							<td>사용자 ID</td>
							<td><input type="text" name="id" size="10" maxlength="12" readonly="readonly" value="${user.id}">
							</td>
						</tr>
						<tr>
							<td>새비밀번호</td>
							<td><input type="password" name="password" size="15"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>새비밀번호 확인</td>
							<td><input type="password" name="passwordCheck" size="15"
								maxlength="12"></td>
						</tr>
						<tr>
							<td>사용자 이름</td>
							<td><input type="text" name="name" size="15" maxlength="10" readonly="readonly" value="${user.name}"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" name="birthday" size="20"
								id="datepicker" value="${user.birthday}"></td>
						</tr>
						<tr>
							<td>E-Mail</td>
							<td><input type="email" name="email" size="40"
								maxlength="30" value="${user.email}"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="zipcode" id="zipcode" size="12"
								placeholder=" 우편번호 검색" readonly="readonly" value="${user.zipcode}"> <input
								type="button" value=" 우편번호찾기" onClick="addressSearch()"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="address1" id="address1"
								size="70" placeholder=" 주소를 검색해주세요." readonly="readonly" value="${user.address1}"></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="address2" id="address2"
								size="70" placeholder=" 상세주소를 적어 주세요." value="${user.address2}"></td>
						</tr>
						<tr>
							<td>핸드폰 번호</td>
							<td><input type="text" name="phone" size="20"
								placeholder=" 핸드폰번호를 적어 주세요." value="${user.phone}"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								name="confirm" value="수정"> <input type="reset"
								name="reset" value="다시입력"> <input type="button"
								value="취소" onclick="mypage.do"></td>
						</tr>
					</table>
				</form>
			</c:if>
		</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
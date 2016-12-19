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
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<c:if test="${passCheck=='false'}">
		<script>
			alert("현재 비밀번호가 틀립니다.");
		</script>
	</c:if>

	<!-- header -->
	<%@include file="header.jsp"%>
	<section class="mod_user">

		<div class="top_wrap">
			<div class="top_wrap_inner">
				<div class="top">
					<ul class="left">
						<li><a href="./"><img src="resources/css/home.png"></a></li>
						<li><span>></span></li>
						<li>마이페이지</li>
						<li><span>></span></li>
						<li>개인정보 수정</li>
					</ul>
					<ul class="right">
						<li>고객센터 연락처</li>
						<li><span>/</span></li>
						<li>1588-0000</li>
					</ul>
				</div>
			</div>
		</div>


		<div class="top_inner">
			<%@include file="mypageNav.jsp"%>
			<div class="section_right">
				<div class="section_right_inner">
					<c:if test="${passwordCheck==null}">
						<form action="mod_user.do" method="post">
							<div class="moduser_img">
								<img src="resources/css/hold_img.png">
							</div>

							<ul class="moduser">
								<li><span class="mod_icon">※</span>고객님의 개인정보 관리는 <span
									class="strong">movie cinema&nbsp;</span>홈페이지에서</li>
								<li>안전하게 관리되고있습니다.</li>
							</ul>

							<div class="moduser_body">
								<ul class="moduser_body_inner">
									<li class="m_body_title">비밀번호 확인</li>
									<li><input type="password" name="password" /></li>
									<li><input type="submit" value="개인정보 수정"></li>
								</ul>
							</div>
						</form>
					</c:if>


					<!--       개인정보 수정 틀                   -->

					<div class="personal">
						<c:if test="${passwordCheck==true}">
							<form method="post" action="update_user.do">
								<div class="personal_title">
									<h2>개인정보 수정</h2>
								</div>


								<table>
									<tr>
										<td class="b_body_title">사용자 ID</td>
										<td class="b_body_in"><input type="text" name="id"
											readonly="readonly" value="${user.id}"></td>
									</tr>
									<tr>
										<td class="b_body_title">새비밀번호</td>
										<td class="b_body_in"><input type="password"
											name="password"></td>
									</tr>
									<tr>
										<td class="b_body_title">새비밀번호 확인</td>
										<td class="b_body_in"><input type="password"
											name="passwordCheck"></td>
									</tr>
									<tr>
										<td class="b_body_title">사용자 이름</td>
										<td class="b_body_in"><input type="text" name="name"
											readonly="readonly" value="${user.name}"></td>
									</tr>
									<tr>
										<td class="b_body_title">생년월일</td>
										<td class="b_body_in"><input type="text" name="birthday"
											id="datepicker" value="${user.birthday}"></td>
									</tr>
									<tr>
										<td class="b_body_title">E-Mail</td>
										<td class="b_body_in"><input type="email" name="email"
											value="${user.email}"></td>
									</tr>
									<tr>
										<td class="b_body_title">우편번호</td>
										<td class="b_body_in"><input type="text" name="zipcode"
											id="zipcode" placeholder=" 우편번호 검색" readonly="readonly"
											value="${user.zipcode}"> <br> <input
											type="button" value=" 우편번호찾기" onClick="addressSearch()"></td>
									</tr>
									<tr>
										<td class="b_body_title">주소</td>
										<td class="b_body_in"><input type="text" name="address1"
											id="address1" placeholder=" 주소를 검색해주세요." readonly="readonly"
											value="${user.address1}"></td>
									</tr>
									<tr>
										<td class="b_body_title">상세 주소</td>
										<td class="b_body_in"><input type="text" name="address2"
											id="address2" placeholder=" 상세주소를 적어 주세요."
											value="${user.address2}"></td>
									</tr>
									<tr>
										<td class="b_body_title">핸드폰 번호</td>
										<td class="b_body_in"><input type="text" name="phone"
											placeholder=" 핸드폰번호를 적어 주세요." value="${user.phone}"></td>
									</tr>
								</table>
								<p class="line"></p>
								<a href="ListBest.do">
									<div class="notice">
										<ul>
											<li class="li_title">자주 찾는 질문</li>
											<li class="li_body"><strong>MOVIE CINEMA</strong>에 궁금한
												사항을 물어보세요 <br> 언제나 친절하게 답해주는<strong> MOVIE
													CINEMA</strong>가 되겠습니다.</li>
										</ul>
									</div>
								</a>
								<div class="notice_2">
									<ul>
										<li class="li_title">1:1문의 답변 시간</li>
										<li class="li_body"><strong>평일 : </strong>다음날 답변 완료<br>
											<strong>주말&공휴일 : </strong>휴일 이후 답변완료</li>
									</ul>
								</div>

								<div class="button">
									<input type="submit" name="confirm" value="수정"> <input
										type="reset" name="reset" value="다시입력"> <a
										href="mypage.do"><input type="button" value="취소"></a>
								</div>
							</form>
						</c:if>
					</div>






				</div>
			</div>
		</div>
	</section>
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>
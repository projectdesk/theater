<%@ page language="java" pageEncoding="UTF-8"%>
<header>
		<div class="contain">
			<div class="logo">
				logo
			</div>
			<nav>
				<div class="nav_top">
					<div class="nav_bar">
						<ul>
							<li>
							<c:if test="${sessionScope.id==null}">				
							<a href="login.do">로그인</a>
							</c:if>
							<c:if test="${sessionScope.id!=null}">				
							<a href="logout.do">로그아웃</a>
							</c:if>
							<div class="seperate"></div></li>
							<li><a href="register.do">회원가입</a><div class="seperate"></div></li>
							<li><a href="mypage.do">마이페이지</a><div class="seperate"></div></li>
							<li><a href="#">예매취소</a></li>
						</ul>
					</div>
				</div>
				<div class="nav_bottom">
					<div class="nav_bar">
						<ul>
						<li><a href="movie.do">영화</a></li>
						<li><a href="reservation.do">예매</a></li>
						<li><a href="theater.do">영화관</a></li>
						<li><a href="review.do">리뷰&평점</a></li>
						<li><a href="helpcenter.do">고객센터</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
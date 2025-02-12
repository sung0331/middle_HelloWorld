<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<header>
	<div class="container header-content">
		<a href="<c:url value='/index.do'/>" style="text-decoration: none">
			<div class="logo">HELLO WORLD</div>
		</a>
		<nav>
			<ul>
				<li><a href="<c:url value='/mainRide.do'/>">헬로월드!</a></li> +
				<li><a href="<c:url value='/infopage.do'/>">이용안내</a></li>
				<li><a href="productMain.do">티켓상품</a></li>
				<li><a href="event.do">이벤트</a></li>
                <li><a href="<c:url value='/board.do'/>">참여마당</a></li>
				<li><a href="faq.do">고객센터</a></li>
			</ul>
		</nav>
		<div class="header-actions">
			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<span style="margin-right: 10px;">${sessionScope.user.cust_name}님
						환영합니다!</span>
					<c:choose>
						<c:when
							test="${sessionScope.user.cust_type eq '1' or sessionScope.user.cust_type eq 1}">
							<button class="MyPage-btn" onclick="location.href='<c:url value="/mypageMain.do"/>'">마이페이지</button>
						</c:when>
						<c:when
							test="${sessionScope.user.cust_type eq '3' or sessionScope.user.cust_type eq 3}">
							<button class="EmpMyPage-btn"
								onclick="location.href='<c:url value="/empMain"/>'">직원mypage</button>
						</c:when>
						<c:when
							test="${sessionScope.user.cust_type eq '4' or sessionScope.user.cust_type eq 4}">
							<button class="MangerMyPage-btn"
								onclick="location.href='<c:url value="/mangerMypage.do"/>'">관리자mypage</button>
						</c:when>
					</c:choose>
					<button class="login-btn"
						onclick="location.href='<c:url value="/logout.do"/>'">로그아웃</button>
				</c:when>
				<c:otherwise>
					<button class="login-btn"
						onclick="location.href='<c:url value="/login.do"/>'">로그인</button>
					<button class="signup-btn"
						onclick="location.href='<c:url value="/signup.do"/>'">회원가입</button>

				</c:otherwise>
			</c:choose>
		</div>
	</div>
</header>
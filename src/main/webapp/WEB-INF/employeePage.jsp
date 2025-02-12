<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헬로월드 테마파크 - 환상과 모험의 세계</title>
	<!--     스타일 영역 -->
	<%@include file="./include/style.css"%>
	<!-- ass -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>직원페이지</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<!-- ass -->

</head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
	<!--예약고객명단/일정표/조직도/공지사항/휴가신청/구내식당/개인정보  -->
<body>
	<%
	String employeePageCode = (String) session.getAttribute("employeePageCode");
        %>

	<!--     헤더영역의 코드가 잘려나감 -->
	<%@include file="./include/top.jsp"%>


			<!--    사이드바 부분 -->
	<%@include file="./include/empSidebar.jsp"%>
	
<%-- 	[<%=employeePageCode %>] --%>
	
	<!-- 메인(변경예정) -->
	<%
	if (employeePageCode == "empMyPage"){
	%>
	<%@include file="./view/employee/empMyPage.jsp"%>
	<%
	} else if(employeePageCode == "empList"){ /* 예약명단 */
	%>
	<%@include file="./view/employee/empList.jsp" %>
	<%
	} else if(employeePageCode == "empCalendar"){ /* 일정표(달력)  */
	%>
	<%@include file="./view/employee/empCalendar.jsp" %>
	<%
	} else if(employeePageCode == "empDepartment"){	/* 조직도 */
	%>
	<%@include file="./view/employee/empDepartment.jsp" %>
	<%
	} else if(employeePageCode == "empBoard"){	/* 공지사항 */
	%>
	<%@include file="./view/employee/empBoard.jsp" %>
	<%
	} else if(employeePageCode == "empVacation"){ 	/* 휴가홈 */
	%>
	<%@include file="./view/employee/empVacation.jsp" %>
	<%
	} else if(employeePageCode == "Menu"){ 	/* 식단표 */
	%>
	<%@include file="./view/employee/Menu.jsp" %>
	<%
	} else if(employeePageCode == "empInformation"){ /* 탈퇴,수정 */
	%>
	<%@include file="./view/employee/empInformation.jsp" %>
	<%
	}
	%>
	
	<!-- 	바텀디자인 넘침 방지용 -->
	<div class="box"></div>
		<!--     바닥영역의 코드가 잘려나감 -->
	<%@include file="./include/bottom.jsp"%>
	

	<script>
	
	sidebarToggle.addEventListener('click', function() {
	    sidebar.classList.toggle('expanded'); // 사이드바의 클래스를 토글
	    content.classList.toggle('sidebar-expanded'); // 콘텐츠의 클래스를 토글
	    toggleIcon.classList.toggle('fa-chevron-right'); // 아이콘 토글
	    toggleIcon.classList.toggle('fa-chevron-left'); // 아이콘 토글
	});
	
		// Smooth scrolling for navigation links //누르면 지정된 문단으로 가지는 스크립트
		/* document.querySelectorAll('a[href^="#"]').forEach(anchor => {
			anchor.addEventListener('click', function (e) {
				e.preventDefault();
				document.querySelector(this.getAttribute('href')).scrollIntoView({
					behavior: 'smooth'
				});
			});
		}); */

		// Header background change on scroll
		window.addEventListener('scroll', function () {
			const header = document.querySelector('header');
			if (window.scrollY > 50) {
				header.style.boxShadow = '0 2px 5px rgba(0,0,0,0.1)';
			} else {
				header.style.boxShadow = 'none';
			}
		});

		// Animate elements on scroll
		function isElementInViewport(el) {
			const rect = el.getBoundingClientRect();
			return (
				rect.top >= 0 &&
				rect.left >= 0 &&
				rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
				rect.right <= (window.innerWidth || document.documentElement.clientWidth)
			);
		}

		function handleScrollAnimation() {
			const elements = document.querySelectorAll('.attraction-card, .ticket-type, .event-card, .info-item');
			elements.forEach(el => {
				if (isElementInViewport(el)) {
					el.style.opacity = '1';
					el.style.transform = 'translateY(0)';
				}
			});
		}

		window.addEventListener('scroll', handleScrollAnimation);
		window.addEventListener('load', handleScrollAnimation);

		// Initialize animation styles
		document.querySelectorAll('.attraction-card, .ticket-type, .event-card, .info-item').forEach(el => {
			el.style.opacity = '0';
			el.style.transform = 'translateY(20px)';
			el.style.transition = 'opacity 0.5s ease-out, transform 0.5s ease-out';
		});	
	</script>

</body>

</html>
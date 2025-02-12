<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%
        String mangePageCode = (String)request.getAttribute("mangePageCode");
        CustomerVo user = (CustomerVo)session.getAttribute("user");
    %> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬로월드 테마파크 - 환상과 모험의 세계</title>
    <!--     스타일 영역 -->
    <%@include file="./include/style.css"%>
    <!-- Custom fonts for this template-->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- 헤더영역 -->
    <%@include file="./include/top.jsp"%>

    <!-- 사이드부분 -->
    <%@include file="/WEB-INF/include/mypageSidebar.jsp"%>
    
    <!-- 메인코드 부분 여기부분이 바뀔 부분입니다 -->
    <%@include file="./view/main/main.jsp"%>
    
    <!-- 바텀디자인 넘침 방지용 -->
    <div class="box"></div>

    <!-- 바닥영역 -->
    <%@include file="./include/bottom.jsp"%>

    <!-- 스크립트 부분 -->
    <script>
        // Smooth scrolling for navigation links
        // document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        //     anchor.addEventListener('click', function (e) {
        //         e.preventDefault();
        //         document.querySelector(this.getAttribute('href')).scrollIntoView({
        //             behavior: 'smooth'
        //         });
        //     });
        // });

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
        // window.addEventListener('load', handleScrollAnimation);

        // Initialize animation styles
        document.querySelectorAll('.attraction-card, .ticket-type, .event-card, .info-item').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(20px)';
            el.style.transition = 'opacity 0.5s ease-out, transform 0.5s ease-out';
        });    
    </script>
</body>
</html>
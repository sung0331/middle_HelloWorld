<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet" type="text/css" />

        <div class="sidebar">
            <div class="sidebar-toggle">
                <i class="fas fa-chevron-right"></i>
            </div>
            <div class="sidebar-menu">
                <ul>
                	<li><a href="http://localhost:38080/HelloWorld/empController#reservations">마이페이지</a></li>
                    <li><a href="http://localhost:38080/HelloWorld/reservations"><i class="fas fa-calendar-check"></i> 예약 관리</a></li>
                    <li><a href="#schedule"><i class="fas fa-calendar-alt"></i> 일정표</a></li>
                    <li><a href="#organization"><i class="fas fa-sitemap"></i> 조직도</a></li>
                    <li><a href="#notices"><i class="fas fa-bullhorn"></i> 공지사항</a></li>
                    <li><a href="#vacation"><i class="fas fa-plane-departure"></i> 휴가 신청</a></li>
                    <li><a href="#menu"><i class="fas fa-utensils"></i> 구내식당</a></li>
                    <li><a href="#profile"><i class="fas fa-user-circle"></i> 개인정보</a></li>
                </ul>
            </div>
        </div>

        <div class="content">
            <section id="reservations" class="section">

    <script>
        // 사이드바 토글 기능
        document.addEventListener('DOMContentLoaded', function() {
            const sidebar = document.querySelector('.sidebar');
            const sidebarToggle = document.querySelector('.sidebar-toggle');
            const content = document.querySelector('.content');
            const toggleIcon = sidebarToggle.querySelector('i');

            sidebarToggle.addEventListener('click', function() {
                sidebar.classList.toggle('expanded');
                content.classList.toggle('sidebar-expanded');
                toggleIcon.classList.toggle('fa-chevron-right');
                toggleIcon.classList.toggle('fa-chevron-left');
            });
        });

    </script>

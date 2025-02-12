<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script> -->
<!--     <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet" type="text/css" /> -->

        <div class="sidebar">
            <div class="sidebar-toggle">
                <i class="fas fa-chevron-right"></i>
            </div>
            <div class="sidebar-menu">
                <ul>
<%--                 <h4>"<%= request.getContextPath() %></h4> --%>
                	<li><a href="<%= request.getContextPath() %>/empMyPage">마이페이지</a></li>
                    <li><a href="<%= request.getContextPath() %>/empList"><i class="fas fa-calendar-check"></i> 예약 고객 명단</a></li>
                    <li><a href="<%= request.getContextPath() %>/calendar.do"><i class="fas fa-calendar-alt"></i> 일정표</a></li>
                    <li><a href="<%= request.getContextPath() %>/Department"><i class="fas fa-sitemap"></i> 조직도</a></li>
                    <li><a href="<%= request.getContextPath() %>/empBoard"><i class="fas fa-bullhorn"></i> 공지사항</a></li>
                    <li><a href="<%= request.getContextPath() %>/empVacation"><i class="fas fa-plane-departure"></i> 휴가 신청</a></li>
<%--                     <li><a href="<%= request.getContextPath() %>/menu.do"><i class="fas fa-utensils"></i> 구내식당</a></li> --%>
                    <%-- <li><a href="<%= request.getContextPath() %>/empInformation.do"><i class="fas fa-user-circle"></i> 개인정보</a></li> --%>
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

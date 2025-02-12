<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.empVo" %>    
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- <%	import { Calendar } from '@fullcalendar/core'
	import dayGridPlugin from '@fullcalendar/daygrid'

	const calendar = new Calendar(calendarEl, {
  	plugins: [dayGridPlugin],
  	initialView: 'dayGridMonth'
});%> --%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List<empVo> vacationList = (List<empVo>)request.getAttribute("vacationList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>헬로월드 테마파크 - 직원 페이지</title>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap"
	rel="stylesheet">
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
	<link
	href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css"
	rel="stylesheet" type="text/css" />
    <meta charset='utf-8' />
    <!-- <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.15/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.15/index.global.min.js'></script> -->
     <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<style>
.calendar {
	margin-left: 50px;
	padding: 40px;
	flex-grow: 1;
	transition: margin-left 0.3s ease;
	 height: '700px'; /*  calendar 높이 설정 */
    expandRows: true;
}

.calendar.sidebar-expanded {
	margin-left: 250px;
}    
html, body {
  margin: 0;
  padding: 0;
  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
  font-size: 14px;
}

#calendar {
  max-width: 1100px;
  margin: 40px auto;
}
 .var shedule{
	white-space: normal; /* 줄바꿈 허용 */
}
</style>
  </head>
  <body>
  
    <script id=empcalendar >

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
      
      // JSP 데이터를 JSON 형식으로 변환하여 JavaScript에 전달
      var vacation = [];
      <% List<empVo> vacation = (List<empVo>) request.getAttribute("vacation"); %>
      <% if (vacation != null) { %>
        <% for (empVo emp : vacation) { %>
          vacation.push({
            title: '휴가',
            start: '<%= emp.getStart_date() %>',
            end: '<%= emp.getEnd_date() %>',
            allDay: true
          });
        <% } %>
      <% } %>
      console.log('Vacation data:', vacation);

      if (vacation.length === 0) {
        console.warn('Vacation list is empty. Please check if the data is being passed correctly from the server.');
      }
      // FullCalendar 초기화
     /*  var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        events: vacation
      }); */

      
      
      var shedule = [];
      <% List<empVo> shedule = (List<empVo>) request.getAttribute("shedule"); %>
      <% if (shedule != null) { %>
        <% for (empVo emp : shedule) { %>
        shedule.push({
            title: '<%= emp.getRide_name() %> : <%= emp.getShed_start_time() %> - <%= emp.getShed_end_time() %>',
            start: '<%= emp.getShed_date() %>',
            allDay: true
          });
        <% } %>
      <% } %>
      console.log('Shedule data:', shedule);

      if (shedule.length === 0) {
        console.warn('Shedule list is empty. Please check if the data is being passed correctly from the server.');
      }
      
   // vacation과 shedule 배열을 events 배열로 병합
      var events = vacation.concat(shedule);
      
      // FullCalendar 초기화
      var calendarEl = document.getElementById('calendar'); // 'calendarEl' 요소를 정의해야 합니다.
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        events: events
      });
      
      calendar.render();
    });
    </script>
    
    <div id='calendar'></div>
    
  </body>
</html>
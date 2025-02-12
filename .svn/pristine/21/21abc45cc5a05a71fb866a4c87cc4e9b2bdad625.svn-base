<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.empVo" %>    
<%@page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
   List<empVo> empVacation = (List<empVo>)request.getAttribute("empVacation");
   List<empVo> stateVacation = (List<empVo>)request.getAttribute("stateVacation");

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬로월드 테마파크 - 직원 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1e88e5;
            --secondary-color: #ffc107;
            --text-color: #333;
            --light-bg: #f4f4f4;
            --header-height: 80px;
        }
        body, html {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-color);
            line-height: 1.6;
            scroll-behavior: smooth;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        .content {
            margin-left: 50px;
            padding: 20px;
            flex-grow: 1;
            transition: margin-left 0.3s ease;
        }
        .content.sidebar-expanded {
            margin-left: 250px;
        }
        .section {
           /*  background-color: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        } */
        .section h2 {
            color: var(--primary-color);
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 15px;
        }
        .section h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100px;
            height: 3px;
            /* background-color: var(--primary-color); 삭제 */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: var(--primary-color);
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }
        tr:nth-child(even) {
            background-color: #f8f8f8;
        }
        tr:hover {
            background-color: #e8e8e8;
        }
        .btn-custom {
            background-color: #007bff; /* 파란색 배경 */
            color: white; /* 흰색 글씨 */
            border-radius: 12px; /* 둥근 직사각형 */
            font-size: 14px; /* 글씨 크기 */
            padding: 10px 20px; /* 패딩 조절 */
            border: none; /* 기본 테두리 제거 */
            cursor: pointer; /* 커서 포인터로 변경 */
            transition: background-color 0.3s ease; /* 호버 애니메이션 */
        }
        .btn-custom:hover {
            background-color: #0056b3; /* 마우스 호버 시 더 짙은 파란색 */
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <%-- <div class="container">
           <h2>휴가 결재 목록</h2>
           <table class="table table-bordered">
               <thead>
                   <tr>
                      <th>번호</th>
                       <th>이름</th>
                       <th>휴가 사유</th>
                       <th>연차</th>
                       <th>부서</th>
                       <th>시작일</th>
                       <th>종료일</th>
                       <th>승인여부</th>
                       <th>반려/수정</th>
                       <th>신청일</th>
                   </tr>
               </thead>
               <tbody>
                   <% 
                      int rowNumber = 1; //시작 번호 설정
                      if (empVacation != null && !empVacation.isEmpty()) {
                       for (empVo emp : empVacation) { %>
                           <tr>
                              <td><%=rowNumber++ %></td>
                               <td><%= emp.getEmp_name() %></td>
                               <td><%= emp.getVacation_type() %></td>
                               <td><%= emp.getLess_date() %></td>
                               <td><%=emp.getDepartment_name() %></td>
                               <td><%= emp.getStart_date() %></td>
                               <td><%= emp.getEnd_date() %></td>
                               <td><%=emp.getVaction_state() != 2? emp.getVaction_state() : "미승인"%></td>
                               <td><%=emp.getVaction_state() != 3? emp.getVaction_state() : "승인"%></td>
                               <td><button>수정</button></td>
                               <td><%
                             // 현재 시스템 날짜 가져오기
                          Date now = new Date();
                          SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                          String formattedDate = sdf.format(now);
                           %>
                           <%= formattedDate %></td>
                               <td>
                                   <form method="post" action="processVacationApproval.do">
                                       <input type="hidden" name="empId" value="<%= emp.getEmpId() %>">
                                       <input type="hidden" name="vacationId" value="<%= emp.getVacationId() %>">
                                       <button type="submit" name="action" value="approve" class="btn btn-success">승인</button>
                                       <button type="submit" name="action" value="reject" class="btn btn-danger">반려</button>
                                   </form>
                               </td>
                           </tr>
                       <% }
                   } else { %>
                       <tr>
                           <td colspan="7" style="text-align: center;">결재할 휴가 신청이 없습니다.</td>
                       </tr>
                   <% } %>
               </tbody>
           </table>
       </div> --%>

   <div class="content">

            <section id="empVacation" class="section">
                <h2>휴가 신청</h2>
                 <div class="button-container" style="margin-bottom: 20px; text-align: right;">
                <form method="get" action="<%= request.getContextPath() %>/insert.do" style="display: inline;">
                    <button type="submit" class="btn-custom">휴가 신청하기</button>
                </form>
            </div>
    </div>
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>이름</th>
                            <th>사유</th>
                            <th>부서</th>
                            <th>승인여부</th>
                            <th>신청일</th>
                        </tr>
                    </thead>
                   <tbody>
                    <%
                      int rowNumber = 1;  // 시작 번호 설정
                     for (empVo emp : empVacation) {
               %>
                        <tr>
                            <td><%= rowNumber++ %></td>
                            <td><%=emp.getEmp_name() %></td>
                            <td><%=emp.getVacation_type() %></td><!-- 사유 -->
                            <td><%=emp.getDepartment_name() %></td>
                            <td> 
                            <!-- 승인, 반려, 미승인 버튼 설정 -->
               <%
             
                        int state = emp.getVaction_state();
                        String stateText = "미승인";
                        if (state == 2) {
                            stateText = "승인";
                        } else if (state == 3) {
                            stateText = "반려";
                        }
                
                    %>
                    <%= stateText %>  
                      
                            <td><%=emp.getAppli_date() %></td>
                           </tr>
                        <%
                      }
                  %>
                        
                    </tbody>
                </table>
                   <script>
                   /* const subs = document.getElementsByClassName('a');

                    for (let i = 0; i < subs.length; i++) {
                        subs[i].addEventListener('click', function () {
                                this.innerText = '열람';
                        });
                    } *//* 열람 버튼 누르면 공지사항 팝업?으로 보이게 해야하나????? */
                   </script>
            </section>
      </div>
</body>
</html>
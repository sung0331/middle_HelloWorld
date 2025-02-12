<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.empVo" %>    
<%@page import="java.util.List"%>
<%
	List<empVo> empBoard = (List<empVo>)request.getAttribute("empBoard");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬로월드 테마파크 - 직원 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
       /*  :root {
            --primary-color: #1e88e5;
            --secondary-color: #ffc107;
            --text-color: #333;
            --light-bg: #f4f4f4;
            --header-height: 80px;
        } */
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
            /* background-color: var(--primary-color); */
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
        .btn {
            display: inline-block;
            background-color: var(--secondary-color);
            color: var(--text-color);
            padding: 0.8rem 1.5rem;
            text-decoration: none;
            border-radius: 50px;
            transition: all 0.3s ease;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .btn:hover {
            background-color: #e0a800;
            transform: translateY(-3px);
            box-shadow: 0 6px 8px rgba(0,0,0,0.15);
        }    
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet" type="text/css" />
</head>
<body>

		<!-- jQuery 라이브러리 로드 (CDN을 사용하여 로드) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <div class="content">

            <section id="empBoard" class="section">
                <h2>공지사항</h2>
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>보낸사람</th>
                            <th>날짜</th>
                            <th>열람여부</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
   						 int rowNumber = 1;  // 시작 번호 설정
  						 for (empVo emp : empBoard) {
					%>
                        <tr>
                            <td><%= rowNumber++ %></td>
                            <td><%=emp.getTitle() %></td>
                            <td><%=emp.getDepartment_name() %></td>
                            <td><%=emp.getBoard_date() %></td>
                        <td>
							<!-- 열람 링크를 사용하여 클릭 시 해당 공지사항 번호를 상세 페이지로 전달 -->
                            <a href="<%= request.getContextPath() %>/empDeailBoard.do?boardNo=<%= emp.getBoard_no() %>" class="view-link">열람</a>
                        </td>
                        </tr>
                        <%
  						  }
						%>
                        
                    </tbody>
                </table>
            </section>
		</div>
</body>
</html>
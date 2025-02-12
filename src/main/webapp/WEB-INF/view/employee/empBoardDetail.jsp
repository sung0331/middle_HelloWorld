<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.empVo" %>    
<%@page import="java.util.List"%>
<%
    // 공지사항 목록을 요청 속성으로부터 받아옴
    List<empVo> empDeailBoard = (List<empVo>) request.getAttribute("empDeailBoard");

    // 요청 파라미터로 공지사항 번호를 받아옴
    String boardNoParam = request.getParameter("boardNo");
    int boardNo = boardNoParam != null ? Integer.parseInt(boardNoParam) : 0;

    // 디버깅용 출력
    System.out.println("받은 boardNo: " + boardNo);
    System.out.println("empDeailBoard 리스트 크기: " + (empDeailBoard != null ? empDeailBoard.size() : "null"));

    // 공지사항 목록에서 특정 번호의 공지사항을 가져오기
    empVo selectedEmp = null;

    if (empDeailBoard != null) {
        for (empVo emp : empDeailBoard) {
            System.out.println("현재 검사 중인 공지사항 번호: " + emp.getBoard_no());
            if (emp.getBoard_no() == boardNo) {
                selectedEmp = emp;
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        body, html {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
        }
        .content {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        h2 {
            color: #1e88e5;
            font-size: 2rem;
            margin-bottom: 20px;
        }
        .detail-item {
            margin-bottom: 10px;
        }
        .detail-item strong {
            color: #1e88e5;
        }
        .btn {
            display: inline-block;
            background-color: #1e88e5;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            font-weight: bold;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .btn:hover {
            background-color: #1565c0;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="content">
        <h2>공지사항 상세 내용</h2>
		<%
            if (selectedEmp != null) {
        %>
		<div class="detail-item"><strong>제목:</strong> <%=selectedEmp.getTitle() %></div>
        <div class="detail-item"><strong>내용:</strong> <%=selectedEmp.getContent() %></div>
        <div class="detail-item"><strong>날짜:</strong> <%=selectedEmp.getBoard_date() %></div>
 	    <div class="detail-item"><strong>보낸 부서:</strong> <%=selectedEmp.getDepartment_name() %></div>
        <% 
            } else { 
        %>
        <div class="detail-item">해당 공지사항을 찾을 수 없습니다.</div>
        <% 
            } 
        %>
        <div class="button-container">
            <!-- 확인 버튼 클릭 시 JavaScript 함수 호출 -->
            <button class="btn" onclick="redirectToBoard()">확인</button>
        </div>
    </div>
   <!--  <script>
        // JavaScript 함수 정의: 버튼 클릭 시 지정된 URL로 이동
        function redirectToBoard() {
            window.location.href = "http://localhost:38080/HelloWorld/empBoard";
        }
    </script> -->
    <script>
        // JavaScript 함수 정의: 버튼 클릭 시 지정된 URL로 이동
        function redirectToBoard() {
            window.location.href = "<%= request.getContextPath() %>/empBoard";
        }
    </script>
</body>

</html>

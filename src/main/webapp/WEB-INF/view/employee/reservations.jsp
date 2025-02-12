<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.empVo" %>    
<%@page import="java.util.List"%>
<%
	List<empVo> empList = (List<empVo>)request.getAttribute("empList");
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬로월드 테마파크 - 직원 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css" rel="stylesheet" type="text/css" />
<style>
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
            background-color: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
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
            background-color: var(--primary-color);
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
        .modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 30px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .close:hover,
        .close:focus {
            color: var(--primary-color);
            text-decoration: none;
            cursor: pointer;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        form label {
            margin-top: 15px;
            font-weight: bold;
            color: var(--primary-color);
        }
        form input, form select, form textarea {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        form textarea {
            resize: vertical;
            min-height: 100px;
        }
        #organizationChart {
            width: 100%;
            height: 400px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
        }
        #cafeteria table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        #cafeteria th, #cafeteria td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            vertical-align: top;
        }
        #cafeteria th {
            background-color: var(--primary-color);
            color: white;
        }
        #cafeteria td {
            height: 80px;
        }
        #cafeteria .date {
            font-weight: bold;
            margin-bottom: 5px;
        }
        #cafeteria ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            font-size: 0.9em;
        }
        #cafeteria li {
            margin-bottom: 2px;
        }
        #cafeteria .weekend {
            background-color: #f0f0f0;
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                overflow: hidden;
            }
            .content {
                margin-left: 0;
            }
            .header-content {
                flex-direction: column;
                align-items: flex-start;
            }
            nav ul {
                flex-direction: column;
                width: 100%;
            }
            nav ul li {
                margin-left: 0;
                margin-bottom: 10px;
            }
        }
    </style>

</style>    
</head>
<body>
    
 <main>
        <div class="content">
            <section id="reservations" class="section">
                <h2>예약 고객 명단</h2>
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>고객명</th>                        
                            <th>사용일자</th>
                            <th>인원</th>
                            <th>놀이기구</th>
                            <th>사용여부</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%
                    	 	int rowNumber = 1;  // 시작 번호 설정
                    		for(empVo emp : empList){
                    	%> <!--  에러나는 부분 확인하기  -->
                    	
                        <tr>
                            <td><%= rowNumber++ %></td>
                            <td><%=emp.getCust_name() %></td>                          
                            <td><%=emp.getRsvt_date() %></td>
                            <td><%=emp.getAmount() %></td>
                            <td><%=emp.getProd_name() %></td>
                            <td><button class="subscriberBtn" type="button" onclick='change()'>미사용</button></td>
                        </tr>
                        
                        <%
                    		}
                        %>
                    </tbody>
                </table>
                            <script> 
                            const subs = document.getElementsByClassName('subscriberBtn');

                            for (let i = 0; i < subs.length; i++) {
                                subs[i].addEventListener('click', function () {
                                    if (this.innerText === '미사용') {
                                        this.innerText = '사용';
                                    } else {
                                        this.innerText = '미사용';
                                    }
                                });
                            }
								/* update 내용 변경 저장할 수 있게 하기 */
                            </script>
            </section>
      	</div>
    </main>
</body>
</html>

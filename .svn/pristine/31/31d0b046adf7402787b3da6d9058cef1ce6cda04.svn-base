<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.empVo"%>
<%@page import="kr.or.ddit.vo.MakeVo"%>
<%@page import="java.util.List"%>
<%
//검색어와 직원 목록을 받아옵니다.
String query = request.getParameter("query");
List<MakeVo> empList = (List<MakeVo>) request.getAttribute("empList");
List<MakeVo> makeUpdate = (List<MakeVo>) request.getAttribute("makeUpdate");
int cPage = request.getAttribute("cPage") != null ? (int) request.getAttribute("cPage") : 1;
int sPage = request.getAttribute("sPage") != null ? (int) request.getAttribute("sPage") : 1;
int ePage = request.getAttribute("ePage") != null ? (int) request.getAttribute("ePage") : 1;
int tPage = request.getAttribute("tPage") != null ? (int) request.getAttribute("tPage") : 1;
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.content {
	padding: 40px;
}


.section {
	background-color: white;
	border-radius: 15px;
	padding: 30px;
	margin-bottom: 30px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
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
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
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


.type-box {
	width: 10%; /* 전체 너비로 확장 */
	margin-bottom: 5px; /* 아래 여백 */
}

.inputId {
	width: calc(10% - 20px); /* 전체 너비에서 패딩과 여백을 고려한 크기 */
	padding: 5px; /* 입력 필드 안쪽 여백 */
	margin-bottom: 5px; /* 아래 여백 */
}

.submitBtn {
	width: 10%; /* 버튼의 전체 너비 */
	padding: 5px; /* 버튼의 안쪽 여백 */
	background-color: #007bff; /* 버튼 배경색 */
	color: white; /* 버튼 글자 색 */
	border: none; /* 경계선 제거 */
	border-radius: 3px; /* 모서리 둥글게 */
	cursor: pointer; /* 커서 포인터 표시 */
}

.submitBtn:hover {
	background-color: #0056b3; /* 마우스 호버 시 배경색 변경 */
}
#pageArea{
	display: flex;
	justify-content: center;
	align-items: center;
}
/* ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    unicode-bidi: isolate;
} */
</style>

</head>
<body>

	<main>
    <div class="content">
        <!-- 검색 폼 -->
        <form action="${pageContext.request.contextPath}/empList" method="POST="searchForm" name="search-form">
            <section class="section">
                <h2>예약 고객 명단</h2>
                <div class="search">
                    <select name="type" class="type-box">
                        <option value="">검색 유형 선택</option>
                        <option value="cust_name" <%= "cust_name".equals(request.getParameter("type")) ? "selected" : "" %>>고객명</option>
                    </select>
                    <input class="inputId" type="text" name="query" value="<%= query != null ? query : "" %>" placeholder="검색어 입력">
                    <input class="submitBtn" type="submit" value="검색하기">
                </div>
            </section>
        </form>

        <!-- 검색 결과 또는 전체 목록 테이블 -->
        <section class="section">
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
					if (empList != null && !empList.isEmpty()) {
  					for (int i = 0; i < empList.size(); i++) {
        			MakeVo make = empList.get(i);
					%>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><%= make.getCust_name() %></td>
                        <td><%= make.getRsvt_date() %></td>
                        <td><%= make.getAmount() %></td>
                        <td><%= make.getProd_name() %></td>
                        <td>
							<button class="subscriberBtn" type="button" data-resv-no="<%= make.getMake_no() %>">
        					<%= make.getMake_state() == 1 ? "미사용" : "사용" %>
   						 </button>
                        </td>
                        
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6">검색 결과가 없습니다.</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </section>
		<script>
		$(document).ready(function() {
			$('.subscriberBtn').click(function() {
			var button = $(this);
			var make_no = button.data('resv-no'); // 버튼의 예약 번호 데이터 속성에서 가져옴
			var currentState = button.data('use-state');

			// 이미 "사용" 상태라면 아무 동작도 하지 않음
	        if (currentState == 2) {
	            return;
	        }
			
			// 상태 변경 (2이면 사용으로, 1이면 미사용으로)
			var newState = currentState == 2 ? 1 : 2;
				var newText = newState == 2 ? "사용" : "미사용";

			// 서버에 AJAX 요청 보내기
			$.ajax({
				url: '${pageContext.request.contextPath}/empList', // 실제 엔드포인트로 변경
				method: 'POST',
			data: {
				make_no: make_no, // 예약 번호
				make_state: newState // 새로운 상태
				 },
			success: function(response) {
			// 요청 성공 시 버튼 텍스트와 데이터 속성 업데이트
			button.text(newText);
			button.data('use-state', newState);
			},
			error: function(xhr, status, error) {
				alert("오류 발생: " + error);
			}
					});
				});
			});
		</script>
        <!-- 페이지 네비게이션 -->
        <div id="pageArea">
            <button id="prev" onclick="goToPrevPage()">Prev</button>
            <ul class="pagination">
                <%
                for (int i = sPage; i <= ePage; i++) {
                    if (cPage == i) {
                %>
                <button class="page-button active" disabled><%= i %></button>
                <%
                    } else {
                %>
                <button class="page-button" onclick="goToPage(<%= i %>)"><%= i %></button>
                <%
                    }
                }
                %>
            </ul>
            <button id="next" onclick="goToNextPage()">Next</button>
        </div>
    </div>
</main>
</body>
</html>

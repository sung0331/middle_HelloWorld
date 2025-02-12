<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.empVo"%>
<%@page import="kr.or.ddit.vo.MakeVo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
//검색어와 직원 목록을 받아옵니다.
	String query = request.getParameter("query");
	List<MakeVo> empList = (List<MakeVo>) request.getAttribute("empList");
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    unicode-bidi: isolate;
    align-items: center;
}
</style>

</head>
<body>
<main>
    <div class="content">
        <section class="section">
        <h2>예약 고객 명단</h2>
		 <!-- 검색 폼 -->
        <form action="${pageContext.request.contextPath}/empList" method="get">
    <select name="type" class="type-box">
        <option value="">검색 유형 선택</option>
        <option value="query" <c:if test="${param.type == 'query'}">selected</c:if>>고객명</option>
    </select>
    	<input type="text" name="query" value="${param.query}" placeholder="검색어 입력">
    	<button type="submit" class="submitBtn">검색하기</button>
	</form>

	<!-- 검색 결과 출력 -->
	 <c:if test="${not empty empList}"> 
    <c:forEach var="cust_name" items="${empList}">
    </c:forEach> 
 </c:if>
 <c:if test="${empty empList}"> 
  <!-- <p>검색 결과가 없습니다.</p> -->
 </c:if> 
        <!-- 검색 결과 또는 전체 목록 테이블 -->
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
        
        <!-- 페이지 네비게이션 -->
        <div id="pageArea">

		<button class="page-button" id="prev" onclick="goToPrevPage()">Prev</button>

		<ul class="pagination">
			<%
			/* int cPage = (int) request.getAttribute("cPage");
			int sPage = (int) request.getAttribute("sPage");
			int ePage = (int) request.getAttribute("ePage"); */

			for (int i = sPage; i <= ePage; i++) {
				if (cPage == i) {
			%>

			<button class="page-button disabled"><%=i%></button>


			<%
			} else {
			%>
			<button class="page-button" onclick="goToPage(<%=i%>)"><%=i%></button>
			<%
			}// if end
			}// for end
			%>
		</ul>
		<!-- 다음페이지 -->
		<ul class="pager">
			<button class="page-button" id="next" onclick="goToNextPage()">Next</button>
			</ul>
		</div>
	</div>
</main>	
	<script>
    let ttPage = <%=request.getAttribute("tPage")%>;

    function goToPage(pageNum) {
        location.href = "/empList?page=" + pageNum;
    }

    function goToNextPage() {
        let lastPage = parseInt($('.pagination button').last().text()); // string -> number
        console.log(lastPage);
        if (ttPage === lastPage) return;
        location.href = "/empList?page=" + (lastPage + 1);
    }

    function goToPrevPage() {
        let firstPage = parseInt($('.pagination button').first().text()); // string -> number
        if (firstPage <= 1) return;
        location.href = "/empList?page=" + (firstPage - 1);
    }
    /* function confirmDelete(custNo) {
        if (confirm("정말로 탈퇴시키겠습니까?")) {
        	alert("탈퇴되었습니다.");
            location.href = "managerCustDelete.do?cust_no=" + custNo; // 삭제 처리로 리다이렉트
        } */
    }
	</script>
    
    
    	<!-- JavaScript 코드 -->
		<script>
		$(document).ready(function() {
			$('.subscriberBtn').click(function() {
			let button = $(this);
			let make_no = button.data('resv-no'); // 버튼의 예약 번호 데이터 속성에서 가져옴
			let currentState = button.data('use-state');

			// 이미 "사용" 상태라면 아무 동작도 하지 않음
	        if (currentState == 2) {
	            return;
	        }
			
			// 상태 변경 (2이면 사용으로, 1이면 미사용으로)
			let newState = currentState == 2 ? 1 : 2;
			let newText = newState == 2 ? "사용" : "미사용";

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
</body>
</html>

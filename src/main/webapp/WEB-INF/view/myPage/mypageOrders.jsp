<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.BuyCartVo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
:root {
	--primary-color: #007bff; /* 기본 색상 설정 */
	--secondary-color: #6c757d;
	--background-color: #f9f9f9;
	--accent-color: #FFD700;
}

body {
	font-family: Arial, sans-serif;
	background-color: var(--background-color);
	margin: 0;
}

.AAAA {
	max-width: 800px;
	margin: 50px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}
/*     header { */
/*         background-color: var(--primary-color); */
/*         padding: 20px; */
/*         text-align: center; */
/*         color: white; */
/*         font-size: 1.5rem; */
/*     } */
.section h2 {
	color: var(--primary-color);
	font-size: 2.5rem;
	margin-bottom: 1.5rem;
	padding-bottom: 15px;
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
</style>



<main>
	<section class="AAAA">
		<h2>주문 내역</h2>
		<c:if test="${empty orderList}">
			<p>주문 내역이 없습니다.</p>
		</c:if>
		<c:if test="${not empty orderList}">
			<table>
				<thead>
					<tr>
						<th>주문 번호</th>
						<th>상품명</th>
						<th>수량</th>
						<th>예약일자</th>
						<th>가격</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orderList}">
						<tr>
							<td>${order.buy_no}</td>
							<td>${order.prod_name}</td>
							<td>${order.amount}</td>
							<td>
								<!-- rsvt_date가 String이라면 그냥 출력 --> ${order.rsvt_date} <!-- 만약 rsvt_date가 Date로 변환된다면 사용 가능 -->
								<%--                                 <fmt:formatDate value="${order.rsvt_date}" pattern="yyyy-MM-dd" /> --%>
							</td>
							<td><fmt:formatNumber value="${order.prod_price}"
									type="number" groupingUsed="true" /> 원</td>
							<td><c:choose>
									<c:when test="${order.state == 1}">처리 중</c:when>
									<c:when test="${order.state == 2}">구매 완료</c:when>
									<c:when test="${order.state == 3}">배송 중</c:when>
									<c:when test="${order.state == 4}">배송 완료</c:when>

									<c:otherwise>기타</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		</div>
	</section>
</main>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

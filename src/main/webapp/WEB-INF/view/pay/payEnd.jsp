<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.PayVo"%>


<title>결제 완료 페이지</title>
<style>
/* body { */
/* 	font-family: Arial, sans-serif; */
/* 	background-color: #f9f9f9; */
/* 	color: #333; */
/* 	max-width: 600px; */
/* 	margin: 0 auto; */
/* 	padding: 20px; */
/* } 
*/
h2 {
	text-align: center;
	color: #333;
}

.confirmation-box {
	display: flex;

	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	justify-content: center; /* 가로 방향으로 가운데 정렬 */
}

.aaa {
			width: 50%;
	
}

.info {
	font-weight: bold;
	margin-top: 15px;
}

.info-row {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

.label {
	font-weight: bold;
}

.value {
	text-align: right;
}

.back-button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin-top: 20px;
}

.back-button:hover {
	background-color: #0056b3;
}
</style>

<main>
	<%
	PayVo pay = (PayVo) request.getAttribute("pay");
	%>
	<h2>결제 완료</h2>
	<div class="confirmation-box">
		<div class="aaa">
			<p class="info">결제가 완료되었습니다. 아래는 결제 정보입니다:</p>

			<div class="info-row">
				<span class="label">구매번호:</span> <span class="value">${pay.buy_no}</span>
			</div>



			<div class="info-row">
				<span class="label">총 결제 금액:</span> <span class="value">${pay.pay_price}원</span>
			</div>

			<a href="index.do" class="back-button">메인 페이지로 돌아가기</a>
		</div>
	</div>


</main>
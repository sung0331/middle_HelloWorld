<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="kr.or.ddit.vo.BuyCartVo"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.Servlet"%>
<%
// Servlet sc = request.getServletContext();
List<BuyCartVo> cart = (List<BuyCartVo>) request.getAttribute("cart");
CustomerVo customer = (CustomerVo) request.getAttribute("customer");
int buy_no = (int) request.getAttribute("buy_no");
int totalPrice = (int) request.getAttribute("totalPrice");
String address = (String)request.getAttribute("address");
%>
<style>
button {
	height: 40px;
	padding: 0 15px;
	font-size: 16px;
	border-radius: 5px;
	margin: 0 5px;
	transition: background-color 0.3s;
}

.selection {
	display: flex;
	justify-content: right;
}

a {
	text-decoration: none;
}
</style>
<main>

	<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<%@include file="../../include/managerStyle.css"%>


	<div class="content">
		<section id="" class="">
			<h2>주문 결제</h2>
			<ul class="selection">

			</ul>
			<table class="table table-border">
				<tbody>
					<tr>
						<th>구매자</th>
						<td colspan="1"><%=customer.getCust_name()%></td>
						<th>구매번호</th>
						<td><%=buy_no%></td>
					</tr>
					<tr>
						<th>상품 이름</th>
						<th>가격</th>
						<th>수량</th>
						<th>총가격</th>
					</tr>
					<tr>
						<%
						for (int i = 0; i < cart.size(); i++) {
						%>
					
					<tr>
						<td>&nbsp;&nbsp;<%=cart.get(i).getProd_name()%></td>
						<td>&nbsp;&nbsp;<%=cart.get(i).getProd_price()%></td>
						<td>&nbsp;&nbsp;<%=cart.get(i).getAmount()%></td>
						<td>&nbsp;&nbsp;<%=cart.get(i).getTotal_price()%></td>




						<%
						} //for end
						%>
					</tr>
					<tr>
						<th colspan="2">총금엑</th>
						<td><%=totalPrice%></td>

					</tr>
					<tr>
						<th colspan="2">배송주소</th>
						<td><%=address%></td>
					</tr>
<!-- 					<td>※배송 주소 변경시 마이페이지에서 변ㄱ여</td> -->

				</tbody>
			</table>


	</div>

		<a href="#"onclick="confirmDelete('<%=buy_no%>','<%=totalPrice%>','<%=address%>')"><button>구매</button></a>




	<script>-->
			function confirmDelete(buy_no,totalPrice,address) {

				if (confirm("주문하시겠습니까?")) {
					alert("주문 되었습니다.");
					location.href = "payEnd.do?buy_no=" + buy_no+"&totalPrice="+totalPrice+"&address="+address; 
					}
			}
</script> 
</main>


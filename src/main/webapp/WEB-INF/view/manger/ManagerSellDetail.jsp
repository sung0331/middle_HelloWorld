<%@page import="kr.or.ddit.vo.BuyCartVo"%>
<%@page import="kr.or.ddit.vo.CartVo"%>
<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="jakarta.servlet.ServletContext"%>
<%@page import="kr.or.ddit.vo.BoardVo"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ServletContext sc = request.getServletContext();
List<BuyCartVo> cart = (List<BuyCartVo>) request.getAttribute("cart");
CustomerVo customer = (CustomerVo) request.getAttribute("customer");
int buy_no = (int) request.getAttribute("buy_no");
int state = (int) request.getAttribute("state");
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



	<div class="content">
		<section id="" class="">
			<h2>주문 조회</h2>
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
						<th colspan="2">주문상태</th>
						<td colspan="2">
							<%
							if (state == 1) {
							%> &nbsp;&nbsp;구매중 <%
 } else if (state == 2) {
 %> &nbsp;&nbsp;구매완료 <%
 } else if (state == 3) {
 %> &nbsp;&nbsp;배송중 <%
 } else if (state == 4) {
 %> &nbsp;&nbsp;배송완료 <%
 }
 %>
						</td>
					</tr>
				</tbody>
			</table>
	</div>

	<a href="mangerSellInfo.do"><button>뒤로</button></a> <a href="#"
		onclick="confirmDelete('<%=buy_no%>','<%=state%>')"><button>주문상태업데이트</button></a>




	<script>
		function confirmDelete(buy_no, state) {

			if (state == 4) {
				alert("이미 배송완료된 주문입니다");
			} else if (confirm("배송상태를 업데이트 하시겠습니까?")) {
				alert("업데이트 되었습니다.");
				location.href = "mangerSellUpdate.do?buy_no=" + buy_no; // 삭제 처리로 리다이렉트
			}
		}
	</script>
</main>

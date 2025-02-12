<%@page import="kr.or.ddit.vo.BuyVo"%>
<%@page import="kr.or.ddit.vo.BoardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
			<table>
				<thead>
					<tr>
						<th>&nbsp;&nbsp;글번호</th>
						<th>&nbsp;&nbsp;주문번호</th>
						<th>&nbsp;&nbsp;구매자</th>
						<th>&nbsp;&nbsp;총가격</th>
						<th>&nbsp;&nbsp;주소</th>
						<th>&nbsp;&nbsp;주문상태</th>
						<th>&nbsp;&nbsp;단계설정</th>

					</tr>
				</thead>
				<tbody>
					<%
					List<BuyVo> list = (List<BuyVo>) request.getAttribute("list");
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td>&nbsp;&nbsp;<%=list.get(i).getRNUM()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getBuy_no()%>
						</td>
						<td>&nbsp;&nbsp;<%=list.get(i).getCust_name()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getTotal_price()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getBuy_address()%></td>

						<%
						if (list.get(i).getState() == 1) {
						%>
						<td>&nbsp;&nbsp;구매중</td>
						<%
						} else if (list.get(i).getState() == 2) {
						%>
						<td>&nbsp;&nbsp;구매완료</td>
						<%
						} else if (list.get(i).getState() == 3) {
						%>
						<td>&nbsp;&nbsp;배송중</td>
						<%
						} else if (list.get(i).getState() == 4) {
						%>
						<td>&nbsp;&nbsp;배송완료</td>
						<%
						}
						%>
						<td><a href="#"
							onclick="confirmUpdate('<%=list.get(i).getBuy_no()%>','<%=list.get(i).getCust_no()%>','<%=list.get(i).getState()%>')"
							class='blue_btn'>단계</a></td>
					</tr>

					<%
					} //for end
					%>
				</tbody>
			</table>
	</div>

	<div id="pageArea">
		<ul>

			<button class="page-button" id="prev" onclick="goToPrevPage()">Prev</button>


		</ul>

		<ul class="pagination">
			<%
			int cPage = (int) request.getAttribute("cPage");
			int sPage = (int) request.getAttribute("sPage");
			int ePage = (int) request.getAttribute("ePage");

			for (int i = sPage; i <= ePage; i++) {
				if (cPage == i) {
			%>

			<button class="page-button disabled"><%=i%></button>


			<%
			} else {
			%>
			<button class="page-button" onclick="goToPage(<%=i%>)"><%=i%></button>
			<%
			} //if end
			} //for end
			%>
		</ul>
		<!-- 다음페이지 -->
		<ul class="pager">
			<button class="page-button" id="next" onclick="goToNextPage()">Next</button>
		</ul>
	</div>

	<script>
    let ttPage = <%=request.getAttribute("tPage")%>;

    function goToPage(pageNum) {
        location.href = "mangerSellInfo.do?page=" + pageNum;
    }

    function goToNextPage() {
        let lastPage = parseInt($('.pagination button').last().text()); // string -> number
        console.log(lastPage);
        if (ttPage === lastPage) return;
        location.href = "mangerSellInfo.do?page=" + (lastPage + 1);
    }

    function goToPrevPage() {
        let firstPage = parseInt($('.pagination button').first().text()); // string -> number
        if (firstPage <= 1) return;
        location.href = "mangerSellInfo.do?page=" + (firstPage - 1);
    }
    function confirmUpdate(buy_no,cust_no,state) {
//         if (confirm("해당 주문 다음 단계 설정하시겠습니까")) {
//         	alert("적용되었습니다.");
//             location.href = "mangerSellUpdate.do?buy_no=" + buy_no; 
//         }
        location.href = "mangerSellDetail.do?buy_no=" + buy_no+"&cust_no="+cust_no+"&state="+state; 

    }
</script>
	</section>

	<div class="box"></div>

</main>

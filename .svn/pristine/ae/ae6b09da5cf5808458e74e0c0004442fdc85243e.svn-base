<%@page import="kr.or.ddit.vo.ProductVo"%>
<%@page import="kr.or.ddit.vo.SheduleVo"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

</style>
<main>
	<div class="content">
		<section id="" class="">
			<h2>판매품 관리</h2>
			<ul class="selection">

			</ul>
			<table>
				<thead>
				<a href="managerProductInsert.do">
					<button class="page-button ">작성</button>
					</a> 
					<tr>
						<th>&nbsp;&nbsp;번호</th>
						<th>&nbsp;&nbsp;이름</th>
						<th>&nbsp;&nbsp;가격</th>
						<th>&nbsp;&nbsp;카테고리</th>
						<th>&nbsp;&nbsp;삭제</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<ProductVo> list = (List<ProductVo>) request.getAttribute("list");
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td>&nbsp;&nbsp;<%=list.get(i).getProd_no()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getProd_name()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getProd_price()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getProd_comment()%></td>
						<td><a href="#"
							onclick="confirmDelete('<%=list.get(i).getProd_no()%>')"
							 class='blue_btn'>삭제</a>
						</td>
					</tr>
					<%
					} //for end
					%>
				</tbody>
			</table>
	</div>

	<div id="pageArea">

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
        location.href = "managerProductInfo.do?page=" + pageNum;
    }

    function goToNextPage() {
        let lastPage = parseInt($('.pagination button').last().text()); // string -> number
        console.log(lastPage);
        if (ttPage === lastPage) return;
        location.href = "managerProductInfo.do?page=" + (lastPage + 1);
    }

    function goToPrevPage() {
        let firstPage = parseInt($('.pagination button').first().text()); // string -> number
        if (firstPage <= 1) return;
        location.href = "managerProductInfo.do?page=" + (firstPage - 1);
    }

    function confirmDelete(prod_no) {
        if (confirm("정말로 삭제시키겠습니까?")) {
        	alert("삭제되었습니다.");
            location.href = "managerProdDelete.do?prod_no=" + prod_no; 
        }
    }
</script>
	</section>

	<div class="box"></div>

</main>
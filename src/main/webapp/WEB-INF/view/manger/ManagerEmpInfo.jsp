<%@page import="kr.or.ddit.vo.empVo"%>
<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main>
	<div class="content">
		<section id="" class="">
			<h2>직원 조회</h2>
			<ul class="selection">

			</ul>
			<table>
				<thead>
					<tr>
						<th>&nbsp;&nbsp;이름</th>
						<th>&nbsp;&nbsp;전화번호</th>
						<th>&nbsp;&nbsp;직책</th>
						<th>&nbsp;&nbsp;부서</th>
						<th>&nbsp;&nbsp;입사일</th>
						<th>&nbsp;&nbsp;월급</th>
						<th>&nbsp;&nbsp;탈퇴</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<empVo> list = (List<empVo>) request.getAttribute("list");
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getCust_name()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getCust_tel()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getManager()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getDepartment_name()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getHire_date()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getSalary()%></td>
						<td><a href="#"
							onclick="confirmDelete('<%=list.get(i).getCust_no()%>')"
							class='blue_btn'">탈퇴</a>
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
        location.href = "ManagerEmpInfo.do?page=" + pageNum;
    }

    function goToNextPage() {
        let lastPage = parseInt($('.pagination button').last().text()); // string -> number
        console.log(lastPage);
        if (ttPage === lastPage) return;
        location.href = "ManagerEmpInfo.do?page=" + (lastPage + 1);
    }

    function goToPrevPage() {
        let firstPage = parseInt($('.pagination button').first().text()); // string -> number
        if (firstPage <= 1) return;
        location.href = "ManagerEmpInfo.do?page=" + (firstPage - 1);
    }
    function confirmDelete(cust_no) {
        if (confirm("정말로 탈퇴시키겠습니까?")) {
        	alert("탈퇴되었습니다.");
            location.href = "managerEmpDelete.do?cust_no=" + cust_no; 
        }
    }
</script>
	</section>

	<div class="box"></div>

</main>
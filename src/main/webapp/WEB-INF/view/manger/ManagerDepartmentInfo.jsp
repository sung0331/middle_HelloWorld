<%@page import="kr.or.ddit.vo.DepartmentVo"%>
<%@page import="kr.or.ddit.vo.empVo"%>
<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main>
	<div class="content">
		<section id="" class="">
			<h2>조직도</h2>
			<ul class="selection">

			</ul>
			<table>
				<thead>
					<tr>
						<th>&nbsp;&nbsp;사원번호</th>
						<th>&nbsp;&nbsp;이름</th>
						<th>&nbsp;&nbsp;연락처</th>
						<th>&nbsp;&nbsp;부서</th>
						<th>&nbsp;&nbsp;수정</th>
					</tr>
				</thead>
				<tbody>
					<form action="managerDepartmentUpdate.do" method="get">

						<%
						List<empVo> list = (List<empVo>) request.getAttribute("list");
						List<DepartmentVo> department = (List<DepartmentVo>) request.getAttribute("department");

						for (int i = 0; i < list.size(); i++) {
						%>
						<input type="hidden" name="emp_no"
							value="<%=list.get(i).getEmp_no()%>">

						<tr>
							<td>&nbsp;&nbsp;<%=list.get(i).getEmp_no()%></td>
							<td>&nbsp;&nbsp;<%=list.get(i).getEmp_name()%></td>
							<td>&nbsp;&nbsp;<%=list.get(i).getCust_tel()%></td>
							<td>&nbsp;&nbsp;<%=list.get(i).getDepartment_name()%></td>
							<td colspan="5"><select name="department">
									<%
									for (int j = 0; j < department.size(); j++) {
									%>
									<option value="<%=department.get(j).getDepartment_no()%>"><%=department.get(j).getDepartment_name()%></option>
									<%
									}
									%>
							</select> <input type='submit' class='' value="저장"
								style="border: 2px solid black; background-color: var(--primary-color); color: white;"></td>

						</tr>
					</form>
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
        location.href = "managerDepartmentInfo.do?page=" + pageNum;
    }

    function goToNextPage() {
        let lastPage = parseInt($('.pagination button').last().text()); // string -> number
        console.log(lastPage);
        if (ttPage === lastPage) return;
        location.href = "managerDepartmentInfo.do?page=" + (lastPage + 1);
    }

    function goToPrevPage() {
        let firstPage = parseInt($('.pagination button').first().text()); // string -> number
        if (firstPage <= 1) return;
        location.href = "managerDepartmentInfo.do?page=" + (firstPage - 1);
    }
    function confirmDelete(cust_no) {
        if (confirm("정말로 탈퇴시키겠습니까?")) {
        	alert("탈퇴되었습니다.");
            location.href = "managerDepartmentInfo.do?cust_no=" + cust_no; 
        }
    }
</script>
	</section>

	<div class="box"></div>

</main>
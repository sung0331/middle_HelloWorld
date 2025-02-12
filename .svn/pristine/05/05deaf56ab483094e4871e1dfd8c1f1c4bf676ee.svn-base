<%@page import="kr.or.ddit.vo.empVo"%>
<%@page import="kr.or.ddit.vo.VacationVo"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% --%>
<!-- // 					List<empVo> list = (List<empVo>) request.getAttribute("list"); -->
<%-- %> --%>
</style>
<main>
	<div class="content">
		<section id="" class="">
			<h2>휴가 신청 관리</h2>
			<ul class="selection">

			</ul>
			<table>
				<thead>
					<tr>
						<th>&nbsp;&nbsp;이름</th>
						<th>&nbsp;&nbsp;휴가시작일</th>
						<th>&nbsp;&nbsp;휴가종료일</th>
						<th>&nbsp;&nbsp;사유</th>
						<th>&nbsp;&nbsp;부서</th>
						<th>&nbsp;&nbsp;신청일</th>
						<th>&nbsp;&nbsp;승인여부</th>

					</tr>
				</thead>
				<tbody>
					<%
					List<VacationVo> list = (List<VacationVo>) request.getAttribute("list");
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td>&nbsp;&nbsp;<%=list.get(i).getEmp_name()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getStart_date()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getEnd_date()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getVacation_type()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getDepartment_name()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getAppli_date()%></td>
						<td><button
								onclick="stateChk(<%=list.get(i).getVacation_no()%>,2)" class='blue_btn'>승인</button>
							<button onclick="stateChk(<%=list.get(i).getVacation_no()%>,3)" class='blue_btn'>반려</button></td>
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
        location.href = "ManagerVacationInfo.do?page=" + pageNum;
    }

    function goToNextPage() {
        let lastPage = parseInt($('.pagination button').last().text()); // string -> number
        console.log(lastPage);
        if (ttPage === lastPage) return;
        location.href = "ManagerVacationInfo.do?page=" + (lastPage + 1);
    }

    function goToPrevPage() {
        let firstPage = parseInt($('.pagination button').first().text()); // string -> number
        if (firstPage <= 1) return;
        location.href = "ManagerVacationInfo.do?page=" + (firstPage - 1);
    }

    function stateChk(vacation_no,state_no) {
     let stat= " ";
     if(state_no==2){
    	 stat="정말로 승인시키겠습니까?"
     }else if(state_no==3){
    	 stat= "정말로 반려시키겠습니까?"
     }
    	if (confirm(stat)) {
        	alert("적용되었습니다.");
            location.href = "ManagerVacationState.do?vacation_no="+vacation_no+"&state_no=" + state_no; 
    	}
    }
</script>
	</section>

	<div class="box"></div>

</main>
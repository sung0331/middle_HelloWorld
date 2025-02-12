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
			<h2>공지사항 조회</h2>
			<ul class="selection">

			</ul>
			<table>
				<thead>
					<a href="managerAnnouncementInsert.do">
						<button class="page-button ">작성</button>
					</a>

					<tr>
						<th>&nbsp;&nbsp;글번호</th>
						<th>&nbsp;&nbsp;게시판</th>

						<th>&nbsp;&nbsp;제목</th>
						<th>&nbsp;&nbsp;글쓴이</th>
						<th>&nbsp;&nbsp;작성날짜</th>
						<th>&nbsp;&nbsp;조회수</th>
						<th>&nbsp;&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<BoardVo> list = (List<BoardVo>) request.getAttribute("list");
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td>&nbsp;&nbsp;<%=list.get(i).getPost_no()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getBoard_name()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getTitle()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getWriter()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getBoard_date()%></td>
						<td>&nbsp;&nbsp;<%=list.get(i).getCnt()%></td>
						<td><a
							href='managerAnnouncementUpdate.do?post_no=<%=list.get(i).getPost_no()%>'
							class='blue_btn'>수정</a></td>

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
        location.href = "managerAnnouncementInfo.do?page=" + pageNum;
    }

    function goToNextPage() {
        let lastPage = parseInt($('.pagination button').last().text()); // string -> number
        console.log(lastPage);
        if (ttPage === lastPage) return;
        location.href = "managerAnnouncementInfo.do?page=" + (lastPage + 1);
    }

    function goToPrevPage() {
        let firstPage = parseInt($('.pagination button').first().text()); // string -> number
        if (firstPage <= 1) return;
        location.href = "managerAnnouncementInfo.do?page=" + (firstPage - 1);
    }
</script>
	</section>

	<div class="box"></div>

</main>

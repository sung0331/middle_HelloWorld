<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="jakarta.servlet.ServletContext"%>
<%@page import="kr.or.ddit.vo.BoardVo"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ServletContext sc = request.getServletContext();
List<BoardVo> cateList = (List<BoardVo>) sc.getAttribute("cateList");
BoardVo board = (BoardVo) request.getAttribute("board");
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



	<input type="hidden" name="post_no" value="<%=board.getPost_no()%>">

	<div class="row">

		<!-- Content Column -->
		<div class="col-lg-12 mb-4">
			<table class="table table-border">
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3"><%=board.getTitle()%></td>
						<th>게시판</th>
						<td colspan="1"><%=board.getBoard_name()%></td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td><%=board.getWriter()%></td>
						<th>조회수</th>
						<td><%=board.getCnt()%></td>
						<th>등록일</th>
						<td><%=board.getBoard_date()%></td>
					</tr>
					<tr>
						<td colspan="9"><%=board.getContent()%></td>
					</tr>
				</tbody>
			</table>

			<!-- 			수정할 경우 -->
			<a href="mangerBoardUpdate.do?post_no=<%=board.getPost_no()%>"><button>수정</button></a>

			<!-- 			삭제할 경우 -->
			<a href="#" onclick="confirmDelete('<%=board.getPost_no()%>')"><button>삭제</button></a>

			<a href="mangerBoardInfo.do"><button>뒤로</button></a>
			<div class="box"></div>




			<script>
				function confirmDelete(custNo) {
					if (confirm("정말로 삭제하시겠습니까?")) {
						alert("삭제되었습니다.");
						location.href = "mangerBoardDelete.do?post_no="
								+ custNo; // 삭제 처리로 리다이렉트
					}
				}
			</script>
</main>

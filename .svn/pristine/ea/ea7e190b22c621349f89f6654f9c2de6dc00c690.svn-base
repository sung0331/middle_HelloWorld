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

<main>

	<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



	<form action="mangerBoardUpdate.do" method="post">
		<input type="hidden" name="post_no" value="<%=board.getPost_no()%>">

		<div class="row">

			<!-- Content Column -->
			<div class="col-lg-12 mb-4">
				<table class="table table-border">
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="5"><input type="text" name="title"
								value="<%=board.getTitle()%>"></td>
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
							<td colspan="9"><textarea rows="" cols="" name="content"><%=board.getContent()%></textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<input type='submit' class='' value="저장"
					style="border: 2px solid black;">
	</form>
	<a href="mangerBoardInfo.do"><button>뒤로</button></a>
	<div class="box"></div>

</main>

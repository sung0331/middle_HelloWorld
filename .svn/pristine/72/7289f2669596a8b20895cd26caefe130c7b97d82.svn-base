<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="jakarta.servlet.ServletContext"%>
<%@page import="kr.or.ddit.vo.BoardVo"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
CustomerVo customer = (CustomerVo) session.getAttribute("user");
%>

<main>

	<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



	<form action="managerAnnouncementInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="cust_no" value="<%=customer.getCust_no()%>">

		<div class="row">

			<!-- Content Column -->
			<div class="col-lg-12 mb-4">
				<table class="table table-border">
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="5"><input type="text" name="title" value=""></td>
						</tr>
						<tr>
							<th>글쓴이</th>
							<td><%=customer.getCust_name()%></td>
						</tr>
						<tr>
							<th>게시판 선택</th>
							<td><select name="type">
									<option value="4">공지사항</option>
									<option value="5">직원 공지사항</option>
									<option value="6">이벤트</option>

							</select></td>
						<tr>
							<th>사진</th>
							<td colspan="9"><input type="file" name="img" value=""></td>
						</tr>


						<tr>
							<td colspan="9"><textarea rows="" cols="" name="content"></textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<input type='submit' class='' value="저장"
					style="border: 2px solid black;">
	
	</form>
	
	<button href="managerAnnouncementInfo.do">뒤로</button>
	<div class="box"></div>

</main>

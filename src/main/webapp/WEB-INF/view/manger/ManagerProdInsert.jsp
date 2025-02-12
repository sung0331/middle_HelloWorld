<%@page import="kr.or.ddit.vo.ProdCategoryVo"%>
<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="jakarta.servlet.ServletContext"%>
<%@page import="kr.or.ddit.vo.BoardVo"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<ProdCategoryVo> cate = (List<ProdCategoryVo>) request.getAttribute("cate");
%>

<main>

	<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



	<form action="managerProductInsert.do" method="post"
		enctype="multipart/form-data">

		<div class="row">

			<!-- Content Column -->
			<div class="col-lg-12 mb-4">
				<table class="table table-border">
					<tbody>
						<tr>
							<th>이름</th>
							<td colspan="5"><input type="text" name="name" value=""></td>
						</tr>
						<tr>
							<th>가격</th>
							<td colspan="5"><input type="text" name="price" value=""></td>
						</tr>
						<tr>
							<th>설명</th>
							<td colspan="9"><input type="text" name="comment" value=""></td>
						</tr>
						<tr>
						<tr>
							<th>사진</th>
							<td colspan="9"><input type="file" name="img" value=""></td>
						</tr>
						<tr>
							<th>카테고리 선택</th>
							<td><select name="type">
									<%
									for (int i = 0; i < cate.size(); i++) {
									%>
									<option value="<%=cate.get(i).getProd_cate_no()%>"><%=cate.get(i).getProd_catename()%></option>
									<%
									}
									%>

							</select></td>
						</tr>

					</tbody>
				</table>

				<input type='submit' class='' value="저장"
					style="border: 2px solid black;">
			</div>
	</form>
	<a href="managerProductInfo.do"
		style="height: 40px; padding: 0 15px; font-size: 16px;border:4px solid; border-radius: 5px; margin: 0 5px; transition: background-color 0.3s;">뒤로</a>

	<div class="box"></div>

</main>

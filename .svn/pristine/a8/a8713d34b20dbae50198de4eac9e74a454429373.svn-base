<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.RideVo"%>
<%@page import="kr.or.ddit.vo.empVo"%>
<%@page import="jakarta.servlet.ServletContext"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<empVo> emp = (List<empVo>) request.getAttribute("list");
List<RideVo> ride = (List<RideVo>) request.getAttribute("ride");


%>

<main>

	<!-- 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



	<form action="ManagerSheduleInsert.do" method="post"
		onsubmit="validateForm(event)">
		<h2>스케줄 추가</h2>

		<div class="row">

			<!-- Content Column -->
			<div class="col-lg-12 mb-4">
				<table class="table table-border">
					<tbody>
						<tr>
							<th>이름</th>
							<td colspan="5"><select name="name">
							<%
							for (int i = 0; i < emp.size(); i++) {
							%>
									<option value="<%=emp.get(i).getEmp_no()%>"><%=emp.get(i).getEmp_name()%></option>
						<%
						}
						%>
							</select></td>
						</tr>
						<tr>
							<th>기구</th>
							<td colspan="5"><select name="ride">
							<%
							for (int i = 0; i < ride.size(); i++) {
							%>
									<option value="<%=ride.get(i).getRide_no()%>"><%=ride.get(i).getRide_name()%></option>
						<%
						}
						%>
							</select></td>
						</tr>
						<tr>
							<th>날짜</th>
							<td colspan="5"><input type="date" name="date" value=""></td>
						</tr>
						<tr>
							<th>시간대 선택</th>
							<td><select name="time">
									<option value="08-10">08시-10시</option>
									<option value="10-12">10시-12시</option>
									<option value="12-14">12시-14시</option>
									<option value="14-16">14시-16시</option>
									<option value="16-18">16시-18시</option>
									<option value="18-20">18시-20시</option>
							</select></td>
						</tr>
						<tr>
						</tr>
					</tbody>
				</table>

				<input type='submit' class='' value="저장"
					style="border: 2px solid black;">
	</form>
	<button href="managerSheduleInfo.do">뒤로</button>
	<div class="box"></div>

</main>

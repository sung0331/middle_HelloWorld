<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
CustomerVo customer = (CustomerVo) session.getAttribute("user");
%>
<style>
table {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
}

td.main {
	background-color: white;
	width: 50%;
	height: 12vh;
	border: none;
	text-align: center;
	vertical-align: middle;
	font-size: 33px;
}

h2 {
	text-align: left; /* 텍스트를 왼쪽 정렬 */
	margin: 0; /* 기본 여백 제거 */
	padding: 10px; /* 원하는 패딩 추가 (선택 사항) */
}
	a {
		text-decoration: none;
		color: black;
	}
</style>
<main>


	<section>
		<!-- 		<div class="box"></div> -->
		<div class="container">
			<%-- 			<h2><%=customer.getCust_name()%> --%>
			<!-- 				관리자님 어서오세요 -->
			<!-- 			</h2> -->
			<table>
				<tr>
					<td>
						<h2><%=customer.getCust_name()%>
						직원님 어서오세요
					</h2>
					</td>
				
				<tr>
					<td class="main"><i class="fa-solid fa-user"></i><a
						href="empList">&nbsp;예약 고객 명단</a></td>
					<td class="main"><a href="calendar.do"><i
							class="fa-solid fa-calendar-days"></i> 일정표</a></td>
				</tr>		
				<tr>
					<td class="main"><a href="Department"><i
							class="fa-solid fa-user-tie"></i> &nbsp;조직도</a></td>
					<td class="main"><a href="empBoard"><i
							class="fa-solid fa-circle-exclamation"></i> &nbsp;공지사항</a></td>
				</tr>
				<tr>
					<td class="main"><a href=empVacation> <i
							class="fa-solid fa-border-all"></i>&nbsp;휴가신청
					</a></td>
				</tr>
			</table>

		</div>
	</section>

</main>


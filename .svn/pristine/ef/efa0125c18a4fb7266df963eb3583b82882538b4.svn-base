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
						관리자님 어서오세요
					</h2>
					</td>
				
										<td class="main"><a href="mangerSellInfo.do"><i
							class="fa-solid fa-parachute-box"></i>주문 조회</a></td>
				</tr>
				<tr>
					<td class="main"><i class="fa-solid fa-user"></i><a
						href="mangerCusInfo.do">&nbsp;회원관리</a></td>
					<td class="main"><a href="managerProductInfo.do"><i
							class="fa-solid fa-boxes-stacked"></i>상품 추가</a></td>
				</tr>
				<tr>

					<td class="main"><a href="mangerSellTicketInfo.do"><i
							class="fa-solid fa-ticket"></i>&nbsp;티켓 판매 통계</a></td>
					<td class="main"><a href="mangerSellProductInfo.do"><i
							class="fa-brands fa-goodreads"></i>&nbsp;굿즈 판매 통계</a></td>
				</tr>
				<tr>
					<td class="main"><a href="managerAnnouncementInfo.do"><i
							class="fa-solid fa-circle-exclamation"></i> &nbsp;공지사항</a></td>
					<td class="main"><a href=mangerBoardInfo.do> <i
							class="fa-solid fa-border-all"></i>&nbsp;게시글
					</a></td>
				</tr>
				<tr>
					<td class="main"><a href="ManagerSheduleInfo.do"><i
							class="fa-solid fa-calendar-days"></i> 스케줄</a></td>
					<td class="main"><a href="ManagerEmpInfo.do"><i
							class="fa-solid fa-user-tie"></i> &nbsp;직원관리</a></td>
				</tr>
				<tr>
					<td class="main"><a href="managerDepartmentInfo.do"><i
							class="fa-solid fa-chart-bar"></i>조직도</a></td>
					<td class="main"><a href="ManagerVacationInfo.do"><i
							class="fa-solid fa-plane-departure"></i>&nbsp;휴가관리</a></td>
				</tr>
			</table>

		</div>
	</section>

</main>


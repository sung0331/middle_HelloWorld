<%@page import="kr.or.ddit.vo.BoardVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.section {
	background-color: white;
	border-radius: 15px;
	padding: 30px;
	margin-bottom: 30px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.section h2 {
	color: var(--primary-color);
	font-size: 2.5rem;
	margin-bottom: 1.5rem;
	position: relative;
	padding-bottom: 15px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: var(--primary-color);
	color: white;
	font-weight: bold;
	text-transform: uppercase;
}

tr:nth-child(even) {
	background-color: #f8f8f8;
}

tr:hover {
	background-color: #e8e8e8;
}

.modal {
	display: none;
	position: fixed;
	z-index: 2000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 30px;
	border: 1px solid #888;
	width: 80%;
	max-width: 500px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	transition: color 0.3s ease;
}

.close:hover, .close:focus {
	color: var(--primary-color);
	text-decoration: none;
	cursor: pointer;
}

form {
	display: flex;
	flex-direction: column;
}

form label {
	margin-top: 15px;
	font-weight: bold;
	color: var(--primary-color);
}

form input, form select, form textarea {
	margin-bottom: 15px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 1rem;
}

form textarea {
	resize: vertical;
	min-height: 100px;
}

#organizationChart {
	width: 100%;
	height: 400px;
	border: 1px solid #ddd;
	border-radius: 10px;
	overflow: hidden;
}

@media ( max-width : 768px) {
	.sidebar {
		width: 0;
		overflow: hidden;
	}
	.content {
		margin-left: 0;
	}
	.header-content {
		flex-direction: column;
		align-items: flex-start;
	}
	nav ul {
		flex-direction: column;
		width: 100%;
	}
	nav ul li {
		margin-left: 0;
		margin-bottom: 10px;
	}
}

#pageArea { 
 	display: flex; 
 	justify-content: center; 
 	align-items: center; 
 }

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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<section>
		<div class="content">
	    <h2>내 게시물</h2>
	    <table>
	        <thead>
	            <tr>
	                <th>글번호</th>
	                <th>제목</th>
<!-- 	                <th>글쓴이</th> -->
	                <th>작성날짜</th>
	                <th>조회수</th>
	            </tr>
	        </thead>
				<tbody>
				    <%
				    List<BoardVo> list = (List<BoardVo>) request.getAttribute("list");
				    if (list != null && !list.isEmpty()) {
				        for (BoardVo board : list) {
				    %>
				        <tr>
				            <td><%= board.getPost_no() %></td> <!-- 글번호 -->
				            <td><a href="/board/view?postNo=<%= board.getPost_no() %>"><%= board.getTitle() %></a></td> <!-- 제목에 링크 추가 -->
				            <td>
				                <%
				                // 날짜가 null이면 기본 날짜를 출력
				                if (board.getBoard_date() != null) {
				                %>
				                    <fmt:formatDate value="${board.board_date}" pattern="yyyy-MM-dd" />
				                <%
				                } else {
				                %>
				                    <%= "2024-10-10" %>
				                <%
				                }
				                %>
				            </td> <!-- 작성날짜 -->
				            <td><%= board.getCnt() %></td> <!-- 조회수 -->
				        </tr>
				    <%
				        }
				    } else {
				    %>
				        <tr>
				            <td colspan="4" style="text-align: center;">작성한 게시물이 없습니다.</td>
				        </tr>
				    <%
				    }
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
        location.href = "mypagePosts.do?page=" + pageNum;
    }

    function goToNextPage() {
        let lastPage = parseInt($('.pagination button').last().text()); // string -> number
        console.log(lastPage);
        if (ttPage === lastPage) return;
        location.href = "mypagePosts.do?page=" + (lastPage + 1);
    }

    function goToPrevPage() {
        let firstPage = parseInt($('.pagination button').first().text()); // string -> number
        if (firstPage <= 1) return;
        location.href = "mypagePosts.do?page=" + (firstPage - 1);
    }

    
</script>
	</section>
	<div class="box"></div>


</main>

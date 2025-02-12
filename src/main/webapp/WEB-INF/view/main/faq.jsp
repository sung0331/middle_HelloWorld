<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.BoardVo"%>
<%@page import="java.util.List"%>
<%
List<BoardVo> eventList = (List<BoardVo>) request.getAttribute("eventList");
%>
<html lang="ko">

<style>
/* 전체 페이지 스타일 */
body {
	/*             margin: 0; */
	/*             font-family: 'Noto Sans KR', sans-serif; */
	/*             background-color: #001428;  /* 어두운 배경색 */ */
	/*             color: white; */
	display: flex;
	/*             justify-content: center; */
	/*             align-items: center; */
	/*             min-height: 100vh; */
	/*             text-align: center; */
}

.event-container {
	max-width: 800px;
	margin: 0 auto;
	padding: 100px;
	background: rgba(255, 255, 255, 0.1); /* 반투명한 배경 */
	border-radius: 15px;
	/*  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); */
	display: flex;
	flex-direction: column; /* 수직 정렬 */
	align-items: center; /* 수평 중앙 정렬 */
	justify-content: center; /* 수직 중앙 정렬 */
	text-align: center; /* 텍스트도 중앙 정렬 */
}

/* 이미지 스타일 */
.event-image {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	margin-bottom: 20px;
}

/* 제목 스타일 */
.event-title {
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 10px;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

/* 설명 텍스트 스타일 */
.event-description {
	font-size: 1.2rem;
	line-height: 1.6;
}
/* 모달 창 배경 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7); /* 반투명한 검정 배경 */
}

/* 모달 창 내용 */
.modal-content {
	position: relative;
	margin: auto;
	padding: 20px;
	max-width: 600px;
	background-color: white;
	border-radius: 8px;
}

/* 닫기 버튼 스타일 */
.close {
	position: absolute;
	top: 10px;
	right: 20px;
	color: #aaa;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
}

/* 이미지 스타일 */
.popup-image {
	width: 100%;
	height: auto;
	border-radius: 8px;
}

/* 메인 페이지에서 팝업을 여는 버튼 */
/*  .open-popup-btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        } */
</style>
<style>
h2 {
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
	background-color: #fff;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px #333;
}

th {
	background-color: #1e88e5;
	color: #fff;
}

.faq-title {
	cursor: pointer;
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
}

.faq-title:hover {
	text-decoration: underline;
}

.faq-answer {
	display: none;
	padding: 10px 20px;
	background-color: #f9f9f9;
	color: #555;
}

.footer-section ul li {
	margin-bottom: 10px;
}
</style>
<script>
	function toggleAnswer(faqId) {
		var answer = document.getElementById(faqId);
		if (answer.style.display === "none") {
			answer.style.display = "block";
		} else {
			answer.style.display = "none";
		}
	}
</script>

</head>
<body>
	<main>
<h1>&nbsp;&nbsp;</h1>
		<div class="container">
			<h2>FAQ 게시판</h2>

			<table>
				<thead>
					<tr>
						<th>No</th>
						<th>질문</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a class="faq-title" onclick="toggleAnswer('faq1')">회원가입은
								어떻게 하나요?</a></td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="faq1" class="faq-answer">회원가입은 상단 메뉴의 '회원가입' 버튼을
								클릭한 후, 필수 정보를 입력하고 가입 절차를 완료하시면 됩니다.</div>
						</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a class="faq-title" onclick="toggleAnswer('faq2')">비밀번호를
								잊어버렸습니다. 어떻게 해야 하나요?</a></td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="faq2" class="faq-answer">로그인 페이지에서 '비밀번호 찾기'를 클릭한
								후, 이메일 주소와 전화번호를 입력하시면 비밀번호 재설정 링크가 전송됩니다. 해당 링크를 통해 새로운 비밀번호를 설정하실 수
								있습니다.</div>
						</td>
					</tr>
					<tr>
						<td>3</td>
						<td><a class="faq-title" onclick="toggleAnswer('faq3')">주문
								내역은 어디서 확인할 수 있나요?</a></td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="faq3" class="faq-answer">로그인 후, 마이페이지에서 주문 내역을
								확인하실 수 있습니다. 주문 상태와 배송 정보를 실시간으로 확인하실 수 있습니다.</div>
						</td>
					</tr>




				</tbody>
			</table>
		</div>

	</main>
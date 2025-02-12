<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.BoardVo" %>  	
<%@page import="java.util.List"%>
<%
	List<BoardVo> eventList = (List<BoardVo>)request.getAttribute("eventList");
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
            background: rgba(255, 255, 255, 0.1);  /* 반투명한 배경 */
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

        .close:hover,
        .close:focus {
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
</head>
<body>
<main>

     <div class="event-container">
     
     
        <%
        if (eventList != null && !eventList.isEmpty()) {
            for (BoardVo event : eventList) {
                String imgLink = event.getBoard_img_link();
        %>
        <!-- 이벤트 제목 -->
        <h1 class="event-title"><%= event.getTitle() %></h1>
        
        <!-- 이미지가 있을 때만 이미지 출력 -->
        <%
                if (imgLink != null && !imgLink.trim().isEmpty()) {
        %>
            <img src="<%= imgLink %>" alt="이벤트 이미지" class="event-image">
        <%
                } else {
        %>
            <!-- 이미지가 없을 때 텍스트 출력 -->
            <p class="no-image">이미지가 없습니다.</p>
        <%
                }
        %>


        <!-- 이벤트 설명 -->
        <p class="event-description"><%= event.getContent() %></p>

        <%
            }
        } else {
        %>
        <p class="event-description">현재 등록된 이벤트가 없습니다.</p>
        <%
        }
        %>
    </div>


	<!-- <button class="open-popup-btn" onclick="openModal()">이미지 팝업 열기</button> -->

    <!-- 모달(팝업) -->
    <div id="imageModal" class="modal">
    	<%
            for (BoardVo event : eventList) {
                String imgLink = event.getBoard_img_link();
        %>
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <!-- 팝업 이미지 -->
            <img src="<%= imgLink %>" alt="팝업 이미지" class="popup-image">
        </div>
         <%
        	}
        %>
    </div>

    <!-- <script>
 		// 팝업 열기
    	function openModal() {
        document.getElementById("imageModal").style.display = "block";
    	}

        // 팝업 닫기
        function closeModal() {
            document.getElementById("imageModal").style.display = "none";
        }
    	 // 페이지 로드 시 팝업 자동 실행
        window.onload = function() {
            openModal(); // 페이지가 로드되면 팝업을 자동으로 열기
        };


        // 팝업 외부 클릭 시 닫기
        window.onclick = function(event) {
            const modal = document.getElementById("imageModal");
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
    </script> -->
	</main>

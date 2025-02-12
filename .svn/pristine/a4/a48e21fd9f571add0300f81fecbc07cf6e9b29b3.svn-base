<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
        /* 모달 스타일 */
        #imageModal {
            display: none; /* 처음에는 보이지 않음 */
            position: fixed;
            top: 0;
            left: 0;
            width:50%;
            height: 5s0%;
            background-color: rgba(0, 0, 0, 0.9); /* 배경을 어둡게 처리 */
            z-index: 1000; /* 모달이 다른 요소 위에 오도록 설정 */
        }

        .modal-content {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0;
        }

        .modal-content img {
            width: 100%;
            height: 100%;
           /*  object-fit: cover; */ /* 이미지가 전체를 덮도록 설정 */
        }

        .close-btn, .move-btn {
            position: absolute;
            bottom: 15px;
            left: 50%;
            transform: translateX(-50%);
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
            z-index: 1001;
        }
		.move-btn{
		padding: 1.5px 5px;
		}
        .close-btn:hover, .move-btn:hover {
            background-color: #0056b3;
        }

        .move-btn {
            left: calc(50% + 50px); /* 닫기 버튼 옆에 위치 */
        }

        /* 배경을 어둡게 하기 위한 오버레이 */
        #modalOverlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.1); /* 배경을 어둡게 */
            z-index: 999; /* 모달 배경이 다른 요소 위에 오도록 설정 */
        }
    </style>
<main>
		<section id="home" class="hero">
			<div class="hero-content">
				<h1>헬로월드에 오신 것을 환영합니다</h1>
				<p>상상이 현실이 되는 곳, 환상과 모험의 세계로 여러분을 초대합니다</p>
<!-- 				<a -->
<!-- 					href="file:///C:/Users/PC-01/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/helloworld.html#tickets" -->
<!-- 					class="btn">지금 예매하기</a> -->
			</div>
		</section>

		<!-- <section id="attractions">
			<div class="container">
				<h2>인기 어트랙션</h2>
				<div class="attractions-grid">
					<div class="attraction-card"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<img src="file:///C:/api/placeholder/400/300" alt="드래곤 플라이트">
						<div class="attraction-info">
							<h3>드래곤 플라이트</h3>
							<p>하늘을 나는 듯한 짜릿함! 최고 속도 120km/h의 롤러코스터</p>
						</div>
					</div>
					<div class="attraction-card"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<img src="file:///C:/api/placeholder/400/300" alt="미스터리 맨션">
						<div class="attraction-info">
							<h3>미스터리 맨션</h3>
							<p>호러와 스릴이 가득한 유령의 집에서 탈출할 수 있을까요?</p>
						</div>
					</div>
					<div class="attraction-card"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<img src="file:///C:/api/placeholder/400/300" alt="판타지 리버">
						<div class="attraction-info">
							<h3>판타지 리버</h3>
							<p>온 가족이 함께 즐기는 신나는 래프팅 어드벤처</p>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="tickets" class="tickets">
			<div class="container">
				<h2>티켓 예매</h2>
				<p>특별한 하루를 위한 티켓을 지금 예매하세요!</p>
				<div class="ticket-types">
					<div class="ticket-type"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<h3>종일권</h3>
						<p>성인 60,000원</p>
						<p>청소년 50,000원</p>
						<p>어린이 40,000원</p>
						<a
							href="file:///C:/Users/PC-01/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/helloworld.html#"
							class="btn">예매하기</a>
					</div>
					<div class="ticket-type"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<h3>야간권</h3>
						<p>성인 40,000원</p>
						<p>청소년 35,000원</p>
						<p>어린이 30,000원</p>
						<a
							href="file:///C:/Users/PC-01/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/helloworld.html#"
							class="btn">예매하기</a>
					</div>
					<div class="ticket-type"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<h3>시즌패스</h3>
						<p>성인 200,000원</p>
						<p>청소년 180,000원</p>
						<p>어린이 160,000원</p>
						<a
							href="file:///C:/Users/PC-01/Documents/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%86%A1%20%EB%B0%9B%EC%9D%80%20%ED%8C%8C%EC%9D%BC/helloworld.html#"
							class="btn">구매하기</a>
					</div>
				</div>
			</div>
		</section>

		<section id="events">
			<div class="container">
				<h2>특별 이벤트</h2>
				<div class="events-list">
					<div class="event-card"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<img src="file:///C:/api/placeholder/400/300" alt="여름 축제">
						<div class="event-info">
							<h3>썸머 판타지아</h3>
							<p>
								<i class="fa-regular fa-calendar-days"></i> 7월 1일 - 8월 31일
							</p>
							<p>시원한 물놀이와 함께하는 환상적인 여름 축제!</p>
						</div>
					</div>
					<div class="event-card"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<img src="file:///C:/api/placeholder/400/300" alt="할로윈 축제">
						<div class="event-info">
							<h3>호러 나이트</h3>
							<p>
								<i class="fa-regular fa-calendar-days"></i> 10월 1일 - 10월 31일
							</p>
							<p>으스스한 분위기 속에서 즐기는 특별한 할로윈 이벤트</p>
						</div>
					</div>
					<div class="event-card"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<img src="file:///C:/api/placeholder/400/300" alt="겨울 축제">
						<div class="event-info">
							<h3>윈터 원더랜드</h3>
							<p>
								<i class="fa-regular fa-calendar-days"></i> 12월 1일 - 2월 28일
							</p>
							<p>눈과 함께 즐기는 따뜻한 겨울 축제</p>
						</div>
					</div>
				</div>
			</div>
		</section> -->

		<section id="info">
			<div class="container">
				<h2>이용 안내</h2>
				<div class="info-grid">
					<div class="info-item"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<i class="fa-regular fa-clock"></i>
						<h3>운영 시간</h3>
						<p>
							매일 오전 10시 - 오후 10시<br>(계절별 변동 있음)
						</p>
					</div>
					<div class="info-item"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<i class="fa-solid fa-location-dot"></i>
						<h3>위치</h3>
						<p>대전광역시 중구 계룡로 846 123</p>
					</div>
					<div class="info-item"
						style="opacity: 0; transform: translateY(20px); transition: opacity 0.5s ease-out, transform 0.5s ease-out;">
						<i class="fas fa-phone-alt"></i>
						<h3>문의</h3>
						<p>
							전화: 031-123-4567<br>이메일: info@helloworld.com
						</p>
					</div>
				</div>
			</div>
			
			
			
			
		  <!-- 모달 오버레이 -->
    <div id="modalOverlay"></div>

    <!-- 모달 창 (팝업) -->
    <div id="imageModal">
        <div class="modal-content">
          <!--   <h2>모달 팝업</h2> -->
            <!-- 모달 창 내부에 이미지와 하이퍼링크 -->
            <a href="https://www.example.com" target="_blank">
                <img src="https://i.namu.wiki/i/nyvpArxql7TlmSuXS5_NeJ6lchrJcrJ_HlxOLDdHdrTE3lDpDqPAExro5zFxseaci7Wo9zUHLjL_lmg_YjddCw.webp" alt="이미지" class="event-image" alt="클릭하면 이동합니다">
            </a>

            <!-- 닫기 버튼 -->
            <button class="close-btn" onclick="closeModal()">닫기</button>

            <!-- 이동 버튼 -->
            <a href="event.do" target="_blank" class="move-btn">이동</a>
        </div>
    </div>

    <script>
        // 팝업 열기
        function openModal() {
            document.getElementById("imageModal").style.display = "block";
            document.getElementById("modalOverlay").style.display = "block"; // 배경 오버레이 보이기
        }

        // 팝업 닫기
        function closeModal() {
            document.getElementById("imageModal").style.display = "none";
            document.getElementById("modalOverlay").style.display = "none"; // 배경 오버레이 숨기기
        }

        // 페이지 로드 시 모달 자동 실행
        window.onload = function() {
            openModal(); // 페이지가 로드되면 팝업 자동으로 열기
        };

        // 팝업 외부 클릭 시 닫기
        window.onclick = function(event) {
            const modal = document.getElementById("imageModal");
            const overlay = document.getElementById("modalOverlay");
            if (event.target === overlay) {
                closeModal();
            }
        };
    </script>
	</main>
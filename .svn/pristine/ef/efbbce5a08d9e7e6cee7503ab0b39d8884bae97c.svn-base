<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.ddit.vo.PointVo" %>
<%@ page import="java.util.List" %>    

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
    border-radius: 10px;
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

/* 텍스트 버튼 디자인 */
.button-group {
    margin-bottom: 20px;
    display: flex;
    justify-content: flex-start; /* 왼쪽 정렬 */
}

.button-group .btn {
    background: none;
    border: none;
    font-size: 1.2rem;
    cursor: pointer;
    color: #999; /* 비활성화 상태는 회색 */
    padding: 0 10px;
    transition: color 0.3s ease;
}

.button-group .btn.active {
    color: #000; /* 활성화 상태는 검정색 */
}

.button-group .btn:hover {
    color: #333;
}

/* 페이지네이션 버튼 디자인 */
.pagination {
    text-align: center;
    margin-top: 30px; /* 상단 여백 */
    margin-bottom: 50px; /* 하단 여백 추가 */
}

.pagination .btn {
    font-size: 0.9rem;
    padding: 8px 15px;
    background-color: #f0f0f0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 0 5px;
    transition: background-color 0.3s ease;
}

.pagination .btn:hover {
    background-color: #e0e0e0;
}

/* 테이블 상단에 버튼 위치 */
.table-container {
    position: relative;
    margin-top: 20px;
}

.table-container .button-group {
    position: absolute;
    top: -50px; /* 테이블 상단에 버튼 위치 */
    left: 0;
}

.table-container .pagination {
    position: relative;
    bottom: -20px;
    left: 50%;
    transform: translateX(-50%);
}

@media (max-width: 768px) {
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
</style>

<main>
    <section class="section">
        <div class="content">
            <div class="form-container">
                <h2 style="text-align: center;">포인트 현황</h2>
                <hr>

                <!-- Point Selection Buttons -->
                <div class="table-container">
                    <div class="button-group">
                        <button class="btn active" onclick="selectPoint('all')">전체</button>
                        <button class="btn" onclick="selectPoint('used')">사용</button>
                        <button class="btn" onclick="selectPoint('unused')">미사용</button>
                    </div>

                    <!-- 포인트 내역 테이블 -->
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>상태</th>
                                <th>포인트</th>
                                <th>내용</th>
                                <th>적용일자</th>
                            </tr>
                        </thead>
                        <tbody>
						<%
						    List<PointVo> pointList = (List<PointVo>) request.getAttribute("pointList");
						    if (pointList != null && !pointList.isEmpty()) {
						        for (PointVo point : pointList) {
						%>
						<tr>
						    <td>
						        <%
						            String pointState = point.getPoint_state();
						            if ("1".equals(pointState)) {
						                out.print("사용");
						            } else if ("2".equals(pointState)) {
						                out.print("미사용");
						            } else {
						                out.print("알 수 없음"); // 추가적인 상태가 있을 경우 대비
						            }
						        %>
						    </td>
						    <td><%= point.getPoint_value() %></td> 
						    <td><%= point.getPoint_content() %></td>
						    <td><%= point.getPoint_date() %></td> 
						</tr>
						<%
						        }
						    } else {
						%>
						<tr>
						    <td colspan="4" style="text-align: center;">포인트 내역이 없습니다.</td>
						</tr>
						<%
						    }
						%>



                        </tbody>
                    </table>

                    <!-- Pagination Buttons -->
                    <div class="pagination">
                        <button class="btn" onclick="changePage('prev')">이전 페이지</button>
                        <button class="btn" onclick="changePage('next')">다음 페이지</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function selectPoint(type) {
                const buttons = document.querySelectorAll('.button-group .btn');
                buttons.forEach(button => {
                    button.classList.remove('active');  // 모든 버튼 비활성화
                });

                if (type === 'all') {
                    buttons[0].classList.add('active');  // 전체 버튼 활성화
                } else if (type === 'used') {
                    buttons[1].classList.add('active');  // 사용 버튼 활성화
                } else if (type === 'unused') {
                    buttons[2].classList.add('active');  // 미사용 버튼 활성화
                }

                // 포인트 필터에 따라 데이터를 서버에 요청하는 AJAX 로직 추가 (선택 사항)
                // 예: location.href = "/mypage/pointList?filter=" + type;
            }

            function changePage(direction) {
                if (direction === 'prev') {
                    // 이전 페이지로 이동
                    console.log('이전 페이지');
                } else if (direction === 'next') {
                    // 다음 페이지로 이동
                    console.log('다음 페이지');
                }

                // 페이지 이동을 위한 AJAX 로직 추가 (선택 사항)
                // 예: location.href = "/mypage/pointList?page=" + (현재 페이지 번호 ± 1);
            }
        </script>            
    </section>
</main>

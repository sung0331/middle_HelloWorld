<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%
        CustomerVo user = (CustomerVo)session.getAttribute("user");
    %> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용안내 - 헬로월드 테마파크</title>
    <!--     스타일 영역 -->
    <%@include file="./include/style.css"%>
    <%@include file="./include/infopage.css"%>
    <!-- Custom fonts for this template-->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
</head>
<body>
    <%@include file="./include/top.jsp"%>
<%@include file="./include/style.css"%>

    <main>
<!--         <section class="section"> -->
<!--             <div class="container"> -->
<!--                 <h1>이용안내</h1> -->
<!--                 <div class="info-grid"> -->
<!--                     <div class="info-item"> -->
<!--                         <h3>운영 시간</h3> -->
<!--                         <table> -->
<!--                             <tr> -->
<!--                                 <th>구분</th> -->
<!--                                 <th>평일</th> -->
<!--                                 <th>주말/공휴일</th> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>3월 ~ 10월</td> -->
<!--                                 <td>10:00 - 22:00</td> -->
<!--                                 <td>09:00 - 23:00</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>11월 ~ 2월</td> -->
<!--                                 <td>10:00 - 21:00</td> -->
<!--                                 <td>10:00 - 22:00</td> -->
<!--                             </tr> -->
<!--                         </table> -->
<!--                         <p class="note">※ 계절 및 특별 이벤트에 따라 변동될 수 있습니다.</p> -->
<!--                     </div> -->
<!--                     <div class="info-item"> -->
<!--                         <h3>위치 및 교통</h3> -->
<!--                         <p>주소: 경기도 용인시 헬로월드로 123</p> -->
<!--                         <table> -->
<!--                             <tr> -->
<!--                                 <th>교통수단</th> -->
<!--                                 <th>소요시간</th> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>서울역에서 직통버스</td> -->
<!--                                 <td>약 1시간</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>강남역에서 셔틀버스</td> -->
<!--                                 <td>약 45분</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>용인역에서 무료 셔틀</td> -->
<!--                                 <td>약 15분</td> -->
<!--                             </tr> -->
<!--                         </table> -->
<!--                     </div> -->
<!--                     <div class="info-item"> -->
<!--                         <h3>문의</h3> -->
<!--                         <table> -->
<!--                             <tr> -->
<!--                                 <th>구분</th> -->
<!--                                 <th>연락처</th> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>대표전화</td> -->
<!--                                 <td>031-123-4567</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>단체예약</td> -->
<!--                                 <td>031-123-4568</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>고객센터</td> -->
<!--                                 <td>1588-1234</td> -->
<!--                             </tr> -->
<!--                             <tr> -->
<!--                                 <td>이메일</td> -->
<!--                                 <td>info@helloworld.com</td> -->
<!--                             </tr> -->
<!--                         </table> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </section> -->

        <section class="section">
            <div class="container">
                <h2>주요 어트랙션</h2>
                <table>
                    <tr>
                        <th>이미지</th>
                        <th>어트랙션</th>
                        <th>설명</th>
                        <th>요금(원)</th>
                        <th>제한사항</th>
                    </tr>
                    <tr>
                        <td><img src="<c:url value='https://adventure.lotteworld.com/image/2023/12/202312060539450770_1350.jpg'/>" alt="카트라이더 레이싱월드" class="attraction-image"></td>
                        <td>카트라이더 레이싱월드</td>
                        <td>게임 속에서만 즐기던 카트라이더를 이젠 헬로월드에서 직접 타면서 즐겨보세요!</td>
                        <td>성인 15,000<br>청소년 13,000<br>어린이 10,000</td>
                        <td>신장 120cm 이상</td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value='https://adventure.lotteworld.com/image/2020/6/202006010125571450_1350.jpg'/>" alt="자이로드롭" class="attraction-image"></td>
                        <td>자이로드롭</td>
                        <td>구름이 맞닿을 듯한 높이까지 올라갔다 한 순간에 떨어지는 스릴만점 어트랙션입니다.</td>
                        <td>성인 12,000<br>청소년 10,000<br>어린이 8,000</td>
                        <td>신장 140cm 이상<br>임산부 탑승 불가</td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value='https://adventure.lotteworld.com/image/2018/6/20180608080208814_1350.jpg'/>" alt="자이로스윙" class="attraction-image"></td>
                        <td>자이로스윙</td>
                        <td>40여명이 둘러앉은 거대한 회전기구가 시계추처럼 움직여 회오리바람에 날려가 버리는 듯한 새로운 공포를 느낄 수 있습니다.</td>
                        <td>성인 13,000<br>청소년 11,000<br>어린이 9,000</td>
                        <td>신장 135cm 이상<br>심장질환자 탑승 불가</td>
                    </tr>
                    <tr>
                        <td><img src="<c:url value='https://adventure.lotteworld.com/image/2021/4/202104230354000520_1350.jpg'/>" alt="혜성특급" class="attraction-image"></td>
                        <td>혜성특급</td>
                        <td>좌우로 회전하는 롤러코스터를 타고 떠나는 어둠 속 스펙터클 우주여행</td>
                        <td>성인 14,000<br>청소년 12,000<br>어린이 10,000</td>
                        <td>신장 130cm 이상<br>노약자 탑승 주의</td>
                    </tr>
                </table>
                <p class="note">※ 모든 어트랙션은 기상 상황 및 점검 일정에 따라 운영이 중단될 수 있습니다.</p>
            </div>
        </section>

        <section class="section">
            <div class="container">
                <h2>입장권 요금</h2>
                <table>
                    <tr>
                        <th>구분</th>
                        <th>성인</th>
                        <th>청소년</th>
                        <th>어린이</th>
                        <th>비고</th>
                    </tr>
                    <tr>
                        <td>종일권</td>
                        <td>62,000원</td>
                        <td>54,000원</td>
                        <td>47,000원</td>
                        <td>모든 어트랙션 무제한 이용</td>
                    </tr>
                    <tr>
                        <td>반일권</td>
                        <td>50,000원</td>
                        <td>43,000원</td>
                        <td>36,000원</td>
                        <td>오후 2시 이후 입장<br>일부 어트랙션 제외</td>
                    </tr>
                </table>
                <p class="note">
                    ※ 성인: 만 19세 이상, 청소년: 만 13세 ~ 18세, 어린이: 36개월 ~ 만 12세<br>
                    ※ 65세 이상 노인, 장애인, 국가유공자는 50% 할인<br>
                    ※ 36개월 미만 영아 무료입장 (증빙서류 지참)
                </p>
            </div>
        </section>
    </main>
    
    <div class="box"></div>

    <%@include file="./include/bottom.jsp"%>

    <script>
        // Header background change on scroll
        window.addEventListener('scroll', function () {
            const header = document.querySelector('header');
            if (window.scrollY > 50) {
                header.style.boxShadow = '0 2px 5px rgba(0,0,0,0.1)';
            } else {
                header.style.boxShadow = 'none';
            }
        });

        // Animate elements on scroll
        function isElementInViewport(el) {
            const rect = el.getBoundingClientRect();
            return (
                rect.top >= 0 &&
                rect.left >= 0 &&
                rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
                rect.right <= (window.innerWidth || document.documentElement.clientWidth)
            );
        }

        function handleScrollAnimation() {
            const elements = document.querySelectorAll('.attraction-card, .ticket-type, .event-card, .info-item');
            elements.forEach(el => {
                if (isElementInViewport(el)) {
                    el.style.opacity = '1';
                    el.style.transform = 'translateY(0)';
                }
            });
        }

        window.addEventListener('scroll', handleScrollAnimation);

        // Initialize animation styles
        document.querySelectorAll('.attraction-card, .ticket-type, .event-card, .info-item').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(20px)';
            el.style.transition = 'opacity 0.5s ease-out, transform 0.5s ease-out';
        });    
    </script>
</body>
</html>
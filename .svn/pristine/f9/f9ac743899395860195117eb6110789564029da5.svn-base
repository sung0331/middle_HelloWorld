<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="kr.or.ddit.vo.RideVo" %>  

<%
    // Controller에서 전달된 'selectedRide'를 받아 상세 정보로 표시
    RideVo selectedRide = (RideVo) request.getAttribute("selectedRide");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>놀이기구 상세 설명</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background-color: #fff;
            text-align: center;
            padding: 50px 20px;
        }
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .header p {
            font-size: 1.2em;
            color: #666;
        }
        .main-image {
            width: 100%;
            height: 400px;
            text-align: center;
            margin-bottom: 20px;
        }
        .main-image img {
            max-width: 100%;
            height: auto;
        }
        .main-content {
            padding: 20px;
            text-align: center;
        }
        .main-content p {
            font-size: 1.2em;
        }
         .info-section {
        text-align: center; /* 텍스트를 수평 가운데 정렬 */
    }
        
    </style>
</head>
<body>

    <!-- 상단 영역 -->
    <div class="header">
        <h1>${selectedRide.ride_name}</h1>
        <p>${selectedRide.ride_comment}</p>
    </div>

    <!-- 주요 이미지 -->
    <div class="main-image">
        <img src="${selectedRide.ride_img}" alt="${selectedRide.ride_name} 이미지">
    </div>

    <!-- 놀이기구 상세 정보 -->
    <div class="main-content">
    	<br><br>
        <p><strong>탑승 가능 인원:</strong> ${selectedRide.oper_people}명</p>
        <p><strong>놀이기구 설명:</strong> ${selectedRide.ride_comment}</p>
    </div>
	<!-- 하단 정보 영역 -->
    <div class="info-section">
        <h3>※ 운영안내</h3>
        <ul>
            <div>운영기간: 7월 12일(금) ~ 11월 17일(일)</div>
            <div>운영시간: 09:00 ~ 21:00</div>
            <div>Break Time: 14:40 ~ 17:00</div>
        </ul>

        <h3>※ 이용안내</h3>
        <ul>
            <div>만 13세 이상부터 이용 가능</div>
            <div>입장 전 나이 확인을 위한 신분증을 요청할 수 있음</div>
            <div>노약자 및 임산부, 음주자 등은 이용이 불가능합니다.</div>
        </ul>

        <h3>※ 티켓안내</h3>
        <ul>
            <div>별도 이용요금이 적용됩니다.</div>
            <div>입장 후 티켓 환불은 불가합니다.</div>
        </ul>
    </div>

    <!-- 하단 영역 -->
    <div class="footer">
        <p>© 2024 놀이공원. All Rights Reserved.</p>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="kr.or.ddit.vo.RideVo" %>  
<%@page import="java.util.List"%>

<%
    // Controller에서 넘어온 'rideList'라는 attribute를 리스트로 받음
    List<RideVo> rideList = (List<RideVo>) request.getAttribute("rideList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>놀이기구 목록 페이지</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            display: flex;
            flex-wrap: wrap; /* 항목을 여러 줄로 나눠 배치 */
            justify-content: space-between; /* 항목들 사이를 균등하게 분배 */
            padding: 100px;
        }
        .ride-container {
            width: 30%; /* 각 항목이 한 줄에 3개씩 들어가도록 설정 */
            margin-bottom: 50px;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .ride-container h2 {
            font-size: 1.5em;
        }
        .ride-container img {
            max-width: 100%;
            /* height: auto; */
         	width: 600px;
            height:60%;
            object-fit:fill	;
            
        }
        .ride-container a {
            display: block;
            margin-top: 50px;
            margin-bottom: 200px;
            text-decoration: none;
            color: #007bff;
        }
        .ride-container a:hover {
            text-decoration: underline;
        }
        .image-container {
            width: 100%; /* 부모 컨테이너 크기를 100% */
/*             padding-top: 100%; /* 정사각형을 유지하기 위해 패딩 설정 */ */
            
            position: relative; /* 자식 요소를 절대 배치하기 위한 relative */
        }
         .image-container img {
            position: absolute;
            top: 0;
            left: 0;

            object-fit: cover; /* 이미지 비율을 유지하면서 크기에 맞게 잘림 */
            border-radius: 10px; /* 이미지의 모서리를 둥글게 처리 */
        }
    </style>
</head>
<body>

    <div class="container">
        <c:forEach var="ride" items="${rideList}">
            <div class="ride-container">
                <h2>${ride.ride_name}</h2>
                <img src="${ride.ride_img}" alt="${ride.ride_name}">
                <a href="detailRide.do?rideName=${ride.ride_name}">상세보기</a>
                <!-- 놀이기구 이름을 클릭하면 rideName을 URL로 전달 -->
            </div>
        </c:forEach>
    </div>

</body>
</html>

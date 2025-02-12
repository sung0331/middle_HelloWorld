<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="kr.or.ddit.vo.GradeVo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <style>
/*         body { */
/*             font-family: 'Noto Sans KR', sans-serif; */
/*             margin: 0; */
/*             padding: 20px; */
/*             background-color: #f9f9f9; */
/*         } */
/*         .container { */
/*             max-width: 500px; */
/*             margin: 0 auto; */
/*             background-color: #fff; */
/*             border: 1px solid #e0e0e0; */
/*             border-radius: 8px; */
/*             padding: 20px; */
/*         } */
        h1 {
            font-size: 18px;
            color: #333;
            margin-bottom: 15px;
        }
        .user-info {
            display: flex;
 			align-items: center;
        	justify-content: center;
            padding: 10px;
            background-color: #f5f5f5;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .user-avatar {
            width: 40px;
            height: 40px;
            background-color: #1a73e8;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-right: 10px;
            color: white;
            font-size: 24px;
        }
        .user-grade {
            font-size: 16px;
        }
        .actions {
            display: flex;
            justify-content: space-between;
            border-top: 1px solid #e0e0e0;
            padding-top: 15px;
            justify-content: center;
            
        }
        .action-item {
            text-align: center;
            flex: 1;
            text-decoration: none;
        }
        .action-icon {
            font-size: 24px;
            color: #5f6368;
            margin-bottom: 5px;
        }
        .action-text {
            font-size: 12px;
            color: #5f6368;
        }
    </style>


<main>

<div class="container">
    
    <div class="welcome-message" style="text-align: center;">
        <h2>   </h2>
        <h2>환영합니다,  ${userName}님!</h2>
        <h4>마이페이지에서 다양한 서비스를 이용해보세요.</h4>
<!--         <p>마이페이지에서 다양한 서비스를 이용해보세요.</p> -->
    </div><br> <br>
    <div class="actions">
        <a class="action-item" href="mypageEditProfile.do">
            <div class="action-icon">✏️</div>
            <div class="action-text">개인 정보 수정</div>
        </a>
        <a class="action-item" href="mypageOrders.do">
            <div class="action-icon">📦</div>
            <div class="action-text">주문 내역 확인</div>
        </a>
        <a class="action-item" href="mypageMembership.do">
            <div class="action-icon">❤️</div>
            <div class="action-text">내 등급</div>
        </a>
        <a class="action-item" href="mypagePoints.do">
            <div class="action-icon">⭐</div>
            <div class="action-text">내 포인트</div>
        </a>
        <a class="action-item" href="mypageReviews.do">
            <div class="action-icon">📝</div>
            <div class="action-text">내가 쓴 리뷰</div>
        </a>
    </div>
</div>


</main>




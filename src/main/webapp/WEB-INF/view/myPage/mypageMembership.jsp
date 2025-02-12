<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.GradeVo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
    /* 추가된 CSS 코드 */
    :root {
        --primary-color: #007bff;
        --secondary-color: #6c757d;
        --background-color: #f9f9f9;
        --accent-color: #FFD700;
    }

    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: var(--background-color);
        margin: 0;
        padding: 0;
    }

    .AAAA {
        max-width: 800px;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    }

    h2 {
        text-align: center;
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 20px;
        position: relative;
    }

    h2::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 60px;
        height: 4px;
        background-color: var(--accent-color);
        border-radius: 2px;
    }

    .welcome-message {
        text-align: center;
        margin-bottom: 30px;
    }

    .welcome-message h3 {
        font-size: 1.8rem;
        color: var(--secondary-color);
    }

    .user-info {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 15px;
        background-color: #f1f1f1;
        padding: 15px;
        border-radius: 10px;
        margin-bottom: 30px;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    }

    .user-avatar {
        font-size: 3rem;
        color: var(--primary-color);
    }

    .user-grade {
        font-size: 1.5rem;
        color: var(--secondary-color);
    }

    .actions {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }

    .action-item {
        text-align: center;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #e0e0e0;
        border-radius: 10px;
        width: 160px;
        transition: transform 0.3s, box-shadow 0.3s;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .action-item:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
    }

    .action-icon {
        font-size: 2.5rem;
        margin-bottom: 10px;
        color: var(--accent-color);
    }

    .action-text {
        font-size: 1rem;
        font-weight: bold;
        color: var(--secondary-color);
    }

</style>

<!-- 메인 콘텐츠 (회원 정보 및 등급) -->
<main>
    <div class="AAAA">
        <h2>나의 등급</h2>
        <div class="welcome-message">
            <h3>환영합니다, ${userName}님!</h3>
        </div>
        <div class="user-info">
            <div class="user-avatar">&#128100;</div>
            <div class="user-grade">${userName}님의 등급은 <strong>${gradeName}</strong>입니다.</div>
        </div>
        <div class="actions">
            <div class="action-item">
                <div class="action-icon"><i class="fas fa-star"></i></div>
                <div class="action-text">상품 혜택보기</div>
            </div>
            <div class="action-item">
                <div class="action-icon"><i class="fas fa-ticket-alt"></i></div>
                <div class="action-text">티켓 혜택보기</div>
            </div>
            <div class="action-item">
                <div class="action-icon"><i class="fas fa-info-circle"></i></div>
                <div class="action-text">등급별 이용안내</div>
            </div>
        </div>
    </div>
</main>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

 
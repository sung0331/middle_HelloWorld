<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - 헬로월드 테마파크</title>
    
    <!-- 스타일 영역 -->
    <%@include file="./include/login.css"%>
    
    <!-- Custom fonts for this template-->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    
    <style>
        .forgot-links {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .forgot-links a {
            color: #1e88e5;
            text-decoration: none;
            font-size: 14px;
        }
        .forgot-links a:hover {
            text-decoration: underline;
        }
        .social-login {
            margin-top: 20px;
        }
        .social-btn {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .kakao-btn {
            background-color: #FEE500;
            color: #000;
        }
        .signup-link {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- 헤더영역 -->
    <%@include file="./include/logintop.jsp"%>
    
    <!-- 메인 콘텐츠 영역 -->
    <div class="content">
        <div class="login-container">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <form class="login-form" id="loginForm" action="<c:url value='/login.do'/>" method="post">
                        <h2>로그인</h2>
                        <c:if test="${not empty error}">
                            <div class="error-message" role="alert">
                                ${error}
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="username">아이디</label>
                            <input type="text" id="username" name="username" required autocomplete="username">
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" id="password" name="password" required autocomplete="current-password">
                        </div>
                        <button type="submit" class="btn">로그인</button>
                        <div class="forgot-links">
                            <a href="<c:url value='/findid.do'/>">아이디를 잊으셨나요?</a>
                            <a href="<c:url value='/resetPassword.do'/>">비밀번호를 잊으셨나요?</a>
                        </div>
<!--                         <div class="social-login"> -->
<!--                             <button type="button" class="social-btn kakao-btn" onclick="kakaoLogin()" aria-label="카카오 로그인"> -->
<!--                                 <i class="fas fa-comment"></i> 카카오 로그인 -->
<!--                             </button> -->
<!--                         </div> -->
                        <div class="signup-link">
                            <p>계정이 없으신가요? <a href="<c:url value='/signup.do'/>">회원가입</a></p>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <div class="welcome-message">
                        <h2>${sessionScope.Cust_Name}님, 환영합니다!</h2>
                        <p>이미 로그인되어 있습니다.</p>
                        <button class="btn" onclick="location.href='<c:url value="/logout.do"/>'">로그아웃</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- 스크립트 영역 -->
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

        // 소셜 로그인 함수 (실제 구현 필요)
        function kakaoLogin() {
            alert('카카오 로그인 기능은 아직 구현되지 않았습니다.');
        }
    </script>
</body>
</html>
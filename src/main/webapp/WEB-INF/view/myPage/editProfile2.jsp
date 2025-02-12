<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정/탈퇴</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/noto-sans-kr.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1e88e5;
            --secondary-color: #ffc107;
            --text-color: #333;
            --light-bg: #f4f4f4;
            --header-height: 60px;
            --naver-color: #03C75A;
            --kakao-color: #FEE500;
        }

        body, html {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-color);
            line-height: 1.6;
            height: 100%;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            margin-top: var(--header-height); /* 헤더가 고정된 상태에서 본문이 가려지지 않도록 여백 추가 */
        }

        header {
            background-color: var(--primary-color);
            color: white;
            padding: 0.5rem 0;
            position: fixed;
            width: 100%;
            z-index: 1000;
            height: var(--header-height);
            display: flex;
            align-items: center;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 40px;
            margin-right: 10px;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - var(--header-height));
            background-image: url('/api/placeholder/1200/800');
            background-size: cover;
            background-position: center;
        }

        .login-form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        .login-form h2 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary-color);
        }

        .btn {
            display: inline-block;
            background-color: var(--primary-color);
            color: white;
            padding: 0.75rem 1.5rem;
            text-decoration: none;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom: 1rem;
        }

        .btn:hover {
            background-color: #1565c0;
        }

        .forgot-password {
            text-align: right;
            margin-top: 1rem;
        }

        .forgot-password a {
            color: var(--primary-color);
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .social-login {
            margin-top: 1rem;
        }

        .social-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 0.75rem;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 0.5rem;
        }

        .social-btn svg {
            margin-right: 10px;
            width: 20px;
            height: 20px;
        }

        .naver-btn {
            background-color: var(--naver-color);
            color: white;
        }

        .naver-btn:hover {
            background-color: #02a54b;
        }

        .kakao-btn {
            background-color: var(--kakao-color);
            color: #3c1e1e;
        }

        .kakao-btn:hover {
            background-color: #e6cf00;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 1rem;
        }

        .signup-link {
            text-align: center;
            margin-top: 1rem;
        }

        .signup-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<body>

    <div class="form-container">
        <!-- Prepopulate form fields with data from the request -->
        <form action="updateProfile" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
            </div>
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}" readonly>
            </div>
            <div class="form-group">
                <label for="currentPassword">현재 비밀번호</label>
                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">새 비밀번호</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword">
            </div>
            <div class="form-group">
                <label for="confirmNewPassword">새 비밀번호 확인</label>
                <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword">
            </div>
              <div class="form-group">
                <label for="address">주소</label>
                <input type="text" class="form-control" id="address" name="address" value="${user.address1}">
            </div>
            <div class="form-group">
                <label for="address">상세 주소</label>
                <input type="text" class="form-control" id="address" name="address" value="${user.address2}">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
            </div>
            <div class="button-container">
                <button type="submit" class="btn btn-primary">수정</button>
                <button type="button" class="btn btn-danger">탈퇴</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 및 재설정</title>
    <style>
        body, html {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h1 {
            color: #1e88e5;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn {
            background-color: #1e88e5;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #1565c0;
        }
        .link {
            color: #1e88e5;
            text-decoration: none;
        }
        .link:hover {
            text-decoration: underline;
        }
        .error-message {
            color: red;
            margin-top: 5px;
        }
        .password-requirements {
            font-size: 0.9em;
            color: #666;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>비밀번호 찾기 및 재설정</h1>
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>
        <form action="<c:url value='/resetPassword.do'/>" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">아이디</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <input type="text" id="phone" name="phone" placeholder="000-0000-0000" required>
            </div>
            <div class="form-group">
                <label for="newPassword">새 비밀번호</label>
                <input type="password" id="newPassword" name="newPassword" required>
                <p class="password-requirements">비밀번호는 최소 8자리 이상이어야 합니다.</p>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div class="btn-container">
                <button type="submit" class="btn">비밀번호 재설정</button>
                <a href="<c:url value='/login.do'/>" class="link">로그인 페이지로 돌아가기</a>
            </div>
        </form>
    </div>

    <script>
    function validateForm() {
        var newPassword = document.getElementById('newPassword').value;
        var confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword.length < 8) {
            alert('비밀번호는 최소 8자리 이상이어야 합니다.');
            return false;
        }

        if (newPassword !== confirmPassword) {
            alert('새 비밀번호와 확인 비밀번호가 일치하지 않습니다.');
            return false;
        }

        return true;
    }
    </script>
</body>
</html>
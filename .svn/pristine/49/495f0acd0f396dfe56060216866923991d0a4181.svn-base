<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
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
            text-align: center;
        }
        h1 {
            color: #1e88e5;
            margin-bottom: 30px;
        }
        p {
            margin-bottom: 20px;
            font-size: 18px;
        }
        .btn {
            background-color: #1e88e5;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            margin: 10px;
        }
        .btn:hover {
            background-color: #1565c0;
        }
        .error-message {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>아이디 찾기 결과</h1>
        <c:if test="${not empty foundId}">
            <p>찾은 아이디: <strong id="foundId">${foundId}</strong></p>
            <a href="<c:url value='/login.do'/>" class="btn">로그인하기</a>
            <a href="<c:url value='/resetPassword.do'/>" class="btn">비밀번호 재설정</a>
        </c:if>
        <c:if test="${empty foundId}">
            <p class="error-message">일치하는 사용자 정보를 찾을 수 없습니다.</p>
            <a href="<c:url value='/findid.do'/>" class="btn">다시 시도하기</a>
        </c:if>
    </div>
</body>
</html>
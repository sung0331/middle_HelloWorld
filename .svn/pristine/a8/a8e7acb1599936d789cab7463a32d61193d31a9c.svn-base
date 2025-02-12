<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 성공</title>
    <%@include file="./include/signup.css"%>
    <style>
        .success-message {
            text-align: center;
            margin-top: 50px;
        }
        .success-message h2 {
            color: #4CAF50;
        }
        .success-message p {
            margin-top: 20px;
        }
        .success-message a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="success-message">
        <h2>회원가입이 완료되었습니다!</h2>
        <p>환영합니다. 이제 로그인하여 서비스를 이용하실 수 있습니다.</p>
        <a href="<c:url value='/login.do'/>">로그인 페이지로 이동</a>
    </div>
    
    <script>
        setTimeout(function() {
            window.location.href = "<c:url value='/login.do'/>";
        }, 5000);  // 5초 후 자동으로 로그인 페이지로 이동
    </script>
</body>
</html>
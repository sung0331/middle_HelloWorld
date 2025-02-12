<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 - 헬로월드 테마파크</title>
    <!-- 스타일 영역 -->
    <%@include file="./include/style.css"%>
    <%@include file="./include/findid.css"%>
    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
</head>
<body>
    <main>
        <div class="container">
            <h1>아이디 찾기</h1>
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>
            <form action="<c:url value='/findid.do'/>" method="post">
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">이메일 주소</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">전화번호</label>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000" required>
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn">아이디 찾기</button>
                    <a href="<c:url value='/resetPassword.do'/>" class="btn">비밀번호 찾기</a>
                </div>
            </form>
            <a href="<c:url value='/login.do'/>" class="link">로그인 페이지로 돌아가기</a>
        </div>
    </main>
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
    </script>
</body>
</html>
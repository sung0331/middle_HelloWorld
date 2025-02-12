<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="kr.or.ddit.vo.CustomerVo" %>
<%@ page import="java.util.List" %>  

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정 및 탈퇴</title>

    <style>
        /* form-container 스타일 */
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
            
        }

        /* form-group 스타일 */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .form-control:focus {
            outline: none;
            border-color: #007bff;
        }

        /* 버튼 스타일 */
        .button-container {
            text-align: center;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .alert-success {
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- 메인 콘텐츠 (회원정보 수정 폼) -->
    <div class="form-container">
        <h2>회원 정보 수정/탈퇴</h2>
<!-- 서버에서 updateMessage가 있을 경우 성공 메시지 표시 -->
<c:choose>
    <c:when test="${not empty updateMessage}">
        <!-- 성공 메시지 표시 -->
		<div class="alert alert-success" role="alert">
		    <h3>회원정보가 성공적으로 수정되었습니다.</h3>
		    <!-- 메인페이지로 이동하는 버튼 스타일의 링크 -->
		    <a class="btn btn-primary" href="index.do">메인페이지로 이동</a>
<!-- 		    <a class="btn btn-primary" href="login.do">메인페이지로 이동</a> -->
		</div>

    </c:when>
    <c:otherwise>
        <!-- 회원 정보 수정 폼 -->
        <div class="form-container">
            <!-- <h2>회원 정보 수정</h2> -->

            <form id="editProfileForm" action="mypageEditProfile.do" method="post">
                <input type="hidden" name="userNo" value="${user.cust_no}">
                <input type="hidden" name="action" value="editProfile">

                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" id="name" name="name" value="${user.cust_name}" required>
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
                    <label for="address1">주소</label>
                    <input type="text" class="form-control" id="address2" name="address1" value="${user.cust_address1}">
                </div>
                <div class="form-group">
                    <label for="address2">상세주소</label>
                    <input type="text" class="form-control" id="address2" name="address2" value="${user.cust_address2}">
                </div>
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" value="${user.cust_mail}" required>
                </div>
                <div class="button-container">
                    <button type="submit" class="btn btn-primary">수정</button>
                    <button type="button" class="btn btn-danger" onclick="deleteAccount()">탈퇴</button>
                </div>
            </form>
        </div>
    </c:otherwise>
</c:choose>

    </div>

    <script>
    // 회원 정보 수정 시 메시지 표시
    function showUpdateMessage(event) {
        event.preventDefault(); // 기본 폼 제출 동작 방지
        const form = document.getElementById("editProfileForm");

        alert("회원정보가 성공적으로 수정되었습니다.");
        form.submit();
    }

 // 회원 탈퇴 시 확인 후 탈퇴 처리
    function deleteAccount() {
        if (confirm("정말로 탈퇴하시겠습니까?")) {
            const form = document.createElement('form');
            form.action = "mypageEditProfile.do";
            form.method = "post";

            const userNoInput = document.createElement('input');
            userNoInput.type = "hidden";
            userNoInput.name = "userNo";
            userNoInput.value = "${user.cust_no}";  // 이 부분이 제대로 렌더링되는지 확인 필요
            form.appendChild(userNoInput);

            const actionInput = document.createElement('input');
            actionInput.type = "hidden";
            actionInput.name = "action";
            actionInput.value = "deleteAccount";
            form.appendChild(actionInput);

            document.body.appendChild(form);
            
            // 폼이 성공적으로 제출된 후 리다이렉션
            form.submit();
        }
    }

    </script>


</body>
</html>
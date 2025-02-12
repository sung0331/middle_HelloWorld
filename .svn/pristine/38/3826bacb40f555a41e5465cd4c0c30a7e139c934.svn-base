<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정/탈퇴</title>
    <!-- 스타일 및 외부 리소스 링크 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
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

</style>
</head>
<body>

    <!-- 메인 콘텐츠 (회원정보 수정 폼) -->
    <div class="form-container">
    
     <c:if test="${not empty updateMessage}">
        <div class="alert alert-info">
            ${updateMessage}
        </div>
    </c:if>
    
    <!-- 회원정보 수정 및 탈퇴 폼 -->
    <form id="editProfileForm" action="empInformation.do" method="post">
        <input type="hidden" name="userNo" value="${user.cust_no}">
        <input type="hidden" name="action" value="editProfile">
        
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" class="form-control" id="name" name="name" value="${user.cust_name}" required>
        </div>
        <div class="form-group">
            <label for="userId">아이디</label>
            <input type="text" class="form-control" id="userId" name="userId" value="${user.cust_id}" required readonly>
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
            <label for="email">이메일</label>
            <input type="email" class="form-control" id="email" name="email" value="${user.cust_mail}" required>
        </div>
        <div class="form-group">
            <label for="address">주소</label>
            <input type="text" class="form-control" id="address" name="address" value="${user.cust_address2}">
        </div>
        <div class="form-group">
            <label for="address">상세주소</label>
            <input type="text" class="form-control" id="address" name="address" value="${user.cust_address2}">
        </div>
        <div class="button-container">
                <button type="submit" class="btn btn-primary" onclick="showUpdateMessage(event)">수정</button>
                <button type="button" class="btn btn-danger" onclick="deleteAccount()">탈퇴</button>
            </div>
        </form>
</div>

<script>
// 회원 정보 수정 시 메시지 표시
function showUpdateMessage(event) {
    event.preventDefault(); // 기본 폼 제출 동작 방지
    const form = document.getElementById("editProfileForm").submit();
    alert("회원정보가 성공적으로 수정되었습니다.");
}

//회원 탈퇴 시 확인 후 탈퇴 처리
function deleteAccount() {
    if (confirm("정말로 탈퇴하시겠습니까?")) {
        const form = document.getElementById("editProfileForm");
        const actionInput = document.createElement('input');
        actionInput.type = "hidden";
        actionInput.name = "action";
        actionInput.value = "deleteAccount";
        form.appendChild(actionInput);
        form.submit();
        alert("탈퇴가 완료되었습니다.");
    }
}
</script>

    <!-- Bootstrap JS -->
<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
</body>
</html>

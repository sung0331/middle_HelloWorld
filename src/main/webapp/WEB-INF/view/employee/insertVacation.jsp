<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>휴가 신청 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>휴가 신청</h2>
     <%-- <c:set var="userNo" value="${sessionScope.userNo}"> --%><!--10.08  -->
        
        <form method="post" action="<%= request.getContextPath() %>/insert.do">
            <div class="form-group">
                <label for="title">휴가 사유</label>
                <input type="text" class="form-control" id="title" name="vacation_type" placeholder="휴가 제목을 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="start_date">시작일</label>
                <input type="date" class="form-control" id="start_date" name="start_date" required>
            </div>
            <div class="form-group">
                <label for="end_date">종료일</label>
                <input type="date" class="form-control" id="end_date" name="end_date" required>
            </div>
            <button type="submit" class="btn btn-primary">휴가 신청하기</button>
        </form>
<%-- <%--             <% --%>
<!-- //           java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy/MM/dd"); -->
<!-- //              String currentDate = sdf.format(new java.util.Date()); -->
<%--          %> --%>
<!--             <div class="form-group"> -->
<!--                 <label for="appli_date">결재일</label> -->
<%--                 <input type="datetime-local" class="form-control" id="appli_date" name="appli_date" value="<%= currentDate %>" required> --%>
<!--             </div> -->
       <%--  </c:set> --%>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

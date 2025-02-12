<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@page import="kr.or.ddit.vo.boardCodeVo"%>
<%@page import="kr.or.ddit.vo.BoardVo"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%
        CustomerVo user = (CustomerVo)session.getAttribute("user");
    %> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 - 헬로월드 테마파크</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <%@include file="./include/style.css"%>
    <%@include file="./include/board.css"%>
    <style>
        .board-tabs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }
        .board-tab {
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            background: none;
            font-size: 16px;
        }
        .board-tab.active {
            border-bottom: 2px solid #007bff;
            color: #007bff;
        }
        .post-list {
            width: 100%;
            border-collapse: collapse;
        }
        .post-list th, .post-list td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .post-list th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        .post-title {
            color: #007bff;
            text-decoration: none;
            cursor: pointer;
        }
        .post-title:hover {
            text-decoration: underline;
        }
        .post-content {
            display: none;
            padding: 15px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            margin-top: 10px;
        }
        .write-btn {
            float: right;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <%@include file="./include/top.jsp"%>

    <main>
        <section class="board">
            <div class="container">
                <h1>게시판</h1>
                <div class="board-tabs">
                    <c:forEach var="board" items="${boardNames}">
                        <button class="board-tab" onclick="showBoard(${board.board_no})">${board.board_name}</button>
                    </c:forEach>
                </div>
                <c:forEach var="board" items="${boardNames}">
                    <div class="board-content" id="board-${board.board_no}" style="display: none;">
                        <table class="post-list">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>제목</th>
                                    <th>글쓴이</th>
                                    <th>작성시간</th>
                                    <th>공개/비공개</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty boardsWithPosts[board.board_no]}">
                                        <c:forEach var="post" items="${boardsWithPosts[board.board_no]}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>
                                                    <a class="post-title" onclick="toggleContent(${post.post_no}, ${post.board_state})">${post.title}</a>
                                                    <div id="content-${post.post_no}" class="post-content">
                                                        <c:choose>
                                                            <c:when test="${post.board_state == 1}">
                                                                ${post.content}
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p>이 게시글은 비공개입니다.</p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </td>
                                                <td>${post.writer}</td>
                                                <td>${post.board_date}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${post.board_state == 1}">공개</c:when>
                                                        <c:when test="${post.board_state == 2}">비공개</c:when>
                                                        <c:otherwise>unknown</c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="5">게시글이 없습니다.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                        <button class="write-btn">글쓰기</button>
                    </div>
                </c:forEach>
            </div>
        </section>
    </main>
	<div class="box"></div>

    <%@include file="./include/bottom.jsp"%>

    <script>
        function showBoard(boardNo) {
            var boardContents = document.getElementsByClassName('board-content');
            for (var i = 0; i < boardContents.length; i++) {
                boardContents[i].style.display = 'none';
            }
            
            var selectedBoard = document.getElementById('board-' + boardNo);
            if (selectedBoard) {
                selectedBoard.style.display = 'block';
            }
            
            var tabs = document.getElementsByClassName('board-tab');
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].classList.remove('active');
            }
            event.target.classList.add('active');
        }

        function toggleContent(postNo, boardState) {
            var content = document.getElementById('content-' + postNo);
            if (boardState == 1) { // 공개 게시글
                if (content.style.display === 'block') {
                    content.style.display = 'none';
                } else {
                    content.style.display = 'block';
                }
            } else { // 비공개 게시글
                alert('이 게시글은 비공개입니다.');
            }
        }

        window.onload = function() {
            var firstTab = document.querySelector('.board-tab');
            if (firstTab) {
                firstTab.click();
            }
        }

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
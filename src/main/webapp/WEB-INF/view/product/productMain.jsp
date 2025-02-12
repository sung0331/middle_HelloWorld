<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.or.ddit.vo.ProductVo" %> 
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 판매 - 헬로월드 테마파크</title>

	<!-- 공통 스타일 include -->
    <%@include file="/WEB-INF/include/style.css"%>

    <!-- 스타일 영역 -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">

    <style>
        /* CSS 변수 정의: 주요 색상과 레이아웃 관련 요소의 크기를 지정합니다. */
        :root {
            --primary-color: #007bff; /* 기본 색상 */
            --secondary-color: #6c757d; /* 보조 색상 */
            --hover-color: #0056b3; /* 버튼 등 hover 시 변경되는 색상 */
            --container-width: 1200px; /* 컨텐츠 최대 너비 */
            --header-height: 80px; /* 헤더 높이 */
            --product-width: 260px; /* 개별 상품 아이템 너비 */
            --product-height: 420px; /* 개별 상품 아이템 높이 */
        }

        /* 기본적인 페이지 스타일 */
        body {
            font-family: 'Noto Sans KR', sans-serif; /* 'Noto Sans KR' 폰트 사용 */
            background-color: #f8f9fa; /* 페이지 배경색 */
        }

        /* 컨텐츠 영역 설정 */
        .content {
            max-width: var(--container-width); /* 최대 너비 */
            margin: 0 auto; /* 가운데 정렬 */
            padding: 20px; /* 패딩 추가 */
        }

        /* 상품 리스트 컨테이너 */
        .product-container {
            display: flex; /* Flexbox 레이아웃 사용 */
            flex-wrap: wrap; /* 상품을 여러 줄에 걸쳐 표시 */
            gap: 30px; /* 상품 간격 */
            justify-content: center; /* 가운데 정렬 */
            padding: 100px 0; /* 상하 패딩 */
            background: #ffffff; /* 배경색 */
            border-radius: 15px; /* 둥근 모서리 */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        /* 개별 상품 아이템 스타일 */
        .product-item {
            width: var(--product-width);
            height: var(--product-height);
            border: 1px solid #ddd; /* 테두리 */
            border-radius: 10px; /* 둥근 모서리 */
            overflow: hidden; /* 내부 요소가 넘칠 때 잘리도록 */
            text-align: center; /* 중앙 정렬 */
            padding: 20px; /* 패딩 추가 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            transition: transform 0.3s, box-shadow 0.3s; /* 애니메이션 효과 */
            background-color: #fff; /* 배경색 */
        }

        /* 상품 아이템에 hover 효과 추가 */
        .product-item:hover {
            transform: translateY(-10px); /* 위로 약간 이동 */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* 그림자 확대 */
        }

        /* 상품 이미지 스타일 */
        .product-item img {
            width: 100%;
            height: 180px;
            object-fit: cover; /* 이미지를 비율 유지하면서 크기에 맞춤 */
            border-radius: 10px 10px 0 0; /* 상단 모서리 둥글게 */
        }

        /* 상품 세부정보 스타일 */
        .product-details {
            margin-top: 15px;
        }

        .product-details h3 {
            font-size: 1.25em;
            margin-bottom: 10px;
        }

        .price {
            font-size: 1.5em; /* 가격 폰트 크기 */
            font-weight: bold; /* 굵은 글씨체 */
            color: #f53b57; /* 가격 글씨색 */
            margin-bottom: 15px;
        }

        .btn {
            background-color: var(--primary-color); /* 버튼 배경색 */
            color: #fff; /* 버튼 글씨색 */
            padding: 12px 20px; /* 버튼 패딩 */
            border: none; /* 테두리 없음 */
            border-radius: 5px; /* 둥근 모서리 */
            cursor: pointer; /* 마우스 포인터 변경 */
            transition: background-color 0.3s; /* 색상 변경 애니메이션 */
        }

        .btn:hover {
            background-color: var(--hover-color); /* hover 시 색상 변경 */
        }

        /* 페이지네이션 스타일 */
        .pagination {
            text-align: center;
            margin-top: 50px;
            margin-bottom: 50px;
        }

        .pagination .btn {
            margin: 0 10px;
            padding: 10px 20px;
            text-decoration: none; /* 링크 밑줄 제거 */
            font-size: 1.2em;
        }

        header {
            transition: box-shadow 0.3s; /* 스크롤 시 헤더 그림자 변경 */
        }
        
        
        /* 모달 창 및 버튼 스타일 설정 */
    	.modal {
	        display: none;
	        position: fixed;
	        z-index: 2000;
	        left: 0;
	        top: 0;
	        width: 100%;
	        height: 100%;
	        overflow: auto;
	        background-color: rgba(0, 0, 0, 0.4);
   		}
    
    	#pageArea {
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.footer-section {
   			flex: 1;
  			mheight: 00px;
		}
		
		.footer-section ul li {
		    margin-bottom: 10px;
		}

        
    </style>
    
	</head>
	<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
<main>


	<%
	//JSP에서 전달된 "productList"를 List 형태로 받아서 사용하기 위해 캐스팅합니다.
	List<ProductVo> list = (List<ProductVo>) request.getAttribute("list");
	%>
	
	
	<!-- 메인 콘텐츠 영역 -->
    <div class="content">
        <div class="product-container">
            <c:forEach var="product" items="${list}">
                <div class="product-item">
                    <!-- 상품 상세 페이지로 이동하는 링크 -->
                    <a href="<c:url value='/productDetail.do?prod_no=${product.prod_no}'/>">
                        <img src="/HelloWorld/${product.prod_img_link}" alt="상품 ${product.prod_name}">
                    </a>
                    <div class="product-details">
                        <h3>
                            <a href="<c:url value='/productDetail.do?prod_no=${product.prod_no}'/>" style="color: #333; text-decoration: none;">${product.prod_name}</a>
                        </h3>
                        <p>${product.prod_comment}</p>
                        <p class="price">${product.prod_price}원</p>
<%--                         <form action="<c:url value='/addToCart.do'/>" method="post"> --%>
<%--                             <input type="hidden" name="productId" value="${product.prod_no}"> --%>
<!--                             <button type="submit" class="btn">장바구니에 추가</button>                 		 -->
<!--                         </form> -->
                    </div>
                </div>
            </c:forEach>
        </div>


		<!-- 이전 페이지로 이동하는 버튼 -->
		<div id="pageArea">
			
			<button id="prev" onclick="goToPrevPage()">Prev</button>

			<ul class="pagination">
			<%
            // 현재 페이지, 시작 페이지, 마지막 페이지 정보를 가져와 페이지네이션 구현
            int cPage = (int) request.getAttribute("cPage");
            int sPage = (int) request.getAttribute("sPage");
            int ePage = (int) request.getAttribute("ePage");

            for (int i = sPage; i <= ePage; i++) {
                if (cPage == i) {
            %>
				<!-- 현재 페이지일 경우 버튼 비활성화 -->
				<button class="page-button active" disabled><%=i%></button>
				<%
                } else {
            	%>
				<!-- 다른 페이지로 이동하는 버튼 -->
				<button class="page-button" onclick="goToPage(<%=i%>)"><%=i%></button>
				<%
                } // if end
            } // for end
            	%>
			</ul>

			<!-- 다음 페이지로 이동하는 버튼 -->
			<ul class="pager">
				<button id="next" onclick="goToNextPage()">Next</button>
			</ul>
		</div>

		<!-- 페이지 이동을 위한 스크립트 -->
		<script>
        // 전체 페이지 수를 서버로부터 받아옴
        let ttPage = <%=request.getAttribute("tPage")%>;

        // 특정 페이지로 이동하는 함수
        function goToPage(pageNum) {
            location.href = "productMain.do?page=" + pageNum;
        }

        // 다음 페이지로 이동하는 함수
        function goToNextPage() {
            let lastPage = parseInt($('.pagination button').last().text()); // 마지막 페이지 번호 가져오기(string -> number)
            console.log(lastPage);
            if (ttPage === lastPage) return; // 마지막 페이지인 경우 더 이상 이동하지 않음
            location.href = "productMain.do?page=" + (lastPage + 1);
        }

        // 이전 페이지로 이동하는 함수
        function goToPrevPage() {
            let firstPage = parseInt($('.pagination button').first().text()); // 첫 번째 페이지 번호 가져오기(string -> number)
            if (firstPage <= 1) return; // 첫 번째 페이지인 경우 더 이상 이동하지 않음
            location.href = "productMain.do?page=" + (firstPage - 1);
        }
    </script>

	</div>
	
	<div class=".footer-section ul li"></div>
</main>


<%@page import="kr.or.ddit.vo.CustomerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.or.ddit.vo.ProductVo"%>

<%
ProductVo productDetail = (ProductVo) request.getAttribute("productDetail");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 상세 정보 - 헬로월드 테마파크</title>

<!-- 공통 스타일 include -->
<%@include file="/WEB-INF/include/style.css"%>

<!-- 상품 상세 페이지에 필요한 추가 스타일 -->
<style>
body {
	margin-bottom: 200px; /* 푸터와 본문이 겹치지 않도록 하단 여백 추가 */
}

footer {
	margin-top: 150px; /* 본문과 푸터 사이 여백 추가 */
}

.product-detail-container {
	max-width: 1000px;
	margin: 50px auto;
	padding: 20px;
	background: #ffffff;
	border-radius: 15px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.product-detail-content {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
	border: 1px solid rgba(0, 0, 0, 0.2);
	padding: 20px;
	border-radius: 10px;
}

.product-detail-content img {
	width: 100%;
	max-width: 400px;
	border-radius: 10px;
	object-fit: cover;
}

.product-info {
	flex: 1;
	padding: 20px;
}

.product-info h1 {
	font-size: 2.5em;
	margin-bottom: 20px;
	color: var(--text-color);
}

.product-info p {
	font-size: 1.1em;
	margin-bottom: 20px;
	line-height: 1.6;
}

.product-price {
	font-size: 2em;
	font-weight: bold;
	color: var(--primary-color);
	margin-bottom: 20px;
}

.product-btn {
	background-color: var(--primary-color);
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-right: 10px;
}

.product-btn:hover {
	background-color: var(--secondary-color);
}

.additional-info, .review-section, .related-products {
	margin-top: 40px;
	text-align: left;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 10px;
}

.review, .product-item {
	background-color: #f1f1f1;
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 10px;
}
</style>
</head>
<main>

	<div class="content">
		<section id="" class="">
			<div class="product-detail-content">
				<div>
					<img
						src="/HelloWorld/${productDetail.prod_img_link}"
						alt="상품 ${productDetail.prod_name}">
				</div>
				<div class="product-info">
					<h1>${productDetail.prod_name}-헬로월드테마파크기념품</h1>
					<h3>제품 소개</h3>

					<form action="gotoCart.do" method="post">
						<input type="hidden" name="prod_no"
							value="${productDetail.prod_no}"> <input type="hidden"
							name="cate" value="${productDetail.prod_cate_no}">
						<p class="product-price">
							상품 가격: <span id="productPrice">${productDetail.prod_price}</span>원
						</p>

						<!-- 수량 선택 -->
						<label for="amount">수량: </label> <input type="number" id="amount"
							name="amount" value="1" min="1"><br> <br> <input
							type='submit' class="product-btn" value="장바구니에 담기">

					</form>
				</div>
			</div>



			<!-- 제품 소개 -->
			<div class="additional-info">
				<h2>제품 소개</h2>
				<p>
					<!-- 제품내용 -->
				<li style="padding: 20px;">제품 설명 : <span id="productPrice">${productDetail.prod_comment}</span></li>
				</p>
			</div>


		</section>
	</div>

</main>
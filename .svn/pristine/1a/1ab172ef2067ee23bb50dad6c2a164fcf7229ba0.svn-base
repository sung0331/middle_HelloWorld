<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.or.ddit.vo.CartVo"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
:root {
	--primary-color: #007bff;
	--secondary-color: #6c757d;
	--background-color: #f9f9f9;
	--accent-color: #FFD700;
	--button-color: #ffffff;
	--button-border-color: #ccc;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: var(--background-color);
	margin: 0;
	padding: 0;
}

.AAAA {
	max-width: 1000px; /* 컨테이너의 최대 너비를 넓혔습니다 */
	margin: 50px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}

.section h2 {
	color: var(--primary-color);
	font-size: 2.5rem;
	margin-bottom: 1.5rem;
	padding-bottom: 15px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	font-size: 14px; /* 폰트 크기를 줄였습니다 */
}

th {
	background-color: var(--primary-color);
	color: white;
	font-weight: bold;
	text-transform: uppercase;
}

td.product-name {
	max-width: 200px; /* 제품명 열의 최대 너비를 지정하여 넓혔습니다 */
	white-space: nowrap; /* 텍스트를 한 줄로 유지합니다 */
	overflow: hidden;
	text-overflow: ellipsis; /* 길면 '...'으로 표시 */
}

tr:nth-child(even) {
	background-color: #f8f8f8;
}

tr:hover {
	background-color: #e8e8e8;
}

button[type="submit"] {
	height: 35px;
	padding: 10px 20px;
	font-size: 14px;
	border-radius: 5px;
	margin-top: 10px;
	transition: background-color 0.3s;
	background-color: var(--accent-color);
	border: none;
	color: black;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #FFC300;
}

button.delete-btn, button.detail-btn {
	padding: 8px 15px;
	font-size: 14px;
	border-radius: 5px;
	cursor: pointer;
	background-color: var(--button-color);
	border: 1px solid var(--button-border-color);
	color: black;
	width: 100px;
}

button.delete-btn:hover, button.detail-btn:hover {
	background-color: #e0e0e0;
}
</style>
<%-- <% int buy_no = (int) request.getAttribute("buy_no"); %> --%>

<main>
	<section class="AAAA">
		<h2>장바구니</h2>

		<table border="1">
			<thead>
				<tr>
					<th>상품명</th>
					<th>세부정보</th>
					<th>수량</th>
					<th>구매가</th>
					<th>삭제</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${cartItems}">
					<tr data-cart-no="${item.cart_no}">
						<td>${item.prod_name}</td>
						<td>${item.prod_comment}</td>
						<td><input type="number" name="quantity_${item.cart_no}"
							value="${item.amount}" min="1"
							onchange="updateCart(${item.cart_no}, this.value)" /></td>
						<td class="total-price"><fmt:formatNumber
								value="${item.price * item.amount}" type="number"
								groupingUsed="true" /> 원</td>
						<td><button type="button" class="delete-btn"
								onclick="deleteCartItem(${item.cart_no})">삭제</button></td>
						<td><button type="button" class="detail-btn"
								onclick="location.href='/productDetail.do?prod_no=${item.prod_no}'">상세보기</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<!-- 추가 -->
			<%
			int cart_no = (int) request.getAttribute("cart_no");
			%>

			<!-- 			ㅇㅇ -->
			총 결제금액: <span id="totalPrice">0원</span>
		</div>
		<a href="pay.do?buy_no=<%=cart_no%>">
			<button >결제</button>
		</a>
	</section>
</main>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
// 장바구니 항목 삭제 (화면에서만 제거)
function deleteCartItem(cartNo) {
    // 특정 cartNo에 해당하는 tr 요소를 찾아서 제거
     var row = document.querySelector('tr[data-cart-no="' + cartNo + '"]');
    if (row) {
        row.remove();  // 화면에서 해당 행을 제거
        updateTotal(); // 총 결제 금액 다시 계산
    }
}

// 수량 변경 시 Ajax로 서버에 업데이트 요청
function updateCart(cartNo, newQuantity) {
    $.ajax({
        url: '<c:url value="/mypageCart.do"/>',
        type: 'POST',
        data: {
            cartNo: cartNo,
            quantity: newQuantity
        },
        success: function (response) {
            if (response.success) {
                updateTotal(); // 총 결제 금액 다시 계산
            } else {
                alert('수량 업데이트에 실패했습니다.');
            }
        },
        error: function () {
            alert('서버 오류로 인해 수량 업데이트에 실패했습니다.');
        }
    });
}

//총 결제 금액 계산
function updateTotal() {
    let total = 0;
    document.querySelectorAll('tbody tr').forEach(row => {
        const price = parseInt(row.querySelector('.total-price').textContent.replace(/[^0-9]/g, ''), 10);
        total += price;
    });
    document.getElementById('totalPrice').textContent = new Intl.NumberFormat('ko-KR').format(total) + " 원";
}

// 페이지 로드 시 총 결제금액 계산
$(document).ready(function() {
    updateTotal();
});
</script>


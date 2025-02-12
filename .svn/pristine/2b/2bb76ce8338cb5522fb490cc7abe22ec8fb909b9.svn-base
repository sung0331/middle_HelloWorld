<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<%@include file="./include/signup.css"%>
</head>
<body>


	
	<div class="signup-container">
			<h1>&nbsp;&nbsp;</h1><br><br>
		<h1>&nbsp;&nbsp;</h1><br><br>		
		<h1>&nbsp;&nbsp;</h1><br><br>


		<h1>&nbsp;&nbsp;</h1><br><br>
		<h1>&nbsp;&nbsp;</h1><br><br>
		<h1>회원가입</h1>
		<form id="signupForm" action="<c:url value='/signup.do'/>"
			method="post" onsubmit="return validateForm()">
		

			<label for="username">아이디</label>
			<div class="id-check-container">
				<input type="text" id="username" name="username" required>
				<button type="button" id="checkUsername">중복확인</button>
			</div>
			<span id="usernameResult"></span> <label for="name">이름</label> <input
				type="text" id="name" name="name" required> <label
				for="email">이메일</label> <input type="email" id="email" name="email"
				required> <label for="password">비밀번호</label> <input
				type="password" id="password" name="password" required> <label
				for="confirmPassword">비밀번호 확인</label> <input type="password"
				id="confirmPassword" name="confirmPassword" required> <label
				for="birthdate">생년월일</label> <input type="date" id="birthdate"
				name="birthdate" required> <label for="phone">전화번호</label> <input
				type="tel" id="phone" name="phone"
				pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000"
				required> <label for="telecom">통신사</label> <select
				id="telecom" name="telecom" required>
				<option value="">선택하세요</option>
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LG">LG</option>
			</select> <label for="postcode">우편번호</label>
			<div class="address-search-container">
				<input type="text" id="postcode" name="postcode" readonly required>
				<button type="button" onclick="searchAddress()">주소 검색</button>
			</div>

			<label for="address">주소</label> <input type="text" id="address"
				name="address1" readonly required> <label
				for="detailAddress">상세주소</label> <input type="text"
				id="detailAddress" name="address2">

			<div class="terms">
				<h3>약관 동의</h3>
				<label> <input type="checkbox" id="agreeAll" name="agreeAll">
					전체 동의
				</label> <label> <input type="checkbox" id="agreeTerms"
					name="agreeTerms" required> <span class="required">[필수]</span>
					이용약관 동의 <a href="#" onclick="showTerms('terms')">보기</a>
				</label> <label> <input type="checkbox" id="agreePrivacy"
					name="agreePrivacy" required> <span class="required">[필수]</span>
					개인정보 수집 및 이용 동의 <a href="#" onclick="showTerms('privacy')">보기</a>
				</label> <label> <input type="checkbox" id="agreeMarketing"
					name="agreeMarketing"> <span class="optional">[선택]</span>
					마케팅 정보 수신 동의 <a href="#" onclick="showTerms('marketing')">보기</a>
				</label>
			</div>

			<button type="submit">가입하기</button>

			<div class="login-link">
				<p>
					이미 계정이 있으신가요? <a href="<c:url value='/login.do'/>">로그인</a>
				</p>
			</div>
		</form>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        let isUsernameDuplicate = true;

        document.getElementById('checkUsername').addEventListener('click', function() {
            const username = document.getElementById('username').value;
            const resultSpan = document.getElementById('usernameResult');
            
            if (!username) {
                alert('아이디를 입력해주세요.');
                return;
            }
            
            fetch('<c:url value="/checkUsername"/>', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'username=' + encodeURIComponent(username)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('서버 응답 오류');
                }
                return response.json();
            })
            .then(data => {
                if (data.available) {
                    resultSpan.textContent = "사용 가능한 아이디입니다.";
                    resultSpan.className = "success";
                    isUsernameDuplicate = false;
                } else {
                    resultSpan.textContent = "이미 사용 중인 아이디입니다.";
                    resultSpan.className = "error";
                    isUsernameDuplicate = true;
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('아이디 중복 확인 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
                resultSpan.textContent = "";
            });
        });

        document.getElementById('agreeAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.terms input[type="checkbox"]');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        const individualCheckboxes = document.querySelectorAll('.terms input[type="checkbox"]:not(#agreeAll)');
        individualCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', updateAgreeAll);
        });

        function updateAgreeAll() {
            const allChecked = Array.from(individualCheckboxes).every(checkbox => checkbox.checked);
            document.getElementById('agreeAll').checked = allChecked;
        }

        function showTerms(type) {
            let content = '';
            switch(type) {
                case 'terms':
                    content = '이용약관 내용...';
                    break;
                case 'privacy':
                    content = '개인정보 수집 및 이용 동의 내용...';
                    break;
                case 'marketing':
                    content = '마케팅 정보 수신 동의 내용...';
                    break;
            }
            alert(content);
        }

        function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = ''; // 주소 변수

                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }

        function validateForm() {
            const form = document.getElementById('signupForm');
            const password = form.password.value;
            const confirmPassword = form.confirmPassword.value;
            const telecom = form.telecom.value;
            const name = form.name.value;
            const postcode = document.getElementById('postcode').value;
            const address = document.getElementById('address').value;

            if (isUsernameDuplicate) {
                alert('아이디 중복 확인을 해주세요.');
                return false;
            }

            if (!name) {
                alert('이름을 입력해주세요.');
                return false;
            }

            if (password !== confirmPassword) {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }

            if (password.length < 8) {
                alert('비밀번호는 8자 이상이어야 합니다.');
                return false;
            }

            if (!telecom) {
                alert('통신사를 선택해주세요.');
                return false;
            }

            if (!postcode || !address) {
                alert('주소를 입력해주세요.');
                return false;
            }

            if (!form.agreeTerms.checked || !form.agreePrivacy.checked) {
                alert('필수 약관에 동의해야 합니다.');
                return false;
            }

            if (!form.agreeMarketing.checked) {
                alert('마케팅 정보 수신에 동의하지 않았습니다. 동의하시면 다양한 혜택 정보를 받아보실 수 있습니다.');
            }

            return true;
        }

        document.getElementById('username').addEventListener('input', function() {
            isUsernameDuplicate = true;
            document.getElementById('usernameResult').textContent = "";
        });
    </script>
</body>
</html>
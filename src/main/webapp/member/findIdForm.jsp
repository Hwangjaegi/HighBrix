<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="login-form">
	<h1>아이디 찾기</h1>
	<div class="login_box">
		<h3>회원 아이디찾기</h3>
		<form action="findId.yj">
		<input type="text" name="name" placeholder="이름" required="required" id="name"><p></p>
		<input type="text" name="tel" placeholder="가입휴대폰번호" required="required" id="tel">
		<input type="submit" value="아이디 찾기" class="login_btn">
		</form>
	</div>
	<div class="btn_login">
	<button onclick="location.href='findPwForm.yj'">비밀번호 찾기</button>
	<button onclick="location.href='loginForm.yj'" class="join_box" >로그인하기</button>
	</div>
</section>
</body>
</html>
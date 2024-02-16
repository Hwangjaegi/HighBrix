<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="login-form">
	<h1>비밀번호 찾기</h1>
	<div class="login_box">
		<h3>회원 비밀번호찾기</h3>
		<form action="findPw.yj">
		<input type="text" name="id" placeholder="아이디" required="required" id="id">
		<p></p>
		<input type="text" name="name" placeholder="이름" required="required" id="name">
		<input type="submit" value="비밀번호 찾기" class="login_btn">
		</form>
		<div>
		<button onclick="location.href='findIdForm.yj'">아이디 찾기</button>
		<button onclick="location.href='loginForm.yj'" class="join_box">로그인하기</button>
		</div>
	</div>
</section>
</body>
</html>
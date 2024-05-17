<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/member.css");
</style>
</head>
<body>
<div class="login-wrap">
	<div class="login-form">
		<div class="find_box">
			<h2>회원 비밀번호찾기</h2>
			<form action="findPw.yj">
			<div class="login_input_sec">
			<div>
			<input type="text" name="id" placeholder="아이디" required="required" id="id">
			<p></p>
			<input type="text" name="name" placeholder="이름" required="required" id="name">
			</div>
			<button id="btn" type="submit">비밀번호 찾기</button>
			</div>
			</form>
		</div>
		<div class="btn_findId">
			<button onclick="location.href='findIdForm.yj'">아이디 찾기</button>
			<button onclick="location.href='loginForm.yj'" class="join_box">로그인하기</button>
		</div>
	</div>
</div>
</body>
</html>
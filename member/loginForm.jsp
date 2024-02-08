<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("member.css");</style>
</head>
<body>
<div class="login-form">
<form action="login.jsp">
	<div class="login_box">
		<h2>회원 로그인</h2>
		<div class="login_input_sec">
			<div>
			<input type="text" name="id" autofocus="autofocus" required="required"
			 placeholder="아이디">
			<input type="password" name="password" required="required"
			 placeholder="비밀번호">
			</div>
			<button type="submit">로그인</button><p>
		</div>
	</div>
</form>
	<div class="btn_login">
		<ul>
			<li><button onclick="joinForm.jsp" class="join_box" >회원가입</button></li>
			<li><button onclick="findId.jsp">아이디찾기</button></li>
			<li><button onclick="findPw.jsp">비밀번호찾기</button></li>
		</ul>
	</div>
</div>
</body>
</html>
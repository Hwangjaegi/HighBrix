<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/member.css");</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		let id = $('id');
		let pw = $('password');
		let btn = $('#btn');
		$(btn).on('click',function(){
			if($(id).val() == ""){
				$(id).next('label').addClass('warning');
				setTimeout(function() => {
					$('label').removeClass('warning');
				}, 2000);
			} else if($(pw).val() == ""){
				$(pw).next('label').addClass('warning');
				setTimeout(function() => {
					$('label').removeClass('warning');
				}, 2000);
			}
		});
	});
</script>
</head>
<body>
<div class="login-wrap">
<div class="login-form">
<form action="login.yj">
	<div class="login_box">
		<h2>회원 로그인</h2>
		<div class="login_input_sec">
			<div>
			<input type="text" name="id" autofocus="autofocus" required="required"
			 placeholder="아이디">
			<input type="password" name="password" required="required"
			 placeholder="비밀번호">
			</div>
			<button id="btn" type="submit">로그인</button><p>
		</div>
	</div>
</form>
	<div class="btn_login">
		<ul>
			<li><button onclick="location.href='joinForm.yj'" class="join_box" >회원가입</button></li>
			<li><button onclick="location.href='findIdForm.yj'" >아이디찾기</button></li>
			<li><button onclick="location.href='findPwForm.yj'" >비밀번호찾기</button></li>
		</ul>
	</div>
</div>
</div>
</body>
</html>
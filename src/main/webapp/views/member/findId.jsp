<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/member.css");</style>
</head>
<body>
<div class="result-wrap">
	<div class="result-form">
		<h1>아이디 찾기 결과</h1>
		<div class="result-cont">
		<c:if test="${member != null }">
			아이디는 ${member.id }입니다.
		<div class="result-btn">
			<button onclick="location.href='loginForm.yj'">로그인</button>
			<button onclick="location.href='findPwForm.yj'">비밀번호 찾기</button>
		</div>
		</c:if>
		<c:if test="${member == null }">
		 	존재하지 않는 회원정보 입니다.
		<div class="result-btn">
			<button onclick="location.href='joinForm.yj'">회원가입</button>
		</div>
		</c:if>
		</div>
	</div>
</div>
</body>
</html>
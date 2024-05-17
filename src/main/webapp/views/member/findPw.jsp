<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/member.css");</style>
</head>
<body>
<div class="result-wrap">
	<div class="result-form">
	<h1>비밀번호 찾기 결과</h1>
	<div class="result-cont">
	<c:if test="${member != null }">
		<c:if test="${fc:length(member.password) < 4 }">
		 비밀번호는 <b>${fc:substring(member.password,0,4) }
			 <c:forEach begin="1" end="${fc:length(member.password)-1 }">
			 *
			 </c:forEach>
		 </b> 입니다.
		 </c:if>	
		<c:if test="${fc:length(member.password) >= 4 }">
		 비밀번호는 <b>${fc:substring(member.password,0,4) }
			 <c:forEach begin="1" end="${fc:length(member.password)-4 }">
			 *
			 </c:forEach>
		 </b> 입니다.
		 </c:if>
		 <div class="result-btn">
		 	<button onclick="location.href='loginForm.yj'">로그인</button>
		 	<button onclick="location.href='findIdForm.yj'">아이디찾기</button>
		 </div>
	</c:if>
			<c:if test="${member == null }">
				존재하지 않는 회원정보입니다.
			<div class="result-btn">
				<button onclick="location.href='joinForm.yj'">회원가입</button>
			</div>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>
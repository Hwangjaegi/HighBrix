<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<h1>비밀번호 찾기 결과</h1>
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
		 <button onclick="location.href='loginForm.yj'">로그인</button>
	</c:if>
	<c:if test="${member == null }">
		존재하지 않는 회원정보입니다.
		<button onclick="location.href='joinForm.yj'">회원가입</button>
	</c:if>
	</div>
</body>
</html>
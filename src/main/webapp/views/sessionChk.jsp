<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 세션체크로 로그인되어있는지 확인 -->
<c:set var="id" value="${sessionScope.id }"></c:set> <!-- 세션의 id값을 id이름으로 저장 -->
<c:if test="${empty id}">	<!-- 세션이없으면 login폼으로 이동해! -->
	<script type="text/javascript">
		location.href="/highbrix/views/member/loginForm.yj"
	</script>
</c:if>


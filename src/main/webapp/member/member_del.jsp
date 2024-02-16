<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 탈퇴</h2>
대애애충 무슨 개인정보약관 모시기 이렇다는 안내문구넣기.

정말로 탈퇴하시겠습니까?
<form action="delete.yj">
<button type="submit">예</button>
</form>
<form action="myPageForm.yj">
<button type="submit">취소</button>
</form>
</body>
</html>
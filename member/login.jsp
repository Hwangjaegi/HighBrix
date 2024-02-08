<%@page import="member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String password =  request.getParameter("password");
	MemberDao md = MemberDao.getInstance();
	int result = md.loginChk(id,password);
	
%>
</body>
</html>
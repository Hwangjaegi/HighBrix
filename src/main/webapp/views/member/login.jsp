<%-- <%@page import="model.*"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("로그인에 성공하였습니다.");
		location.href="../display/dpMain.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("아이디/비밀번호 정보를 다시 확인해주세요.");
		history.back();
	</script>
</c:if>
<c:if test="${result < 0 }">
	<script type="text/javascript">
		alert("없는 정보입니다.");
		history.back();
	</script>
</c:if>
<%-- <%
	String id = request.getParameter("id");
	String password =  request.getParameter("password");
	MemberDao md = MemberDao.getInstance();
	int result = md.loginChk(id,password);
	if (result > 0){
		session.setAttribute("id", id);
%>
<script type="text/javascript">
	alert("로그인 되었습니다.");
	location.href="myPageForm.jsp";
</script>
<%	} else if(result == 0){ %>
<script type="text/javascript">
	alert("비밀번호가 틀립니다. 다시 시도해주세요.");
	history.go(-1);
</script>
<%	} else{ %>
<script type="text/javascript">
	alert("로그인에 실패하였습니다. 다시 시도해주세요.");
	history.go(-1);	
</script>
<%	} %> --%>
</body>
</html>
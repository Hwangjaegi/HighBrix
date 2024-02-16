<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("탈퇴 되었습니다.");
		location.href="main.yj";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("탈퇴에 실패하였습니다.");
		history.back();
	</script>
</c:if>
<%-- <%
	MemberDao md = MemberDao.getInstance();
	int result = md.delete(id);
	if( result > 0){
		session.invalidate();
%>
<script type="text/javascript">
	alert("탈퇴되었습니다.");
	location.href="main.jsp";
</script>
<%	} else { %>
<script type="text/javascript">
	alert("탈퇴되지 않았습니다.");
	history.go(-1);
</script>
<%	}  %> --%>
</head>
<body>

</body>
</html>
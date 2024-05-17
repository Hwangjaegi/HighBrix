<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<%@ include file="sessionChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${result > 0 }">
	<script type="text/javascript">
	alert("수정 되었습니다.");
	location.href="myPageForm.yj";
	</script>
</c:if>
<c:if test="${result < 0 }">
	<script type="text/javascript">
	alert("수정에 실패하였습니다. 다시 시도해주세요.");
	hisotry.back();
	</script>
</c:if>
<%-- <%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="model.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.update(member);
	if(result > 0){ %>
<script type="text/javascript">
	alert("수정 완료되었습니다.");
	location.href="myPageForm.yj";
</script>
<%	} else { %>
<script type="text/javascript">
	alert("수정 실패하였습니다. 다시 시도해주세요.");
	history.go(-1);
</script>
<%	} %> --%>
</head>
<body>

</body>
</html>
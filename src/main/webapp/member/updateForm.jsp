<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk(){
		if(frm.password.value != frm.password2.value){
			alert("비밀번호와 비밀번호확인이 맞지 않습니다.");
			frm.password.focus(); return false;
		}
	}
</script>
</head>
<body>
<%-- <%	
	MemberDao md = MemberDao.getInstance();
	Member mb = md.select(id);
%> --%>
<form action="update.yj" method="post" name="frm" onsubmit="return chk()">
<input type="hidden" name="id" value="${member.id }">
<table>
<tr><th>아이디</th><td>${member.id }</td></tr>
<tr><th>비밀번호</th><td><input type="password" name="password"
	 required="required"></td></tr>
<tr><th>비밀번호확인</th><td><input type="password" name="password2"
	required="required"></td></tr>
<tr><th>이름</th><td><input type="text" name="name" required="required"
	value="${member.id }"></td></tr>
<tr><th>주소</th><td><input type="text" name="address" value="${member.address }"></td></tr>
<tr><th>전화번호</th><td><input type="text" name="tel" required="required" value="${member.tel }"></td></tr>
<tr><th>이메일</th><td><input type="email" name="email" value="${member.email }"></td></tr>
<tr><th colspan="2"><input type="submit" value="완료"></th></tr>
</table>
</form>
</body>
</html>
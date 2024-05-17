<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/member.css");</style>
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
<div class="join-wrap">
<div class="join-form">
<h2>회원정보 수정</h2>
<form action="update.yj" method="post" name="frm" onsubmit="return chk()">
<input type="hidden" name="id" value="${member.id }">
<table>
<colgroup><col width="25%"><col width="75%"></colgroup>
<tbody>
<tr><th>아이디</th><td><span class="table-id">${member.id }</span></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="password"
	 required="required"></td></tr>
<tr><th>비밀번호확인</th><td><input type="password" name="password2"
	required="required"></td></tr>
<tr><th>이름</th><td><input type="text" name="name" required="required"
	value="${member.id }"></td></tr>
<tr><th>주소</th><td><input type="text" name="address" value="${member.address }"></td></tr>
<tr><th>전화번호</th><td><input type="text" name="tel" required="required" value="${member.tel }"></td></tr>
<tr><th>이메일</th><td><input type="email" name="email" value="${member.email }"></td></tr>
</tbody>
</table>
<div class="btn_join">
<button type="submit">완료</button>
<button onclick="location.href='/highbrix/views/member/myPageForm.yj'">취소</button>
</div>
</form>
</div>
</div>
</body>
</html>
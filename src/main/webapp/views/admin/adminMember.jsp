<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/admin/admin_list.css?after");
.btn main {
	float: right;
}
</style>
</head>
<body>
<script type="text/javascript">
	function del(id) {
		let con = confirm("선택한 회원을 탈퇴 처리하시겠습니까?");
		if (con) {
			location.href="/highbrix/views/admin/memberDelete.ms?id="+id;
		}
	}
</script>
<div class="container">
	<table><caption>회원관리</caption>
		<tr><td colspan="8"></td>
			<td>
			<input type="button" value="관리자메인" 
				class="btn main" style="background-color: white"
				onclick="location.href='/highbrix/views/admin/adminMain.jsp'"></td></tr>
		<tr><th>아이디</th>
			<th>이름</th>
			<th>주소</th>
			<th>연락처</th>
			<th>이메일</th>
			<th>가입일</th>
			<th>수정</th>
			<th>삭제</th>
			<th>삭제여부</th></tr>
<c:if test="${empty list }">
		<tr align="center"><td colspan="9">회원이 없습니다</td></tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="member" items="${list}">
		<tr><td>${member.id }</td>
			<td>${member.name }</td>
			<td>${member.address }</td>
			<td>${member.tel }</td>
			<td>${member.email }</td>
			<td>${member.reg_date }</td>
			<td><a href="/highbrix/views/member/updateForm.yj?id=${member.id }">
				<input type="button" class="btn up" value="수정" style="background-color: white"></a></td>
			<td><a onclick="del('${member.id}')">
				<input type="button" class="btn del" value="삭제" style="background-color: white"></a></td>
				<td>${member.del }</td></tr>
	</c:forEach>
</c:if>
	</table>
	</div>
<div class="page" align="center">
	<!-- 앞에 보여줄게 남아있어 -->
	<c:if test="${startPage > PAGE_PER_BLOCK }">
		<button class="pageBtn" onclick="location.href='adminMember.ms?pageNum=1'"><img alt="" src="/highbrix/images/paging11.png"></button>
		<button class="pageBtn" onclick="location.href='adminMember.ms?pageNum=${startPage - 1}'"><img alt="" src="/highbrix/images/paging1.png"></button>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<button class="pageBtn" onclick="location.href='adminMember.ms?pageNum=${i}'">${i }</button>
	</c:forEach>
	<!-- 아직 보여줄게 남아있다 -->
	<c:if test="${endPage < totalPage }">
		<button class="pageBtn" onclick="location.href='adminMember.ms?pageNum=${endPage + 1}'"><img alt="" src="/highbrix/images/paging2.png"></button>
		<button class="pageBtn" onclick="location.href='adminMember.ms?pageNum=${totalPage}'"><img alt="" src="/highbrix/images/paging22.png"></button>
	</c:if>
</div><br>
</body>
</html>
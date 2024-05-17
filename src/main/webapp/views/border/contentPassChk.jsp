<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("/highbrix/css/border/border.css")
</style>
</head>
<body>
<c:if test="${passwordChk == 'member' || id == 'admin'}">
	<input type="hidden" name="a_no" value="${a_no}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="passwordChk" value="member">
    <script type="text/javascript">
  	  location.href="content.cu?a_no=${a_no}&pageNum=${pageNum}&passwordChk=${passwordChk}&id=${id}";
    </script>
</c:if>
	<div class="passChkmain">
	<c:if test="${passwordChk != 'member'}">
		<form action="content.cu">
			<input type="hidden" name="a_no" value="${a_no}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="passwordChk" value="${passwordChk}">
			<h2 style="text-align: center;">암호를 입력하세요</h2>
			<input type="password" name="password" required="required" autofocus="autofocus" style="text-align: center;">
			<input type="submit" value="확인">
		</form>
	</c:if>
	</div>
</body>

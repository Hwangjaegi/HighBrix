<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/highbrix/css/admin/admin.css");
	.container {
		display: flex;
		justify-content: center;
	}
</style>
</head>
<body>
<div class="container">
	<table>
		<tr><th>상품번호</th><th>상품명</th><th>상품가격</th><th>재고수량</th><th>등록일</th></tr>
		<c:forEach var="cmProduct" items="${list }">
		<tr><td>${cmProduct.cm_no }</td>
			<td>${cmProduct.cm_name }</td>
			<td>${cmProduct.cm_count }</td>
			<td>${cmProduct.cm_date }</td>
			<td><a href="../cmProduct/cmUpdateForm.min?cm_no=${cmProduct.cm_no }">수정</a></td>
			<td><a onclick="del(${cmProduct.cm_no })">삭제</a></td></tr>
		</c:forEach>
	</table>
</div>
</body>
</html>
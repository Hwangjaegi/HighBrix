<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/highbrix/css/admin/admin_list.css?after");
</style>
</head>
<body>
<script type="text/javascript">

</script>

<div class="container">
	<table><caption>배송 주문관리</caption>
		<tr><td colspan="6">
			<td><input type="button" value="관리자메인" 
					class="btn main" style="background-color: white"
					onclick="location.href='/highbrix/views/admin/adminMain.jsp'"></td></tr>
		<tr><th>주문번호</th>
			<th>상품명</th>
			<th>수령인 성명</th>
			<th>수령인 연락처</th>
			<th>수령인 주소</th>
			<th>요청사항</th>
			<th>주문일자</th>
		<c:if test="${empty b_list }">
				<tr><td colspan="7">주문이 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty b_list }">
			<c:forEach var="delivery_buy" items="${b_list }">
				<tr><td>${delivery_buy.db_no }</td>
					<td>${delivery_buy.cm_name }</td>
					<td>${delivery_buy.db_name }</td>
					<td>${delivery_buy.db_tel }</td>
					<td>${delivery_buy.db_address }</td>
					<td>${delivery_buy.db_request }</td>
					<td>${delivery_buy.db_date }</td>
			</c:forEach>
		</c:if>
	</table>
</div>

<div align="center">
	<!-- 앞에 보여줄게 남아있어 -->
	<c:if test="${startPage > PAGE_PER_BLOCK }">
		<button class="pageBtn" onclick="location.href='adminDb.ms?pageNum=1'"><img alt="" src="/highbrix/images/paging11.png"></button>
		<button class="pageBtn" onclick="location.href='adminDb.ms?pageNum=${startPage - 1}'"><img alt="" src="/highbrix/images/paging1.png"></button>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<button class="pageBtn" onclick="location.href='adminDb.ms?pageNum=${i}'">${i }</button>
	</c:forEach>
	<!-- 아직 보여줄게 남아있다 -->
	<c:if test="${endPage < totalPage }">
		<button class="pageBtn" onclick="location.href='adminDb.ms?pageNum=${endPage + 1}'"><img alt="" src="/highbrix/images/paging2.png"></button>
		<button class="pageBtn" onclick="location.href='adminDb.ms?pageNum=${totalPage}'"><img alt="" src="/highbrix/images/paging22.png"></button>
	</c:if>
</div><br>
</body>
</html>
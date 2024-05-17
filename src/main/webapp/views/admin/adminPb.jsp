<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/highbrix/css/admin/admin_list.css");
	table {
	  border-collapse: collapse;
	  width: auto;
	  margin: 1rem auto;
	}
	th, td {
	  padding: 8px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	  text-align: center;
	}
	th {
	  background-color: #FF6244;
	  color: white;
	  font-weight: normal;
	}
	caption {
		font-size: 18px;
		margin-bottom: 10px;
	}
	.btn {
		float: left;
		border: 1px solid #FF6244;
		color: #FF6244;
		font-family: 'SUITE-Regular', sans-serif;
		text-decoration: none;
		display: inline-block;
		font-size: 16px; /* 글꼴 크기 */
		margin: 4px 2px;
		cursor: pointer;
		border-radius: 2px; /* 버튼 모서리 둥글게 */
 b
</style>
</head>
<body>
<script type="text/javascript">

</script>

<div class="container">
	<table><caption>픽업 주문관리</caption>
		<tr><td colspan="6">
			<td><input type="button" value="관리자메인" 
					class="btn main" style="background-color: white"
					onclick="location.href='/highbrix/views/admin/adminMain.jsp'"></td></tr>
		<tr><th>주문번호</th>
			<th>수령인 성명</th>
			<th>수령인 연락처</th>
			<th>요청사항</th>
			<th>주문일자</th>
			<th>수정</th>
			<th>삭제</th></tr>
<c:if test="${empty pb_list }">
		<tr><td colspan="8">주문이 없습니다</td></tr>
</c:if>
<c:if test="${not empty pb_list }">
	<c:forEach var="pickup_buy" items="${db_list }">
		<tr><td>${pickup_buy.pb_no }</td>
			<td>${pickup_buy.pb_name }</td>
			<td>${pickup_buy.pb_tel }</td>
			<td>${pickup_buy.pb_request }</td>
			<td>${pickup_buy.db_date }</td>
			<td><a href="/highbrix/views/admin/pbUpdateForm.ms?pb_no=${pickup_buy.pb_no }">
				<input type="button" class="btn update" value="수정" style="background-color: white"></a></td>
			<td><a onclick="del(${pickup_buy.pb_no })">
				<input type="button" class="btn del" value="삭제" style="background-color: white"></a></td></tr>
			
	</c:forEach>
</c:if>
		<tr><td style="border-bottom: none;">
			<input type="button" class="btn pb" style="background-color: white; " 
				onclick="location.href='/highbrix/views/admin/adminDb.ms'" value="배송주문관리"></td></tr>
	</table>
</div>

<div align="center">
	<!-- 앞에 보여줄게 남아있어 -->
	<c:if test="${startPage > PAGE_PER_BLOCK }">
		<button onclick="location.href='adminPb.ms?pageNum=1'">첫페이지</button>
		<button onclick="location.href='adminPb.ms?pageNum=${startPage - 1}'">◀</button>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<button onclick="location.href='adminPb.ms?pageNum=${i}'">${i }</button>
	</c:forEach>
	<!-- 아직 보여줄게 남아있다 -->
	<c:if test="${endPage < totalPage }">
		<button onclick="location.href='adminPb.ms?pageNum=${endPage + 1}'">▶</button>
		<button onclick="location.href='adminPb.ms?pageNum=${totalPage}'">끝페이지</button>
	</c:if>
</div><br>
</body>
</html>
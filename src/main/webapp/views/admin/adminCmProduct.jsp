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
	function del(cm_no) {
		let con = confirm("선택한 일반상품을 삭제하시겠습니까?");
		if (con) {
			location.href="/highbrix/views/admin/cmDelete.ms?cm_no="+cm_no;
		}
	}
</script>

<div class="container">
	<table><caption>일반 상품관리</caption>
		<tr><td colspan="6" >
			<input type="button" value="상품등록" 
				class="btn_insert" style="background-color: white"
				onclick="location.href='/highbrix/views/admin/cmInsertForm.ms'"></td>
			<td align="right">
			<input type="button" value="관리자메인" 
				class="btn main" style="background-color: white"
				onclick="location.href='/highbrix/views/admin/adminMain.jsp'"></td></tr>
		<tr><th>상품번호</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>재고수량</th>
			<th>등록일</th>
			<th>수정</th>
			<th>삭제</th></tr>
		<c:if test="${empty cm_list }">
				<tr><td colspan="7">상품이 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty cm_list }">
			<c:forEach var="cm_product" items="${cm_list }">
				<tr><td>${cm_product.cm_no }</td>
					<td>${cm_product.cm_name }</td>
					<td>${cm_product.cm_price }</td>
					<td>${cm_product.cm_count }</td>
					<td>${cm_product.cm_date }</td>
					<td><a href="/highbrix/views/admin/cmUpdateForm.ms?cm_no=${cm_product.cm_no }">
						<input type="button" class="btn update" value="수정" style="background-color: white"></a></td>
					<td><a onclick="del(${cm_product.cm_no })">
						<input type="button" class="btn del" value="삭제" style="background-color: white"></a></td></tr>
			</c:forEach>
		</c:if>
	</table>
</div>
<div align="center">
	<!-- 앞에 보여줄게 남아있어 -->
	<c:if test="${startPage > PAGE_PER_BLOCK }">
		<button class="pageBtn" onclick="location.href='adminCmProduct.ms?pageNum=1'"><img alt="" src="/highbrix/images/paging11.png"></button>
		<button class="pageBtn" onclick="location.href='adminCmProduct.ms?pageNum=${startPage - 1}'"><img alt="" src="/highbrix/images/paging1.png"></button>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<button class="pageBtn" onclick="location.href='adminCmProduct.ms?pageNum=${i}'">${i }</button>
	</c:forEach>
	<!-- 아직 보여줄게 남아있다 -->
	<c:if test="${endPage < totalPage }">
		<button class="pageBtn" onclick="location.href='adminCmProduct.ms?pageNum=${endPage + 1}'"><img alt="" src="/highbrix/images/paging2.png"></button>
		<button class="pageBtn" onclick="location.href='adminCmProduct.ms?pageNum=${totalPage}'"><img alt="" src="/highbrix/images/paging22.png"></button>
	</c:if>
</div><br>
</body>
</html>
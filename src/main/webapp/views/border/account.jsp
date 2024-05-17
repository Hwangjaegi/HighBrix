<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	@import url("/highbrix/css/border/border.css")
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<%-- <%@ include file="../member/sessionChk.jsp" %>	<!-- 비회원 구현x --> --%>
	<div class="wrap">
		<div class="cu_border">
			<div class="pdTitle">종합 게시판</div>
			<div class="cu_tableFull">
				<table class="cu_table" border="1">
					<tr class="t_head">
						<th width="10%">번호</th>
						<th width="35%">게시글제목</th>
						<th width="20%">작성자</th>
						<th width="25%">작성일</th>
						<th width="10%">조회수</th>
					</tr>
					<!-- jstl로 조건줘서 데이터받기 -->
					<c:if test="${empty list }">
						<tr class="t_body">
							<th colspan="5">게시글이없습니다</th>
						</tr>
					</c:if>

					<c:if test="${not empty list }">
						<c:forEach var="account" items="${list}">
							<tr class="t_body">
								<td align="center">${num}<c:set var="num" value="${num-1}"></c:set></td>
								<c:if test="${account.a_del=='y'}">
									<th colspan="4">삭제된글입니다</th>
								</c:if>
								<c:if test="${account.a_del!='y' }">
									<td title="${account.a_content }">
										<c:if test="${account.a_level > 0 }">
											<img alt="" src="/highbrix/images/account_img/level.gif"
												height="5" width="${account.a_level * 10 }">
											<img alt="" src="/highbrix/images/account_img/re.gif">
										</c:if>
											<a class="titleChk" href="contentPassChk.cu?a_no=${account.a_no}&pageNum=${currentPage}&password=${account.a_password}">${account.a_title }</a>
										<c:if test="${account.a_view >100 }">
											<img alt="" src="/highbrix/images/account_img/hot.gif">
										</c:if></td>
									<td align="center">${account.name }</td>
									<td align="center">${account.a_date }</td>
									<td align="center">${account.a_view }</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<!-- 1페이지 10개지정 -->
				<section class="cu_BtnBox">
					<div align="center">
						<c:if test="${startPage > PAGE_PER_BLOCK }">
							<button class="pageBtn" onclick="location.href='account.cu?pageNum=${startPage-1}'">이전</button>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<button class="pageBtn" onclick="location.href='account.cu?pageNum=${i }'">${i }</button>
						</c:forEach>
						<c:if test="${endPage < totalPage }">
							<button class="pageBtn" onclick="location.href='account.cu?pageNum=${endPage+1}'">다음</button>
						</c:if>
					</div>
					<!-- 버튼을 클릭하면 글쓰기폼이동 -->
					<div align="center">
						<button class="pageBtn" id="cu_Btn" onclick="location.href='writeForm.cu?a_no=0&pageNum=1'">글쓰기</button>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>
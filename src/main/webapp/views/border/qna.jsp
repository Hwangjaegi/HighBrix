<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글폰트적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&family=Lora:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">

<style type="text/css">
@import url("/highbrix/css/border/border.css")
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>

</head>
<body>
	<div class="wrap">
		<!-- web Start -->
		<main>
			<!-- 게시판 main start -->
			<div class="cu_menu">
				<h1>고객센터</h1>
				<hr class="cu_line">
				<ul>
					<li class="notice" onclick="location.href='account.cu'"><a>공지사항</a></li>
					<li class="QnA"><a>Q&A</a></li>
				</ul>
			</div>

			<div class="cu_border">
				<span class="cu_guide">HOME>고객센터>Q&A</span>
				<hr>
				<h1>Q&A 게시판[데이터베이스 구성 시 추가합니다]</h1>
				<div class="cu_tableFull">
					<table class="cu_table" border="1">
						<tr class="t_head">
							<th width="10%">번호</th>
							<th width="50%">게시글제목</th>
							<th width="15%">작성자</th>
							<th width="15%">작성일</th>
							<th width="10%">조회수</th>
						</tr>
						
						<tr><th colspan="5">데이터베이스 생성시 추가합니다</th></tr>
						<%--<c:if test="${empty list }">
							<tr class="t_body">
								<th colspan="5">게시글이없습니다</th>
							</tr>
						</c:if>

						 <c:if test="${not empty list }">
							<c:forEach var="list" items="${list}">
								<tr class="t_body">
									<td align="center">${num}<c:set var="num" value="${num-1}"></c:set></td>
									<c:if test="${list.a_del=='y'}">
										<th colspan="4">삭제된글입니다</th>
									</c:if>
									<c:if test="${list.a_del!='y' }">
										<td title="${list.a_content }"><c:if
												test="${list.a_level > 0 }">
												<img alt="" src="/highbrix/images/account_img/level.gif"
													height="5" width="${list.a_level * 10 }">
												<img alt="" src="/highbrix/images/account_img/re.gif">
											</c:if> <a href="content.cu?num=${list.a_no}&pageNum=${currentPage}">${list.a_title }</a>
											<c:if test="${list.a_view >100 }">
												<img alt="" src="/highbrix/images/account_img/hot.gif">
											</c:if></td>
										<td align="center">${list.a_title }</td>
										<td align="center">${list.a_date }</td>
										<td align="center">${list.a_view }</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if> --%>
					</table>
					<!-- 1페이지 10개지정 -->
					<section class="cu_BtnBox">
						<div align="center">
							<c:if test="${startPage > PAGE_PER_BLOCK }">
								<button class="cu_Btn" onclick="location.href='account.cu?pageNum=${startPage-1}'">이전</button>
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<button class="cu_Btn" onclick="location.href='account.cu?pageNum=${i }'">${i }</button>
							</c:forEach>
							<c:if test="${endPage < totalPage }">
								<button class="cu_Btn" onclick="location.href='account.cu?pageNum=${endPage+1}'">다음</button>
							</c:if>
						</div>
						<!-- 버튼을 클릭하면 글쓰기폼이동 -->
						<div align="center">
							<button class="cu_writeBtn" onclick="location.href='writeForm.cu?num=0&pageNum=1'">글쓰기</button>
						</div>
					</section>
				</div>
			</div>
		</main>

	</div>
	<!-- web end -->
</body>
</html>
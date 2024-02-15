<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/border/border.css")
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
/* 	$(function(){
		$(".cu_border").load("/highbrix/views/border/notice.jsp .cu_main"); //jQuery - load 기능으로 다른페이지 업로드
	}); */ // 추후 기능사용가능
</script>
</head>
<body>
	<div class="wrap"> <!-- web Start -->
		<header>
			<div class="top">
				<!-- 로그인/회원가입 -->
				<div class="logo-login">
					<div class="logo">
						<a href="/highbrix/dpMain.do"><img alt="하이브릭스 로고"
							src="/highbrix/images/highbrix.png"></a>
					</div>
					<!-- 하이브릭스 이미지로고 -->
					<div class="login">
						<!-- loginForm 기능구현 -->
						<a href="loginForm.do">로그인</a>/<a href="join.do">회원가입</a>
					</div>
				</div>
			</div>
			<form action="searchForm.do"> <!-- searchForm : 검색기능구현 -->
				<div class="search">
					<input type="text" name="search" placeholder="검색내용입력">
					<input type="submit" value="검색">
				</div>
		</form>
		
		<div class="menu">
			<div class="icon"> <!-- icon : 카테고리기능구현 -->
				<input type="checkbox" id="menuicon"> 
					<label for="menuicon">
						<span></span>
						<span></span>
						<span></span>
					</label>
					<div class="sidebar"> <!-- icon클릭 시 카테고리 사이드바 구현 -->
					<ol>
						<li><a href="">과일</a></li>
						<li><a href="">과일선물세트</a></li>
						<li><a href="">컵과일</a></li>
						<li><a href="">과일주스</a></li>
						<li><a href="">정기구독과일</a></li>
						<li><a href="">뭐먹고싶어?</a></li>
					</ol>
				</div>
			</div>
				
			<div class="menu_list"> <!-- 상단메뉴 list -->	
				<ul>
					<li><a href="">상품</a></li>
					<li><a href="">SALE</a></li>
					<li><a href="">정기구독</a></li>
					<li><a href="">사다드림</a></li>
					<li><a href="customer.cu">고객센터</a></li>
				</ul>
			</div>
		</div>
		</header> <!-- 헤더 end -->
		
		<main> <!-- 게시판 main start -->
			<div class="cu_menu">
				<h1>고객센터</h1>
				<hr class="cu_line">
				<ul>
					<li class="notice"><a>공지사항</a></li>
					<li class="QnA"><a>Q&A</a></li>
				</ul>
			</div>
			
			<div class="cu_border">
				<span>HOME>고객센터>공지사항</span>
				<hr>
				<h1>Q&A 게시판</h1>
				<div class="cu_tableFull">
					<table border="1" class="cu_table">
						<tr class="t_head"><th width="10%">번호</th><th width="50%">게시글제목</th><th width="15%">작성자</th><th width="15%">작성일</th><th width="10%">조회수</th></tr>
						<!-- jstl로 조건줘서 데이터받기 -->
						<c:if test="${empty list }">
							<tr><th colspan="5">게시글이없습니다</th>
						</c:if>
						
						<c:if test="${not empty list }">
							<c:forEach var="acount" items="${list}">
								<tr><td>${num}<c:set var="num" value="${num-1}"></c:set></td>
								<c:if test="${acount.a_del=='y'}">
									<th colspan="4">삭제된글입니다</th>
								</c:if>
								<c:if test="${acount.a_del!='y' }">
									<td title="${acount.a_content }">
										<c:if test="${acount.a_level > 0 }">
											<img alt="" src="/highbrix/images/acount_img/level.gif" height="5" width="${acount.a_level * 10 }">
											<img alt="" src="/highbrix/images/acount_img/re.gif">
										</c:if>
										
										<a href="content.cu?num=${acount.a_no}&pageNum=${currentPage}">${acount.a_title }</a>
										<c:if test="${acount.a_view >100 }">
											<img alt="" src="/highbrix/images/acount_img/hot.gif">
										</c:if>
									</td>
									<td>${acount.a_title }</td>
									<td>${acount.a_date }</td>
									<td>${acount.a_view }</td>
								</c:if></tr>
							</c:forEach>
						</c:if>
					</table>
					<!-- 1페이지 10개지정 -->
					<div align="center">
						<c:if test="${startPage > PAGE_PER_BLOCK }">
							<button onclick="location.href='customer.cu?pageNum=${startPage-1}'">이전</button>
						</c:if>
						<c:forEach var = "i" begin ="${startPage }" end = "${endPage }">
							<button onclick="location.href='customer.cu?pageNum=${i }'">${i }</button>
						</c:forEach>
						<c:if test="${endPage < totalPage }">
							<button onclick="location.href='customer.cu?pageNum=${endPage+1}'">다음</button>
						</c:if>
					</div>
				<!-- 버튼을 클릭하면 글쓰기폼이동 -->
					<div align="center">
						<button onclick="location.href='writeForm.cu?num=0&pageNum=1'">글쓰기</button>
					</div>
				</div>
			</div>
		</main>

	</div><!-- web end -->
</body>
</html>
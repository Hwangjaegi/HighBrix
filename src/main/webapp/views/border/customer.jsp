<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="service.display.*"%><!-- Controller이용위해 임포트 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/border/customer.css")
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
	//jQuery - load 기능으로 다른페이지 업로드
	$(function(){
		$(".cu_borard").load("announce.jsp .cu_main");
	});
</script>
</head>
<body>
	<div class="wrap">
		<!-- 전체 웹페이지 div -->
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
					<li><a href="/highbrix/customer.do">고객센터</a></li>
				</ul>
			</div>
		</div>
		</header> <!-- 헤더 end -->
		
		<main>
			<div class="cu_menu">
				<h1>고객센터</h1>
				<hr class="cu_line">
				<ul>
					<li class="announce" onclick="location.href='announce.cu'"><a>공지사항</a></li>
					<li class="announce"><a>Q&A</a></li>
				</ul>
			</div>
			
			<!-- jQuery의 load기능으로 announce.jsp를 가져옴 -->
			<div class="cu_borard"></div>
		</main>
		
		
	</div><!-- web end -->
</body>
</html>
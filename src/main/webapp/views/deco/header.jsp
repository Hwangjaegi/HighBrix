<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/display/header.css"); /* 디스플레이 css 연동 */
</style>
</head>
<body>
	<div class="header">
		<header>
			<div class="top">
				<!-- 로그인/회원가입 -->
				<div class="logo-login">
					<div class="logo">
						<a href="/highbrix/dpMain.do"><img alt="하이브릭스 로고" src="/highbrix/images/highbrix.png"></a>
					</div>
					<!-- 하이브릭스 이미지로고 -->
					<div class="login">
						<!-- loginForm 기능구현 -->
						<a href="../member/loginForm.yj">로그인</a><a
							href="../member/joinForm.yj"
						>회원가입</a>
					</div>
				</div>
			</div>
			<form action="searchForm.do">
				<!-- searchForm : 검색기능구현 -->
				<div class="search">
					<input type="text" name="search" placeholder="검색내용입력"> 
					<input type="submit" value="검색"	>
				</div>
			</form>
			<nav class="menu">

				<div class="icon">
					<!-- icon : 카테고리기능구현 -->
					<input type="checkbox" id="menuicon"> <label for="menuicon">
						<span></span> <span></span> <span></span>
					</label>
					<div class="sidebar">
						<!-- icon클릭 시 카테고리 사이드바 구현 -->
						<ol>
							<li><a href="product.do">과일</a></li>
							<!-- 상품페이지연동 -->
							<li><a href="product_Gift.do">과일선물세트</a></li>
							<li><a href="product_Cup.do">컵과일</a></li>
							<li><a href="product_Juice.do">과일주스</a></li>
							<li><a href="product_Gudoc.do">정기구독과일</a></li>
							<li><a href="product_Other.do">기타</a></li>
						</ol>
					</div>
				</div>

				<div class="menu_list">
					<!-- 상단메뉴 list -->
					<ul>
						<!-- 카테고리 테스트입니다 -->
						<li><a href="../display/cmproductList.mk">상품</a></li>
						<li><a href="../display/disproductList.mk">SALE</a></li>
						<li><a href="product_Gudoc.do">정기구독</a></li>
						<li><a href="account.cu">고객센터</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- 헤더구현 종료 -->
	</div>
</body>
</html>
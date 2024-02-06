<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL선언 -->
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/display.css");	/* 디스플레이 css 연동 */
@import url("/highbrix/css/icon.css");		/* 아이콘 css 연동 */
</style>
</head>

<body>
<div class="wrap"> <!-- 전체 웹페이지 div -->
	<header>
		<div class="top"> <!-- 로그인/회원가입 -->
	    	<div class="logo-login">
	        	<div class="logo">
	            	<img alt="highbrix" src="/highbrix/images/highbrix.png">
	        	</div> <!-- 하이브릭스 이미지로고 -->
	        	<div class="login"> <!-- loginForm 기능구현 -->
	            	<a href="loginForm.do" >로그인</a>/<a href="join.do">회원가입</a>
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
					<li><a href="">고객센터</a></li>
				</ul>
			</div>
		</div>
	</header> <!-- 헤더구현 종료 -->
	
	<nav> <!-- 네비게이션바 구현 -->
		<a href=""><img id="arow" alt="이전" src="/highbrix/images/arow.png"> </a>	<!-- [<]버튼구현 -->
		<a href=""><img id="arow2" alt="다음" src="/highbrix/images/arow2.png"> </a> <!-- [>]버튼구현 -->
		<div class="nav_bar"> <!-- 네비게이션바 크기 [1920 x 600] -->
			<ul>
				<li><a href="subscribe.do"><img alt="네비게이션바" src="/highbrix/images/test.jpg"></a>
			</ul>
		</div>
	</nav> <!-- 네비게이션바 구현 종료 -->
	
	<main><!-- 메인구현 시작 -->
		<div class="main_content">
			<p class="mainText1">이 물품은 어떠세요?</p>
			<ul class="pdList"> <!-- 상품리스트 -->
				<li class="pdListCon">
					<div class="imgWrap">
						<a href="">
							<img alt="스테비아청귤" src="/highbrix/images/product_img/fruit1.jpg">
						</a>
					</div>
					<div class="txtWrap"><p><a href="">스테비아청귤(1kg)</a><p>
						<div class="pdPrice"><a href="">9900원</a></div>
						<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
					</div>	
				</li> <!-- 청귤 완료 -->
				<li class="pdListCon">
					<div class="imgWrap">
						<a href="">
							<img alt="스테비아청귤" src="/highbrix/images/product_img/fruit1.jpg">
						</a>
					</div>
					<div class="txtWrap"><p><a href="">스테비아청귤(1kg)</a><p>
						<div class="pdPrice"><a href="">9900원</a></div>
						<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
					</div>
				</li>
				<li class="pdListCon">
					<div class="imgWrap">
						<a href="">
							<img alt="스테비아청귤" src="/highbrix/images/product_img/fruit1.jpg">
						</a>
					</div>
					<div class="txtWrap"><p><a href="">스테비아청귤(1kg)</a><p>
						<div class="pdPrice"><a href="">9900원</a></div>
						<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
					</div>
				</li>
				<li class="pdListCon">
					<div class="imgWrap">
						<a href="">
							<img alt="스테비아청귤" src="/highbrix/images/product_img/fruit1.jpg">
						</a>
					</div>
					<div class="txtWrap"><p><a href="">스테비아청귤(1kg)</a><p>
						<div class="pdPrice"><a href="">9900원</a></div>
						<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
					</div>
				</li>
			</ul>
		</div>
	</main>
</div>
</body>
</html>
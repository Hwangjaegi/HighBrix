<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL선언 -->
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url("../../css/display.css");
@import url("../../css/icon.css");
</style>
</head>
<body>
<div class="wrap">
	<header>
	<div class="top">
		<img alt="highbrix" src="../../images/highbrix.jpg">
			<div id="login">
				<a href="login.do" >로그인</a>/<a href="join.do">회원가입</a>
			</div> <!-- login [div] -->
			<form action="search.do">
				<div id="search">
					<input type="text" name="search" placeholder="검색내용입력">
					<input type="submit" value="검색">
				</div>
			</form>
	</div> <!-- header [div] -->
	
			<!-- icon 설정 -->
			<div class="icon">
				<input type="checkbox" id="menuicon"> 
				<label for="menuicon">
					<span></span>
					<span></span>
					<span></span>
				</label>
				<div class="sidebar">
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
			
	<!-- 상단메뉴 list -->		
	<div class="menu">
		<ul>
			<li><a href="sale.do">할인품목</a></li>
			<li><a href="subscribe.do">정기구독</a></li>
			<li><a href="groupbuy.do">사다드림</a></li>
			<li><a href="customer.do">고객센터</a></li>
		</ul>
	</div>
	</header>
	<!-- 메인 구역 구현 -->
	<a href=""><img id="arow" alt="다음" src="../../images/arow.png"> </a>
	<a href=""><img id="arow2" alt="다음" src="../../images/arow2.png"> </a>
	<div class="main">
		<a href="subscribe.do"><img alt="네비게이션바" src="../../images/test.jpg"></a>
	</div>
</div>
</body>
</html>
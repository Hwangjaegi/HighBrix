<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/display/header2.css");
/* 디스플레이 css 연동 */
.nav-click {
    color: black;
    text-decoration: none;
}
#TopBtn{
	border-radius: 30px;
    width: 50px;
    height: 50px;
 	position: fixed;
    top: 800px;
    left: 1800px;
    background:aqua;
    z-index: 1; 
}
</style>
<script type="text/javascript">
	function nullChk() {
		let nullchk = document.getElementById("searchText").value;
		if (!nullchk) {
			alert("검색내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	//Top버튼 클릭 시 최상단이동
	function TopBtn() {
	    window.scrollTo({
	        top: 0,
	        behavior: 'smooth' // 부드러운 스크롤 효과 적용
	    });
	}
</script>
</head>
<body>
	<header>
		<nav class="menu">
			<div class="header-container">
				<!-- 상단메뉴 list -->
				<ul class="nav-container">
					<li class="nav-item">
						<a href="../display/dpMain.do">
						<img id="logo" alt="하이브릭스 로고" src="/highbrix/images/hb_logo01.png" width="350"></a></li>
				</ul>
				<ul class="nav-container2">
					<!-- 카테고리 테스트입니다 -->
					<li id="nav-text"><a class="nav-click" href="../display/cmproductList.mk">상품</a></li>
					<li id="nav-text"><a class="nav-click" href="../display/disproductList.mk">SALE</a></li>
					<li id="nav-text"><a class="nav-click" href="../display/productGudoc.mk">정기구독</a></li>
					<li id="nav-text"><a class="nav-click" href="../border/account.cu">고객센터</a></li>
				</ul>
				<ul class="nav-container3">
					<li class="search"  id="nav-text1">
						<form action="/highbrix/views/display/search.do"
							onsubmit="return nullChk()">
							<input class="searchText" type="text" name="search"
									placeholder="검색내용입력"
									style="background-color: white; border: 1px solid #ccc;">
							<input class="searchBtn" type="submit" value="검색">
						</form>
					</li>
				</ul>
				<ul class="nav-container4">				
					<%
					/* String = session이므로 형변환 */
					String session_id = (String) session.getAttribute("id");
					if (session_id == null) {
					%>
						<li id="nav-btn"><a href="../member/loginForm.yj"><button id="login-btn">로그인</button></a></li>
						<li id="nav-btn"><a href="../member/joinForm.yj"><button id="login-btn">회원가입</button></a></li>
						<li id="nav-btn"><a onclick="TopBtn()"><button id="login-btn2">Top</button></a></li>				
					<%
					} else if (session_id.equals("admin")) {
					%>
						<li id="nav-btn"><a href="../member/logout.yj"><button id="login-btn">로그아웃</button></a></li>
						<li id="nav-btn"><a href="../admin/adminMain.ms"><button id="login-btn">관리자페이지</button></a></li>
						<li id="nav-btn"><a onclick="TopBtn()"><button id="login-btn2">Top</button></a></li>
					<%
					} else {
					%>
						<li id="nav-btn"><a href="../member/logout.yj"><button id="login-btn">로그아웃</button></a></li>
						<li id="nav-btn"><a href="../member/myPageForm.yj"><button id="login-btn">마이페이지</button></a></li>
						<li id="nav-btn"><a onclick="TopBtn()"><button id="login-btn2">Top</button></a></li>
					<%
					}
					%>
				</ul>
			</div>				
		</nav>
	</header>
	<!-- 헤더구현 종료 -->
</body>
</html>
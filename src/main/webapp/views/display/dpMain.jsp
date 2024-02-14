<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL선언 -->
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/display/display.css");	/* 디스플레이 css 연동 */
@import url("/highbrix/css/display/icon.css");		/* 아이콘 css 연동 */
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){	/* 할인상품 텍스트 애니메이션 추가 */
		let pdListText1 = document.querySelector('.pdListText')
		window.addEventListener('scroll',function(){
			 let value = window.scrollY
			 console.log("scrollY",value)
			 if(value<2000){
				pdListText1.style.animation='disappear 1s ease-out forwards'
			 }else if(value>2000 && value<3200){
				pdListText1.style.animation='slide 1s ease-out forwards'
			 }else if(value>3200){
				pdListText1.style.animation='disappear 1s ease-out forwards'
			 }
		});
	});
	
</script>
</head>

<body>
<div class="wrap"> <!-- 전체 웹페이지 div -->
	<header>
		<div class="top"> <!-- 로그인/회원가입 -->
	    	<div class="logo-login">
	        	<div class="logo">
	            	<a href="/highbrix/dpMain.do"><img alt="하이브릭스 로고" src="/highbrix/images/highbrix.png"></a>
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
					<li><a href="customer.cu">고객센터</a></li>	
				</ul>
			</div>

		</div>
	</header> <!-- 헤더구현 종료 -->
		<div class="nav_bar"> <!-- 네비게이션바 크기 [1920 x 600] -->
			<ul>
				<li><a href="subscribe.do"><img alt="네비게이션바" src="/highbrix/images/highbrixnav.png"></a>
			</ul>
		</div>
	
	<main><!-- 메인구현 시작 -->
		<div class="main_content">
			
			<p class="mainText1">이 물품은 어떠세요?</p>
			<div class="pdList">
				<ul> <!-- 상품리스트 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="스테비아청귤" src="/highbrix/images/product_img/apple.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">꿀 예산 사과(1kg)</a><p>
							<div class="pdPrice"><a href="">29,900원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>	
					</li> <!-- 청귤 완료 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="예산 부사사과" src="/highbrix/images/product_img/pear.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="" vlink="black">나주 신고배(1kg)</a><p>
							<div class="pdPrice"><a href="">15,000원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="나주 배" src="/highbrix/images/product_img/strawberry.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">산청 설향딸기(500g)</a><p>
							<div class="pdPrice"><a href="">15,000원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="스테비아청귤" src="/highbrix/images/product_img/mandarin.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">타이벡 감귤1박스[5kg]</a><p>
							<div class="pdPrice"><a href="">39,900원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
				</ul>
			</div>
			<div class="pdList">
				<ul> <!-- 상품리스트 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="허니파인애플" src="/highbrix/images/product_img/pineapple.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">허니글로우 파인애플[1통]</a><p>
							<div class="pdPrice"><a href="">7,000원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>	
					</li> <!-- 청귤 완료 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="태국망고" src="/highbrix/images/product_img/mango.jpg">
							</a>
						</div> 
						<div class="txtWrap"><p><a href="">태국망고[2개]</a><p>
							<div class="pdPrice"><a href="">9,900원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="애플망고" src="/highbrix/images/product_img/applemango.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">애플망고[2개]</a><p>
							<div class="pdPrice"><a href="">19,900원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="샤인머스켓" src="/highbrix/images/product_img/Shine.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">샤인머스켓[1박스]</a><p>
							<div class="pdPrice"><a href="">29,900원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
				</ul>
			</div>
			
			<p class="mainText1">할인 상품</p>
			<div class="pdList">
				<ul> <!-- 상품리스트 -->
					<li class="pdListCon">
						<div class="pdListText">
							<h1>놓치기 아쉬운</h1>
							<h2>할인 상품</h2>	
							-------------<p>
						
							<h3>할인하는 과일을</h3><p>
							<h3>지금바로 만나보세요!</h3><p>
							<button>더보기</button> <!-- 할인상품page이동 -->
						
						</div>
					</li> <!-- 청귤 완료 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="토망고" src="/highbrix/images/product_img/tomato.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">스테비아 토망고(500g)</a><p>
							<div class="pdPrice">
								<a href="">6,500원</a><br>
								<a href="" id="pritest">8,000원</a><br>
								★★★★★
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>	
					</li> <!-- 청귤 완료 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="별마토" src="/highbrix/images/product_img/tomato2.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">스테비아 별마토(500g)</a><p>
							<div class="pdPrice">
								<a href="">7,000원</a><br>
								<a href="" id="pritest">9,000원</a><br>
								★★★★★
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="젤리마토" src="/highbrix/images/product_img/tomato3.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">스테비아 젤리마토(500g)</a><p>
							<div class="pdPrice">
								<a href="">7,000원</a><br>
								<a href="" id="pritest">9,000원</a><br>
								★★★★★
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
				</ul>
			</div>
			<p class="mainText1">새롭게 등장한<br> 신상품</p>
			<div class="pdList">
				<ul> <!-- 상품리스트 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="피치애플" src="/highbrix/images/product_img/peachapple.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">피치애플(1kg)</a><p>
							<div class="pdPrice"><a href="">15,000원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>	
					</li> <!-- 청귤 완료 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="파파야메론" src="/highbrix/images/product_img/papayamelon.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">파파야메론(2개)</a><p>
							<div class="pdPrice"><a href="">10,000원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="신데렐라딸기" src="/highbrix/images/product_img/strawberry2.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">신데렐라딸기(500g)</a><p>
							<div class="pdPrice"><a href="">10,000원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="스테비아자몽" src="/highbrix/images/product_img/jamong.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">스테비아자몽(1kg)</a><p>
							<div class="pdPrice"><a href="">12,900원</a><p>
								<span>★★★★★</span>
							</div>
							<div class="cart"><a href=""><img alt="장바구니" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</main>

<footer class ="footer">
	<hr>
	<div class="footerText">
		<h3>프로젝트명 : 하이브릭스 / 조원 : 황재기,정민권,한민서,김예지</h3>
		<a href="/highbrix/dpMain.do"><img alt="하이브릭스 로고" src="/highbrix/images/highbrix.png"></a>
	</div>
</footer>
</div>
</body>
</html>
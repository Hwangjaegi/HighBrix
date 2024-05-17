<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL선언 -->
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("/highbrix/css/display/display.css");	/* 디스플레이 css 연동 */
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
	let cartBtn = false;
	
	$(function(){	/* 할인상품 텍스트 애니메이션 추가 */
		let pdListText1 = document.querySelector('.pdListText')
		window.addEventListener('scroll',function(){
			 let value = window.scrollY
			 console.log("scrollY",value)
			 if(value<933){
				pdListText1.style.animation='disappear 1s ease-out forwards'
			 }else if(value>933 && value<1600){
				pdListText1.style.animation='slide 1s ease-out forwards'
			 }else if(value>1600){
				pdListText1.style.animation='disappear 1s ease-out forwards'
			 }
		});
	});
	//main 장바구니
	function cartChk(productImg, productName , productCm_no , id) {
	    let cartIcon = document.getElementById("carticon-" + productName);
	    let isActive = cartIcon.classList.contains('active');
	    let c_count = 1;

	    if (${empty id}) {
	        alert("로그인 후 이용해 주시기 바랍니다");
	        location.href = "/highbrix/views/member/loginForm.yj";
	        return false;
	        
	    } else {
	        if (isActive) {
	            alert(productName + " 상품이 장바구니에서 삭제되었습니다.");
	        } else {
	            let cartAdd = confirm(productName + " 상품을 장바구니에 추가하시겠습니까?");
	            if(cartAdd){
		             // 장바구니에 상품을 추가하는 Ajax 요청을 보냅니다.
			         addToCart(productCm_no, id , c_count);
	            }else return false;

	        }
	        cartIcon.classList.toggle('active');
	        const cartImg = isActive ? "${img}" : "${fimg}";
	        document.getElementById("carticon-" + productName).src = cartImg;
	    }
	}
	function addToCart(cm_no, id , c_count) {
	    // Ajax를 사용하여 서버에 상품 추가 요청을 보냅니다.
	    let xhr = new XMLHttpRequest();																	/* 개수가미리 1개 올라가서 방지용으로 -1 */
	    xhr.open("POST", "/highbrix/views/member/cartInsert.ms?cm_no=" + cm_no + "&id=" + id + "&c_count=" + (c_count-1),true);
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === XMLHttpRequest.DONE) {
	            if (xhr.status === 200) {
	                // 상품이 성공적으로 추가되면, 이동할 페이지로 이동합니다.
	                location.href = "/highbrix/views/member/cartInsert.ms?cm_no="+ cm_no + "&id=" + id + "&c_count=" + c_count; // 장바구니 페이지의 URL로 변경
	            } else {
	                console.error("상품 추가 실패: " + xhr.responseText);
	            }
	        }
	    };
	    xhr.send();
	}
</script>
<style type="text/css">
.sub-middle-layout { /* 푸터 미들레이아웃 밀어내기 */
	height:2850px;
}
</style>
</head>
<body>
<%@ include file="/decorator/navImgSlide.html" %>	<!-- 부트스트랩 추가시 display.css가 부분적으로안먹힘 -->

<div class="wrap"> <!-- 전체 웹페이지 div -->
<!-- 메인구현 시작 -->
		<div class="main_content">
			<p class="mainText1">이 물품은 어떠세요?</p>
			<div class="pdList">
				<ul> <!-- 상품리스트 -->
					<c:if test="${empty list }">
						<li>데이터가 없습니다</li>
					</c:if>
					<c:if test="${not empty list }"><c:forEach var="product"  items="${list }">
						<li class="pdListCon">
							<div class="imgWrap">
								<a href="productContent.mk?cm_no=${product.cm_no }">
									<img alt="${product.cm_name }" src="/highbrix/images/product_img/${product.cm_image }">
								</a>
							</div>
							<div class="txtWrap"><p><a href="productContent.mk?cm_no=${product.cm_no }">${product.cm_name }</a><p>
								<div class="pdPrice"><a href="productContent.mk?cm_no=${product.cm_no }">${product.cm_price }원</a><p></div>
								<div class="cart" onclick="cartChk('${product.cm_image}', '${product.cm_name}','${product.cm_no}','${id }')">
    								<img id="carticon-${product.cm_name}" class="cart-icon" alt="장바구니" src="${img}">
								</div>
							</div>	
						</li>
					</c:forEach></c:if>
				</ul>
			</div>
			
			<!-- 할인상품 -->
			<p class="mainText1">할인 상품</p>
			<div class="pdList2">
				<ul> <!-- 상품리스트 -->
					<c:if test="${empty list2 }">
						<li>데이터가없습니다</li>
					</c:if>
					<li class="pdListCon">
						<div class="pdListText">
							<h1>놓치기 아쉬운</h1>
							<h2>할인 상품</h2>	
							-------------<p>
						
							<h3>할인하는 과일을</h3><p>
							<h3>지금바로 만나보세요!</h3><p>
							<button class="moreBtn" onclick="location.href='disproductList.mk'">더보기</button> <!-- 할인상품page이동 -->
						</div>
					</li> <!-- 청귤 완료 -->
					<c:if test="${not empty list2 }"><c:forEach var="product_dis" items="${list2 }">
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="productContent.mk?cm_no=${product_dis.cm_no }">
								<img alt="${product_dis.cm_name }" src="/highbrix/images/product_img/${product_dis.cm_image }">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">${product_dis.cm_name }</a><p>
							<div class="pdPrice">
							<a><fmt:formatNumber value="${product_dis.cm_price- product_dis.cm_discount * product_dis.cm_price/100 }"
									pattern="#">
								</fmt:formatNumber>원</a><br>
								<span class ="pdDis" style="text-decoration: line-through;">${product_dis.cm_price}원</span>
							</div>
							<div class="cart" onclick="cartChk('${product_dis.cm_image}', '${product_dis.cm_name}','${product_dis.cm_no}','${id }')">
    							<img id="carticon-${product_dis.cm_name}" class="cart-icon" alt="장바구니" src="${img}">
							</div>
						</div>	
					</li> 
					</c:forEach></c:if>
				</ul>
			</div>
			<p class="mainText1">새롭게 등장한<br> 신상품</p>
			<div class="pdList">
				<ul> <!-- 상품리스트 -->
					<c:if test="${empty list3 }">
						<li>상품이 없습니다</li>
					</c:if>
					<c:if test="${not empty list3 }"><c:forEach var="product_new" items="${list3 }">
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="productContent.mk?cm_no=${product_new.cm_no }">
								<img alt="${product_new.cm_name }" src="/highbrix/images/product_img/${product_new.cm_image }">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">${product_new.cm_name }</a><p>
							<div class="pdPrice"><a href="">${product_new.cm_price }원</a><p>
							</div>
							<div class="cart" onclick="cartChk('${product_new.cm_image}', '${product_new.cm_name}','${product_new.cm_no}','${id }')">
    							<img id="carticon-${product_new.cm_name}" class="cart-icon" alt="장바구니" src="${img}">
							</div>
						</div>	
					</li> <!-- 청귤 완료 -->
					</c:forEach></c:if>
				</ul>
			</div>
			<div style="width: 100%; height:400px; margin:0 auto;">
				<div style="width: 1000px; height:400px; margin: 0 auto; text-align: center; overflow: hidden; margin-top: 150px;">
					<c:if test="${empty review }">
						<h2>비어있는 리뷰입니다</h2>
					</c:if>
					<c:if test="${not empty review }">
					<div id="reviewList" style="width: 300px; height: 100%; float: left;  display: flex; align-items: center; justify-content: center;">
		    			<div style="margin-bottom: 150px">
						<h2 style="font-weight: bold;">하이브릭스 회원님의</h2><p>
						<h3 style="font-weight: bold;">생생한 후기 [최신4항목]</h3>
						</div>
					</div>
						<c:forEach var="review" items="${review}">
							<div id="reviewList" style="width: 150px; height: 400px; float: left; margin:0 10px;">
								<c:if test="${review.r_image == null }">
									<img align="middle" width="100%" height="160" alt="리뷰사진" src="/highbrix/images/user.png">					
								</c:if>
								<c:if test="${review.r_image != null }">
									<img align="middle" width="100%" height="160" alt="리뷰사진" src="/highbrix/images/review_img/${review.r_image }">						
								</c:if>
								<hr>
								<h5 style="font-weight: bold;">${review.r_title }</h5>
								<hr>
								<h6 style="font-weight: bold;">${review.r_content }</h6>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
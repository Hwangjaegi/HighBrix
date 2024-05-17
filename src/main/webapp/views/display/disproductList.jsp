<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할인 상품</title>
<style type="text/css">
	@import url("/highbrix/css/display/display.css?after");	/* 디스플레이 css 연동 */
	.sub-middle-layout {
	    margin-bottom: 150px;
	}

</style>
<script type="text/javascript">
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
</head>
<body style="overflow-x: hidden">
	<main>
	<div class="pdcontainer">
		<div class="pdTitle">할인 상품	</div>
		<ul class="pdList">
			<c:if test="${empty disproductList}">
				<li>데이터가 없습니다</li>
			</c:if>
			<c:if test="${not empty disproductList}">
				<c:forEach var="disproductList" items="${disproductList }">
					<!-- 상품리스트 -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="productContent.mk?cm_no=${disproductList.cm_no}"><img src="/highbrix/images/product_img/${disproductList.cm_image }"></a>
						</div>
						<div class="txtWrap">
							<p><a href="productContent.mk?cm_no=${disproductList.cm_no }">${disproductList.cm_name }</a>
							<div class="pdPrice">
								<a><fmt:formatNumber value="${disproductList.cm_price- disproductList.cm_discount* disproductList.cm_price/100 }"
									pattern="#">
								</fmt:formatNumber>원</a>
								<p>
							</div>
							<div class="cart" onclick="cartChk('${disproductList.cm_image}', '${disproductList.cm_name}','${disproductList.cm_no}','${id }')">
    							<img id="carticon-${disproductList.cm_name}" class="cart-icon" alt="장바구니" src="${img}">
							</div>
						</div>
					</li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	<div class="page" align="center">
		<!-- 앞에 보여줄께 있어 -->
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button class="pageBtn" onclick="location.href='disproductList.mk?pageNum=${startPage-1}'"><img alt="" src="/highbrix/images/paging1.png"></button>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<button class="pageBtn" onclick="location.href='disproductList.mk?pageNum=${i}'">${i}</button>
		</c:forEach>
		<!-- 아직 보여줄께 남아있다 -->
		<c:if test="${endPage < totalPage}">
			<button	class="pageBtn" onclick="location.href='disproductList.mk?pageNum=${endPage+1}'"><img alt="" src="/highbrix/images/paging2.png"></button>
		</c:if>
	</div>
	</main>
</body>
</html>
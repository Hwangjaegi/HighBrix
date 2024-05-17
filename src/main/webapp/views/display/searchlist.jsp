<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 페이지</title>
<style type="text/css">
	@import url("/highbrix/css/display/display.css?after");
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
<body>
	<div class="pdTitle">
		<h2>조회 상품</h2>
	</div>
	<div class="searchlist_content">
		<div class="searchList">
			<ul>
				<c:if test="${empty searchlist}">
					<li class="search_null">
						<h1>조회된 상품이 존재하지 않습니다</h1><p>
						<h2>새로운 상품을 조회해보세요~</h2>
					</li>
				</c:if>
				<c:if test="${not empty searchlist}">
				<c:forEach var="searchlist" items="${searchlist }">
					<!-- 상품리스트 -->
					<li class="searchListCon">
						<div class="imgWrap">
							<a href="productContent.mk?cm_no=${searchlist.cm_no}">
							<img width="390" height="500" alt="${searchlist.cm_image }" src="/highbrix/images/product_img/${searchlist.cm_image }"></a>
						</div>
						<div class="txtWrap">
							<p><a href="productContent.mk?cm_no=${searchlist.cm_no }">${searchlist.cm_name }</a>
							<div class="pdPrice">
								<a href="productContent.mk?cm_no=${searchlist.cm_no }"><fmt:formatNumber value="${searchlist.cm_price- searchlist.cm_discount* searchlist.cm_price/100 }"
									pattern="#">
								</fmt:formatNumber>원</a>
								<p>
							</div>
							<div class="cart" onclick="cartChk('${searchlist.cm_image}', '${searchlist.cm_name}','${searchlist.cm_no}','${id }')">
    							<img id="carticon-${searchlist.cm_name}" class="cart-icon" alt="장바구니" src="${img}">
							</div>
						</div>
					</li>
				</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>
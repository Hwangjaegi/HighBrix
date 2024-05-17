<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("../../css/member/member.css")
</style>
<script type="text/javascript">
	function cm_allCheck() {
		// 전체 체크박스
		const checkboxes = document.getElementsByName('cm_product');
		// 선택된 체크박스
		const checked = document.querySelectorAll('input[name="cm_product"]:checked');
		// select all 체크박스
		const selectAll = document.querySelector('input[name="selectAll"]');
		
		if (checkboxes.length == checked.length) {
			selectAll.checked = true;
		} else {
			selectAll.checked = false;
		}
	}
	function selectAllCheckboxes(selectAll) {
		let checkboxes;
		if (selectAll.id === 'selectAllCm') {
			checkboxes = document.getElementsByName('cm_product');
		} 
//		else if (selectAll.id === 'selectAllGp') {
// 			checkboxes = document.getElementsByName('gp_product');
// 		}
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked;
		});
	}
</script>
</head>
<body>
<div class="loveList-wrap">
	<div class="title"><h2>찜상품</h2></div>
	<div class="caption">
		<div class="caption-middle">
			<span>찜상품</span>&nbsp;<span class="number" id="totalCount">${l_list.size()}</span><span>개</span>
		</div>
		<div class="selectAllbutton-wrap">
			<div class="selectAll">
				<label>
					<input type="checkbox" name="selectAll" value="selectAll" id="selectAllCm" onclick="selectAllCheckboxes(this)">
					전체선택
				</label>
				<button onclick="location.href='loveDelAll.yj'">전체삭제</button>
			</div>
		</div>
	</div>
	<div class="list-wrap">
		<c:if test="${empty l_list}">
			찜 내역이 없습니다.
		</c:if>
		<div class="product-wrap">
		<form name="loveList" action="cartInsert.ms">
				<c:forEach var="love" items="${l_list}">
					<div class="product-container">
					<input type="checkbox" name="cm_product" class="productChk" onclick="cm_allCheck()" data-ordertypedivd="1">
						<div class="pdImg-container">
	                   	 <a href="/highbrix/views/display/productContent.mk?cm_no=${love.cm_no}" >
	                   	 <img src="/highbrix/images/product_img/${love.cm_image}" class="pdImg"></a>
	                	</div>
						<div class="text">
							<div><a href="/highbrix/views/display/productContent.mk?cm_no=${love.cm_no}">${love.cm_name}</a></div>
							<div>${love.cm_price}원</div>
						</div>
						<div class="btnDel">
							<div onclick="location.href='loveDel.yj?cm_no=${love.cm_no}';"><img alt="삭제" src="/highbrix/images/trashcan.png"></div>
						</div>
					</div>
				</c:forEach>
		</form>
		</div>
	</div>
</div>
</body>
</html>

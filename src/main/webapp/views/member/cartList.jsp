<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">
@import url("/highbrix/css/cart/cart.css");
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// 페이지 로드 시 총 상품 금액 초기화
							updateTotal();

							// 각 체크박스 클릭 시 총 상품 금액 업데이트
							$(".cart_item").on("click", "input:checkbox",
									function() {
										updateTotal();
									});

							// 전체 체크박스 클릭 시 각 체크박스와 총 상품 금액 업데이트
							$("#chkAll").click(
									function() {
										$("input[name=chk]").prop("checked",
												$(this).is(":checked"));
										updateTotal();
									});

							// 개별 체크박스 클릭 시 전체 체크박스와 총 상품 금액 업데이트
							$("input[name=chk]")
									.click(
											function() {
												if ($("input[name=chk]").length === $("input[name=chk]:checked").length) {
													$("#chkAll").prop(
															"checked", true);
												} else {
													$("#chkAll").prop(
															"checked", false);
												}
												updateTotal();
											});
						});

		// 총 상품 금액 업데이트 함수
		function updateTotal() {
			let total = 0;
			$(".cart_item input:checked").each(
					function() {
						let item_value = parseInt($(this).siblings(
								'.totalprice').val()) || 0;
						total += item_value;
					});
			$('.sum').text(formatCurrency(total));
		}

		// 금액 포맷팅 함수
		function formatCurrency(amount) {
			return new Intl.NumberFormat('ko-KR').format(amount) + "원";
		}

		// 선택 상품 삭제
		function delSelect() {
			let c_nos = "";
			$('input[name=chk]:checked').each(function() {
				c_nos += $(this).siblings('input[type=hidden]').val() + ",";
			});
			location.href = "cartDelAll.ms?c_nos=" + c_nos;
		}

		// 주문    
		function delivery_buy() {
			let cm_name = [];
			let cm_price = [];
			let cm_discount = [];
			let c_count = [];
			let c_no = [];
			let cm_no = [];
			let id = [];
			let cm_image = [];
			let totalprice = [];
			if (frm.chk.length === undefined) {
			    // 체크박스가 체크되었을경우
			    if (frm.chk.checked) {
			        cm_name.push(frm.cm_name.value);
			        cm_price.push(frm.cm_price.value);
			        cm_discount.push(frm.cm_discount.value);
			        c_count.push(frm.c_count.value);
			        c_no.push(frm.c_no.value);
			        cm_no.push(frm.cm_no.value);
			        id.push(frm.id.value);
			        cm_image.push(frm.cm_image.value);
			        totalprice.push(frm.totalprice.value);
			    }
			} else {
			    // chk그룹이 다수 체크되었을때 체크된 모든 체크박스의 정보를 수집
			    for (let i = 0; i < frm.chk.length; i++) {
			        if (frm.chk[i].checked) {
			            cm_name.push(frm.cm_name[i].value);
			            cm_price.push(frm.cm_price[i].value);
			            cm_discount.push(frm.cm_discount[i].value);
			            c_count.push(frm.c_count[i].value);
			            c_no.push(frm.c_no[i].value);
			            cm_no.push(frm.cm_no[i].value);
			            id.push(frm.id[i].value);
			            cm_image.push(frm.cm_image[i].value);
			            totalprice.push(frm.totalprice[i].value);
			        }
			    }
			}
			sendData="cm_name="+cm_name+"&cm_price="+cm_price+"&cm_discount="+cm_discount+"&c_count="+
					c_count+"&c_no="+c_no+"&cm_no="+cm_no+"&id="+id+"&cm_image="+cm_image+"&totalprice="+totalprice;
			$.post('/highbrix/views/member/db_buyForm.yj', sendData, function(data) {
					$('form').hide();
					$('#disp').html(data);
				});
		}	
	</script>
	<form action="/highbrix/views/member/db_buyForm.yj" method="post"
		name="frm" onsubmit="return subchk()">
		<div class="container">
			<div class="hi">${member.name } 님의 장바구니</div>
			<div class="item">
				<div>
					<input type="checkbox" id="chkAll" name="chkAll" class="chk"
						onclick="chkAll()">
				</div>
				<div class="num1">번호</div>
				<div class="img1">상품이미지</div>
				<div class="name1">상품명</div>
				<div class="count1">수량</div>
				<div class="discount1">할인율</div>
				<div class="price1">금액</div>
				<div class="total_price1">합계</div>
				<div class="del1">삭제</div>
			</div>

			<div class="cart_li">
				<c:if test="${empty cart_list }">
					<div>장바구니가 비었습니다</div>
				</c:if>
				<c:if test="${not empty cart_list }">
					<c:forEach var="cart" items="${cart_list }" varStatus="v">
						<div class="cart_item">
							<input type="checkbox" name="chk" class="chk" value="1"> 
							<input type="hidden" value="${cart.c_no}" name="c_no">
							<input type="hidden" value="${cart.cm_no}" name="cm_no"> 
							<input type="hidden" name="c_count" value="${cart.c_count}"> 
							<input type="hidden" name="id" value="${cart.id}"> 
							<input type="hidden" name="cm_name" value="${cart.cm_name}"> 
							<input type="hidden" name="cm_price" value="${cart.cm_price}">
							<input type="hidden" name="cm_image" value="${cart.cm_image}">
							<input type="hidden" name="cm_discount" value="${cart.cm_discount}"> 
							<input type="hidden" value="${cart.c_count * cart.cm_price}" class="totalprice" name="totalprice">
							<div class="num">${v.index + 1 }</div>
							<div class="img">
								<img alt="상품이미지"
									src="/highbrix/images/product_img/${cart.cm_image}">
							</div>
							<div class="name">${cart.cm_name }</div>
							<div class="count">${cart.c_count }</div>
							<div class="discount">${cart.cm_discount }</div>
							<div class="price">${cart.cm_price }</div>
							<div class="total_price">
								<fmt:formatNumber value="${cart.c_count * cart.cm_price}" pattern="#,###원" />
							</div>
							<div class="delete_button">
								<input type="button" id="btn_del" value="삭제"
									style="background: #FF6244;"
									onclick="location.href='cartDel.ms?id=${cart.id }&c_no=${cart.c_no}'">
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<button id="btn_sel" type="button" onclick="delSelect()"
			style="background: #FF6244">선택 삭제</button>

		<div class="pay" align="center">
			<div>총 상품 금액</div>
			<div id="price"></div>
			<div class="sum"></div>
		</div>

		<div align="center">
			<input type="button" id="bt_show"
				onclick="location.href='/highbrix/views/display/cmproductList.mk'"
				value="쇼핑 계속하기"> 
			<input type="button" id="bt_buy"
				onclick="delivery_buy()" value="배송주문">
		</div>
	</form>
	<div id="disp"></div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>주문서 작성</title>
<style>
@import url("../../css/member/member.css")
</style>
</head><body>
<div class="buyForm-wrap">
<form name="orderForm" action="db_buyResult.yj" method="post">
    <div class="sub-wrap">
        <h2 class="sub-tit">주문서 작성</h2>
    </div>
    
    <div class="left-cart">
        <div class="order-top">
            <div class="sectionTitle">배송지 정보</div>
            <div class="delivery-info">
                <div class="formTable-wrap">
                    <table class="formTable">
                        <colgroup>
                            <col style="width : 250px">
                            <col style="width : auto">
                        </colgroup>
                        <!-- 주문자 -->
                        <tr><th><div class="formHeader2">주문자</div></th>
                        <td><div><input type="text" name="name" value="${member.name }" required="required"></div><br>
                       	<div><input type="text" name="tel" value="${member.tel }" required="required"></div></td>
                        </tr>
                        <!-- 배송지 -->
                        <tr><th><div class="formHeader2">배송지</div></th>
                            <td><div>
                                    <input type="text" name="order_addr" value="${member.address }" required="required">
                                </div></td></tr>
                        <!-- 배송지 출입방법 -->
                        <tr><th><div class="fomrHeader2">배송지 출입방법</div></th>
                            <td><div class="inputSelect-wrap">
                                    <input type="text" name="memo" class="memoInput" placeholder="공동현관 출입 방법"
                                           required="required" maxlength="75"></div></td></tr>
                    </table>
                </div>
            </div>
            
            <div class="Cartproduct-wrap">
                <div class="">
                    <div class="cart-top-info">
                        <span class="deli-product">배송상품&nbsp;</span>
                    </div>
                    <div class="cart-section">
                        <div class="order-check">
                        	<div class="">
                                <c:forEach var="buy" items="${list}" varStatus="v">                                   
                                 <div class="product_buy_content">                          
                                   <div class="detail-img">
                                   	<input type="hidden" name="cm_image" value="${buy.cm_image }">
                                       <img alt="" src="/highbrix/images/product_img/${buy.cm_image}">
                                   </div>
                                   <div class="c_no">
                                   	<input type="hidden" name="c_no" value="${buy.c_no }">
                                   </div>
                                   <div class="cm_no">
                                  	 <input type="hidden" name="cm_no" value="${buy.cm_no}">
                                   </div>
                                   <div class="pd-name">
                                   	<input type="hidden" name="cm_name" value="${buy.cm_name }">
                                   ${buy.cm_name}</div>
                                   <div class="pd-count">
	                                   <input type="hidden" name="count" value="${buy.c_count }">
	                                   수량 <span>${buy.c_count}</span>&nbsp;개
                                   </div>
                                   <div class="price">
	                                   <!-- 상품 가격 표시 -->
	                                   <input type="hidden" name="cm_price" value="${buy.cm_price }">
	                                   <fmt:formatNumber value="${(buy.cm_price - buy.cm_discount * buy.cm_price / 100) * buy.c_count}" pattern="#,###원">
	                                   </fmt:formatNumber>
                                   </div>
                                 </div>
                                </c:forEach>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 최종 결제 정보를 출력하는 부분 -->
    <div class="payment-wrap">
        <div class="buy-option-top">최종 결제 정보</div>
        <div class="sectionWrap">
            <table class="formTable2">
                <!-- 총 상품금액 표시 -->
                <tr>
                    <td><div class="formHeader">총 상품금액</div></td>
                    <td></td>
                    <td class="alignRight">&nbsp;<span id="total_price"></span></td>
                </tr>
                <!-- 총 배송비 표시 -->
                <tr>
                    <td><div class="formHeader">총 배송비</div></td>
                    <td></td>
                    <td class="alignRight"><span class="divery-price">3000&nbsp;원</span></td>
                </tr>
            </table>
            
            <table class="formTable3">
                <!-- 최종 결제금액 표시 -->
                <tr>
                    <td><div class="formHeader3">최종 결제금액</div></td>
                    <c:forEach var="buy" items="${list}" varStatus="v">
                    <td><input type="hidden" name="price" value="${buy.cm_price }"></td></c:forEach>
                    <td class="alignRight3">&nbsp;<span id="final_price"></span><span class="totalWon"></span></td>
                </tr>
            </table>
            <div class="agreement-box">
                <p class="agr-chk">
                <label for="agree">구매조건을 확인하였으며, 구매에 동의합니다.</label>
                <input type="checkbox" id="agree" value="agreed" required="required"></p>
            </div>
            <!-- 최종 결제 버튼 -->
            <div class="pay_btn">
            	<input type="submit" value="결제하기" class="payment-btn">
        	</div>
        </div>
    </div>

    <script>
 // 각 상품 가격과 수량을 배열로 저장
	    var prices = [];
	    <c:forEach var="buy" items="${list}">
	        var price = parseInt("${buy.cm_price}");
	        var count = parseInt("${buy.c_count}");
	        prices.push(price * count);
	    </c:forEach>
	
	    // 총 상품금액 계산 (각 상품 가격 합산)
	    var total_price = 0;
	    for (var i = 0; i < prices.length; i++) {
	        total_price += prices[i];
	    }
	
	    // 총 상품금액 출력
	    document.getElementById('total_price').innerHTML = total_price.toLocaleString() + '원';
	
	    // 총 결제금액 계산 (상품 가격 합산 + 배송비)
	    var delivery_fee = 3000; // 배송비
	    var final_price = total_price + delivery_fee; // 총 상품금액에 배송비 추가
	
	    // 최종 결제금액 출력
	    document.getElementById('final_price').innerHTML = final_price.toLocaleString() + '원';
	    
	    
	    // 장바구니를 비우는 함수
	    $('.payment-btn').click(function() {
		    emptyCart();
		});
		
	    function emptyCart() {
	        var c_nos = [];
	        $('.c_no').each(function() {
	            c_nos.push($(this).find('input').val());
	        });
	        $.ajax({
	            url: '/highbrix/views/member/cartDel2.ms',
	            method: 'POST',
	            data: {
	                id: '${member.id}',
	                c_nos: c_nos.join(',') // 배열을 문자열로 결합하여 전송
	            },
	            success: function(response) {
	                alert('결제가 완료되었습니다.');
	            },
	            error: function(xhr, status, error) {
	                // 오류 발생 시 오류 처리를 추가할 수 있습니다.
	                console.error('장바구니 비우기 오류:', error);
	                alert('결제 처리 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
	            }
	        });
	    }

    </script>
            </div>
        </div>
</form>
</div>
</body>
</html>

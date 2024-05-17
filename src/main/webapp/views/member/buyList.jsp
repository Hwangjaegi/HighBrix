<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>주문내역</title>
<style>
@import url("../../css/member/member.css")
</style>
</head>
<body>
    <div class="buylist-wrap">
        <div class="order_sec">
            <div class="myorderList">
                <h2>${member.name } 님의 주문내역</h2>
                <div class="myorder_info">
                <form name="searchForm">
                		<div class="h1"><h3 >상품이미지</h3></div>
                        <div class="h2"><h3 >상품명</h3></div>
                        <div class="h3"><h3 >수량</h3></div>
                        <div class="h4"><h3 >결제금액</h3></div>
                        <div class="h5"><h3 >배송현황</h3></div>
                </form>
                 </div>
            </div>
            <div class="order_content">
                <c:choose>
                    <c:when test="${empty buyList}">
                        <div>구매내역이 없습니다.</div>
                    </c:when>
                    <c:otherwise>
                         <div class="order_obj">
                            <c:forEach var="buy_list" items="${buyList}">
                            <div class="order_con1">
	                           <%--  <c:forEach var="product" items="${cmp_list}"> --%>
									    <div class="image">
									        <a href="/highbrix/views/display/productContent.mk?cm_no=${buy_list.cm_no}">
									        <img alt="" src="/highbrix/images/product_img/${buy_list.cm_image}"></a>
									     </div>
									    <div class="order_con2">
									        <a href="/highbrix/views/display/productContent.mk?cm_no=${buy_list.cm_no}">
									            ${buy_list.cm_name}
									        </a>
									    </div>
								<%--  </c:forEach> --%>
	                                <div class="order_con3">
	                                    ${buy_list.bl_count}
	                                </div>
	                            	<div class="order_con4">
	                                    ${buy_list.bl_price}원
	                                </div>
	                            <div class="order_deli">
	                                배송 준비중
	                            </div>
	                            </div>
                             </c:forEach>
                           </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="data_send">
            <button type="button" class="btn_order" onclick="location.href='../display/dpMain.do'">메인화면</button>
        </div>
    </div>
</body>
</html>
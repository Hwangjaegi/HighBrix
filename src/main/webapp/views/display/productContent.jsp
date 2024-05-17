<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id }'></c:set>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	@import url("/highbrix/css/display/productContent.css?after");
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
	let cc = 1;
	let score = 0;
	var isLiked = false;
	function loveChk() {		
		if (${empty id}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			location.href="/highbrix/views/member/loginForm.yj";
			return false;
		} else {
			// 하트 상태를 토글
			isLiked = !isLiked;
			// 하트 이미지 경로설정
			var heartImg = isLiked ? "${fimg}" : "${img}";
			// 이미지 엘리먼트에 경로 적용
			// document.getElementById("imgID").src = heartImg;
			$('#imgID').attr("src", heartImg);
			 // 데이터 전송
            var cm_name = "${cm_product.cm_name}";
            var cm_image = "${cm_product.cm_image}";
            var cm_no = "${cm_product.cm_no}";
            var cm_price = parseInt("${cm_product.cm_price- cm_product.cm_discount/100* cm_produt.cm_price }");
     //       alert("cm_price ; "+cm_price)
            var data = "cm_name="+cm_name+"&cm_image="+cm_image+"&cm_no="+cm_no+"&cm_price="+cm_price;
            	// JSON.stringify({ "cm_name": cm_name, "cm_image": cm_image, "cm_no": cm_no });
         $.post('/highbrix/views/member/loveList.yj', data, function(data) {	
        	  // $('#k1').hide();
        	  // $('#k2').html(data);
       	  alert("찜목록에 추가되었습니다.");
          });
		}
	}
	function count1(type) {
		// 결과 Element
		const resultElement = document.getElementById('pd_count');
		// 현재
		let number = resultElement.value;

		if (type === 'plus') {
			number = parseInt(number) + 1;

		} else if (type === 'minus') {
			if (number <= 1) {
				alert("1개 이상 구매 가능합니다");
				return;
			} else {
				number = parseInt(number) - 1;
			}
		}
		resultElement.value = number;
		cc = number;
		TotalPrice();
	}
	// 장바구니 버튼 클릭시 찜하기 화면으로 넘어감
	function ssChk() {
		location.href="/highbrix/views/member/cartInsert.ms?cm_no=${cm_product.cm_no}&id=${id}&c_count=" + cc;		
	}
	// 총 금액 계산
	function TotalPrice() {
		// 상품 정보 & 할인율 가져옴
		let productPrice = parseInt(document.getElementById('productPrice').value);
		 // 구매 수량
		let quantity = parseInt(document.getElementById('pd_count').value);
		
		// 총 금액 계산
		let totalPrice = productPrice * quantity;
		// 총 금액 업데이트
		document.getElementById('total_price').innerText = "총 금액 : " + totalPrice.toLocaleString() + '원';
		
	}
		// 페이지 로드시 초기 총 금액 계산
		window.onload = function(){
		TotalPrice();
	}
	$(function(){
		$('#pdBtn').click(function(){
			document.getElementById('content_detail').style.display = 'block';
		    document.getElementById('content_review').style.display = 'none';
		});
		$('#reviewBtn').click(function(){
			document.getElementById('content_detail').style.display = 'none';
		    document.getElementById('content_review').style.display = 'block';
			score = 1;
		}); 
		$('#ansdmlBtn').click(function(){
			location.href="../border/account.cu";
		});
	});
	
	function reviewChk() {
		if (${empty id}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");
			location.href="/highbrix/views/member/loginForm.yj";
			return false;
		} else {
			location.href="reviewForm.do?cm_no=${cm_no}"
		}
	}

</script>
</head>
<body style="overflow-x: hidden">
	<section>
		<form name="frm">
			<!-- 상품컨텐츠 커버 -->
			<div class="product_inner">
				<!-- 윗쪽 박스 -->
				<div class="product-container">
					<!-- 상품컨텐츠 이미지 -->
					<div class="product_img">
						<img width="390" height="500"
							src="/highbrix/images/product_img/${cm_product.cm_image }">
					</div>
					<!-- 상품 컨텐츠 정보 -->
					<div class="product_info">
						<div class="product_tit">${cm_product.cm_name}</div>
						<div class="product_price">
							<strong class="list_Price"><fmt:formatNumber value="${cm_product.cm_price}" pattern="#"></fmt:formatNumber>
							</strong><span class="won">원</span>
						</div>
						<hr>
						<div class="product_info_line">
							<dl>
								<dt>할인율</dt>
								<dd>
									${cm_product.cm_discount}<span>%</span>
								</dd>
							</dl>
							<dl>
								<dt>보관방법</dt>
								<dd>
									<span>냉장</span>
								</dd>
							</dl>
							<dl>
								<dt>원산지</dt>
								<dd>
									<span>국내산</span>
								</dd>
							</dl>
						</div>
						<hr>
						<!-- 갯수 가격 -->
						<div class="check_num">
							<div class="qty_txt">
								<span>구매수량</span>
								<div class="product_num">
									<div onclick='count1("minus")' class="btn_minus"></div>
									<!-- data-unit-qty는 사용자가 선택할수 있는 최소 수량을 지정  -->
									<input type="text" name="quantity" id="pd_count" value="1"
										data-unit-qty="1"> <input type="hidden"
										id="productPrice" value="${cm_product.cm_price }">
									<!-- <input type="hidden" id="discountRate" -->
									<%--value="${cm_product.cm_discount }" --%>
									<!-- 									> -->
									<div onclick='count1("plus")' class="btn_plus"></div>
								</div>
							</div>
							<hr>
							<div class="check_price">
								<strong id="total_price">총 금액 : 
								<fmt:formatNumber value="${cm_product.cm_price- cm_product.cm_discount/100* cm_produt.cm_price }" pattern="#">
								</fmt:formatNumber></strong><span>&nbsp;</span>
								
							</div>
						</div>
						<div class="cart_btnBox">
							<a class="btn_like" onclick="loveChk()"><img id="imgID"
								src="${img }"></a>
							<!-- 장바구니 버튼 클릭시 아이디가 있으면 -->
							<c:if test="${not empty id }">
								<%-- <c:if test="${empty cart }">
									<a onclick="count3(${cm_product.cm_no},'${id})" class="btn_cart">${msg}</a> --%>
								<input type="button" class="btn_cart" onclick="ssChk()"
									value="장바구니" style="background: #FF6244">
								<%-- </c:if> --%>
							</c:if>
						</div>
						<!-- 상품 상세페이지 밑에 상세설명란 -->
					</div>
				</div>
				<div align="center" class="pdmenuBtn" >
					<input id="pdBtn" type="button" value="상품정보" style="border: 1px solid #FF6244"> 
					<input id="reviewBtn" type="button" value="이용후기" style="border: 1px solid #FF6244"> 
					<input id="ansdmlBtn" type="button" value="물품문의" style="border: 1px solid #FF6244">
				</div>
				<div id="content_detail" class="content_detail">
					<img
						src="/highbrix/images/product_img/${cm_product.cm_detailimage }">
					<p>
						<strong>${cm_product.cm_content }</strong>
				</div>

<!-- 리뷰 화면 ---------------------------------------->

				<div id="content_review" class="content_review"
					style="display: none;">
					<h1 align="left" id="reviewTitle">이용후기</h1>
					<p>
					<div class="reviewguide"> 
						   - 물품 공급일 또는 매장 구입일 다음날부터 30일 이내까지 작성할 수 있습니다.
						<br>- 일반문의 , 물품관련질문 , 제안 , 불편사항등은 고객센터 게시판에서 문의주시면<br>&nbsp;&nbsp;&nbsp;하이브릭스가 정성을다해 답변하겠습니다.
						<br>- 이용후기에 적합하지 않은 글은 신고할 수 있습니다. 신고시 해당 이용후기는<br>&nbsp; 게시판 관리기준에 따라 게시중단 됩니다.
						<p>
					</div>
					<input id="reviewformBtn" type="button" value="이용후기작성" onclick="reviewChk()">
					<fieldset class="reviewField">
						<h2>리뷰 총점 [${r_score }]</h2>
						<div class="stars-container">
							<div class="stars">
								<c:forEach var="i" begin="1" end="${r_score }">
									<div class="star" data-rating="${i}">
										<img width="50" height="50" alt="star"
											src="/highbrix/images/star.png">
									</div>
								</c:forEach>
							</div>
						</div>
					</fieldset>

					<div class="reviewText" align="center">
						<span id="reviewCount">게시글 총 ${reviewCount }개</span>
						<c:forEach var="review" items="${review }">
							<c:choose>
								<c:when	test="${not empty review.r_image and review.r_image ne ''}">
									<div class="card mb-3" style="max-width: 800px; max-height: 800px;">
										<div class="row g-0">
											<div class="col-md-4" style="width: 200px; height: 250px;">
												<img style="height: 100%; width: 100%" src="/highbrix/images/review_img/${review.r_image}" class="img-fluid rounded-start" alt="상품사진">
											</div>
											<div class="col-md-8" style="width: 580px; height: 250px;">
												<div class="card-body">
													<h2 align="left" class="card-title">제목 : ${review.r_title }</h2>
													<p align="left" class="card-text">작성자 : ${name }</p>
													<p align="left" class="card-text" style="overflow: hidden; max-height: 250px;">
														<small class="text-body-secondary"> 
															<c:forEach var="i" begin="1" end="${review.r_score }">
																<div class="mystar" data-rating="${i}">
																	<img width="40" height="40" alt="star" src="/highbrix/images/star.png">
																</div>
															</c:forEach>${review.r_date }
														</small>
													</p>
												</div>
											</div>
											<hr>
										</div>
										<p style="text-align: left; margin-left: 20px;">${review.r_content }</p>
									</div>
								</c:when>
								<c:otherwise>
									<div class="card mb-3" style="max-width: 800px; max-height: 800px;">
										<div class="row g-0">
											<div class="col-md-8" style="width: 580px; height: 250px;">
												<div class="card-body">
													<h2 align="left" class="card-title">제목 : ${review.r_title }</h2>
													<p align="left" class="card-text">작성자 : ${name }</p>
													<p align="left" class="card-text" style="overflow: hidden; max-height: 250px;">
														<small class="text-body-secondary"> 
															<c:forEach var="i" begin="1" end="${review.r_score }">
																<div class="mystar" data-rating="${i}">
																	<img width="30" height="30" alt="star" src="/highbrix/images/star.png">
																</div>
															</c:forEach>${review.r_date }
														</small>
													</p>
												</div>
											</div>
											<hr>
										</div>
										<p style="text-align: left; margin-left: 20px;">${review.r_content }</p>
									</div>
								</c:otherwise>
							</c:choose>
							<%-- <h1>작성일 : ${review.r_date}</h1>
						<h1>점수 : ${review.r_score}</h1>
						<h1>아이디 : ${review.id}</h1>
						<h1>상품번호 : ${review.cm_no}</h1>
						<h1>이름 : ${name }</h1> --%>
						</c:forEach>
					</div>

				</div>
			</div>
		</form>
	</section>
</body>
</html>
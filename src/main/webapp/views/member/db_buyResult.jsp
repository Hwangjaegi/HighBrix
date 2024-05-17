<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("../../css/member/member.css")
</style>
</head>
<body>
<div class="order-completed">
	<h2>주문완료</h2>
	<div class="check_img">
		<img class="chk_img" alt="" src="/highbrix/images/complete.png">
	</div>
	<div class="text-area">
		<p class="customer-name">
		<span>${member.name }</span> 고객님
		</p>
		<p class="completed-text">주문 결제가 완료되었습니다.</p>
	</div>
	<div class="order-com-btn">
		<button class="dbc_btn" onclick="location.href='/highbrix/views/display/dpMain.do'">쇼핑계속하기</button>
		<button class="dbc_btn" onclick="location.href='/highbrix/views/member/buyList.yj'">구매내역</button>
	</div>
</div>
</body>
</html>
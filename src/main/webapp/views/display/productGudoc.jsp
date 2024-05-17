<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
#Gudoc_Btn {
	border: 1px solid #FF6244;
	background: #FF6244;
	color: white; 
	text-align: center; 
	display: inline-block;
	font-size: 16px;
	margin: 30px 60px;
	padding: 20px;
	cursor: pointer;
	border-radius: 2px; 
}
#Gudoc_Btn:hover {
	border: 1px solid #FF6244;
	background: white;
	color: #FF6244; 
	text-align: center; 
	display: inline-block;
	font-size: 16px;
	margin: 30px 60px;
	padding: 20px;
	cursor: pointer;
	border-radius: 2px; 
}
.gudocBtn {
	margin-bottom: 50px; 
}
</style>
</head>
<body>
	<div class="gudocMain">
	<!-- 전체 웹페이지 div -->
		<div class="delivery_img" align="center">
			<img alt="" src="/highbrix/images/delivery.jpg">
		</div><p>
		<div class="gudocBtn" align="center">
			<button id="Gudoc_Btn" onclick="location.href='../border/account.cu'">정기배송신청</button>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("../../css/member/member.css")
</style>
</head><body>
<%@ include file="sessionChk.jsp" %>
<div class="mypageForm-wrap">
	<div class="section">
		<div class="my_top">
			<div class="name_box">
				<span>${member.name }</span>님 환영합니다.
			</div>
		</div>
		<div class="my_menu">
			<div class="box1">
				<div class="buyList">
				<button onclick="location.href='buyList.yj'" class="btn_myPage">구매목록</button>
				</div>		
				<div class="loveList">
				<button onclick="location.href='loveList2.yj'" class="btn_myPage">찜목록</button>
				</div>
				<div class="cartList">
				<button onclick="location.href='cartList.ms'" class="btn_myPage">장바구니</button>
				</div>
			</div>
			<div class="box2">
				<div class="update">
				<button onclick="location.href='updateForm.yj'" class="btn_myPage">회원정보수정</button>
				</div>
				<div class="logout">
				<button onclick="location.href='logout.yj'" class="btn_myPage">로그아웃</button>
				</div>
				<div class="member_delete">
				<button onclick="location.href='member_del.yj'" class="btn_myPage">회원탈퇴</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
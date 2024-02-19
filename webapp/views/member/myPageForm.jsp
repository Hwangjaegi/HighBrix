<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="sessionChk.jsp" %>
<script type="text/javascript">
	
</script>
</head><body>
<div class="mypageForm-wrap">
	<div class="section">
		<div>
			<div class="my_top">
				<div class="name_class">
					${member.name }님 <span>환영</span>합니다.
				</div>
			</div>
			<article class="my_menu">
				<div class="buyList">
				<a href="buyList.yj" class="btn_myPage"><span>구매목록</span></a>
				</div>		
				<div class="loveList">
				<a href="loveList.yj" class="btn_myPage"><span>찜목록</span></a>
				</div>
				<div class="logout">
				<a href="logout.yj" class="btn_myPage"><span>로그아웃</span></a>
				</div>
				<div class="update">
				<a href="updateForm.yj" class="btn_myPage"><span>회원정보수정</span></a>
				</div>
				<div class="delivery">
				<a href="deliveryList.yj" class="btn_myPage"><span>배송지관리</span></a>
				</div>
				<div class="member_del">
				<a href="member_del.yj" class="btn_myPage"><span>회원탈퇴</span></a>
				</div>
			</article>
		</div>
	</div>
</div>
</body>
</html>
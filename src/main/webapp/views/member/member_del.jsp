<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url("../../css/member/member.css")
</style>
</head><body>
<div class="member_del-wrap">
<h2>회원 탈퇴</h2>
<div class="member_del">
<h3>[회원 탈퇴 동의 약관]</h3>
<div class="del-content">
<span>1. 탈퇴 안내: 회원 탈퇴를 신청할 경우, 해당 계정은 영구적으로 삭제되며 복구가 불가능합니다.</span>
<span>2. 정보 보호 및 개인정보 삭제: 회원 탈퇴 시에도 회원의 개인정보는 법적 요건에 따라 일정 기간 동안 보관될 수 있습니다. 탈퇴 전에 회원의 개인정보 처리 정책을 확인하시기 바랍니다.</span>
<span>3. 서비스 이용에 따른 책임: 회원 탈퇴로 인해 발생하는 모든 정보 손실에 대한 책임은 회원 본인에게 있으며, 이에 따른 어떠한 보상도 제공되지 않습니다.</span>
<span>4. 재가입 제한: 회원 탈퇴 후에는 동일한 계정으로 재가입이 불가능할 수 있습니다. 이에 대한 자세한 사항은 관련 정책을 참고하시기 바랍니다.</span>
<span>5. 법적 효력 동의: 본인은 회원 탈퇴에 대한 위 사항을 충분히 이해하고 동의하는 것으로 간주됩니다.</span>
<p>
<span>정말로 탈퇴하시겠습니까?</span>
</div>
</div>
<div class="memdel-btn">
	<form action="delete.yj">
	<input type="submit" value="탈퇴하기">
	<input type="button" value="탈퇴취소" onclick="location.href='/highbrix/views/member/myPageForm.yj'">
	</form>
</div>
</div>
</body>
</html>
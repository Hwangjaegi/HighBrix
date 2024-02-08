<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("member.css");</style>
<script type="text/javascript">
	function dupchk(){
		if(!join.id.value){
			alert("아이디를 입력해주세요.");
			join.id.focus();
			return false;
		}
		window.open("idchk.jsp?id="+join.id.value,"",
		"width=400 height=400");
	}
	function chk(){
		if(join.password.value != join.password2.value){
			alert("비밀번호와 비밀번호 확인이 다릅니다.");
			join.password.focus();
			join.password.value="";
			join.password2.value="";
			return false;
		}
	}
</script>
</head>
<body>
<div class="join-form">
<form action="join.jsp" name="join" onsubmit="return chk()">
<table>
<colgroup><col width="25%"><col width="75%"></colgroup>
<tbody>
<tr><th><span class="important">아이디</span></th><td>
<div class="member_warning">
<input type="text" name="id" autofocus="autofocus" required="required">
<button class="id_jchk" onclick="dupchk()">중복확인</button></div></td></tr>
<tr><th><span class="important">비밀번호</span></th><td class="member_password">
<div class="member_warning">
<input type="password" name="password" required="required" autocomplete="off"></div></td></tr>
<tr><th><span class="important">비밀번호 확인</span></th><td>
<div class="member_warning">
<input type="password" name="password2" required="required"></div></td></tr>
<tr><th><span class="important">이름</span></th><td>
<div class="member_warning">
<input type="text" name="name" required="required" max="30"></div></td></tr>
<tr><th><span class="important">휴대폰</span></th><td class="member_address">
<div class="address_postcode">
<input type="tel" name="phone" required="required" placeholder="010-1111-1111" ></div>
<div class="form_element">
<input type="checkbox" id="sns" value="y">
<label for="sns" class="check_sns">정보/이벤트 sns 수신동의</label>
</div></td></tr>
<tr><th><span class="important">이메일</span></th><td>
<div class="member_warning">
<input type="email" name="email"></div></td></tr>
<tr><th><span class="important">주소</span></th><td class="member_address">
<div class="address_input">
<input type="text" name="address" required="required"></div></td></tr>
</tbody>
</table>
<div class="btn_join">
<button type="submit">가입</button>
<button type="reset">취소</button>
</div>
</form>
</div>
</body>
</html>
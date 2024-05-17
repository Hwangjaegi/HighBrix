<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
@import url("/highbrix/css/border/border.css")
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
	function sendChk() {
		let result = confirm("등록 하시겠습니까?");
		if (!result) {
			return false;
		}
	}
	
	$(function(){
		$('.notice').click(function(){
			let cancle = confirm("작성이 취소됩니다 진행하시겠습니까?");
			if(cancle > 0){
				location.href="account.cu";
			}else return false;
		});
		
		$('.QnA').click(function(){
			let cancle = confirm("작성이 취소됩니다 진행하시겠습니까?");
			if(cancle > 0){
				location.href="qna.cu";
			}else return false;
			
		});
	});
</script>
</head>
<body>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("수정 권한이 없습니다");
		history.back();
	</script>
</c:if>
<div class="wrap">
	<div class="cu_border">
		<div class="pdTitle">게시글 수정</div>
		<div class="cu_tableFull">	
			<form action="update.cu" name="qnaWrite" method="post" enctype="multipart/form-data"
				onsubmit="return sendChk()">
			<!-- num과 pageNum을 넘겨주기위해 form안에 저장 -->
			<input type="hidden" name="a_no" value="${a_no }"> 
			<input type="hidden" name="pageNum" value="${pageNum}">
				
				<table class="cu_table" border="1">
					<c:if test="${empty account }">
						<tr><th colspan="2">수정할 글이 없습니다</th></tr>
					</c:if>
					<c:if test="${not empty account }">
						<tr class="t_head"><th width="20%">제목</th>
							<td><input id="t_title" type="text" name="title" required="required" autofocus="autofocus" value="${account.a_title }"></td>
						</tr>
						<tr class="t_head"><th>암호</th>
							<td><input id="t_password" type="password" name="password" required="required" maxlength="4" value="${account.a_password }"></td>
						</tr>
							<tr class="t_head"><th>첨부파일</th>
							<td><input id="t_file" type="file" name="file">${account.a_image }</td>
						</tr>
						<tr class="t_head" height="500"><th>내용입력</th>
							<td><textarea id="t_content" name="content" rows="10" cols="45" required="required" >${account.a_content }</textarea></td></tr>						
					</c:if>
				</table>
				<div align="center" class="t_button">
					<input class="btn btn-outline-danger" type="submit" value="등록하기">
					<input class="btn btn-outline-danger" type="reset" value="초기화">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
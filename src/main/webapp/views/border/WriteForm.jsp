<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&family=Lora:ital,wght@0,400..700;1,400..700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
@import url("/highbrix/css/border/border.css")
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
	function seanChk() {
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
			}else {
				return false;
			}
		});
		
		$('.QnA').click(function(){
			let cancle = confirm("작성이 취소됩니다 진행하시겠습니까?");
			if(cancle > 0){
				location.href="qna.cu";
			}else {
				return false;
			}
		});

	});
	
</script>
</head>
<body>
	<div class="wrap">
		<div class="cu_border">
			<div class="pdTitle">게시글 작성</div>
			<div class="cu_tableFull">							   <!-- 파일첨부시 꼭 enctype 사용 -->
			<form action="Write.cu" name="Write" method="post" enctype="multipart/form-data"
				onsubmit="return seanChk()">
				<input type="hidden" name="a_no" value="${a_no}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<!-- ref,re_level,re_step는 답변글에서 사용할예정 -->
				<input type="hidden" name="a_ref" value="${a_ref}">
				<input type="hidden" name="a_level" value="${a_level}">
				<input type="hidden" name="a_step" value="${a_step}">
				
				<table class="cu_table" border="1">
					<c:if test="${a_no == 0 }">
						<tr class="t_head"><th>제목</th>
							<td><input id="t_title" type="text" name="title" required="required" autofocus="autofocus" placeholder="문의내용의 제목을 입력해주세요"></td>
						</tr>
					</c:if>
					<c:if test="${a_no != 0 }">
						<tr class="t_head"><th>제목</th>
							<td><input id="t_title" type="text" name="title" required="required" autofocus="autofocus" value="답변)"></td>
						</tr>
					</c:if>
					<c:if test="${empty id }">
						<tr class="t_head"><th>암호</th>
							<td><input id="t_password" type="password" name="password" required="required" placeholder="암호를 입력하세요"></td>
						</tr>
					</c:if>
					<tr class="t_head"><th>첨부파일</th>
						<td><input id="t_file" type="file" name="file"></td>
					</tr>
					<tr class="t_head"><th>내용입력</th>
						<td><textarea id="t_content" name="content" rows="10" cols="45" placeholder="문의사항을 입력하세요" required="required"></textarea></td></tr>						
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
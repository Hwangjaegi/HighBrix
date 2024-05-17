<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/highbrix/css/admin/admin_insert.css?after");
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
</head>
<body>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("file-input").addEventListener("change", function() {
			let fileName = this.value.split("\\").pop();
			let fileDisplay = document.getElementById("file-name");
			if (fileDisplay) {
				fileDisplay.textContent = fileName;
	        }
		});
	});
	function dupChk() {
		if(!frm.cm_name.value) {
			alert("상품명을 입력하고 확인하세요");
			frm.cm_name.value.focus();
			return false;
		}
		$.post('confirm.ms', "cm_name="+frm.cm_name.value, function(data) {
			$('.err').html(data);
		});
	}
	function submit() {
		document.querySelector('form[name="frm"]').submit();
	}
	$(function() {
		$('input[type="file"]').on('change', function() {
			var fileName = $(this).val();
			var realFileName = fileName.split("\\");
			$(this).siblings('label').text(realFileName[2]); 
		});
	});
</script>
<div class="container">
	<form action="cmUpdate.ms" method="post" name="frm" enctype="multipart/form-data">
		<input type="hidden" name="cm_no" value="${cm_product.cm_no }">
		<table><caption>일반 상품수정</caption>
			<tr><td><input type="button" value="일반 상품목록" 
				class="bt_list" style="background-color: white"
				onclick="location.href='/highbrix/views/admin/adminCmProduct.ms'"></td>
			<tr><th>상품번호</th>
				<td><input type="text" name="cm_no" value="${cm_product.cm_no }" 
					readonly="readonly">
					</td></tr>
			<tr><th>상품명</th>
				<td><div style="display: flex; align-items: center;">
						<input type="text" name="cm_name" value="${cm_product.cm_name }" 
							required="required" autofocus="autofocus">
						<input type="button" value="중복체크" class="btn chk" 
							style="background-color: #FF6244;" onclick="dupChk()"></div>
						<div class="err"></div></td></tr>
			<tr><th>가격</th>
				<td><input type="number" name="cm_price" value="${cm_product.cm_price }" 
						required="required"></td></tr>
			<tr><th>할인율</th>
				<td><input type="number" name="cm_discount" value="${cm_product.cm_discount }"
						required="required"></td></tr>
			<tr><th>재고</th>
				<td><input type="number" name="cm_count" value="${cm_product.cm_count }"
						required="required"></td></tr>
			<tr><th>상품내용</th>
				<!-- 재기추가 -->
			<td><textarea rows="20" cols="80" name="cm_content" placeholder="상품에대한 내용을 입력하세요" 
			required="required">${cm_product.cm_content }</textarea></td></tr>
				
					
		</table>
<c:if test="${empty cm_product.cm_image }">
		<div class="column_box pd">
				<div class="column">
					<label for="f1" class="file_label">상품 섬네일</label>
					<input type="file" id="f1" name="cm_image">
				</div>
				<div class="column">
					<label for="f2" class="file_label">상세페이지</label>
					<input type="file" id="f2" name="cm_content">
				</div>
			</div>
</c:if>
<c:if test="${not empty cm_product.cm_content }">
			<div class="column_box pd">
				<div class="column">
					<label for="f1" class="file_label">${cm_product.cm_image }</label>
					<input type="file" id="f1" name="cm_image">
				</div>
				<div class="column">
					<label for="f2" class="file_label">${cm_product.cm_detailimage }</label>
					<input type="file" id="f2" name="cm_detailimage">
				</div>
			</div>
</c:if>
			<div align="center">
				<input type="button" onclick="submit()" value="상품수정"
					class="bt_submit" style="background-color: #FF6244; width: calc(200px + 1em);">
			</div>
	</form>
</div>
</body>
</html>
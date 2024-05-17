<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/admin/admin_insert.css?after");

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
	<form action="cmInsert.ms" method="post" name="frm" enctype="multipart/form-data">
		<table><caption>일반 상품등록</caption>
			<tr><td><input type="button" value="일반 상품목록" 
				class="bt_list" style="background-color: white"
				onclick="location.href='/highbrix/views/admin/adminCmProduct.ms'"></td>
			<tr><th>상품명</th>
				<td><div style="display: flex; align-items: center;">
						<input type="text" name="cm_name" required="required" autofocus="autofocus"
							placeholder="20자 이내로 작성하세요">
						<input type="button" value="중복체크" class="btn chk" 
							style="background-color: #FF6244;" onclick="dupChk()"></div>
						<div class="err"></div></td></tr>
			<tr><th>가격</th>
				<td><input type="number" name="cm_price" placeholder="숫자로만 입력하세요" required="required"></td></tr>
			<tr><th>할인율</th>
				<td><input type="number" name="cm_discount" placeholder="%없이 숫자로만 입력하세요" required="required"></td></tr>
			<tr><th>재고</th>
				<td><input type="number" name="cm_count" placeholder="숫자로만 입력하세요" required="required"></td></tr>	
				<tr><th>상품내용</th>
				<!-- 재기추가 -->
				<td><textarea rows="20" cols="80" name="cm_content" placeholder="상품에대한 내용을 입력하세요" required="required"></textarea></td></tr>
				
		</table>
			<div class="column_box pd">
				<div class="column">
					<label for="f1" class="file_label">상품 섬네일</label>
					<input type="file" id="f1" name="cm_image">
				</div>
				<div class="column">
					<label for="f2" class="file_label">상세페이지 이미지</label>
					<input type="file" id="f2" name="cm_detailimage">
				</div>
			</div>
			<div align="center">
				<input type="button" onclick="submit()" value="상품등록"
					class="bt_submit" style="background-color: #FF6244; width: calc(200px + 1em);">
			</div>
	</form>
</div>
</body>
</html>
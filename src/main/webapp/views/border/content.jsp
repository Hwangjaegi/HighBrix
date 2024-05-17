<%@page import="org.apache.catalina.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글폰트적용 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	@import url("/highbrix/css/border/border.css");
.sub-middle-layout { /* 푸터 미들레이아웃 밀어내기 */
	height:1200px;
}	
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
	function deleteChk() {
				let deleteChk = confirm("삭제하시겠습니까?");
				if (deleteChk){
					location.href="delete.cu?a_no=${a_no}&pageNum=${pageNum}";
				}else{
					return false;
				}
			}
</script>

</head>

<body>

<c:if test="${result < 0 }">
	<script type="text/javascript">
		alert("암호가 다릅니다");
		history.back();
	</script>
</c:if>
<%-- <%@ include file="../sessionChk.jsp"%>	<!-- 비회원 구현x -->   --%>
	<div class="wrap">
		<div class="cu_border">
		<div class="pdTitle">공지사항 상세</div>
			<div class="cu_tableFull">	
				<table class="cu_table" border="1">
					<c:if test="${empty Account }">
						<tr><th colspan="2"> 값이 비어있습니다</th></tr>
					</c:if>
					<c:if test="${not empty Account }">
						<tr class="t_head"><th width="20%">제목</th>
							<td class="detail">${Account.a_title }</td>
						</tr>
						<tr class="t_head"><th>작성자</th>
							<td class="detail">${Account.name }</td>
						</tr>
						<tr class="t_head"><th>조회수</th>
							<td class="detail">${Account.a_view }</td>
						</tr>
						<tr class="t_head"><th>작성일</th>
							<td class="detail">${Account.a_date }</td>
						</tr>
						<tr class="t_head" height="500"><th>내용</th>
							<td class="detail">
								<hr id="a_hr">
								<div id="a_img"><img width="200" alt="${Account_a.image}" src="/highbrix/images/upload_img/${Account.a_image }"></div>
								<div id="a_content">${Account.a_content }</div>
							</td>
						</tr>	
					</c:if>
				</table>
				<div align="center" class="t_button">
					<button class="btn btn-outline-danger" id="cu_Btn" onclick="location.href='updateForm.cu?a_no=${a_no}&pageNum=${pageNum }'">수정</button>
					<button class="btn btn-outline-danger" id="cu_Btn" onclick="deleteChk()">삭제</button>
					<%-- <button class="cu_Btn" onclick="location.href='delete.cu?a_no=${a_no}&pageNum=${pageNum}'">삭제</button> --%>
					<button class="btn btn-outline-danger" id="cu_Btn" onclick="location.href='writeForm.cu?a_no=${a_no}&pageNum=${pageNum }'">답변</button>
					<button class="btn btn-outline-danger" id="cu_Btn" onclick="location.href='account.cu'">목록</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL���� -->
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url("../../css/display.css");
@import url("../../css/icon.css");
</style>
</head>
<body>
<div class="wrap">
	<header>
	<div class="top">
		<img alt="highbrix" src="../../images/highbrix.jpg">
			<div id="login">
				<a href="login.do" >�α���</a>/<a href="join.do">ȸ������</a>
			</div> <!-- login [div] -->
			<form action="search.do">
				<div id="search">
					<input type="text" name="search" placeholder="�˻������Է�">
					<input type="submit" value="�˻�">
				</div>
			</form>
	</div> <!-- header [div] -->
	
			<!-- icon ���� -->
			<div class="icon">
				<input type="checkbox" id="menuicon"> 
				<label for="menuicon">
					<span></span>
					<span></span>
					<span></span>
				</label>
				<div class="sidebar">
					<ol>
						<li><a href="">����</a></li>
						<li><a href="">���ϼ�����Ʈ</a></li>
						<li><a href="">�Ű���</a></li>
						<li><a href="">�����ֽ�</a></li>
						<li><a href="">���ⱸ������</a></li>
						<li><a href="">���԰�;�?</a></li>
					</ol>
				</div>
			</div>
			
	<!-- ��ܸ޴� list -->		
	<div class="menu">
		<ul>
			<li><a href="sale.do">����ǰ��</a></li>
			<li><a href="subscribe.do">���ⱸ��</a></li>
			<li><a href="groupbuy.do">��ٵ帲</a></li>
			<li><a href="customer.do">������</a></li>
		</ul>
	</div>
	</header>
	<!-- ���� ���� ���� -->
	<a href=""><img id="arow" alt="����" src="../../images/arow.png"> </a>
	<a href=""><img id="arow2" alt="����" src="../../images/arow2.png"> </a>
	<div class="main">
		<a href="subscribe.do"><img alt="�׺���̼ǹ�" src="../../images/test.jpg"></a>
	</div>
</div>
</body>
</html>
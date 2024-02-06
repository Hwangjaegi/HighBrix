<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL���� -->
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/display.css");	/* ���÷��� css ���� */
@import url("/highbrix/css/icon.css");		/* ������ css ���� */
</style>
</head>

<body>
<div class="wrap"> <!-- ��ü �������� div -->
	<header>
		<div class="top"> <!-- �α���/ȸ������ -->
	    	<div class="logo-login">
	        	<div class="logo">
	            	<img alt="highbrix" src="/highbrix/images/highbrix.png">
	        	</div> <!-- ���̺긯�� �̹����ΰ� -->
	        	<div class="login"> <!-- loginForm ��ɱ��� -->
	            	<a href="loginForm.do" >�α���</a>/<a href="join.do">ȸ������</a>
	       	 	</div>
	    	</div>
		</div>
		<form action="searchForm.do"> <!-- searchForm : �˻���ɱ��� -->
				<div class="search">
					<input type="text" name="search" placeholder="�˻������Է�">
					<input type="submit" value="�˻�">
				</div>
		</form>
		
		<div class="menu">
			<div class="icon"> <!-- icon : ī�װ���ɱ��� -->
				<input type="checkbox" id="menuicon"> 
					<label for="menuicon">
						<span></span>
						<span></span>
						<span></span>
					</label>
					<div class="sidebar"> <!-- iconŬ�� �� ī�װ� ���̵�� ���� -->
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
				
			<div class="menu_list"> <!-- ��ܸ޴� list -->	
				<ul>
					<li><a href="">��ǰ</a></li>
					<li><a href="">SALE</a></li>
					<li><a href="">���ⱸ��</a></li>
					<li><a href="">��ٵ帲</a></li>
					<li><a href="">������</a></li>
				</ul>
			</div>
		</div>
	</header> <!-- ������� ���� -->
	
	<nav> <!-- �׺���̼ǹ� ���� -->
		<a href=""><img id="arow" alt="����" src="/highbrix/images/arow.png"> </a>	<!-- [<]��ư���� -->
		<a href=""><img id="arow2" alt="����" src="/highbrix/images/arow2.png"> </a> <!-- [>]��ư���� -->
		<div class="nav_bar"> <!-- �׺���̼ǹ� ũ�� [1920 x 600] -->
			<ul>
				<li><a href="subscribe.do"><img alt="�׺���̼ǹ�" src="/highbrix/images/test.jpg"></a>
			</ul>
		</div>
	</nav> <!-- �׺���̼ǹ� ���� ���� -->
	
	<main><!-- ���α��� ���� -->
		<div class="main_content">
			<p class="mainText1">�� ��ǰ�� �����?</p>
			<ul class="pdList"> <!-- ��ǰ����Ʈ -->
				<li class="pdListCon">
					<div class="imgWrap">
						<a href="">
							<img alt="���׺��û��" src="/highbrix/images/product_img/fruit1.jpg">
						</a>
					</div>
					<div class="txtWrap"><p><a href="">���׺��û��(1kg)</a><p>
						<div class="pdPrice"><a href="">9900��</a></div>
						<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
					</div>	
				</li> <!-- û�� �Ϸ� -->
				<li class="pdListCon">
					<div class="imgWrap">
						<a href="">
							<img alt="���׺��û��" src="/highbrix/images/product_img/fruit1.jpg">
						</a>
					</div>
					<div class="txtWrap"><p><a href="">���׺��û��(1kg)</a><p>
						<div class="pdPrice"><a href="">9900��</a></div>
						<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
					</div>
				</li>
				<li class="pdListCon">
					<div class="imgWrap">
						<a href="">
							<img alt="���׺��û��" src="/highbrix/images/product_img/fruit1.jpg">
						</a>
					</div>
					<div class="txtWrap"><p><a href="">���׺��û��(1kg)</a><p>
						<div class="pdPrice"><a href="">9900��</a></div>
						<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
					</div>
				</li>
				<li class="pdListCon">
					<div class="imgWrap">
						<a href="">
							<img alt="���׺��û��" src="/highbrix/images/product_img/fruit1.jpg">
						</a>
					</div>
					<div class="txtWrap"><p><a href="">���׺��û��(1kg)</a><p>
						<div class="pdPrice"><a href="">9900��</a></div>
						<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
					</div>
				</li>
			</ul>
		</div>
	</main>
</div>
</body>
</html>
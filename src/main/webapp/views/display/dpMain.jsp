<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL���� -->
<!DOCTYPE html><html><head><meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
@import url("/highbrix/css/display/display.css");	/* ���÷��� css ���� */
@import url("/highbrix/css/display/icon.css");		/* ������ css ���� */
</style>
<script type="text/javascript" src="/highbrix/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){	/* ���λ�ǰ �ؽ�Ʈ �ִϸ��̼� �߰� */
		let pdListText1 = document.querySelector('.pdListText')
		window.addEventListener('scroll',function(){
			 let value = window.scrollY
			 console.log("scrollY",value)
			 if(value<2000){
				pdListText1.style.animation='disappear 1s ease-out forwards'
			 }else if(value>2000 && value<3200){
				pdListText1.style.animation='slide 1s ease-out forwards'
			 }else if(value>3200){
				pdListText1.style.animation='disappear 1s ease-out forwards'
			 }
		});
	});
	
</script>
</head>

<body>
<div class="wrap"> <!-- ��ü �������� div -->
	<header>
		<div class="top"> <!-- �α���/ȸ������ -->
	    	<div class="logo-login">
	        	<div class="logo">
	            	<a href="/highbrix/dpMain.do"><img alt="���̺긯�� �ΰ�" src="/highbrix/images/highbrix.png"></a>
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
					<li><a href="customer.cu">������</a></li>	
				</ul>
			</div>

		</div>
	</header> <!-- ������� ���� -->
		<div class="nav_bar"> <!-- �׺���̼ǹ� ũ�� [1920 x 600] -->
			<ul>
				<li><a href="subscribe.do"><img alt="�׺���̼ǹ�" src="/highbrix/images/highbrixnav.png"></a>
			</ul>
		</div>
	
	<main><!-- ���α��� ���� -->
		<div class="main_content">
			
			<p class="mainText1">�� ��ǰ�� �����?</p>
			<div class="pdList">
				<ul> <!-- ��ǰ����Ʈ -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="���׺��û��" src="/highbrix/images/product_img/apple.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">�� ���� ���(1kg)</a><p>
							<div class="pdPrice"><a href="">29,900��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>	
					</li> <!-- û�� �Ϸ� -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="���� �λ���" src="/highbrix/images/product_img/pear.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="" vlink="black">���� �Ű��(1kg)</a><p>
							<div class="pdPrice"><a href="">15,000��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="���� ��" src="/highbrix/images/product_img/strawberry.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">��û �������(500g)</a><p>
							<div class="pdPrice"><a href="">15,000��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="���׺��û��" src="/highbrix/images/product_img/mandarin.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">Ÿ�̺� ����1�ڽ�[5kg]</a><p>
							<div class="pdPrice"><a href="">39,900��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
				</ul>
			</div>
			<div class="pdList">
				<ul> <!-- ��ǰ����Ʈ -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="������ξ���" src="/highbrix/images/product_img/pineapple.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">��ϱ۷ο� ���ξ���[1��]</a><p>
							<div class="pdPrice"><a href="">7,000��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>	
					</li> <!-- û�� �Ϸ� -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="�±�����" src="/highbrix/images/product_img/mango.jpg">
							</a>
						</div> 
						<div class="txtWrap"><p><a href="">�±�����[2��]</a><p>
							<div class="pdPrice"><a href="">9,900��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="���ø���" src="/highbrix/images/product_img/applemango.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">���ø���[2��]</a><p>
							<div class="pdPrice"><a href="">19,900��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="���θӽ���" src="/highbrix/images/product_img/Shine.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">���θӽ���[1�ڽ�]</a><p>
							<div class="pdPrice"><a href="">29,900��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
				</ul>
			</div>
			
			<p class="mainText1">���� ��ǰ</p>
			<div class="pdList">
				<ul> <!-- ��ǰ����Ʈ -->
					<li class="pdListCon">
						<div class="pdListText">
							<h1>��ġ�� �ƽ���</h1>
							<h2>���� ��ǰ</h2>	
							-------------<p>
						
							<h3>�����ϴ� ������</h3><p>
							<h3>���ݹٷ� ����������!</h3><p>
							<button>������</button> <!-- ���λ�ǰpage�̵� -->
						
						</div>
					</li> <!-- û�� �Ϸ� -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="�����" src="/highbrix/images/product_img/tomato.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">���׺�� �����(500g)</a><p>
							<div class="pdPrice">
								<a href="">6,500��</a><br>
								<a href="" id="pritest">8,000��</a><br>
								�ڡڡڡڡ�
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>	
					</li> <!-- û�� �Ϸ� -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="������" src="/highbrix/images/product_img/tomato2.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">���׺�� ������(500g)</a><p>
							<div class="pdPrice">
								<a href="">7,000��</a><br>
								<a href="" id="pritest">9,000��</a><br>
								�ڡڡڡڡ�
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="��������" src="/highbrix/images/product_img/tomato3.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">���׺�� ��������(500g)</a><p>
							<div class="pdPrice">
								<a href="">7,000��</a><br>
								<a href="" id="pritest">9,000��</a><br>
								�ڡڡڡڡ�
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
				</ul>
			</div>
			<p class="mainText1">���Ӱ� ������<br> �Ż�ǰ</p>
			<div class="pdList">
				<ul> <!-- ��ǰ����Ʈ -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="��ġ����" src="/highbrix/images/product_img/peachapple.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">��ġ����(1kg)</a><p>
							<div class="pdPrice"><a href="">15,000��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>	
					</li> <!-- û�� �Ϸ� -->
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="���ľ߸޷�" src="/highbrix/images/product_img/papayamelon.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">���ľ߸޷�(2��)</a><p>
							<div class="pdPrice"><a href="">10,000��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="�ŵ��������" src="/highbrix/images/product_img/strawberry2.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">�ŵ��������(500g)</a><p>
							<div class="pdPrice"><a href="">10,000��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
					<li class="pdListCon">
						<div class="imgWrap">
							<a href="">
								<img alt="���׺���ڸ�" src="/highbrix/images/product_img/jamong.jpg">
							</a>
						</div>
						<div class="txtWrap"><p><a href="">���׺���ڸ�(1kg)</a><p>
							<div class="pdPrice"><a href="">12,900��</a><p>
								<span>�ڡڡڡڡ�</span>
							</div>
							<div class="cart"><a href=""><img alt="��ٱ���" src="/highbrix/images/cart.jpg"></a></div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</main>

<footer class ="footer">
	<hr>
	<div class="footerText">
		<h3>������Ʈ�� : ���̺긯�� / ���� : Ȳ���,���α�,�ѹμ�,�迹��</h3>
		<a href="/highbrix/dpMain.do"><img alt="���̺긯�� �ΰ�" src="/highbrix/images/highbrix.png"></a>
	</div>
</footer>
</div>
</body>
</html>
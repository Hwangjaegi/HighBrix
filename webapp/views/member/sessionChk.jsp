<%
	//로그인 여부 확인하고, 안 되어 있으면 로그인하라고 이동시킴.
	//마이페이지관련 페이지들에 적용
	String id = (String) session.getAttribute("id");
	if (id == null || id.equals("")){
		response.sendRedirect("loginForm.jsp");
		return;
	}
%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="deco"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>하이-브릭스</title>
<style type="text/css">
.main-layout {
	margin-top: 100px;
	width: 100%;
	display: flex;
	justify-content: center;
}

.sub-left-layout {
	width: 16%;
}

.sub-middle-layout {
	width: 68%;
}

.sub-right-layout {
	width: 16%;
}
</style>
<jsp:include page="header.jsp"></jsp:include>

<deco:head></deco:head>
</head>
<body>

	<div class="main-layout">
		<div class="sub-left-layout"></div>
		<div class="sub-middle-layout">
			<deco:body></deco:body>
		</div>
		<div class="sub-right-layout"></div>
	</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
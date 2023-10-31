<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	background-color: #f4f4f4;
}

nav-logo {
	font-size: 1.5em;
}

.nav-menu {
	list-style: none;
	padding: 0;
	display: flex;
	gap: 20px;
}

.nav-menu li {
	padding: 5px 10px;
}

.nav-login {
	display: flex;
	align-items: center;
	width: 100px;
	justify-content: center;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<nav>
		<div class="nav-logo">LOGO</div>
		<ul class="nav-menu">
			<li><a href="${contextPath }/pet.products">Product</a></li>
			<li>Menu 2</li>
			<li>Menu 3</li>
			<li>Menu 4</li>
		</ul>
		<div class="nav-login">
			<p>로그인</p>
		</div>
	</nav>
</body>
</html>
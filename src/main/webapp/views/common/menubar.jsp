<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	gap: 10px;
}

.login-inputs {
	display: flex;
	flex-direction: column;
	gap: 10px;
}
</style>
</head>
<body>
	<nav>
		<div class="nav-logo">LOGO</div>
		<ul class="nav-menu">
			<li>Menu 1</li>
			<li>Menu 2</li>
			<li>Menu 3</li>
			<li>Menu 4</li>
		</ul>
		<div class="nav-login">
			<div class="login-inputs">
				<input type="text" placeholder="Username"> <input
					type="password" placeholder="Password">
			</div>
			<button>Login</button>
		</div>
	</nav>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	line-height: 1.6;
}

.container {
	max-width: 60%;
	margin: auto;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	background-color: #f4f4f4;
}

.nav-logo {
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

.main-image {
	width: 100%;
	height: 400px;
	background: #ccc;
	text-align: center;
	line-height: 400px;
	font-size: 2em;
	color: #333;
}

.product-list {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	margin-top: 20px;
}

.product {
	width: 18%;
	height: 250px;
	background: #eee;
	text-align: center;
	line-height: 250px;
	font-size: 1.5em;
	color: #333;
}
</style>
</head>
<body>
	<div class="container">
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
					<input type="text" placeholder="Username" /> <input
						type="password" placeholder="Password" />
				</div>
				<button>Login</button>
			</div>
		</nav>
		<div class="main-content">
			<div class="main-image">Main Image</div>
			<div class="product-list">
				<div class="product">Product 1</div>
				<div class="product">Product 2</div>
				<div class="product">Product 3</div>
				<div class="product">Product 4</div>
				<div class="product">Product 5</div>
			</div>
		</div>
	</div>
</body>
</html>

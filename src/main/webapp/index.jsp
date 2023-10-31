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
	width: 70%;
	min-width: 1000px;
	margin: auto;
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
		<%@include file="views/common/menubar.jsp"%>
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


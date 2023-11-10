<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Comparison Page</title>
<style>
.product-comparison {
	width: 70%;
	min-width: 1000px;
	margin: auto;
	margin-top: 100px;
}

.comparison-table {
	width: 100%;
	min-width: 1000px;
	margin: auto;
	border-collapse: collapse;
}

.comparison-table th, .comparison-table td {
	border: 1px solid #ddd;
	text-align: center;
}

.comparison-table th {
	background-color: #f2f2f2;
}

.product-header {
	background-color: #eaeaea;
	padding: 15px;
}

.product-specs {
	padding: 15px;
}

/* Additional styling can go here */
</style>
</head>
<body style="margin:0">
	<%@include file="../common/menubar.jsp"%>
	<div class="product-comparison">
		<%@include file="threeProductCompare.jsp"%>
	</div>
</body>
</html>

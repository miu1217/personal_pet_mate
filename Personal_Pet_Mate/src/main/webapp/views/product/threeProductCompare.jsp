<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background: #ffffff;
}

.compares-div {
	display: flex;
	justify-content: center;
	gap: 2rem;
	padding: 2rem;
}

.compare-product {
	width: 300px;
	overflow: hidden;
	text-align: center;
}

.compare-product img {
	max-width: 100%;
	height: 300px;
}

.compare-product-div {
	padding: 1rem;
}

.compare-product h3 {
	margin: 0.5rem 0;
	font-size: 1.2rem;
	color: #333;
}

.compare-product p {
	margin: 0;
	font-size: 1rem;
	color: #666;
}

.compare-product-info {
	padding: 1rem;
	background: #ffffff;
}

.infomation-product, .ingredient-product, .brand-product {
	margin-bottom: 1rem;
}

.price {
	font-weight: bold;
	color: #ff6f61;
	margin: 1rem 0;
}

.div-line {
	background-color: #e1e1e1;
	height: 1px;
	width: 100%;
	margin: 20px 0;
}
</style>
</head>
<body>
	<div class="compares-div">
		<div class="compare-product">
			<div class="compare-product-div">
				<img class="product-img" src="${contextPath }${phList1[0].filePath }${phList1[0].changeName }">
				<h3>${p1.productName }</h3>
				<p>${p1.productPrice }</p>
			</div>
			<div class="div-line"></div>
			<div class="compare-product-info">
				<div class="ingredient-product">${p1.productIngredient }</div>
				<div class="infomation-product">${p1.productInfo }</div>
				<div class="brand-product">${p1.productBrand }</div>
			</div>
		</div>
		<div class="compare-product">
			<div class="compare-product-div">
				<img class="product-img" src="${contextPath }${phList2[0].filePath }${phList2[0].changeName }">
				<h3>${p2.productName }</h3>
				<p>${p2.productPrice }</p>
			</div>
			<div class="div-line"></div>
			<div class="compare-product-info">
				<div class="ingredient-product">${p2.productIngredient }</div>
				<div class="infomation-product">${p2.productInfo }</div>
				<div class="brand-product">${p2.productBrand }</div>
			</div>
		</div>
		<c:if test="${not empty p3.productName }">
			<div class="compare-product">
				<div class="compare-product-div">
					<c:set var="p3Img" value="${not empty phList3[0].changeName ? (contextPath += phList3[0].filePath += phList3[0].changeName) : '' }" />
					<img class="product-img" src="${p3Img }">
					<c:set var="p3Name" value="${p3.productName != null ? (p3.productName) : ('빈 값입니다') }" />
					<h3>${p3Name }</h3>
					<c:set var="p3Price" value="${p3.productPrice != null ? (p3.productPrice) : ('x') }" />
					<p>${p3Price }</p>
				</div>
				<div class="div-line"></div>
				<div class="compare-product-info">
					<c:set var="p3Ingredient" value="${p3.productIngredient != null ? (p3.productIngredient) : ('x') }" />
					<div class="ingredient-product">${p3Ingredient }</div>
					<c:set var="p3Info" value="${p3.productInfo != null ? (p3.productInfo) : ('x') }" />
					<div class="infomation-product">${p3Info }</div>
					<c:set var="p3Brand" value="${p3.productBrand != null ? (p3.productBrand) : ('x') }" />
					<div class="brand-product">${p3Brand }</div>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 이미지에 대한 스타일 */
.product-img {
	max-width: 100%; /* 너비를 테이블 셀에 맞게 조정 */
	max-height: 200px; /* 최대 높이를 200px로 설정 */
	height: auto; /* 이미지의 비율을 유지하면서 높이를 조정 */
	display: block; /* 이미지를 블록 레벨 요소로 만들어 줄 바꿈 효과를 줌 */
	margin: 0 auto; /* 상하 마진 없이 좌우 마진을 자동으로 설정해 중앙 정렬 */
}

/* 테이블에 대한 추가 스타일 (선택적) */
.comparison-table {
	width: 100%; /* 테이블 너비 전체 사용 */
	table-layout: fixed; /* 열 너비 고정 */
}

.product-specs, .product-header {
	text-align: center; /* 텍스트 중앙 정렬 */
}

.product-price-div {
	display: flex;
	justify-content: space-evenly;
}
</style>
</head>
<body>
	<table class="comparison-table">
		<thead>
			<tr>
				<!-- Product Titles -->
				<th class="product-header">${p1.productName }</th>
				<th class="product-header">${p2.productName }</th>
				<c:set var="p3Name" value="${p3.productName != null ? (p3.productName) : ('빈 값입니다') }" />
				<th class="product-header">${p3Name }</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><img class="product-img" src="${contextPath }${phList1[0].filePath }${phList1[0].changeName }" alt="Product 1"></td>
				<td><img class="product-img" src="${contextPath }${phList2[0].filePath }${phList2[0].changeName }" alt="Product 2"></td>
				<c:set var="p3Img" value="${not empty phList3[0].changeName ? (contextPath += phList3[0].filePath += phList3[0].changeName) : '' }" />
				<td><img class="product-img" src="${p3Img }" alt="${p3Img }"></td>
			</tr>
			<tr>
				<td class="product-specs"><div class="product-price-div">
						<div>가격 :</div>
						<div>${p1.productPrice }</div>
					</div></td>
				<td class="product-specs"><div class="product-price-div">
						<div>가격 :</div>
						<div>${p2.productPrice }</div>
					</div></td>
				<c:set var="p3Price" value="${p3.productPrice != null ? (p3.productPrice) : ('x') }" />
				<td class="product-specs"><div class="product-price-div">
						<div>가격 :</div>
						<div>${p3Price }</div>
					</div></td>
			</tr>
			<tr>
				<td class="product-ingredient">${p1.productIngredient }</td>
				<td class="product-ingredient">${p2.productIngredient }</td>
				<c:set var="p3Ingredient" value="${p3.productIngredient != null ? (p3.productIngredient) : ('x') }" />
				<td class="product-ingredient">${p3Ingredient }</td>
			</tr>
			<tr>
				<td class="product-brand">${p1.productBrand }</td>
				<td class="product-brand">${p2.productBrand }</td>
				<c:set var="p3Brand" value="${p3.productBrand != null ? (p3.productBrand) : ('x') }" />
				<td class="product-brand">${p3Brand }</td>
			</tr>
			<tr>
				<td class="product-tag">${p1.productTag }</td>
				<td class="product-tag">${p2.productTag }</td>
				<c:set var="p3Tag" value="${p3.productTag != null ? (p3.productTag) : ('x') }" />
				<td class="product-tag">${p3Tag }</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
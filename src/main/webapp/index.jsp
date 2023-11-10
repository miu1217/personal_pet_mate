<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main Page</title>
<style>
body {
	font-family: 'Nunito', sans-serif;
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

.product-list1, .product-list2, .product-list3 {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	margin-top: 20px;
	justify-content: center;
}

.product {
	width: 18%;
	height: 250px;
	background: #f5f1dc;
	text-align: center;
	color: #333;
	transition: background 0.3s ease;
	border-radius: 10px;
	overflow: hidden;
	font-family: 'Roboto', sans-serif;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.product span {
	font-size: 20px;
	font-weight: bold;
}

.product:hover {
	background: #A3C08F;
}

span {
	font-size: 20px;
}
</style>
</head>
<body>
	<%@include file="views/common/menubar.jsp"%>
	<div class="container">
		<div class="main-content">
			<div class="main-image">Main Image</div>
			<c:choose>
				<c:when test="${loginUser != null}">
					<div class="product-list1"></div>
					<div class="product-list2"></div>
				</c:when>
				<c:otherwise>
					<div class="product-list1"></div>
					<div class="product-list2"></div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br>
	<script>
		$(document)
				.ready(
						function() {
							// productList categoryList
							$
									.ajax({
										url : "ajax1.do",
										success : function(result) {
											var ipList = result.ipList;
											var pcList = result.pcList;
											var mList = result.mList;

											var productList1 = ""; // productList1에 추가할 HTML 문자열
											var productList2 = "";

											for (var i = 0; i < ipList.length; i++) {
												var productHtml = "<div class='product' onclick=location.href='${contextPath}/pet.productDetail?pno="
														+ ipList[i].productNo
														+ "'><img style='width:100%; height:200px;' src=${contextPath}"
														+ ipList[i].imgsrc
														+ "><span>"
														+ ipList[i].productName
														+ "</span></div>";

												if (i == 10) {
													break;
												}

												if (mList == null && i < 5) {
													productList1 += productHtml;
												} else if (mList == null
														&& 4 < i < 10) {
													productList2 += productHtml;
												} else if (ipList[i].categoryName == mList[0]
														&& i < 5) {
													productList1 += productHtml; // mList == 0
												} else if (ipList[i].categoryName == mList[1]
														&& i < 5) {
													productList2 += productHtml; // mList == 1
												}
											}

											$(
													".container > .main-content > .product-list1")
													.html(productList1);
											$(
													".container > .main-content > .product-list2")
													.html(productList2);
										},
										error : function() {
											console.log("통신 실패");
										},
									});
						});
	</script>
</body>
</html>
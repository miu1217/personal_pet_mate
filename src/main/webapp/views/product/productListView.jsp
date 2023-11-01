<%@page import="com.kh.product.model.vo.ProductCategory"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Product> plist = (ArrayList<Product>) request.getAttribute("plist");
ArrayList<ProductCategory> clist = (ArrayList<ProductCategory>) request.getAttribute("clist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제품 필터 페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f7f7f7;
}

.container-list {
	width: 70%;
	min-width: 1000px;
	margin: auto;
}

.product-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	max-width: 1000px;
	flex-wrap: wrap;
	margin-top: 75px;
}

.product {
	width: 32%;
	box-sizing: border-box;
	margin-bottom: 20px;
	display: flex;
	justify-content: center;
	border: 1px solid gray;
	border-radius: 5px;
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<%@include file="productFilter.jsp"%>
	<div class="container-list">
		<div class="product-list">
			<%
			if (plist.isEmpty()) {
			%>
			<div class="product">제품이 없습니다.</div>
			<%
			} else {
			%>
			<%
			for (Product p : plist) {
			%>
			<div class="product"><%=p.getProductName()%></div>
			<%
			}
			%>
			<%
			}
			%>
		</div>
	</div>
	<script>
		function toggleFilter() {
			const filterDiv = document.getElementById("filterDiv");
			if (filterDiv.style.display === "none"
					|| filterDiv.style.display === "") {
				filterDiv.style.display = "flex";
			} else {
				filterDiv.style.display = "none";
			}
		}
	</script>
</body>
</html>

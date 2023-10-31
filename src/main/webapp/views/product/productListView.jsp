<%-- <%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
ArrayList<Product> plist = (ArrayList<Product>) request.getAttribute("plist");

System.out.println(plist);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제품 필터 페이지</title>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

.container {
	width: 70%;
	margin: 0 auto; /* 중앙 정렬을 위한 설정 */
}

.filter-menu {
	display: flex; /* 필터 메뉴를 가로로 나열하기 위해 flex로 변경 */
	justify-content: space-between; /* 필터 메뉴 항목들 간에 동일한 간격을 유지 */
}

.filter-category {
	flex: 1;
}

.category {
	flex: 1; /* 각 카테고리의 너비를 동일하게 설정 */
	margin-right: 20px; /* 오른쪽 간격 추가 */
}

.category:last-child {
	margin-right: 0; /* 마지막 카테고리의 오른쪽 간격 제거 */
}

.product-list {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.product {
	width: calc(33.33% - 20px); /* 가로 3개 제품 배치, 20px는 gap을 고려한 값 */
	border: 1px solid #e0e0e0;
	padding: 20px;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="../common/menubar.jsp"%>
		<div class="filter-btn-div">
			<button onclick="toggleFilter()">Filter</button>
		</div>
		<div class="filter-menu">
			<!-- 위의 이미지를 기반으로 만든 필터링 메뉴 -->
			<div class="category">
				<!-- 카테고리1 div 추가 -->
				<h2>Price</h2>
				<p>Free</p>

				<h2>카테고리1</h2>
				<label><input type="checkbox"> 사료</label> <br> <label><input
					type="checkbox"> 샤워</label> <br> <label><input
					type="checkbox"> 영양제</label> <br>
			</div>

			<div class="category">
				<!-- 카테고리2 div 추가 -->
				<h2>카테고리2</h2>
				<label><input type="checkbox"> 샴푸</label> <br> <label><input
					type="checkbox"> 컨디셔너</label> <br> <label><input
					type="checkbox"> 눈</label> <br> <label><input
					type="checkbox"> 관절</label> <br> <label><input
					type="checkbox"> 피부</label> <br> <label><input
					type="checkbox"> 사료보조 영양제</label> <br>
				<!-- ... 나머지 항목들 -->
			</div>

			<div class="category">
				<!-- 카테고리3 div 추가 -->
				<h2>카테고리3</h2>
				<label><input type="checkbox"> asdf</label> <br> <label><input
					type="checkbox"> Landing & Website</label> <br>
				<!-- ... 나머지 항목들 -->
			</div>

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

			<script>
				function toggleFilter() {
					const filterMenu = document.querySelector('.filter-menu');
					filterMenu.style.display = filterMenu.style.display === 'none' ? 'block'
							: 'none';
				}
			</script>
		</div>
</body>
</html> --%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Product> plist = (ArrayList<Product>) request.getAttribute("plist");

System.out.println(plist);
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

.container {
	width: 70%;
	min-width: 1000px;
	margin: auto;
	background-color: #ffffff;
}

.filter {
	display: flex;
	justify-content: space-between;
}

.filter-btn-div {
	display: flex;
	justify-content: flex-end;
	margin: 20px 0 20px 0;
}

.filter-btn-div>select {
	margin-left: 20px;
}

.filter>div {
	width: 33%;
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
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="../common/menubar.jsp"%>
		<div class="filter-btn-div">
			<button class="filter-btn" onclick="toggleFilter()">필터</button>
			<select>
				<option>sort by 조회수</option>
				<option>sort by 인기순</option>
				<option>sort by 좋아요순</option>
			</select>
		</div>
		<div class="filter" id="filterDiv">
			<div class="frameworks">
				<h3>Frameworks</h3>
				<label><input type="checkbox"> 사료</label> <br> <label><input
					type="checkbox"> 샤워</label> <br> <label><input
					type="checkbox"> 영양제</label> <br>
			</div>
			<div class="tags">
				<h3>Tags</h3>
				<label><input type="checkbox"> 샴푸</label> <br> <label><input
					type="checkbox"> 컨디셔너</label> <br> <label><input
					type="checkbox"> 눈</label> <br> <label><input
					type="checkbox"> 관절</label> <br> <label><input
					type="checkbox"> 피부</label> <br> <label><input
					type="checkbox"> 사료보조 영양제</label> <br>
			</div>
			<div class="categories">
				<h3>Categories</h3>
				<label><input type="checkbox"> 건식</label> <br> <label><input
					type="checkbox"> 습식</label> <br>
			</div>
		</div>
	</div>
	<div class="container-list">
		<div class="product-list">
			<!-- 제품 리스트 항목들을 여기에 추가하세요 -->
			<div class="product">제품 1</div>
			<div class="product">제품 2</div>
			<div class="product">제품 3</div>
			<!-- ... -->
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

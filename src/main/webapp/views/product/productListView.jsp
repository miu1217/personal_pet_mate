<%@page import="com.kh.product.model.vo.ProductCategory"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	justify-content: space-evenly;
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
			<div class="product" data-category-no="<%=p.getCategoryNo()%>">
				<p><%=p.getProductName()%></p>
				<p><%=p.getCategoryNo()%></p>
			</div>
			<%
			}
			%>
			<%
			}
			%>
		</div>
	</div>
	<script>
	
	function filterProductsByCategory() {
	    // 선택된 카테고리 번호들을 배열로 가져옵니다.
	    let selectedCategories = Array.from(document.querySelectorAll('input[type="checkbox"]:checked')).map(checkbox => checkbox.getAttribute('data-category-no'));

	    // 상위 카테고리 체크박스가 선택되면 해당 카테고리의 모든 하위 카테고리 번호들을 selectedCategories에 포함시킵니다.
	    document.querySelectorAll('.category1 input[type="checkbox"]:checked').forEach(topCheckbox => {
	        const parentCategoryNo = topCheckbox.getAttribute('data-category-no');
	        const childCategoryNumbers = Array.from(document.querySelectorAll('.category2 input[data-parent-category-no="'+parentCategoryNo+'"]')).map(checkbox => checkbox.getAttribute('data-category-no'));
	        selectedCategories = [...selectedCategories, ...childCategoryNumbers];
	    });

	    // 선택된 카테고리가 없다면 모든 제품을 보여줍니다.
	    if (selectedCategories.length === 0) {
	        document.querySelectorAll('.product').forEach(product => {
	            product.style.display = 'block';
	        });
	        return;
	    }

	    // 각 제품에 대해서, 선택된 카테고리에 속하는지 확인하고 그에 따라 제품을 보여주거나 숨깁니다.
	    document.querySelectorAll('.product').forEach(product => {
	        const productCategoryNo = product.getAttribute('data-category-no');
	        if (selectedCategories.includes(productCategoryNo)) {
	            product.style.display = 'block';
	        } else {
	            product.style.display = 'none';
	        }
	    });
	}

	// 모든 체크박스에 대해서 이벤트 리스너를 추가합니다.
	document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
	    checkbox.addEventListener('change', filterProductsByCategory);
	});
	
	
	
	
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

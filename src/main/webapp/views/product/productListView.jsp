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
	    let selectedCategories = Array.from(document.querySelectorAll('input[type="checkbox"]:checked')).map(checkbox => checkbox.getAttribute('data-category-no'));

	    document.querySelectorAll('.category1 input[type="checkbox"]:checked').forEach(topCheckbox => {
	        const parentCategoryNo1 = topCheckbox.getAttribute('data-category-no');
	        const childCategoryNumbers2 = Array.from(document.querySelectorAll('.category2 input[data-parent-category-no="'+parentCategoryNo1+'"]:checked'));
	        
	        // 카테고리 2가 선택되지 않았을 경우
	        if (childCategoryNumbers2.length === 0) {
	            const allChildCategoryNumbers2 = Array.from(document.querySelectorAll('.category2 input[data-parent-category-no="'+parentCategoryNo1+'"]')).map(checkbox => checkbox.getAttribute('data-category-no'));
	            selectedCategories = [...selectedCategories, ...allChildCategoryNumbers2];
	            
	            allChildCategoryNumbers2.forEach(category2No => {
	                const childCategoryNumbers3 = Array.from(document.querySelectorAll('.category3 input[data-parent-category-no="'+category2No+'"]:not(:checked)')).map(checkbox => checkbox.getAttribute('data-category-no'));
	                selectedCategories = [...selectedCategories, ...childCategoryNumbers3];
	            });
	        } else {
	            childCategoryNumbers2.forEach(checkbox2 => {
	                const parentCategoryNo2 = checkbox2.getAttribute('data-category-no');
	                
	                const checkedCategoryNumbers3 = Array.from(document.querySelectorAll('.category3 input[data-parent-category-no="'+parentCategoryNo2+'"]:checked')).map(checkbox => checkbox.getAttribute('data-category-no'));
	                
	                // 카테고리 3이 선택되었을 경우
	                if (checkedCategoryNumbers3.length > 0) {
	                    selectedCategories = [...selectedCategories, ...checkedCategoryNumbers3];
	                } else {
	                    const childCategoryNumbers3 = Array.from(document.querySelectorAll('.category3 input[data-parent-category-no="'+parentCategoryNo2+'"]')).map(checkbox => checkbox.getAttribute('data-category-no'));
	                    selectedCategories = [...selectedCategories, ...childCategoryNumbers3];
	                }
	            });
	        }
	    });

	    // 선택된 카테고리가 없다면 모든 제품을 보여줍니다.
	    if (selectedCategories.length === 0) {
	        document.querySelectorAll('.product').forEach(product => {
	            product.style.display = 'block';
	        });
	        return;
	    }

	    document.querySelectorAll('.product').forEach(product => {
	        const productCategoryNo = product.getAttribute('data-category-no');
	        if (selectedCategories.includes(productCategoryNo)) {
	            product.style.display = 'block';
	        } else {
	            product.style.display = 'none';
	        }
	    });
	}

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

<%@page import="com.kh.product.model.vo.ProductCategory"%>
<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ArrayList<Product> phList = (ArrayList<Product>) request.getAttribute("phList");
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
	display: flex;
	justify-content: center;
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
	box-sizing: border-box;
	margin-bottom: 20px;
	display: flex;
	justify-content: space-evenly;
	border: 1px solid gray;
	border-radius: 5px;
}

#filterDiv {
	display: none;
}

.product-info {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.empty-product {
	display: flex;
	justify-content: center;
}

#product-img {
	width: 250px;
	height: 300px;
	margin: 10px;
	border-radius: 5px;
	cursor: pointer;
}

#product-name {
	font-weight: bold;
}

.product-price {
	width: 100%;
	display: flex;
	justify-content: space-around;
}

.product-price>p {
	margin: 0px
}

.product-info>p {
	max-width: 200px;
	word-wrap: break-word;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: break-word;
	white-space: nowrap;
}

#comparisonArea {
	display: flex;
	justify-content: space-between; /* 추가된 스타일 */
	align-items: center;
	flex-direction: row;
	gap: 10px;
	padding: 10px;
	border-top: 1px solid #ccc;
	margin-top: 20px;
	justify-content: space-between;
}

#productsToCompare {
	flex-grow: 1;
	display: flex;
	justify-content: center;
	gap: 10px;
}

#compareButton {
	background-color: #b0cc99;
	width: 100px;
	color: white;
	border: none;
	padding: 10px 10px;
	text-align: center;
	text-decoration: none;
	display: flex;
	justify-content: center;
	font-size: 16px;
	margin-left: auto; /* 이 부분을 추가해서 버튼을 오른쪽으로 밀어냅니다 */
	cursor: pointer;
	border-radius: 8px;
	transition: background-color 0.3s;
	color: white;
	font-size: 16px;
}

#compareButton:hover {
	background-color: #677e52;
}

.product-compare {
	width: 100%;
	display: flex;
	float: left;
	margin: 0 0 10px 20px;
	cursor: pointer;
}

.plusIcon {
	width: 16px;
	height: 16px;
	margin-right: 8px;
}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<%@include file="productFilter.jsp"%>
	<div class="container-list">
		<%
		if (phList.isEmpty()) {
		%>
		<div class="empty-product">제품이 없습니다.</div>
		<%
		} else {
		%>

		<div class="product-list">
			<%
			for (Product p : phList) {
			%>
			<div class="product" data-category-no="<%=p.getCategoryNo()%>" data-product-no="<%=p.getProductNo()%>" data-product-name="<%=p.getProductName()%>">
				<div class="product-info">
					<img src="<%=contextPath%><%=p.getImgsrc()%>" id="product-img" data-product-no="<%=p.getProductNo()%>" onclick="productDetail(this)">
					<div id="product-name">
						<p><%=p.getProductName()%></p>
					</div>
					<div class="product-price">
						<p>가격</p>
						<p id="product-price"><%=p.getProductPrice()%></p>
					</div>
					<div class="product-info">
						<p><%=p.getProductTag()%></p>
					</div>
					<div class="product-compare">
						<img src="${contextPath }/resources/assets/icons/plus.svg" class="plusIcon" /> <span>비교하기</span>
					</div>
				</div>
			</div>
			<%
			}
			%>
			<%
			}
			%>
		</div>
	</div>
	<div id="comparisonArea">
		<!-- 제품 비교 영역 -->
		<div id="productsToCompare">
			<!-- 여기에 담긴 제품들이 표시됩니다. -->
		</div>

		<!-- 비교하기 버튼 이동 -->
		<button id="compareButton" onclick="compareProducts()">비교하기</button>
	</div>
	<script>
		function productDetail(e){
		    location.href="${contextPath}/pet.productDetail?pno="+e.dataset.productNo;
		}
	</script>

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

	<script>
		var selectedProducts = [];
		
		function addProductToComparison(product) {
		  var productNo = product.getAttribute('data-product-no');
		  if (selectedProducts.length >= 3) {
		      alert('제품은 3개까지 담을 수 있습니다.');
		      return;
		    }
		  if (selectedProducts.includes(productNo)) {
		    alert('이미 담은 제품입니다.');
		    return;
		  }
		  selectedProducts.push(productNo);
		  updateProductStyles();
		  updateComparisonArea();
		}
		
		function removeProductFromComparison(productNo) {
		  selectedProducts = selectedProducts.filter(no => no !== productNo);
		  updateProductStyles();
		  updateComparisonArea();
		}
		
		function updateProductStyles() {
		  document.querySelectorAll('.product').forEach(product => {
		    var productNo = product.getAttribute('data-product-no');
		    var compareDiv = product.querySelector('.product-compare span');
		    if (selectedProducts.includes(productNo)) {
		        compareDiv.style.color = 'green';
		    } else {
		        compareDiv.style.color = 'black';
		    }
		  });
		}
		
		function updateComparisonArea() {
		  var productsToCompareDiv = document.getElementById('productsToCompare');
		  productsToCompareDiv.innerHTML = '';
		  selectedProducts.forEach(productNo => {
		    var productElement = document.querySelector('.product[data-product-no="'+productNo+'"]');
		    var productName = productElement.querySelector('#product-name p').innerText; // Get the product name
		    var productImg = productElement.querySelector('#product-img').src;
		    var productPrice = productElement.querySelector('#product-price').innerText;
		    var productDiv = document.createElement('div');
		    productDiv.setAttribute('data-product-no', productNo); // Store the product number here for removal
		    productDiv.style.cssText = 'width: 200px; height: 100px; border: 1px solid black; border-radius: 5px; display: flex; align-items: center; justify-content: space-between; padding: 10px;';
		    productDiv.innerHTML = '<div style="display:flex; align-items:center; flex-direction: column;"><div style="display:flex; align-items:center;"><img src="'+productImg+'" style="width: 50px; height: 50px;"><span style="display:inline-block; width:120px; overflow-wrap:break-word; margin-left:10px;">'+productName+'</span></div><div style="margin-top:10px;"><span>가격 : </span><span>'+productPrice+'원</span></div></div>';
		    var xDiv = document.createElement('div');
		    xDiv.style.cssText = 'height: inherit;';
		    var removeButton = document.createElement('button');
		    removeButton.textContent = 'x';
		    removeButton.style.cssText = 'background-color: #f7f7f7; color: white; border: none; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; cursor: pointer; color: black;';
		    removeButton.onclick = function() { removeProductFromComparison(productNo); };
		    xDiv.appendChild(removeButton);
		    productDiv.appendChild(xDiv);
		    productsToCompareDiv.appendChild(productDiv);
		  });
		  compareButton.style.display = selectedProducts.length > 0 ? 'flex' : 'none';
		  document.getElementById('compareButton').disabled = selectedProducts.length < 2;
		}
		
		document.querySelectorAll('.product-compare').forEach(compareDiv => {
		    compareDiv.addEventListener('click', function() {
		      var productDiv = this.closest('.product');
		      addProductToComparison(productDiv);
		    });
		  });
		
		updateProductStyles();
		updateComparisonArea();
		
		function compareProducts(){
		    let queryParams = '';
		    selectedProducts.forEach(function(product, index) {
		        console.log(product, index);
		        queryParams += (index === 0 ? '?' : '&') + 'productNo=' + product;
		      });
		    console.log(queryParams);
		      
		      location.href = '${contextPath}/pet.compare' + queryParams;
		} 
</script>
</body>
</html>

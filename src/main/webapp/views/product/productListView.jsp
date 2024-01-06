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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
    flex-direction: column;
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
}
#filterDiv {
    display: none;
}
.product-info {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
.product-infomation {
    display: -webkit-box;
    max-width: 300px;
    word-wrap: break-word;
    overflow-wrap: break-word;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    overflow-wrap: break-word;
    -webkit-line-clamp: 2;
}
.product-infomation>p {
    margin: 0px;
}
.empty-product {
    display: flex;
    justify-content: center;
}
#product-img {
    width: 300px;
    height: 300px;
    cursor: pointer;
}
#product-name {
    font-weight: bold;
}
}
.product-price>p {
    margin: 0px
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
    color: white;
    font-size: 16px;
}
.product-compare {
    display: flex;
    float: left;
    cursor: pointer;
    align-items: center;
}
.plusIcon {
    width: 16px;
    height: 16px;
    margin-right: 8px;
}
.product-foot {
    display: flex;
    justify-content: space-between;
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
        <div class="product-list" id="product-list">
            <%
            }
            %>
        </div>
        <button type="button" class="btn btn-light" style="background-color: #89725B; border: 1px solid #89725B; color: #fff; margin-top: 20px;" id="loadMoreBtn">더보기</button>
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
    var page = 1; // Initial page number
    var reviewsPerPage = 9;
        // $(document).ready에서 한 번 실행
        $(document).ready(function () {
            // 초기 로드
            loadMoreReviews();
            // 클릭 이벤트 핸들러 등록
            $("#loadMoreBtn").click(loadMoreReviews);
           
        });
         // 명시적 함수 정의
        function loadMoreReviews() {
               
                $.ajax({
                    url: "pet.products.more",
                    type: "GET",
                    data: { page: page },
                    success: function (data) {
                        console.log('sccuess');
                        console.log(data);
                        // Iterate through the received reviews and append them to the review tab
                            $.each(data, function (index, pm) {
                            var productHtml = '<div class="product"data-category-no="'+pm.categoryNo+'" data-product-no="'+pm.productNo+'" data-product-name="'+pm.productName+'">';
                            productHtml += '<div class="product-info"><img src="${contextPath}'+pm.imgsrc+'" id="product-img" data-product-no="'+pm.productNo+'" onclick="productDetail(this)">';
                            productHtml += '<div id="product-name"><p>'+pm.productName+'</p></div>';
                            productHtml += '<div class="product-infomation"><p>'+pm.categoryName+'</p></div>';
                            productHtml += '<div class="product-foot"><div class="product-price"><p id="product-price">'+pm.productPrice+'원</p>';
                            productHtml += '</div><div class="product-compare"><img src="${contextPath }/resources/assets/icons/plus.svg" class="plusIcon" /> <span>비교하기</span></div>';
                            productHtml += '</div></div></div>'; 
                            $('#product-list').append(productHtml);
                        });
                    },
                    error: function () {
                        console.error("Error loading more reviews.");
                    },
                    complete: function () {
                        // Increment the page number for the next load, regardless of success or error
                        page++;
                    }
                });
            }
        
    </script>
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
              showError("경고", "제품은 3개까지 담을 수 있습니다.", "확인");
              return;
            }
          if (selectedProducts.includes(productNo)) {
                  showError("경고", "이미 담은 제품입니다.", "확인");
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
            productDiv.style.cssText = 'width: 200px; height: 100px; display: flex; border: 1px solid #ccc; border-radius: 3px; align-items: center; justify-content: space-between; padding: 5px 10px 5px 10px;';
            productDiv.innerHTML = '<div style="display:flex; align-items:center; flex-direction: column;"><div style="display:flex; align-items:center;"><img src="'+productImg+'" style="width: 50px; height: 50px;"><span style="display:inline-block; width:120px; overflow-wrap:break-word; margin-left:10px;">'+productName+'</span></div><div style="margin-top:10px;"><span>'+productPrice+'</span></div></div>';
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
            console.log("click");
            compareDiv.addEventListener('click', function() {
              var productDiv = this.closest('.product');
              if (productDiv) {
                  addProductToComparison(productDiv);
                }
            });
          });
        
        updateProductStyles();
        updateComparisonArea();
        
        document.addEventListener('DOMContentLoaded', function() {
            // ... other DOMContentLoaded code ...
            // Event delegation for dynamically loaded content
            document.querySelector('.container-list').addEventListener('click', function(event) {
              if (event.target.closest('.product-compare')) {
                var productDiv = event.target.closest('.product');
                if (productDiv) {
                  addProductToComparison(productDiv);
                }
              }
            });
          });
        
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
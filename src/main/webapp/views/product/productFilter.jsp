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

.category2 {
	display: flex;
	flex-direction: column;
	width: 15%;
	padding-left: 24px;
}

.category1 {
	display: flex;
	flex-direction: column;
	width: 10%;
	padding: 0 12px 0 24px;
}

.category3 {
	width: 70%;
	padding-left: 24px;
}

.categoryLine {
	background-color: #808080;
	width: 1px;
	height: 284px;
}

.selectBox-div {
	display: grid;
	padding: 5px;
	grid-template-columns: repeat(5, 20%);

}
</style>
</head>
<body>
	<div class="container">
		<div class="filter-btn-div">
			<button class="filter-btn" onclick="toggleFilter()">필터</button>
			<select id="productFilter">
				<option value="all">전체 글</option>
				<option value="1">조회 순</option>
				<option value="2">리뷰 많은순</option>
			</select>
		</div>
		<div class="filter" id="filterDiv">
			<div class="category1">
				<h3>category1</h3>
				<c:forEach items="${clist }" var="list">
					<c:if test="${list.parentCategoryNo == 0 }">
						<label><input type="checkbox" data-category-no="${list.categoryNo}"> ${list.categoryName }</label>
						<br>
					</c:if>
				</c:forEach>
			</div>
			<div class="categoryLine"></div>
			<div class="category2">
				<h3>category2</h3>
				<c:forEach items="${clist }" var="list">
					<c:if test="${list.parentCategoryNo == 2 || list.parentCategoryNo == 3 }">
						<label><input type="checkbox" data-parent-category-no="${list.parentCategoryNo }" data-category-no="${list.categoryNo }"> ${list.categoryName }</label>
						<br>
					</c:if>
				</c:forEach>
			</div>
			<div class="categoryLine"></div>
			<div class="category3">
				<h3>category3</h3>
				<div class="selectBox-div">
					<c:forEach items="${clist }" var="list">
						<c:if test="${list.parentCategoryNo != 2 && list.parentCategoryNo != 3 && list.parentCategoryNo != 0 }">
							<label><input type="checkbox" data-parent-category-no="${list.parentCategoryNo }" data-category-no="${list.categoryNo }"> ${list.categoryName }</label>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<script>
										document.addEventListener('DOMContentLoaded', function() {
										        // 가정: 'selectedCategory' 변수가 서버로부터 전달받은 현재 카테고리 값을 저장하고 있음
										        var selectedCategory = '<%=request.getParameter("productCategory")%>' || 'all';
	
										        // Select box에서 해당 값을 선택하도록 설정
										        var selectBox = document.getElementById('productFilter');
										        selectBox.value = selectedCategory;
										        
											    document.getElementById('productFilter').addEventListener('change', function() {
											        var selectedCategory = this.value;
											        if(selectedCategory === 0) {
											            location.href = 'pet.products?productCategory=all'; // Update this URL as per your routing structure
											        } else {
											            location.href = 'pet.products?productCategory=' + selectedCategory; // Update as per your routing
											        }
											    });
										});
					</script>

			<script>
			document.addEventListener('DOMContentLoaded', function() {
			    const topCategoryCheckboxes = document.querySelectorAll('.category1 input[type="checkbox"]');
			    const secondCategoryCheckboxes = document.querySelectorAll('.category2 input[type="checkbox"]');
			    const thirdCategoryCheckboxes = document.querySelectorAll('.category3 input[type="checkbox"]');

			    topCategoryCheckboxes.forEach(checkbox => {
			        checkbox.addEventListener('change', function() {
			            const categoryNo = this.getAttribute('data-category-no');

			            if (this.checked) {
			                // 체크된 경우, 다른 체크박스들은 비활성화.
			                topCategoryCheckboxes.forEach(otherCheckbox => {
			                    if (otherCheckbox !== this) otherCheckbox.disabled = true;
			                });
			                secondCategoryCheckboxes.forEach(secondCheckbox => {
			                    if (secondCheckbox.getAttribute('data-parent-category-no') === categoryNo) {
			                        secondCheckbox.disabled = false;
			                    } else {
			                        secondCheckbox.disabled = true;
			                        secondCheckbox.checked = false;
			                    }
			                });

			                thirdCategoryCheckboxes.forEach(thirdCheckbox => {
			                    thirdCheckbox.disabled = true;
			                    thirdCheckbox.checked = false;
			                });
			            } else {
			                topCategoryCheckboxes.forEach(otherCheckbox => otherCheckbox.disabled = false);
			                secondCategoryCheckboxes.forEach(secondCheckbox => secondCheckbox.disabled = false);
			                thirdCategoryCheckboxes.forEach(thirdCheckbox => thirdCheckbox.disabled = false);
			            }
			        });
			    });

			    secondCategoryCheckboxes.forEach(checkbox => {
			        checkbox.addEventListener('change', function() {
			            const categoryNo = this.getAttribute('data-category-no');
			            const parentCategoryNo = this.getAttribute('data-parent-category-no');
			            if (this.checked) {
			                thirdCategoryCheckboxes.forEach(thirdCheckbox => {
			                    if (thirdCheckbox.getAttribute('data-parent-category-no') === categoryNo) {
			                        thirdCheckbox.disabled = false;
			                    } else {
			                        if (!thirdCheckbox.disabled) thirdCheckbox.disabled = true;
			                        thirdCheckbox.checked = false;
			                    }
			                });

			                secondCategoryCheckboxes.forEach(secondCheckbox => {
			                    if (secondCheckbox.getAttribute('data-parent-category-no') === parentCategoryNo && secondCheckbox !== this) {
			                        secondCheckbox.disabled = true;
			                        secondCheckbox.checked = false;
			                    }
			                });
			            } else {
			                let isActiveCategory2 = false;
			                secondCategoryCheckboxes.forEach(secondCheckbox => {
			                    if (secondCheckbox.checked) isActiveCategory2 = true;
			                });

			                if (!isActiveCategory2) {
			                    topCategoryCheckboxes.forEach(topCheckbox => {
			                        if (topCheckbox.checked) {
			                            const topCategoryNo = topCheckbox.getAttribute('data-category-no');
			                            secondCategoryCheckboxes.forEach(secondCheckbox => {
			                                if (secondCheckbox.getAttribute('data-parent-category-no') === topCategoryNo) {
			                                    secondCheckbox.disabled = false;
			                                }
			                            });
			                        }
			                    });

			                    thirdCategoryCheckboxes.forEach(thirdCheckbox => {
			                        if (thirdCheckbox.getAttribute('data-parent-category-no') !== parentCategoryNo) {
			                            thirdCheckbox.disabled = true;
			                        } else {
			                            thirdCheckbox.disabled = false;
			                        }
			                        thirdCheckbox.checked = false;
			                    });
			                }
			            }
			        });
			    });
			});
		</script>
		</div>
	</div>
</body>
</html>
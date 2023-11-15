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
}

.filter {
	display: flex;
	justify-content: space-between;
	background-color: #fff;
}

.filter-btn-div {
	display: flex;
	justify-content: flex-end;
	margin: 20px 0 20px 0;
}

.filter-btn-div>select {
	margin-left: 20px;
}

.filter-btn {
	background-color: #b0cc99;
	width: 100px;
	color: white;
	border: none;
	padding: 10px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
	color: white;
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
	margin-top: 14px;
	width: 1px;
	height: 264px;
}

.selectBox-div {
	display: grid;
	padding: 5px;
	grid-template-columns: repeat(5, 20%);
}

select {
  width: 250px;
  padding: 12px;
  border: 0 !important;
  background-color: white;
  /* needed */
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2212%22%20height%3D%2212%22%20viewBox%3D%220%200%2012%2012%22%3E%3Ctitle%3Edown-arrow%3C%2Ftitle%3E%3Cg%20fill%3D%22%23000000%22%3E%3Cpath%20d%3D%22M10.293%2C3.293%2C6%2C7.586%2C1.707%2C3.293A1%2C1%2C0%2C0%2C0%2C.293%2C4.707l5%2C5a1%2C1%2C0%2C0%2C0%2C1.414%2C0l5-5a1%2C1%2C0%2C1%2C0-1.414-1.414Z%22%20fill%3D%22%23000000%22%3E%3C%2Fpath%3E%3C%2Fg%3E%3C%2Fsvg%3E");
    background-size: .6em;
    background-position: calc(100% - 1.3em) center;
    background-repeat: no-repeat;
}
select::-ms-expand {
    display: none;
}

</style>
</head>
<body>
	<div class="container">
		<div class="filter-btn-div">
			<button class="filter-btn" onclick="toggleFilter()">필터</button>
			<select id="productFilter" aria-invalid="false">
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
										        var selectedCategory = '<%=request.getParameter("productCategory")%>' || 'all';
	
										        var selectBox = document.getElementById('productFilter');
										        selectBox.value = selectedCategory;
										        
											    document.getElementById('productFilter').addEventListener('change', function() {
											        var selectedCategory = this.value;
											        if(selectedCategory === 0) {
											            location.href = 'pet.products?productCategory=all';
											        } else {
											            location.href = 'pet.products?productCategory=' + selectedCategory; 
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
			            

			            if (this.checked && categoryNo === '1') { 
			                thirdCategoryCheckboxes.forEach(thirdCheckbox => {
			                    if (thirdCheckbox.getAttribute('data-parent-category-no') === categoryNo) {
			                        thirdCheckbox.disabled = false;
			                    } else {
			                        thirdCheckbox.disabled = true;
			                        thirdCheckbox.checked = false;
			                    }
			                });
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
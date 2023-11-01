<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.filter>div {
	width: 33%;
}
</style>
</head>
<body>
<div class="container">
		<div class="filter-btn-div">
			<button class="filter-btn" onclick="toggleFilter()">필터</button>
			<select>
				<option>sort by 조회수</option>
				<option>sort by 인기순</option>
				<option>sort by 좋아요순</option>
			</select>
		</div>
		<div class="filter" id="filterDiv">
			<div class="category1">
				<h3>category1</h3>
				<c:forEach items="${clist }" var="list">
					<c:if test="${list.parentCategoryNo == 0 }">
						<label><input type="checkbox"
							data-category-no="${list.categoryNo}">
							${list.categoryName }</label>
						<br>
					</c:if>
				</c:forEach>
			</div>
			<div class="category2">
				<h3>category2</h3>
				<c:forEach items="${clist }" var="list">
					<c:if
						test="${list.parentCategoryNo == 2 || list.parentCategoryNo == 3 }">
						<label><input type="checkbox"
							data-parent-category-no="${list.parentCategoryNo }"
							data-category-no="${list.categoryNo }">
							${list.categoryName }</label>
						<br>
					</c:if>
				</c:forEach>
			</div>
			<div class="category3">
				<h3>category3</h3>
				<c:forEach items="${clist }" var="list">
					<c:if
						test="${list.parentCategoryNo != 2 && list.parentCategoryNo != 3 && list.parentCategoryNo != 0 }">
						<label><input type="checkbox"
							data-parent-category-no="${list.parentCategoryNo }">
							${list.categoryName }</label>
						<br>
					</c:if>
				</c:forEach>
			</div>
			<script>
			const topCategoryCheckboxes = document.querySelectorAll('.category1 input[type="checkbox"]');
			const secondCategoryCheckboxes = document.querySelectorAll('.category2 input[type="checkbox"]');
			
			topCategoryCheckboxes.forEach(checkbox => {
			    checkbox.addEventListener('change', function() {
			        if (this.checked) {
			            // 현재 체크박스 외의 모든 체크박스를 비활성화
			            topCategoryCheckboxes.forEach(otherCheckbox => {
			                if (otherCheckbox !== this) {
			                    otherCheckbox.disabled = true;
			                }
			            });
			        } else {
			            // 모든 체크박스를 다시 활성화
			            topCategoryCheckboxes.forEach(otherCheckbox => {
			                otherCheckbox.disabled = false;
			            });
			        }
			    });
			});

			secondCategoryCheckboxes.forEach(checkbox => {
			    checkbox.addEventListener('change', function() {
			        if (this.checked) {
			            // 현재 체크박스 외의 모든 체크박스를 비활성화
			            secondCategoryCheckboxes.forEach(otherCheckbox => {
			                if (otherCheckbox !== this) {
			                    otherCheckbox.disabled = true;
			                }
			            });
			        } else {
			            // 최상위 카테고리에서 선택된 카테고리 번호를 얻기
			            let selectedFirstCategory;
			            topCategoryCheckboxes.forEach(firstCheckbox => {
			                if (firstCheckbox.checked) {
			                    selectedFirstCategory = firstCheckbox.getAttribute('data-category-no');
			                }
			            });

			            // 모든 체크박스를 다시 활성화하되, 선택된 최상위 카테고리와 관련된 체크박스만 활성화
			            secondCategoryCheckboxes.forEach(otherCheckbox => {
			                if (otherCheckbox.getAttribute('data-parent-category-no') === selectedFirstCategory) {
			                    otherCheckbox.disabled = false;
			                }
			            });
			        }
			    });
			});
			

    // 카테고리1의 모든 체크박스에 대한 이벤트 리스너 추가
    document.querySelectorAll('.category1 input[type="checkbox"]').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const categoryNo = this.getAttribute('data-category-no');
            const isChecked = this.checked;

            document.querySelectorAll('.category2 input[type="checkbox"], .category3 input[type="checkbox"]').forEach(childCheckbox => {
                childCheckbox.disabled = isChecked;
            });
            
            if(isChecked) {
                document.querySelectorAll('input[data-parent-category-no="' + categoryNo + '"]').forEach(matchingCheckbox => {
                    matchingCheckbox.disabled = false;
                	});
            	}
            	});
        	});
    document.querySelectorAll('.category2 input[type="checkbox"]').forEach(checkbox => {
    	checkbox.addEventListener('change', function() {
    		const categoryNo = this.getAttribute('data-category-no');
    		const isChecked = this.checked;
    		
    		document.querySelectorAll('.category3 input[type="checkbox"]').forEach(childCheckbox => {
                childCheckbox.disabled = true;
            });
    		
    		if(isChecked) {
                document.querySelectorAll('.category3 input[data-parent-category-no="' + categoryNo + '"]').forEach(matchingCheckbox => {
                    matchingCheckbox.disabled = false;
                	});
            	}
    	})
    })
		</script>
		</div>
	</div>
</body>
</html>
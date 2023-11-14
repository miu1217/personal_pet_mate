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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>
body {
	font-family: 'Nunito', sans-serif;
	margin: 0;
	padding: 0;
	line-height: 1.6;
}

.container {
	width: 100%;
	min-width: 1000px;
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

.product img {
	width: 100%;
	height: 60%;
	object-fit: cover;
	border-bottom: 2px solid #ccc;
}

.product span {
	font-size: 18px;
	font-weight: bold;
	padding: 10px;
	display: block;
}

.product:hover {
	background: #A3C08F;
}

span {
	font-size: 20px;
}

* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
	color: #333;
}

.wrap {
	padding: 15px;
	letter-spacing: -0.5px;
}

.tab_menu {
	position: relative;
	margin: auto;
	text-align: center;
	overflow: hidden;
}

.tab_menu .list {
	overflow: hidden;
	list-style: none;
	padding: 0;
	display: flex;
	justify-content: center;
	margin-top: 40px;
}

.tab_menu .list li {
	margin-right: 14px;
}

.tab_menu .list .btn {
	font-size: 16px;
}

.tab_menu .list li.is_on .btn {
	font-weight: bold;
	color: green;
}

.cont {
	display: flex;
	flex-wrap: wrap;
	gap: 24px;
	margin-top: 20px;
	justify-content: center;
}

#tab2, #tab3, #tab4, #tab5 {
	margin-top: 40px;
}
</style>
</head>
<body>
	<%@include file="views/common/menubar.jsp"%>
	<div class="container">
		<div class="main-content">
			<div class="main-image">Main Image</div>
			<div class="tab_menu">
				<ul class="list">
					<li class="is_on"><a href="#tab1" class="btn"
						onclick="location.href='${contextPath}'">All</a></li>
					<li><a href="#tab2" class="btn">Eat</a></li>
					<li><a href="#tab3" class="btn">Shower</a></li>
					<li><a href="#tab4" class="btn">Nutrients</a></li>
					<c:if test="${loginUser != null }">
						<li><a href="#tab5" class="btn">추천상품</a></li>
					</c:if>
				</ul>
				<div class="cont_area">
					<div id="tab1" class="cont"></div>
					<div id="tab2" class="cont"></div>
					<div id="tab3" class="cont"></div>
					<div id="tab4" class="cont"></div>
					<div id="tab5" class="cont"></div>
				</div>
			</div>
		</div>
	</div>
	<script>
		const tabList = document.querySelectorAll('.tab_menu .list li');
		const contents = document
				.querySelectorAll('.tab_menu .cont_area .cont')
		let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

		for (var i = 0; i < tabList.length; i++) {
			tabList[i]
					.querySelector('.btn')
					.addEventListener(
							'click',
							function(e) {
								e.preventDefault();
								for (var j = 0; j < tabList.length; j++) {
									// 나머지 버튼 클래스 제거
									tabList[j].classList.remove('is_on');

									// 나머지 컨텐츠 display:none 처리
									contents[j].style.display = 'none';
								}

								// 버튼 관련 이벤트
								this.parentNode.classList.add('is_on');

								// 버튼 클릭시 컨텐츠 전환
								activeCont = this.getAttribute('href');
								document.querySelector(activeCont).style.display = 'flex';

							});
		}
	</script>
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
											var loginUser = "${loginUser}";

											// productList1에 추가할 HTML 문자열
											var productListAll = ""; //전체
											var productListEat = ""; //사료
											var productListShower = ""; //샤워
											var productListNutrient = ""; //영양제
											var productListUser = ""; //로그인유저추천타입

											for (var i = 0; i < ipList.length; i++) {
												var productHtml = "<div class='product' onclick=location.href='${contextPath}/pet.productDetail?pno="
														+ ipList[i].productNo
														+ "'><img style='width:100%; height:200px;' src=${contextPath}"
														+ ipList[i].imgsrc
														+ "><span>"
														+ ipList[i].productName
														+ "</span></div>";
														
												if(loginUser != "" || loginUser == ""){ //all 활성화시 다른 카테고리도 같이들어오는 제거 작업
													productListAll += productHtml;
													document.querySelector('#tab2').style.display = 'none';	
													document.querySelector('#tab3').style.display = 'none';	
													document.querySelector('#tab4').style.display = 'none';	
													document.querySelector('#tab5').style.display = 'none';																								
												}
													
												if (ipList[i].parentCategoryNo == 1) { //사료
													productListEat += productHtml;
												} else if (ipList[i].parentCategoryNo == 4
														|| ipList[i].parentCategoryNo == 5) { //샴푸,컨디셔너
													productListShower += productHtml;
												} else if (ipList[i].parentCategoryNo >= 6
														&& ipList[i].parentCategoryNo <= 9) { //영양제
													productListNutrient += productHtml;
												}

												if (loginUser != "") { //로그인 정보 조건 처리
													if (ipList[i].categoryName == mList[0]
															|| ipList[i].categoryName == mList[1]) {
														productListUser += productHtml;
													}
												}

											}
		
											$("#tab1").html(productListAll);
											$("#tab2").html(productListEat);
											$("#tab3").html(productListShower);
											$("#tab4").html(productListNutrient);
											$("#tab5").html(productListUser);

										},
										error : function() {
											console.log("통신 실패");
										},
									});
						});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
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
<title>Personal PetMate</title>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<style>

body {
	font-family: font-family:'Nunito', sans-serif;
	margin: 0;
	padding: 0;
	line-height: 1.6;
	background-color: #fffff;
	color: #333;
}

.container {
	width: 100%;
	min-width: 1200px;
}


.main-image {
	width: 100%;
	height: 100%;
	text-align: center;
	font-size: 2em;
	color: #fff;
	position: relative;
	overflow: hidden;
}

.main-image img {
	width: 100%;
    height: 100%;
    object-fit: cover;
    
}

.list {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	margin-top: 10px;
}

.list li {
	margin-right: 20px;
}

.btn {
	font-size: 16px;
	color: #677E52;
	text-decoration: none;
	padding: 8px 16px;
	transition: background-color 0.3s ease;
}

.cont {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	margin-top: 20px;
	justify-content: center;
}

.product {
	width: 22%;
	margin-bottom: 30px;
	background: #fff;
	text-align: center;
	overflow: hidden;
	transition: transform 0.3s ease;
}

.product img {
	width: 100%;
	height: 400px;
	object-fit: cover;
	border-bottom: 2px solid #eee;
}

.product span {
	display: block;
	padding: 15px;
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.product:hover {
	transform: scale(1.05);
}

span {
	font-size: 20px;
	font-family: "Cairo", sans-serif;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

a {
	text-decoration: none;
	color: #677E52;
}

.tab_menu {
	position: relative;
	margin: auto;
	text-align: center;
	overflow: hidden;
	background-color: #fffff;
	padding: 15px;
	margin-top: 20px;
}

.tab_menu .list {
	list-style: none;
	padding: 0;
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

.tab_menu .list li {
	margin-right: 20px;
}

.tab_menu .list .btn {
	position: relative;
	  font-size: 16px;
	  color: black;
	  text-decoration: none;
	  transition: color 0.3s ease;
}

.tab_menu .list .btn:after {
	content: '';
	  position: absolute;
	  bottom: 0;
	  left: 0;
	  width: 100%;
	  height: 2px;
	  background-color: transparent; 
	  transform: scaleX(0);
	  transform-origin: right;
 	 transition: transform 0.3s ease, background-color 0.3s ease;
}

.tab_menu .list li.is_on .btn {
	font-weight: bold;
	color: #7fad39;
}

.tab_menu .list .btn:hover .btn{
 	color: #7fad39;
}

.tab_menu .list li.is_on .btn::after {
  transform: scaleX(1); 
  transform-origin: left; 
  background-color: #7fad39;
}

.tab_menu .list li:hover .btn::after {
  transform: scaleX(1);
  transform-origin: left;
  background-color: #7fad39;
}
.cont {
	display: flex;
	flex-wrap: wrap;
	gap: 40px;
	margin-top: 20px;
	justify-content: center;
}

#tab1, #tab2, #tab3, #tab4, #tab5 {
	margin-top: 40px;
}


.carousel-inner{
	width:100%;
	height:400px;
	margin-top: 40px;
    margin-bottom: 40px;
}
</style>
</head>
<body>
	<%@include file="views/common/menubar.jsp"%>
	<div class="container">
		<div class="main-content">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="resources/assets/mainImg/shutterstock_108537197.jpg" class="d-block w-100" alt="메인이미지1">
			    </div>
			    <div class="carousel-item">
			      <img src="resources/assets/mainImg/shutterstock_275583851.jpg" class="d-block w-100" alt="메인이미지2">
			    </div>
			    <div class="carousel-item">
			      <img src="resources/assets/mainImg/shutterstock_490148839.jpg" class="d-block w-100" alt="메인이미지3">
			    </div>
			  </div>
			</div>
			<div class="tab_menu">
				<ul class="list">
					<li class="is_on"><a href="#tab1" class="btn">All</a></li>
					<li><a href="#tab2" class="btn">Eat</a></li>
					<li><a href="#tab3" class="btn">Shower</a></li>
					<li><a href="#tab4" class="btn">Nutrients</a></li>
					<c:if test="${loginUser != null }">
						<li><a href="#tab5" class="btn">Recommend</a></li>
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
		//카테고리작업
		const tabList = document.querySelectorAll('.tab_menu .list li');
		const contents = document.querySelectorAll('.tab_menu .cont_area .cont')
		let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

		for (var i = 0; i < tabList.length; i++) {
			tabList[i].querySelector('.btn').addEventListener('click',function(e) {
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
		
		//상품넣기
		$(document)
				.ready(function() {
							// productList categoryList
							$.ajax({
										url : "ajax1.do",
										success : function(result) {
											var ipList = result.ipList;
											var pcList = result.pcList;
											var mList = result.mList;
											var loginUser = "${loginUser}"; //로그인정보 

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

												if (loginUser != ""
														|| loginUser == "") { //all 활성화시 다른 카테고리 들어오는 제거 작업
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
		
		//메인사진슬라이드
		let currentSlide = 0;
        const slides = document.querySelectorAll('.carousel-item');
        
        function showSlide(index) {
            slides.forEach((slide, i) => {
                if (i === index) {
                    slide.style.display = 'block';
                } else {
                    slide.style.display = 'none';
                }
            });
        }

        function nextSlide() {
            currentSlide = (currentSlide + 1) % slides.length;
            showSlide(currentSlide);
        }

        function prevSlide() {
            currentSlide = (currentSlide - 1 + slides.length) % slides.length;
            showSlide(currentSlide);
        }

        showSlide(currentSlide);

        setInterval(nextSlide, 3000);
        
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
</html>
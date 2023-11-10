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

	<link rel="stylesheet" href="resources/assets/indexCSS/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/assets/indexCSS/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/assets/indexCSS/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/assets/indexCSS/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/assets/indexCSS/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/assets/indexCSS/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/assets/indexCSS/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/assets/indexCSS/css/style.css" type="text/css">

<style>
body {
	font-family: 'Nunito', sans-serif;
	margin: 0;
	padding: 0;
	line-height: 1.6;
}

.container {
	width: 70%;
	min-width: 1000px;
	margin: auto;
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

.product-list1, .product-list2, .product-list3 {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	margin-top: 20px;
	justify-content: center;
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

.product span {
	font-size: 20px;
	font-weight: bold;
}

.product:hover {
	background: #A3C08F;
}

span {
	font-size: 20px;
}
</style>
</head>
<body>
	<%@include file="views/common/menubar.jsp"%>
	<section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                            <h2>Personal <br />petMate</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 배너 -->

    <!-- 배너 밑 유저추천상품 -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cateImg-1.jpg">
                            <h5><a href="#">상품이름</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cateImg-2.jpg">
                            <h5><a href="#">상품이름</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cateImg-3.jpg">
                            <h5><a href="#">상품이름</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cateImg-4.jpg">
                            <h5><a href="#">상품이름</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cateImg-5.jpg">
                            <h5><a href="#">상품이름</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 배너 밑 유저추천상품 -->

    <!-- 카테고리별 상품 리스트 -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Product List</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">전체</li>
                            <li data-filter=".oranges">사료</li>
                            <li data-filter=".fresh-meat">샤워</li>
                            <li data-filter=".vegetables">영양제</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-1.jpg">
                            <!-- 하트기능
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">상품명</a></h6>
                            <h5>가격</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-2.jpg">
                            <!-- <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">상품명</a></h6>
                            <h5>가격</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-3.jpg">
                            <!-- <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">상품명</a></h6>
                            <h5>가격</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-4.jpg">
                            <!-- <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">상품명</a></h6>
                            <h5>가격</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-5.jpg">
                            <!-- <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">상품명</a></h6>
                            <h5>가격</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-6.jpg">
                            <!-- <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">상품명</a></h6>
                            <h5>가격</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-7.jpg">
                            <!-- <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">상품명</a></h6>
                            <h5>가격</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="img/featured/feature-8.jpg">
                            <!-- <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#"></a></h6>
                            <h5>가격</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 카테고리별 상품 리스트 -->
	<br>
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

											var productList1 = ""; // productList1에 추가할 HTML 문자열
											var productList2 = "";

											for (var i = 0; i < ipList.length; i++) {
												var productHtml = "<div class='product' onclick=location.href='${contextPath}/pet.productDetail?pno="
														+ ipList[i].productNo
														+ "'><img style='width:100%; height:200px;' src=${contextPath}"
														+ ipList[i].imgsrc
														+ "><span>"
														+ ipList[i].productName
														+ "</span></div>";

												if (i == 10) {
													break;
												}

												if (mList == null && i < 5) {
													productList1 += productHtml;
												} else if (mList == null
														&& 4 < i < 10) {
													productList2 += productHtml;
												} else if (ipList[i].categoryName == mList[0]
														&& i < 5) {
													productList1 += productHtml; // mList == 0
												} else if (ipList[i].categoryName == mList[1]
														&& i < 5) {
													productList2 += productHtml; // mList == 1
												}
											}

											$(
													".container > .main-content > .product-list1")
													.html(productList1);
											$(
													".container > .main-content > .product-list2")
													.html(productList2);
										},
										error : function() {
											console.log("통신 실패");
										},
									});
						});
	</script>
	<script src="resources/assets/indexCSS/js/jquery-3.3.1.min.js"></script>
    <script src="resources/assets/indexCSS/js/bootstrap.min.js"></script>
    <script src="resources/assets/indexCSS/js/jquery.nice-select.min.js"></script>
    <script src="resources/assets/indexCSS/js/jquery-ui.min.js"></script>
    <script src="resources/assets/indexCSS/js/jquery.slicknav.js"></script>
    <script src="resources/assets/indexCSS/js/mixitup.min.js"></script>
    <script src="resources/assets/indexCSS/js/owl.carousel.min.js"></script>
    <script src="resources/assets/indexCSS/js/main.js"></script>
</body>
</html>
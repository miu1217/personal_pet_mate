<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<link rel=“stylesheet” href=“https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css”>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>제품 상세페이지</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/personal/resources/assets/productDetailViewCSS/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/productDetailViewCSS/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/productDetailViewCSS/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/productDetailViewCSS/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/productDetailViewCSS/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/productDetailViewCSS/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/productDetailViewCSS/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/productDetailViewCSS/css/style.css" type="text/css">
</head>

<body>
	<%@include file="../common/menubar.jsp" %>
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img id="pimg" class="product__details__pic__item--large"
                                src="${contextPath}${pa.filePath}${pa.changeName}" alt="상품이미지">
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${p.productBrand }</h3>
                        <!-- 별점 -->
                        <!-- <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div> -->
                        <div class="product__details__price">${p.productPrice }</div>
                        <ul>
                            <li><b>제품명</b> <div>${p.productName }</div></li>
                            <li><b>제품성분</b> <div>${p.productIngredient }</div></li>
                            <li><b>제품설명</b> <div>${p.productInfo }</div></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">제품 상세</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">제품 리뷰</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                  제품상세페이지긁어올겁니다~~~
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                   제품리뷰 들고올겁니다~~~
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Js Plugins -->
    <script src="/personal/resources/assets/productDetailViewCSS/js/jquery-3.3.1.min.js"></script>
    <script src="/personal/resources/assets/productDetailViewCSS/js/bootstrap.min.js"></script>
    <script src="/personal/resources/assets/productDetailViewCSS/js/jquery.nice-select.min.js"></script>
    <script src="/personal/resources/assets/productDetailViewCSS/js/jquery-ui.min.js"></script>
    <script src="/personal/resources/assets/productDetailViewCSS/js/jquery.slicknav.js"></script>
    <script src="/personal/resources/assets/productDetailViewCSS/js/mixitup.min.js"></script>
    <script src="/personal/resources/assets/productDetailViewCSS/js/owl.carousel.min.js"></script>
    <script src="/personal/resources/assets/productDetailViewCSS/js/main.js"></script>


</body>

</html>


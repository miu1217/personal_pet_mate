<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<link rel=“stylesheet”
	href=“https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css”>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>제품 상세페이지</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="/personal/resources/assets/productDetailViewCSS/css/style.css"
	type="text/css">
</head>
<style>
body {
	background-color: #f4f4f4;
	font-family: 'Cairo', sans-serif;
}

.product-details {
	padding: 30px 0;
}

.product__details__pic__item--large{
	max-width: 100%;
	height: 475px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.product__details__text {
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.product__details__text h3 {
	font-size: 36px;
	color: #333;
	margin-bottom: 10px;
}

.product__details__productName h4{
	font-size: 24px; /* 제품 가격 텍스트 크기를 줄입니다. */
    margin-top: 10px; /* 아래로 조금 내립니다. */
}

.product__details__text ul {
	list-style: none;
	padding: 0;
}

.product__details__text ul li {
	font-size: 16px;
	color: #555;
	margin-bottom: 10px;
	padding-left: 20px;
	position: relative;
}

.product__details__text ul li:before {
	content: "✓";
	color: #e74c3c;
	position: absolute;
	left: 0;
	top: 1px;
}

.nav-tabs .nav-link {
	font-size: 16px;
	color: #333;
	border: none;
	padding: 15px 20px;
	border-radius: 0;
}

.nav-tabs .nav-link.active {
	background-color: #e74c3c;
	color: #fff;
}

.tab-pane {
	padding: 20px;
	background-color: #fff;
	border: 1px solid #e7e7e7;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	margin-top: 20px;
}

.product__details__tab .nav-link {
    background-color: transparent; /* 배경색 없애기 */
    color: rgb(137, 114, 91); /* 글자색 변경 */
    border: none; /* 테두리 제거 */
    transition: background-color 0.3s, color 0.3s; /* 배경 색과 글자색 전환 효과 설정 */
}

.product__details__tab .nav-link.active {
    background-color: transparent; /* 클릭 시 배경색 없애기 */
    color: rgb(137, 114, 91); /* 클릭 시 글자색 변경 */
}

#productPrice {
    color: #B7CA79;
    font-size: 24px;
}

.product__details__tab {
	padding: 0;
}

.col-lg-12{
	margin-top:40px;
}

#subImg{
	width:100%;
	height:auto;
}


</style>

<body>
	<%@include file="../common/menubar.jsp"%>
	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
						
						<c:forEach items="${phList }" var="ph" varStatus="vs">
							<c:if test="${vs.index eq 0 }">
									<img id="mainImg" class="product__details__pic__item--large"
										src="${contextPath}${ph.filePath}${ph.changeName}" alt="상품이미지">
							</c:if>			
						</c:forEach>
						
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
                        <br>
						<div class="product__details__productName">
							<h4>${p.productName }</h4>
						</div>
						<ul>
							<li><b>제품가격</b>
								<div>${p.productPrice }원</div></li>
							<li><b>제품성분</b>
								<div>${p.productIngredient }</div></li>
							<li><b>제품설명</b>
								<div>${p.productInfo }</div></li>
						</ul>
					</div>
				</div>
				
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">
									제품 상세</a></li>
							<li class="nav-item"><a class="nav-link" 
								data-toggle="tab" href="#tabs-2" role="tab" aria-selected="false">
									제품 리뷰</a></li>		
						</ul>
						<div align="right"><button>리뷰 작성</button></div>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab">
								
								<c:forEach items="${phList }" var="ph" varStatus="vs">
									<c:if test="${vs.index eq 1 }">
										<img id="subImg"
										src="${contextPath}${ph.filePath}${ph.changeName}" alt="상품상세이미지">
									</c:if>	
								</c:forEach>	
								
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="product__review__tab">
									<c:forEach items="${prList }" var="pr">
										<p align="center">${pr.reviewContent }</p>
									</c:forEach>
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
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/jquery-3.3.1.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/bootstrap.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/jquery.nice-select.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/jquery-ui.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/jquery.slicknav.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/mixitup.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/owl.carousel.min.js"></script>
	<script
		src="/personal/resources/assets/productDetailViewCSS/js/main.js"></script>


</body>

</html>


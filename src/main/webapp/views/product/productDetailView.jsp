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
	background-color: white;
	font-family: 'Cairo', sans-serif;
}
.product-details {
	padding: 30px 0;
}
.product__details__pic__item--large{
	max-width: 100%;
	height: 475px;
    overflow: hidden;
}
.product__details__text {
	background-color: #fff;
	padding: 30px;
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
    color: black;
    margin-bottom: 10px;
    position: relative;
}
.nav-tabs .nav-link {
	font-size: 16px;
	color: #333;
	padding: 15px 20px;
}
.nav-tabs .nav-link.active {
	background-color: #E74C3C;
	color: #fff;
}
.tab-pane {
	padding: 40px;
	background-color: #fff;
	display: flex;
    justify-content: flex-end;
    flex-direction: row-reverse;
}
.product__details__tab .nav-link {
    background-color: transparent;
    color: rgb(137, 114, 91);
    transition: background-color 0.3s, color 0.3s;
}
.product__details__tab .nav-link.active {
    background-color: transparent;
    color: #677E52
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
.check-img{
	margin-right:10px;
	width:16px;
	height:16px;
}
#price,#ingredient,#info{
	margin-left:26px;
}

#reviewImg{
	margin-right: 24px;
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
							<li>
						<img class="check-img" src="${contextPath }/resources/assets/logo/checkLogoGreen.png"><b>제품가격</b>
								<div id="price">${p.productPrice }</div></li>
							<li>
						<img class="check-img" src="${contextPath }/resources/assets/logo/checkLogoGreen.png"><b>제품성분</b>
								<div id="ingredient">${p.productIngredient }</div></li>
							<li>
						<img class="check-img" src="${contextPath }/resources/assets/logo/checkLogoGreen.png"><b>제품설명</b>
								<div id="info">${p.productInfo }</div></li>
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
						<div align="right" style="margin-top:20px">
						
						<button type="button" class="btn btn-light" style="background-color: #89725B; border: 1px solid #89725B; color: #fff;"
							onclick="location.href='${contextPath}/pet.insert.r?pno=${p.productNo }'">리뷰 작성</button></div>
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
									<c:forEach items="${prList}" var="pr">
										<c:choose>
											<c:when test="${pr.imgSrc != null}">
												<div id="reviewImg" >
													<img id="Img" width="150" height="150" src="${contextPath}${pr.imgSrc}">
												</div>
												<div class="tab-pane" data-review-no="${pr.reviewNo }">
												<input type="hidden"  value="${pr.reviewNo }" id="reviewNo">
													<p>${pr.reviewContent }</p>
												</div>
											</c:when>
											<c:otherwise>
												<div class="tab-pane">
												<input type="hidden"  value="${pr.reviewNo }" id="reviewNo">
												<p>${pr.reviewContent }</p>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<button type="button"
								class="btn btn-light" style="background-color: #89725B; border: 1px solid #89725B; color: #fff; margin-top: 20px; margin-left: 500px;"
								id="loadMoreBtn"> 더보기 </button>
							</div>
							<script>
							
							var page = 1; // Initial page number
						    var reviewsPerPage = 2;
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
								        url: "pet.review",
								        type: "GET",
								        data: { pno: ${p.productNo}, page: page },
								        success: function (data) {
								            // Iterate through the received reviews and append them to the review tab
								            $.each(data, function (index, pr) {
								                var reviewHtml = '<div class="tab-pane" data-review-no="' + pr.reviewNo + '">';
								                reviewHtml += '<input type="hidden" value="' + pr.reviewNo + '" id="reviewNo">';
								                reviewHtml += '<p>'+pr.reviewContent+'</p>';
								                if (pr.imgSrc != null) {
								                    reviewHtml += '<div id="reviewImg"><img id="Img" width="150" height="150" src="${contextPath}' + pr.imgSrc + '"></div>';
								                }
								                reviewHtml += '</div>';
								                $(".product__review__tab").append(reviewHtml);
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->
	<script>
	
	
	$(function(){
		
		//테이블에 tbody -> tr이 클릭되었을때 해당 글번호를 추출하여 detail.bo?bno=글번호
		$(".product__review__tab>.tab-pane").click(function(){
			
			//$(this).children().eq(0).text() : 글번호 추출
			console.log($(this).children().eq(0).val());
			location.href="pet.detail.r?rno="+ $(this).children().eq(0).val();
			
		});
		
		
	});
	//이미지를 읽어줄 함수
            function loadImg(inputFile,num){
                //inputFile : 이벤트가 발생된 요소 객체
                console.log(inputFile.files);
                //inputFile.files : 파일업로드 정보를 배열의 형태로 반환해주는 속성
                //파일을 선택하면 files속성의 length가 1이 반환됨
                if(inputFile.files.length == 1){ //파일이 등록되면
                    //해당 파일을 읽어줄 FileReader라고 하는 자바스크립트 객체를 이용한다.
                    var reader = new FileReader();
                    //파일을 읽어줄 메소드 : reader.readAsDataURL(파일)
                    //해당 파일을 읽어서 고유한 url을 부여해주는 메소드
                    //반환받은 url을 미리보기 화면에 넣어주면 된다.
                    reader.readAsDataURL(inputFile.files[0]);
                    //해당 reader객체가 읽혀진 시점에 img src속성에 부여된 고유 url을 넣어주기
                    reader.onload = function(e){//e : event 객체
                        console.log(e);
                        //이벤트 객체에서 reader가 부여한 고유 url 정보
                        //event.target.result
                        console.log(e.target.result);
                        switch(num){
                            case 1: $("#Img").attr("src",e.target.result); break;
                        }
                    }
                }else{//length가 1이 아니면
                    switch(num){
                            case 1: $("#Img").attr("src",null); break;
                        }
                }
            }
	</script>
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
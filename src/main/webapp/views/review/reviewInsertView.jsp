<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PERSONAL-PET-MATE</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/personal/resources/assets/reviewCss/bootstrap.min.css" type="text/css">
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
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
 
    <!-- Humberger End -->


	<%@include file="../common/menubar.jsp"%>
  

   
    <!-- Breadcrumb Section End -->

    

    

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>REVIEW</h2>
                    </div>
                </div>
            </div>
            <form action="${contextPath }/pet.insert.r" method="post" id="enroll-area" enctype="multipart/form-data">
            	<input type="hidden" name="pno" value="1">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" name="name" placeholder="Product Name" value="${p.productName }">
                    </div>
                    <div class="col-lg-12 text-center">
                    
                    <textarea name="reviewContent"placeholder="Review Content"></textarea>
                    </div>
                   	<div class="col-lg-6 col-md-6" >
                   		<img id="Img" width="150" height="150">
                   	</div>
                     <div class="form-group"id="file-area">
				      <label for="formFile" class="form-label mt-4">review Img</label>
				      <input class="form-control" type="file" id="uploadFile" name="uploadFile"  onchange="loadImg(this,1)" >
				    </div>
                    <div class="col-lg-12 text-center">
                       
                        <button type="submit" class="site-btn">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Contact Form End -->
<script>
            $(function(){
                $("#file-area").hide(); //file input 숨기기
                //대표이미지를 클릭하면 input file 요소 1번이 클릭되게 하는 함수
                $("#Img").click(function(){
                    $("#uploadFile").click();
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href=" ../../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    PERSONAL-PET-MATE
  </title>
  <!-- jquery 구문 -->
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="${contextPath }resources/assets/AdminCss/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${contextPath }resources/assets/AdminCss/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${contextPath }/resources/assets/AdminCss/demo/demo.css" rel="stylesheet" />
</head>
<style>

.main-panel {
  position: relative;
  height: 130%;
  float: right;
  width: calc(100% - 260px);
  background-color: #f4f3ef;
  transition: all 0.5s cubic-bezier(0.685, 0.0473, 0.346, 1); }
  .main-panel > .content {
    padding: 0 30px 30px;
    min-height: calc(100vh - px);
    margin-top: 93px; }
  .main-panel > .navbar {
    margin-bottom: 0; }
  .main-panel .header {
    margin-bottom: 50px; }
    
   .content{
   margin-left:200px;
   }
   .card {
  border-radius: 12px;
  box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);
  background-color: #FFFFFF;
  color: #252422;
  margin-bottom: 20px;
  position: relative;
  border: 0 none;
  transition: transform 300ms cubic-bezier(0.34, 2, 0.6, 1), box-shadow 200ms ease; 
  width: 120%}
  

  
.btn.btn-primary.btn-round {
  background-color: #677E52 !important; /* Change this to the desired hover color */
  
}
.btn.btn-primary.btn-sm:hover {
  background-color: #4a5a3b !important; /* Change this to the desired hover color */
  transition: background-color 0.3s ease !important; /* Add a transition effect */
}
</style>
<body class="">

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="message" value="${sessionScope.message}" />
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="${contextPath }" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="/personal/resources/assets/logo/logo.png">
          </div>
          <!-- <p>CT</p> -->
        </a>
        <a href="${contextPath }" class="simple-text logo-normal">
          ADMIN
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="${contextPath}/pet.admin.list.m">
              <i class="nc-icon nc-pin-3"></i>
              <p>User List</p>
            </a>
          </li>
          <li>
            <a href="${contextPath}/pet.admin.list.pd?currentPage=1">
              <i class="nc-icon nc-tile-56"></i>
              <p>Prodcut List</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;" style="font-weight: bold;">Product Insert</a>
          </div>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
        </div>
        <div class="col-md-8">
          <div class="card card-user">
            <div class="card-header">
              <h5 class="card-title" style="font-weight: bold;">Product Insert</h5>
            </div>
            
            
            
            <form action="${contextPath }/pet.admin.insert.pd" method="post" id="enroll-area" enctype="multipart/form-data">
            	<div class="card-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품명</label>
                        <input type="text" class="form-control"  name="productName" >
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>카테고리</label>
                        <select name="categoryNo">
                        	<c:forEach items="${cList }" var="c">
                        		<option value="${c.categoryNo }"> ${c.parentCategoryNo}${c.categoryName } </option>
                        	</c:forEach>
                        </select>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 가격</label>
                        <input type="number" class="form-control" name="price">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>상품 성분</label>
                      <input type="text" class="form-control" name="ingredient">
                    </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 설명</label>
                        <textarea class="form-control" name="info" rows="10" style="resize: none;"></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 브랜드</label>
                        <input type="text" class="form-control" name="brand">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <a>대표 이미지</a>
                    <img id="titleImg" width="250" height="170">
                  </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                    <a>상세 이미지</a>
                    <img id="contentImg1" width="150" height="120">
                  </div>
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round"  style="background-color: #677E52;"> Submit </button>
                    </div>
                  </div>
                  </div>
                  
                  	<div id="file-area">
                <!--onchange : 변화가 일어났을때 발생하는 이벤트 
                    선언석함수를 내부에 작성할때 해당 이벤트가 발생한시점에 요소객체를 전달하는 방법
                    함수(this) 
		                -->
						<input type="file"  class="form-control" id="file1" name="file1" onchange="loadImg(this,1)" required> <!-- 대표이미지 필수  -->
						<input type="file"  class="form-control" id="file2" name="file2" onchange="loadImg(this,2)" required>
					
					</div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      
  
		<script>
            $(function(){
                $("#file-area").hide(); //file input 숨기기
                //대표이미지를 클릭하면 input file 요소 1번이 클릭되게 하는 함수
                $("#titleImg").click(function(){
                    $("#file1").click();
                });
                $("#contentImg1").click(function(){
                    $("#file2").click();
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
                            case 1: $("#titleImg").attr("src",e.target.result); break;
                            case 2: $("#contentImg1").attr("src",e.target.result); break;
                        }

                    }

                }else{//length가 1이 아니면 
                    switch(num){
                            case 1: $("#titleImg").attr("src",null); break;
                            case 2: $("#contentImg1").attr("src",null); break;
                        }

                }
            }

           


        </script>
	
  <!--   Core JS Files   -->
 <script src="${contextPath }resources/assets/AdminCss/js/core/jquery.min.js"></script>
  <script src="${contextPath }resources/assets/AdminCss/js/core/popper.min.js"></script>
  <script src="${contextPath }resources/assets/AdminCss/js/core/bootstrap.min.js"></script>
  <script src="${contextPath }resources/assets/AdminCss/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="${contextPath }resources/assets/AdminCss/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${contextPath }resources/assets/AdminCss/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${contextPath }resources/assets/AdminCss/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="${contextPath }resources/assets/AdminCss/demo/demo.js"></script>
</body>

</html>
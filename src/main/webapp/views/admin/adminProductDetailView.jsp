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
.btn.btn-primary.btn-round:hover {
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
            <img src="/personal/resources/assets/img/logo.png">
          </div>  -->
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
            <a class="navbar-brand" href="javascript:;" style="font-weight: bold;">Product Detail</a>
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
              <h5 class="card-title" style="font-weight: bold;">Product Detail</h5>
            </div>
            	<div class="card-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품명</label> 
                        <input type="text" class="form-control"  name="productName" value="${p.productName }" >
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>카테고리</label>
                        <input type="text" class="from-control" name="category" value="${p.categoryNo }" readonly>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 가격</label>
                        <input type="text" class="form-control"  name="productPrice" value="${p.productPrice }" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>상품 성분</label>
                      <input type="text" class="form-control" name="ingredient" value="${p.productIngredient }" readonly>
                    </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 설명</label>
                        <textarea class="form-control" name="info" rows="10" style="resize: none;" readonly>${p.productInfo }</textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 브랜드</label>
                        <input type="text" class="form-control" name="brand" value="${p.productBrand }" readonly>
                      </div>
                    </div>
                  </div>
                  <c:forEach items="${phList }" var="ph" varStatus="vs">
                  	<c:choose>
                  		<c:when test="${vs.index eq 0 }">
		                  	<div class="row">
			                    <div class="col-md-12">
			                    	<a>대표 이미지</a>
			                    	<img id="titleImg" width="250" height="170" src="${contextPath }${ph.filePath}${ph.changeName}">
			                  	</div>
			                  </div>
		                  </c:when>
		                  <c:otherwise>
			                  	<div class="row">
				                    <div class="col-md-12">
				                    	<a>상세 이미지</a>
				                    	<img id="contentImg${vs.count}" 
											src="${contextPath }${ ph.filePath}${ph.changeName}" width="150" height="120">
				                  </div>
			                  </div>
		                  </c:otherwise>
	                  </c:choose>
                  </c:forEach>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round"   style="background-color: #677E52;"
                      		onclick="location.href='${contextPath}/pet.admin.update.pd?pno=${p.productNo}'"> Update </button>
                      <button type="submit" class="btn btn-primary btn-round"   style="background-color: #677E52;"
                      		onclick="location.href='${contextPath}/pet.admin.delete.pd?pno=${p.productNo}'"> Delete </button>
                    </div>
	                  </div>
	               </div>
				</div>
              </div>
            </div>
          </div>
        </div>
      
  

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
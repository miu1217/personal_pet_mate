<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="/personal/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/personal/resources/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    PERSONAL-PET-MATE
  </title>
  
  <!-- jquery 구문 -->
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="/personal/resources/assets/AdminCss/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/personal/resources/assets/AdminCss/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/personal/resources/assets/demo/demo.css" rel="stylesheet" />


  <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

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
  height: 100%;
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
  
    
   .text-right .btn .btn-secondary .my-2 .my-sm-0:hover {
    background-color: #D1BBA5;
    }
  
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
        <a href="${contextPath }" class="simple-text logo-normal" >
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
            <a class="navbar-brand" href="javascript:;">Product List</a>
          </div>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
         	
          </div>
        </div>
      </nav>
      
        <div class="collapse navbar-collapse justify-content-end" id="navigation">
         	 
          </div>
      <!-- End Navbar -->
	      <div class="row">
	        <div class="container-list">
	            <div class="product" style="margin:0px 20px 0px 20px;">
	                <!-- 게시글 없는경우 -->
	                <c:choose>
	                  <c:when test="${empty phList }">
	                    조회된 게시글이 없습니다.
	                  </c:when>
	                  <c:otherwise>
	                    <c:forEach items="${phList }" var="ph">
	                      <div class="thumbnail" style="display: flex;">
	                        <input type ="hidden" value="${ph.productNo }">
	                        <!--/jsp/resources/uploadFiles/파일이름.jpg -->
	                        <img class="product__item__pic set-bg" src="${contextPath }${ph.imgsrc}" style="width: 200px; height : 150px; margin: 80px 10px 0px 10px;">
	                        <div class="product__item__text" style="margin-left: 10px;">
	                          No.${ph.productNo } ${ph.productName }<br>
	                          price : ${ph.productPrice }
	                        </div>
	                      </div>
	                    </c:forEach>
	                  </c:otherwise>
	                </c:choose>
	            </div>
	            
	                         <div class="text-right">
					         		<button class="btn btn-outline-success"  style="width: 200px; height: 40px; "
					         		onclick="location.href='${contextPath}/pet.admin.insert.pd'">Product Insert</button>
					         	</div>
	        </div>
            <script>
        	//글 클릭했을때 글번호를 detail.bo 로 전달하며 페이지 요청하기
        	$(function(){
        		
        		//테이블에 tbody -> tr이 클릭되었을때 해당 글번호를 추출하여 detail.bo?bno=글번호
        		$(".thumbnail").click(function(){
        			//$(this).children().eq(0).text() : 글번호 추출
        			location.href="pet.admin.detail.pd?pno="+ $(this).children().eq(0).val();
        			
        		});
        		
        		
        	});
        </script>	
        </div>
    </div>
  </div>
  <div class="text-right">
         		<button class="btn btn-outline-success"  style="width: 200px; height: 40px; "
         		onclick="location.href='${contextPath}/pet.admin.insert.pd'">Product Insert</button>
         	</div>
   	<div align="center" class="paging-area">
		<c:choose>
			<c:when test="${pi.currentPage eq 1}">
				<button class="btn btn-secondary" disabled>이전</button>
			</c:when>
			<c:otherwise>
				<button class="btn btn-secondary"
					onclick="location.href='pet.admin.list.pd?currentPage=${pi.currentPage-1}'">이전</button>
			</c:otherwise>
		</c:choose>
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
				<button  class="btn btn-secondary"
				onclick="location.href=pet.admin.list.pd?currentPage=${i}'">${i}</button>
			</c:forEach>
			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage}">
					<button class="btn btn-secondary" disabled>다음</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-secondary"
					onclick="location.href='pet.admin.list.pd?currentPage=${pi.currentPage+1}'">다음</button>
				</c:otherwise>
			</c:choose>
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
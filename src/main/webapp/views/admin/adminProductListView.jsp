<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//ContextRoot(ContextPath)를 꺼내놓기 (메소드를 이용하여)
	String contextPath = request.getContextPath();
	//로그인 정보 꺼내놓기 
	//session객체에 loginUser 객체와 alertMsg 메세지를 담아놓음 
	String message = (String)session.getAttribute("message");

	
%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="personal/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="personal/resources/assets/img/favicon.png">
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
  <link href="/personal/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/personal/resources/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/personal/resources/assets/demo/demo.css" rel="stylesheet" />


  <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/personal/resources/assets/product/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/product/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/product/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/product/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/product/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/product/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/product/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/personal/resources/assets/product/css/style.css" type="text/css">
</head>

<body class="">
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="../assets/img/logo-small.png">
          </div>
          <!-- <p>CT</p> -->
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          ADMIN
          <!-- <div class="logo-image-big">
            <img src="../assets/img/logo-big.png">
          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="./member.html">
              <i class="nc-icon nc-pin-3"></i>
              <p>회원 Table</p>
            </a>
          </li>
          <li>
            <a href="./user.html">
              <i class="nc-icon nc-single-02"></i>
              <p>회원 수정</p>
            </a>
          </li>
           <li>
            <a href="${contextPath}/admin_list.pd">
              <i class="nc-icon nc-tile-56"></i>
              <p>ProdcutList</p>
            </a>
          </li>
          <li>
            <a href="${contextPath}/admin_insert.pd">
              <i class="nc-icon nc-tile-56"></i>
              <p>ProdcutInsert</p>
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
            <a class="navbar-brand" href="javascript:;">상품 수정</a>
          </div>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
	      <div class="row">
	        <div class="col-lg-4 col-md-6 col-sm-6">
	            <div class="product__item">
	              <div>
	                <!-- 게시글 없는경우 -->
	                <c:choose>
	                  <c:when test="${empty phList }">
	                    조회된 게시글이 없습니다.
	                  </c:when>
	                  <c:otherwise>
	                    <c:forEach items="${phList }" var="ph">
	                      <div class="thumbnail">
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
	            </div>
	        </div>
            <script>
        	//글 클릭했을때 글번호를 detail.bo 로 전달하며 페이지 요청하기
        	$(function(){
        		
        		//테이블에 tbody -> tr이 클릭되었을때 해당 글번호를 추출하여 detail.bo?bno=글번호
        		$(".thumbnail").click(function(){
        			//$(this).children().eq(0).text() : 글번호 추출
        			location.href="admin_detail.pd?pno="+ $(this).children().eq(0).val();
        			
        		});
        		
        		
        	});
        </script>	
        </div>
      <footer class="footer footer-black  footer-white ">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="https://www.creative-tim.com" target="_blank">Creative Tim</a></li>
                <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li>
                <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li>
              </ul>
            </nav>
            <div class="credits ml-auto">
              <span class="copyright">
                © <script>
                  document.write(new Date().getFullYear())
                </script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
              </span>
            </div>
          </div>
        </div>
       </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="/personal/resources/assets/js/core/jquery.min.js"></script>
  <script src="/personal/resources/assets/js/core/popper.min.js"></script>
  <script src="/personal/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="/personal/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="/personal/resources/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="/personal/resources/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/personal/resources/assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="/personal/resources/assets/demo/demo.js"></script>
</body>

</html>
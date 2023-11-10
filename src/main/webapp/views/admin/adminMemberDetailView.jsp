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
  <link href="/personal/resources/assets/AdminCss/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/personal/resources/assets/AdminCss/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/personal/resources/assets/AdminCss/demo/demo.css" rel="stylesheet" />
</head>
<body class="">

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
         <div class="logo-image-small">
            <img src="/personal/resources/assets/AdminCss/img/logo.png">
          </div>
          <!-- <p>CT</p> -->
        </a>
        <a href="http://localhost:7777/personal/" class="simple-text logo-normal">
          ADMIN
          <!-- <div class="logo-image-big">
            <img src="/personal/resources/assets/img/logo.png">
          </div>  -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="${contextPath}">
              <i class="nc-icon nc-pin-3"></i>
              <p>회원 Table</p>
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
            <a class="navbar-brand" href="javascript:;">상품 입력</a>
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
              <h5 class="card-title">Product Update</h5>
            </div>
            	<div class="card-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>회원 아이디</label> 
                        <input type="text" class="form-control"  name="userId" value="${m.userId }"readonly >
                      </div>
                    </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label>회원 비밀번호</label>
                          <input type="text" class="form-control"  name="userPwd" value="${m.userPwd }" readonly>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>회원 이름</label>
                        <input type="text" class="form-control"  name="userName" value="${m.userName }" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>성별</label>
                        <input type="radio" name="gender" id="gen" value="남"><label for="gen">남</label> 
                        <input type="radio" name="gender" id="gen" value="여"><label for="gen">여</label> 
                    </div>
                    </div>
                    <script>
                    	$(function(){
                    		$("input[name=gender]").each(function(){   
                    			
                    			var gender = "${m.gender}"
                  				var value1 = $(this).val();     
                  				if(gender.includes(value1)) {  
                  					$(this).attr("checked",true);
                  				}
                  			});
                	
                    	})
                    	
                    
                    </script>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>휴대폰</label>
                        <input type="text" class="form-control" name="phone" value="${m.phone }" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>이메일</label>
                        <input type="text" class="form-control" name="email" value="${m.email }" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>주소</label>
                        <input type="text" class="form-control" name="address" value="${m.address }" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round"
                      onclick="location.href='${contextPath}/admin_list.m'">회원 관리 페이지</button>
                    </div>
	                  </div>
	               </div>
				</div>
              </div>
            </div>
          </div>
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

  <!--   Core JS Files   -->
  <script src="/personal/resources/assets/AdminCss/js/core/jquery.min.js"></script>
  <script src="/personal/resources/assets/AdminCss/js/core/popper.min.js"></script>
  <script src="/personal/resources/assets/AdminCss/js/core/bootstrap.min.js"></script>
  <script src="/personal/resources/assets/AdminCss/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="/personal/resources/assets/AdminCss/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="/personal/resources/assets/AdminCss/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/personal/resources/assets/AdminCss/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="/personal/resources/assets/AdminCss/demo/demo.js"></script>
</body>

</html>
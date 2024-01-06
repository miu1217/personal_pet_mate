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
.sidebar {
background-color : #B0CC99;
}
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
            <a class="navbar-brand" href="javascript:;" style="font-weight: bold;">User Update</a>
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
              <h5 class="card-title" style="font-weight: bold;">User Update</h5>
            </div>
             <form action="${contextPath }/pet.admin.update.m" method="post" id="update-area">
            	<input type="hidden" name="userNo" value="${m.userNo }">
            	<div class="card-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>회원 아이디</label> 
                        <input type="text" class="form-control"  name="userId" value="${m.userId }" >
                      </div>
                    </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label>회원 비밀번호</label>
                          <input type="text" class="form-control"  name="userPwd" value="${m.userPwd }">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>회원 이름</label>
                        <input type="text" class="form-control"  name="userName" value="${m.userName }">
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
                        <input type="text" class="form-control" name="phone" value="${m.phone }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>이메일</label>
                        <input type="text" class="form-control" name="email" value="${m.email }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>주소</label>
                        <input type="text" class="form-control" name="address" value="${m.address }">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit" class="btn btn-primary btn-round"  style="background-color: #677E52;"> Submit </button>
                    </div>
	                  </div>
	               </div>
	               </form>
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
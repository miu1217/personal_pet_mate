<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   		마이페이지
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />


  <style>
      .header{
      border: 1px solid grey;
      box-sizing: border-box;
      background-color: beige;
      width: 1000px;
      align
    }
    .header div>a{
      text-decoration: none;
    }
   

    .icon_group>div{
        float: left;
        font-size: 20px;
    }
    #header_name{
      font-size: 50px;
    }
    .welcomebox>div{
      float: left;
     
    }
    .welcomebox{
      text-align: center;
      margin: 0px;
      padding: 0px;
      display: flex;
    align-items: center;
    justify-content: space-between;
    }
    .post_icon,.review_icon{
      margin-left: 200px;
   
    }

    .bar{
      
      font-weight: lighter;
    }
    .txt,.count{
      color: grey;
    }
    .mypage{
      color: black;
    }
    
    .nav>li>a>p{
      font-size: 25px;
      color: black;
    }

    .miniBar{
      background-color:rgba(238, 238, 238, 1);
      width: 1px;
      height: 120px;
      margin-top: 10px;
    }
  </style>


</head>

<body class="">

<%@include file="../common/menubar.jsp" %>

  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="../assets/img/logo-small.png">
          </div>
        
        </a>
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          PersonalMate
        </a>
      </div>

     

      <!--사이드바 부분-->
      <div class="sidebar-wrapper">
        
        <ul class="nav">
          <li>
              <p><h4>나의 활동</h4></p>
          </li>
          
          <!-- 내 게시글만 보이는 페이지로 이동 -->
          <li>
            <a href="${contextPath }/pet.myBoardList">
              <p>게시글 관리</p>
            </a>
          </li>
          
          <!-- 내 리뷰만 보이는 페이지로 이동 -->
          <li>
            <a href="${contextPath }/pet.myReview">
              <p>리뷰 관리</p>
            </a>
          </li>
          <li>
              <p><h4>나의 정보</h4></p>
          </li>
          
          <!-- 회원정보 변경 페이지로이동 -->
          <li>
            <a href="${contextPath }/pet.beforeUpdateChk">   <!--회원정보하기전에 비밀번호입력해서 확인해주는 창으로 넘어가기  -->
              <p>회원정보 수정</p>
            </a>
          </li>
          
          <!-- 비밀번호 변경페이지 -->
          <li>
          	<a href="${contextPath }//pet.changePwdForm">  
          		<p>비밀번호 변경</p>
          	</a>
          </li>
          
          <!-- 진단테스트로 이동 -->
          <li class="active ">
            <a href="${contextPath }/pet.test">
              <p>진단테스트 수정</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      
     
      <!--마이페이지 헤더부분-->
      <div class="header" >
        <div>
            <h1><a href="" style="text-decoration: none;" class="mypage">My Page</a></h1>
        </div>

        <div class="welcomebox">
           <div id="header_name"><strong><span>반정현</span></strong>님 반갑습니다.</div>
       
        
            <div class="icon_group">
                <div>
                
                    <a href="${contextPath }/pet.myBoardList" class="post_icon">
                        <div class="icon"><img src="./resources/icons/게시글아이콘.png" alt="게시글아이콘" width="50px" height="50"></div>
                        <div class="txt" >게시글 </div>  
                        <div class="count"><span>2</span></div>
                    </a>
                </div>  
                 <div class="bar" style="font-size: 100px;"><div class="miniBar"></div></div>
                <div>
                    <a href="${contextPath }/pet.myReview" class="review_icon">
                        <div class="icon"><img src="./resources/icons/리뷰아이콘.png" alt="리뷰아이콘" width="50px" height="50"></div>
                        <div class="txt">리뷰</div>
                        <div class="count"><span>2</span></div>
                    </a>        
                </div>
            </div>
        </div>
        <br clear="both">
        가입일 :  ${loginUser.enrollDate }
       
    </div>




     <!--최근 게시글/리뷰내역부분-->
        <div class="content">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">최근 게시글 내역</h4>
                  <p class="card-category"> <a href="">더보기</a></p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          번호
                        </th>
                        <th>
                          카테고리
                        </th>
                        <th>
                          제목
                        </th>
                        <th class="text-right">
                          작성자
                        </th>
                        <th class="text-right">
                          작성일
                        </th>
                        <th class="text-right">
                          조회수
                        </th>
                      
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            Dakota Rice
                          </td>
                          <td>
                            Niger
                          </td>
                          <td>
                            Oud-Turnhout
                          </td>
                          <td class="text-right">
                            $36,738
                          </td>
                        </tr>
                        <tr>
                          <td>
                            Minerva Hooper
                          </td>
                          <td>
                            Curaçao
                          </td>
                          <td>
                            Sinaai-Waas
                          </td>
                          <td class="text-right">
                            $23,789
                          </td>
                        </tr>
                    
                      
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="card card-plain">
                <div class="card-header">
                  <h4 class="card-title"> 최근 리뷰 내역</h4>
                  <p class="card-category"> <a href="">더보기</a></p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          제품명
                        </th>
                        <th>
                          아이디
                        </th>
                        <th>
                          날짜
                        </th>
                        <th class="text-right">
                          조회수
                        </th>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            Dakota Rice
                          </td>
                          <td>
                            Niger
                          </td>
                          <td>
                            Oud-Turnhout
                          </td>
                          <td class="text-right">
                            $36,738
                          </td>
                        </tr>
                        <tr>
                          <td>
                            Minerva Hooper
                          </td>
                          <td>
                            Curaçao
                          </td>
                          <td>
                            Sinaai-Waas
                          </td>
                          <td class="text-right">
                            $23,789
                          </td>
                        </tr>
                  
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
     
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="../assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
</body>

</html>
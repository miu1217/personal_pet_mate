<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
  <link href="./resources/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./resources/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./resources/assets/demo/demo.css" rel="stylesheet" />


  <style>
  
	/* ㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지 상단영역ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/  
      .header{  
      box-sizing: border-box;
      background-color: white;
      height: 270px;
      border-radius: 15px;
    }
    
    .header div>a{
      text-decoration: none;
    }
   
    #header_name{
      font-size: 20px;
      margin-left: 100px;
    }
    #header_name>strong{
    	 font-size: 35px;
    }
   
   
   
  /*ㅡㅡㅡㅡㅡㅡㅡㅡ상단영역 아이콘 밑에 글씨ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
    .icon_group>div{
        float: left;
        font-size: 15px;
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
    
    
    
    .post_icon,.review_icon, .qna_icon{
      margin-left: 300px;
   
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
      font-size: 15px;
      color: black;
    }

    .miniBar{
      background-color:rgba(238, 238, 238, 1);
      width: 1px;
      height: 120px;
      margin-top: 10px;
    }
     .enroll-date{
    	font-size: 15px;
    } 
    .sidebar{
    	position: absolute;
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
            <a href="${contextPath }/pet.myBoardList?currentPage=1">
              <p>게시글 관리</p>
            </a>
          </li>
          
          <!-- 내 리뷰만 보이는 페이지로 이동 -->
          <li>
            <a href="${contextPath }/pet.myReview?currentPage=1">
              <p>리뷰 관리</p>
            </a>
          </li>
          
          <li>
          		<a href="${contextPath }/pet.myQnA?currentPage=1">
          			<p>QnA 관리</p>
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
          	<a href="${contextPath }/pet.changePwdForm">  
          		<p>비밀번호 변경</p>
          	</a>
          </li>
          
          <!-- 진단테스트로 이동 -->
          <li>
            <a href="${contextPath }/pet.testUpdate">
              <p>진단테스트 수정</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      
     
   




     <!--최근 게시글/리뷰내역부분-->
        <div class="content">
        
   <!--마이페이지 헤더부분-->
      <div class="header" >
        <div>
            <h1><a href="" style="text-decoration: none;" class="mypage">My Page</a></h1>
        </div>

        <div class="welcomebox">
        	
           <div id="header_name">
           		<img src="./resources/icons/프로필사진.png" width="80px" height="80px">
           		 <strong><span>${loginUser.userName }</span></strong>
           		 님 반갑습니다.
           		  <div class="enroll-date">
        				가입일 :  ${loginUser.enrollDate }
       				</div>
           </div>
       
        
            <div class="icon_group">
                <div>
                
                    <a href="${contextPath }/pet.myBoardList?currentPage=1" class="post_icon">
                        <div class="icon"><img src="./resources/icons/게시글아이콘.png" alt="게시글아이콘" width="50px" height="50"></div>
                        <div class="txt" >게시글 </div>                         
                        <div class="count">${boardCount }</div>
                    </a>
                </div>  
                 <div class="bar" style="font-size: 100px;"><div class="miniBar"></div></div>
                <div>
                    <a href="${contextPath }/pet.myReview?currentPage=1" class="review_icon">
                        <div class="icon"><img src="./resources/icons/리뷰아이콘.png" alt="리뷰아이콘" width="50px" height="50"></div>
                        <div class="txt">리뷰</div>
                        <div class="count">${reviewCount }</div>
                    </a>        
                </div>
                 <div class="bar" style="font-size: 100px;"><div class="miniBar"></div></div>
                 <div>
                 	<a href="${contextPath }/pet.myQnA?currentPage=1" class="qna_icon">
                        <div class="icon"><img src="./resources/icons/문의아이콘.png" alt="문의아이콘" width="50px" height="50"></div>
                        <div class="txt">QnA</div>
                        <div class="count">${qnaCount }</div>
                    </a>  
                 </div>
            </div>
        </div>
        <br clear="both">
  	  </div>
        
        
        
        
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">최근 게시글 내역</h4>
                  <p class="card-category"> <a href="${contextPath }/pet.myBoardList?currentPage=1">더보기</a></p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          글번호
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
                       <c:choose>
		                	<c:when test="${empty bList }">
		                		<tr>
		                			<td colspan="6">최근 30일동안 작성하신 게시글이 없습니다.</td> 
		                		</tr>
		                	</c:when>
		                	
		                	<c:otherwise>
		                		<c:forEach items="${bList }" var="bl">
				                    <tr>
				                        <td>${bl.boardNo }</td>
				                        <!-- 여기서 boardType이 1이면 자유게시판 2이면 고민게시판 만들기 -->
				                        <c:choose>
				                        	<c:when test="${bl.boardType eq 2 }">
				                        		<td>자유게시판</td>
				                        	</c:when>
				                        	<c:when test="${bl.boardType eq 3 }">
				                        		<td>고민게시판</td>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<td>기타</td>
				                        	</c:otherwise>
				                        </c:choose>		                      		                  
				                        <td>${bl.boardTitle } </td>
				                   		<td>${bl.userId }</td> 
				                        <td>${bl.createDate }</td>
				                        <td>${bl.count }</td>
				                    </tr>
			                    </c:forEach>
		                    </c:otherwise>
              		</c:choose>
                      
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            
          
            
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">최근 리뷰 내역</h4>
                  <p class="card-category"> <a href="${contextPath }/pet.myReview?currentPage=1">더보기</a></p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                      	<th>
                      	</th>
                        <th>
                          제품명
                        </th>
                        <th>
                          아이디
                        </th>
                        <th>
                          날짜
                        </th>
                      
                      </thead>
                      <tbody>
                       <c:choose>
		                	<c:when test="${empty rList }">
		                		<tr>
		                			<td colspan="4">최근 30일동안 작성하신 게시글이 없습니다.</td> 
		                		</tr>
		                	</c:when>
		                	
		                	<c:otherwise>
		                		<c:forEach items="${rList }" var="rl">
				                   <tr>
										<td><img src="${contextPath }${rl.titleImg}" width="100px" height="100px"></td>
										<td>${rl.productName } </td>
										<td>${rl.userId }</td>
										<td>${rl.createDate }</td>
								   </tr>
			                    </c:forEach>
		                    </c:otherwise>
              			</c:choose>
                      
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
	<script src="../assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/demo/demo.js"></script>
</body>

</html>
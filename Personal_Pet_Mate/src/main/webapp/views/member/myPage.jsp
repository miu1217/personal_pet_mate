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
  <link href="${contextPath }resources/assets/AdminCss/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${contextPath }resources/assets/AdminCss/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${contextPath }resources/assets/AdminCss/demo/demo.css" rel="stylesheet" />


  <style>
  
	/* ㅡㅡㅡㅡㅡㅡㅡㅡ마이페이지 상단영역ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/  
      .header{  
      box-sizing: border-box;
      background-color: white;
      height: 220px;
      border-radius: 15px;
      display: flex;
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
   
   
   .welcomebox {
  text-align: center;
  margin: 0px;
  padding: 0px;
  display: flex;
  align-items: center;
}

.icon_group {
  display: flex;
  align-items: center;
  width: 70%;
}



		.post_icon,
		.review_icon,
		.qna_icon {
		  margin-left: 350px; /* Adjust this value as needed */
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
    
    
    /* 최근게시글내역/qna내역 옆으로 띄우기*/
    .recentAll{
    	display: flex;
    	heig

    }
    
     .recent1, .recent2{
     	width: 900px;
     }
    
    /*답변대기중/완료 버튼 스타일*/
    .qnaButton{
    	background-color: #B0CC99;
    	border-radius: 20px; 
    	margin: auto;
    	height: 26px;
    	display: flex;
    	justify-content: center;
    }
    .qnaButton>span{
	    color: white;
	    font-weight: bold;
	    margin-top: 3px;
    }
    
    /*사이드바 스타일영역*/
    .nav{
    	list-style-type: none;
    }
    .nav>li>ul{
    	list-style-type: none;
    	display: none;
    }
    .nav>li:hover ul{
    	 display:block;
    }
   
   
   /*ㅡㅡㅡㅡㅡㅡㅡ사이드바 호버ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
   	

        #sidebar {
        height: 100%;
        width: 200px;
        background-color: white;
        padding-top: 20px;
    }

        #sidebar a {
            padding: 8px 8px 8px 16px;
            text-decoration: none;
            font-size: 18px;
            color: black;
            display: block;
        }

        #sidebar a:hover {
            background-color: #ddd;
            color: black;
        }

        .submenu {
            display: none;
            padding-left: 20px;
        }

        .submenu a {
            padding: 8px 8px 8px 16px;
            text-decoration: none;
            font-size: 16px;
            color: black;
            display: block;
        }

        #content {
            margin-left: 200px;
            padding: 16px;
        }
   
   		.table-responsive {
   			overflow: auto;
		}
   
   		.card-body,.card-header{
   			 width: 90%;
   			 margin: auto;
   		}
   
  </style>
		 <script>
		        function toggleSubMenu(subMenuId) {
		            var subMenu = document.getElementById(subMenuId);
		            subMenu.style.display = (subMenu.style.display === 'none' || subMenu.style.display === '') ? 'block' : 'none';
		        }
		        
		      	    window.addEventListener("scroll", function() {
		            var sidebar = document.getElementById("sidebar");
		            var content = document.getElementById("content");

		            // 사이드바의 기본 위치
		            var sidebarOriginalPosition = 20;

		            // 스크롤 위치에 따라 사이드바 위치 조정
		            if (window.scrollY > sidebarOriginalPosition) {
		                sidebar.style.position = "fixed";
		                sidebar.style.top = "20px"; // 원하는 위치로 조정
		            } else {
		                sidebar.style.position = "absolute";
		                sidebar.style.top = sidebarOriginalPosition + "px";
		            }
		        });
		    </script>

</head>

<body class="">

<%@include file="../common/menubar.jsp" %>

  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-mini">
          <div class="logo-image-small">
				
          </div>
        
        </a>
      	 <div style="font-size: 20px;">MyPage</div> 
        
      </div>

     

      <!--사이드바 부분-->
      <div class="sidebar-wrapper">
        
        <div id="sidebar">
    <a href="#" onclick="toggleSubMenu('activitySubMenu')" style="font-weight: bold;">나의 활동</a>
    <div id="activitySubMenu" class="submenu">
        <a href="${contextPath}/pet.myBoardList?currentPage=1" style="color: #888;">게시글 관리</a>
        <a href="${contextPath}/pet.myReview?currentPage=1" style="color: #888;">리뷰 관리</a>
        <a href="${contextPath}/pet.myQnA?currentPage=1" style="color: #888;">QnA 관리</a>
    </div>
    <a href="#" onclick="toggleSubMenu('infoSubMenu')" style="font-weight: bold;">나의 정보</a>
    <div id="infoSubMenu" class="submenu">
        <a href="${contextPath}/pet.beforeUpdateChk" style="color: #888;">회원정보 수정</a>
        <a href="${contextPath}/pet.changePwdForm" style="color: #888;">비밀번호 변경</a>
        <a href="${contextPath}/pet.moveTestUpdate" style="color: #888;">진단테스트 수정</a>
    </div>
</div>
        
        
        <%-- <ul class="nav">
           <li>
              <p><div class="category" style="margin-left: 30px">나의 활동</div></p>
              <ul>
              	  <li>
          			  <a href="${contextPath }/pet.myBoardList?currentPage=1">
             		  <p>게시글 관리</p>
          			  </a>
         		 </li>
         		 
         		 
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
              </ul>
          </li> 
          
         
         
          
          <li>
              <p><div class="category" style="margin-left: 30px">나의 정보</div></p>
              <ul>
              		<!-- 회원정보 변경 페이지로이동 -->
              	  <li>
	          		  <a href="${contextPath }/pet.beforeUpdateChk">   <!--회원정보하기전에 비밀번호입력해서 확인해주는 창으로 넘어가기  MemberBeforeUpdateChkController로 이동 -->
	             	  <p>회원정보 수정</p>
	           		  </a>
        		  </li>
        		  
        		   <!-- 비밀번호 변경페이지 -->
          		  <li>
          		      <a href="${contextPath }/pet.changePwdForm">  <!-- MemberChangePwdFormController로 이동 -->
          			  <p>비밀번호 변경</p> 
          			  </a>
          		  </li>
        		  
        		  
        		   <!-- 진단테스트로 이동 -->
        		  <li>
          			  <a href="${contextPath }/pet.moveTestUpdate">
         		      <p>진단테스트 수정</p>
          			  </a>
         		  </li>
              </ul>
          </li>  

               
        </ul> --%>
      </div>
    </div>
    <div class="main-panel">

     <!--최근 게시글/리뷰내역부분-->
      <div class="content">
        
   <!--마이페이지 헤더부분-->
      <div class="header" >
        <div class="welcomebox">
           <div id="header_name">
              <div>
           		<img src="./resources/icons/프로필사진.png" width="80px" height="80px">
           		<strong><span>${loginUser.userName }</span></strong>님 반갑습니다.
           		<div class="enroll-date">
        			가입일 :  ${loginUser.enrollDate }
       		    </div>
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
            
        </div> <!-- welcomebox 종료 -->
  	  </div>
        <br clear="both">
        
        
        <div class="content">
          <div class="row">
           <div class="col-md-12" style="margin-bottom: 60px;">
              <div class="card">
	                <div class="card-header">
	                  <h4 class="card-title">최근 리뷰 내역</h4>
	                  <p class="card-category"> <a href="${contextPath }/pet.myReview?currentPage=1">더보기</a></p>
	                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                      	<th style="width: 150px;">
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
          
         
          
          
          
          
          
          
          
          
        <div class="recentAll" style="width: 100%">  
         <div class="recent1">
         
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
                        <th>
                          작성자
                        </th>
                        <th>
                          작성일
                        </th>
                        <th>
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
          </div>  
          
            
           
            
            
            
          <div class="recent2">  
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">최근 QnA 내역</h4>
                  <p class="card-category"> <a href="${contextPath }/pet.myQnA?currentPage=1">더보기</a></p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                      	<th>
                      	</th>
                        <th>
                          문의제목
                        </th>
                        <th>
                          날짜
                        </th>                
                      </thead>
                      <tbody>
                       <c:choose>
						    <c:when test="${empty qList}">
						        <tr>
						            <td colspan="3">최근 30일동안 작성하신 게시글이 없습니다.</td> 
						        </tr>
						    </c:when>
						    
						    <c:otherwise>
						        <c:forEach items="${qList}" var="ql">
						            <tr>
						                <td width="100px">
						                    <c:forEach items="${replyList}" var="rp">
						                        <c:choose>
						                            <c:when test="${ql.qnaNo eq rp.qnaNo}">
						                                <div class="qnaButton"><span>답변완료</span></div>
						                            </c:when>
						                            <c:otherwise></c:otherwise>
						                        </c:choose>
						                    </c:forEach>
						                    <c:forEach items="${isNotReplyList}" var="nr">
						                        <c:choose>
						                            <c:when test="${ql.qnaNo eq nr}">
						                                <div class="qnaButton"><span>답변대기중</span></div>
						                            </c:when>
						                            <c:otherwise></c:otherwise>
						                        </c:choose>
						                    </c:forEach>
						                </td>
						                <td>${ql.qnaTitle}</td>
						                <td>${ql.createDate}</td>
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
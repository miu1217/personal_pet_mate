<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href=" ${contextPath }resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${contextPath }resources/assets/img/favicon.png">
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
  <link href="${contextPath }resources/assets/AdminCss/bootstrap.min.css" rel="stylesheet" />
  <link href="${contextPath }resources/assets/AdminCss/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${contextPath }resources/assets/AdminCss/demo/demo.css" rel="stylesheet" />
</head>
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
            <a class="navbar-brand" href="javascript:;">Product Update</a>
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
             <form action="${contextPath }/pet.admin.update.pd" method="post" id="update-area" enctype="multipart/form-data">
            	<input type="hidden" name="productNo" value="${p.productNo }">
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
                       <input type="text" class="from-control" value="${p.categoryNo }" readonly>
                        <select name="categoryNo">
                        	<c:forEach items="${cList }" var="c">
                        		<option value="${c.categoryNo }"> ${c.parentCategoryNo}${c.categoryName } </option>
                        	</c:forEach>
                        </select>
                        
                         <script>
						$(function(){
							//비교대상 : Board 객체에 담겨있는 category(카테고리 이름)
							//select option 목록에서 똑같은 카테고리 이름인 요소를 선택하기
							
								var choose = "${p.categoryNo}";	//Board 객체에 담겨있는 category(카테고리 이름)
								console.log(choose);
								$("#update-area option").each(function(){
								
								console.log($(this).text());	//각 요소의 텍스트
								
								//데이터베이스에[거 조회해온 게시글의 카테고리와 카테고리 목록 중 텍스트가 같은 요소
								if($(this).text() == choose){//비교대상이 같다면
									$(this).attr("selected", true);	//해당 요소객체의 selectes 속성을 true 값으로 변경
									
									return false;
								
								}
							});
						});
					</script>
                      </div>
                    </div>
					</div>
                    <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 가격</label>
                        <input type="text" class="form-control"  name="productPrice" value="${p.productPrice }" >
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>상품 성분</label>
                      <input type="text" class="form-control" name="ingredient" value="${p.productIngredient }">
                    </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 설명</label>
                        <textarea class="form-control" name="info" rows="10" style="resize: none;">${p.productInfo }</textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>상품 브랜드</label>
                        <input type="text" class="form-control" name="brand" value="${p.productBrand }">
                      </div>
                    </div>
                  </div>
                  <c:forEach items="${phList }" var="ph" varStatus="vs">
                  	<c:choose>
                  		<c:when test="${vs.index eq 0 }">
		                  	<div class="row">
			                    <div class="col-md-12">
			                    	<a>대표 이미지</a>
			                    		 <input type="hidden" name = "originFileNofile1" value="${ph.fileNo }">
						  				<input type="hidden" name = "originFileNamefile1" value="${ph.changeName }">
			                    	<img id="titleImg" width="250" height="170" src="${contextPath }${ph.filePath}${ph.changeName}" >
			                  	</div>
			                  </div>
		                  </c:when>
		                  <c:otherwise>
			                  	<div class="row">
				                    <div class="col-md-12">
				                    	<a>상세 이미지</a>
					                    	<input type="hidden" name = "originFileNofile${vs.count }" value="${ph.fileNo }">
						  					<input type="hidden" name = "originFileNamefile${vs.count }" value="${ph.changeName }">
				                    	<img id="contentImg${vs.index}" 
											src="${contextPath }${ ph.filePath}${ph.changeName}" width="150" height="120">
				                  </div>
			                  </div>
		                  </c:otherwise>
	                  </c:choose>
                  </c:forEach>
                  <div class="row">
                    <div class="update ml-auto mr-auto">
                      <button type="submit"> Submit </button>
                    </div>
	                  </div>
	                  
	                  <div id="file-area">
		                <!--onchange : 변화가 일어났을때 발생하는 이벤트 
		                    선언석함수를 내부에 작성할때 해당 이벤트가 발생한시점에 요소객체를 전달하는 방법
		                    함수(this) 
				         -->
				        
						<input type="file" id="file1" name="file1" onchange="loadImg(this,1)" required> <!-- 대표이미지 필수  -->
						<input type="file" id="file2" name="file2" onchange="loadImg(this,2)" required>
					
					</div>
					</div>
                		</form>
                		
                		
        <script>
            $(function(){
                // $("#file-area").hide();
                $("#titleImg").click(function(){
                    $("#file1").click();
                });
                $("#contentImg1").click(function(){
                    $("#file2").click();
                });
                

                
            });

            //이미지를 읽어줄 함수
            function loadImg(inputFile, num){
                //inputFile : 이벤트가 발생된 요소 객체

                    console.log(inputFile.files);
                    //inputFile.files : 파일업로드 정보를 배열의 형태로 변환해주는 속성
                    //파일을 선택하면 files 속성의 length 가 1이 반환됨

                    if(inputFile.files.length == 1){
                        //해당 파일을 읽어줄 FileReader 라고 하는 자바스크립트 객체를 이용한다.
                        var reader = new FileReader();
                        //파일을 읽어줄 메소드 : 
                        //reader.readAsDataURL(파일);
                        //해당 파일을 읽어서 고유한 url을 반환해주는 메소드
                        //반환받은 url을 미리보기 화면에 넣어주면 된다.

                        reader.readAsDataURL(inputFile.files[0]);

                        //해당 reader 객체가 읽혀진 시점에 img src 속성에 부여된 고유 url 넣어주기
                        reader.onload = function(e){ //e: event 객체
                            console.log(e);
                            //이벤트 객체에서 reader가 부여한 고유 url 정보
                            //event.target.result
                            console.log(e.target.result);

                            switch(num){
                                case 1 : $("#titleImg").attr("src",e.target.result); break;
                                case 2 : $("#contentImg1").attr("src",e.target.result);  break;
                            }
                        }
                    }else{
                        switch(num){
                            case 1 : $("#titleImg").attr("src",null); break;
                            case 2 : $("#contentImg1").attr("src",null);  break;
                        }
                    }
                }

          
        </script>
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
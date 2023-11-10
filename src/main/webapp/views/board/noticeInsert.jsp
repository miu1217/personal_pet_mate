<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항 작성</title>
  <link rel="stylesheet" href="styles.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <style>
    /* 영역설정 */
      body {
      width: 1400px;
      height: 100%;
      margin: auto;
      font-family: Arial, sans-serif;
    }

    main {
        height: auto;
    }
    footer{
      height: auto;
      margin: auto;
      text-align: center;
    }
	/* 네비바 */
	.navbar[data-bs-theme=light] { 
		-bs-navbar-color: #000000; 
		-bs-navbar-hover-color: #bc187d; 
		-bs-navbar-active-color: rgb(5, 131, 106);
	}
	
	.navbar-expand-lg { 
		-bs-navbar-color: rgba(var(- -bs-emphasis-color-rgb), 0.65); 
		-bs-navbar-hover-color: rgba(var(- -bs-emphasis-color-rgb), 0.8); 
		-bs-navbar-active-color: rgba(var(- -bs-emphasis-color-rgb), 1);
		background-color: #e1eef1;
		width: 1400px;
	}
	
	.navbar-nav { 
		-bs-nav-link-color: var(- -bs-navbar-color); 
		-bs-nav-link-hover-color: var(- -bs-navbar-hover-color);
		margin: auto;
	}
	
	.nav-link {
		color: var(- -bs-nav-link-color);
	}
	
	.nav-link:focus, .nav-link:hover {
		color: var(- -bs-nav-link-hover-color)
	}
	
	.navbar-nav .nav-link.active, .navbar-nav .nav-link.show {
		color: var(- -bs-navbar-active-color);
	}

    .insertTop{
        font-size: 35px;
        margin: auto;
        text-align: center;
        
    }


    .insert{
      border: none;
      width: 1000px;
      height: auto;
      margin: auto;
      
    }

    .content {
      width: 100%;
      height: auto;
      margin: auto;
      text-align: center;
    }


    .subject{
      margin: auto;
      width: 1000px;
      height: 50px;
    }
    .subject .insertT{
      width: 700px;
      font-size: 21px;
      margin-top: 6px;
    }

    .num_byte{
      font-size: 14px;
    }

    .content textarea{
      width: 1000px;
      height: 600px;
      font-size: 15px;
      resize: none;
      overflow: visible;
    }

    .content textarea:focus{
        outline: none;
    }

  
    /* 버튼 스타일 */
    #cancle, #submit{
      width: 80px;
      height: 40px;
      margin: auto;
      text-align: center;
      border: 1px solid;
    }
  </style>
</head>

<body>
	<%@include file="../common/menubar.jsp"%>
	
  <div class="outer">
    <div id="insertBo">

		<header>
		<nav class="navbar navbar-expand-lg" data-bs-theme="light">
		<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath }/pet.boardMain?currentPage=1">전체게시글 </a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/pet.notice?currentPage=1">공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/pet.freeBoard?currentPage=1">자유게시판</a></li>
			</ul>
		</nav>
	</header>
    
    <div class="insertTop">게시글 작성</div>
    <form action="${contextPath }/pet.insertNo" method="post" id="goInsert">
    	<input type=hidden name="userNo" value="${loginUser.userNo }">
      <main>
        <div class="insert">
          <div class="subject">
            <input name="title" id="title" class="insertT" type="text" value="" placeholder="제목을 입력하세요.">
            <span class="num_byte">
              <span class="screen_out">입력된 글자 수 : </span>
              <span id="subject_limit" class="current_num">0</span> / 60 bytes (한글 30자)
            </span>
          </div>
          
          <div class="content" id="mainContent">
            <textarea type="text" id="content" name="content"  rows="1" placeholder="내용을 입력하세요."></textarea> <br>
        </div>
        </main>
</form>
        <footer>
          <div class="choose">
            <a onclick="isertCancle();" id="cancle" class="btn btn-waenning">취소</a>
            <a  onclick="insertChk();" id="submit" class="btn btn-success">작성</a>
          </div>
        </footer>
          
        </div>
    </div>
  </div>
  
  <script>
  //글 작성 중 취소 버튼 누를 시
  	function isertCancle(){
  		var result = window.confirm('게시글 작성을 취소하시겠습니까? \n확인을 누르시면 이전페이지로 돌아갑니다.');
  		
  		console.log(result);
  		if(result){ //확인 누르면 이전페이지로 넘김
  			window.history.back();
  		}
  	}

	/* 글작성 버튼 클릭시 */
        function insertChk(){
        	if($("#title") == null){
        		alert("제목을 입력해주세요.");
        		return false;
        	}
        	
        	if($("#insertContent") == null){
        		alert("내용을 입력해주세요.");
        		return false;
        	}
        	
        	$("#goInsert").submit();
        }
        

</script>

</body>

</html>>
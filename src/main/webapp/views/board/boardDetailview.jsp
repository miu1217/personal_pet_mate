<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="styles.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <style>

body {
        width: 1400px;
        height: 100%;
        margin: auto;
        font-family: Arial, sans-serif ;
    }

    .insert{
      width: 1400px;
      height: 100%
         
    }

   /* 네비바 */
.navbar[data-bs-theme=light] { -
	-bs-navbar-color: #000000; -
	-bs-navbar-hover-color: #bc187d; -
	-bs-navbar-active-color: rgb(5, 131, 106);
}

.navbar-expand-lg { -
	-bs-navbar-color: rgba(var(- -bs-emphasis-color-rgb), 0.65); -
	-bs-navbar-hover-color: rgba(var(- -bs-emphasis-color-rgb), 0.8); -
	-bs-navbar-active-color: rgba(var(- -bs-emphasis-color-rgb), 1);
	background-color: #e1eef1;
	width: 1400px;
}

.navbar-nav { -
	-bs-nav-link-color: var(- -bs-navbar-color); -
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
    .insert .info{
      width: 1000px;
      height: 100px;
      margin: auto;
      margin-bottom : 1%;
    }

    .title{
      width: 1000px;
      height: 50px;
    }

    .info table{
      width: 1000px;
      height: 100px;
      border-top : 2px solid grey;
      border-bottom: 2px solid grey;
      text-align: center;
    }
    #ti{
      font-size: 25px;
      border-bottom: 2px solid grey;
      text-align: left;
      padding-left: 5%;
    }
	/* 뒤로가기버튼 */
    #back{
      margin-left: 90%;
      
    }

    #wr, #dav, #co, #cov{
      width: 100px;
      border-right: 2px solid grey;
    }

    #cov{border-right: none;}


    #wrv{
      width: 200px;
      border-left: 2px solid grey;
      border-right: 2px solid grey;
    }

    #da{width: 70px; border-right: 2px solid grey;}

   .content {
      width: 100%;
      height: 10%;
      margin: auto;
      text-align: center;
    }

    .content textarea{
      width: 1000px;
      height: auto;
      border: none;
      border-top: 2px solid gray;
      margin-top: 1%;
      resize: none;
      overflow: hidden;
    }

    .content textarea:focus{
      outline: none;
    }

    

    .reply{
      width: 1000px;
      height: 300px;
      margin: auto;
      text-align: center;
    }

    .reply table{
      margin: auto;
      margin-top: 2%;
      border-top: 2px solid grey;
      border-bottom : 2px solid grey;
      
    }

    .reply table textarea{
      box-sizing: border-box;
      resize: none;
      border: 2px solid grey;
     
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
              href="${pageContext.request.contextPath  }/pet.boardMain?currentPage=1">전체게시글 </a></li>
            <li class="nav-item"><a class="nav-link"
              href="${pageContext.request.contextPath  }/pet.notice?currentPage=1">공지사항</a></li>
            <li class="nav-item"><a class="nav-link"
              href="${pageContext.request.contextPath  }/pet.freeBoard?currentPage=1">자유게시판</a></li>
          </ul>
        </nav>
      </header>

  <main>
   

      <div class="insert">
        <div class="info">
          <input type="hidden" name="bno" value="${b.boardNo }">
          <table >
            <tr>
              <td id="ti" colspan="10" style="font-size: 25px;">${b.boardTitle } <span id="back"><a href="javascript:window.history.go(-1);" class="btn btn-success">목록가기</a></span></td>
            </tr>
            <tr>
              <td id="wr">작성자 </td>
              <td id="wrv">${b.boardWriter }</td>
              <td id="da">작성일</td>
              <td id="dav">${b.createDate }</td>
              <td id="co">조회수</td>
              <td id="cov">${b.count }</td>
            </tr>
          </table>
        </div>
            <div class="content" id="mainContent">
          <textarea type="text" id="contentText" name="content" readonly>${b.boardContent }</textarea>
          <br>
         
          <img id="inputImg" src="${contextPath}${at.filePath}${at.changeName}">
         
        </div>
        
        <div class="reply">
          <table>
              <tr>
                <td colspan="2" style="height: 40px;">댓글</td>
              </tr>
              <tr>
                <td>
                  <textarea id="replyContent"rows="3" cols="114" placeholder="로그인 후 이용 가능합니다."></textarea>
                </td>
                <c:choose>
                <c:when test="${not empty loginUser }">
	                <td><button onclick="" class="btn btn-success">작성</button></td>
                </c:when>
                <c:otherwise>
                  <td><button onclick="window.alert('로그인 후 이용 가능합니다.'); return false;" class="btn btn-success">작성</button></td>
                </c:otherwise>
                </c:choose>
              </tr>
              
          </table>
        </div>
      </div>
    </main>
  </div>
  </div>


  <script>
  //textarea 크기 조정
    function resize() {
        let textarea = document.getElementById("contentText");
 
        textarea.style.height = "0px";
 
        let scrollHeight = textarea.scrollHeight;
        let style = window.getComputedStyle(textarea);
        let borderTop = parseInt(style.borderTop);
        let borderBottom = parseInt(style.borderBottom);
 
        textarea.style.height = (scrollHeight + borderTop + borderBottom)+"px";
    }
    
    window.addEventListener("load", resize);
    window.onresize = resize;
    
   
</script>
  
  </body>
  </html>
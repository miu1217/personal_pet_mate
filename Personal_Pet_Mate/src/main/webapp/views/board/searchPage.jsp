<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">	

<title>검색게시글</title>
<style>
/* 영역설정 */
header {
	width: 1400px;
	height: 80px;
	font-family: 'Noto Sans KR', sans-serif;
    font-weight: 500;
	text-align: center;
	margin: auto;
}

main {
	width: 1200px;
	height: auto;
	margin: auto;
}


/* 네비바 */
.navbar[data-bs-theme=light] {
	--bs-navbar-color: #ffff; 
	--bs-navbar-hover-color: #000000; 
	--bs-navbar-active-color: #000000;
}

.navbar-expand-lg { 
	--bs-navbar-color: rgba(var(--bs-emphasis-color-rgb), 0.65);
	--bs-navbar-hover-color: rgba(var(--bs-emphasis-color-rgb), 0.8); 
	--bs-navbar-active-color: rgba(var(--bs-emphasis-color-rgb), 1);
	background-color: #87a56c;
	width: 1400px;
}

.navbar-nav { 
	--bs-nav-link-color: var(--bs-navbar-color); 
	--bs-nav-link-hover-color: var(--bs-navbar-hover-color);
	margin: auto;
}

.nav-link {
	color: var(--bs-nav-link-color);
}

.nav-link:focus, .nav-link:hover {
	color: var(--bs-nav-link-hover-color)
}

.navbar-nav .nav-link.active, .navbar-nav .nav-link.show {
	color: var(--bs-navbar-active-color);
}

#search{
margin: auto;
margin-left: 830px;
margin-top: 1%;
margin-bottom: 1%;
}

#selectSearch{
    width: 120px;
	height: 40px;
    border: 1px solid #87a56c;
    box-sizing: border-box;
	text-align: center;
    font-weight: 400;
    line-height: 16px;
	margin-right: 2%;
}

#selectSearch:focus{
    border: 1px solid #87a56c;
    box-sizing: border-box;
    border-radius: 8px;
    outline: 2px solid #87a56c;
}

#searchInput{
	width: 200px;
	height: 40px;
	border: none;
	border: 1px solid #87a56c;
	border-right: none;
	margin-right: 2%;
	padding-left: 5px;
}

#searchInput:focus{
    border: 1px solid #87a56c;
    box-sizing: border-box;
}

#searchBtn{
	width: 50px;
	height: 40px;
	border: none;
	outline: none;
    margin-top: 5px;
	margin-left:-5%;
	background-color: #87a56c;
	 color: #ffff;
}

table { text-align: center; margin-top: 4%; }
thead{ background-color: #87a56c; color: #ffff;}
tbody { font-size: small }
table tr td {border-bottom: 1px solid #cce4b9 }
#bNo { width: 100px }
#title { width: 600px }
#writer { width: 200px }
#count { width: 100px; }
tbody #title { text-align: left }

#insertBtn{
	float: left;
	margin-top: 1%;
	margin-left: 7.2%;
	 color: #ffff;
}

.btn-two {
	width: 70px;
	height: 35px;
	font-size: 14px;
	border: none;
	margin-bottom: 0.5%;
	margin-left: 2%;
	float: right;
	background-color: #87a56c;
	color: rgb(36, 28, 28); 
	text-align: center;
	padding-top: 7px;
	border-bottom-color: rgba(0,0,0,0.34);
	text-shadow:0 1px 0 rgba(0,0,0,0.15);
	box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
				0 2px 0 -1px rgba(0,0,0,0.13), 
				0 3px 0 -1px rgba(0,0,0,0.08), 
				0 3px 13px -1px rgba(0,0,0,0.21);
}

.btn-two:hover {
  top: 1px;
  text-decoration: none;
  color: rgb(36, 28, 28); 
  outline: none;

}

.btn-two:active {
  top: 1px;
  border-color: rgba(0,0,0,0.34) rgba(0,0,0,0.21) rgba(0,0,0,0.21);
  box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
  outline: none;
}
    .moveTopBtn {
      position: fixed;
      float: right;
      height: 32px;
      right: 10px;
      bottom: 10px;
      opacity: 0.7;
    }

    .moveTopBtn:hover {
      background-color: grey;
	  text-align: center;
    }

</style>
</head>

<body>
	<%@include file="../common/menubar.jsp"%>
	<header>
		<nav class="navbar navbar-expand-lg" data-bs-theme="light">
		<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.boardMain?currentPage=1">전체게시글 </a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.notice?currentPage=1">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.freeBoard?currentPage=1">자유게시판</a></li>
			</ul>
		</nav>
		
		<div id="insert">
		<c:choose> 
			<c:when test="${loginUser.userId eq 'admin' }">
					<a href="${contextPath }/pet.insertNo" id='insertBtn' class="btn-two">글작성</a>
			</c:when>
			<c:when test="${not empty loginUser}"> 
				<a href="${contextPath }/pet.insertBo" id='insertBtn'  class="btn-two">글작성</a>
			</c:when>
		</c:choose>
		</div>
		
		<form action="${contextPath }/pet.boardSearch" onsubmit="return beforeSearch();" method="get">
		<div id="search">
    		<select id="selectSearch">
    			<option value="all" selected>제목+내용</option>
    			<option value="titleSearch">제목</option>
    			<option value="contentSearch">내용</option>
    		</select>
    		<input type="text" id="searchInput" name="searchInput" placeholder="검색어를 입력하세요."><input type="submit" id="searchBtn" value="검색">
       	</div>
		</form>
	</header>


	<main>
		<table class="table table-hover">
			<thead>
				<tr style="background-color: #87a56c;">
					<th scope="col" style="width: 70px">번호</th>
					<th scope="col" style="width: 700px">제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty slist}">
						<tr>
							<td colspan='6'>게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<!-- 목록이 존재하는 경우(반복문을 통해 list에 담겨있는 객체 하나씩 다 추출해주기) -->
						<c:forEach items="${slist}" var="b">
							<tr>
								<td>${b.boardNo }</td>
								<td>${b.boardTitle }</td>
								<td>${b.boardWriter }</td>
								<td>${b.createDate }</td>
								<td>${b.count }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</table>
	</main>
	      <div class="upBtn">
        <div class="moveTopBtn">위로</div>
      </div>


	  <script>
  	$(function(){ //detail.bo
				$("table>tbody>tr").click(function(){
					var bno = $(this).children().eq(0).text();
					
					location.href="<%=contextPath%>/pet.boardDetail?bno="+bno;
				});
			});
  	
  //검색버튼 누를시
  	function beforeSearch(){
		//검색어 없을때
		let input = $("#searchInput").val();
  		let selectedValue = $("#selectSearch").val();
		
  		if(input == ''){
  		    showError("입력 오류","검색어를 입력해주세요.","확인");
  			return false;
  		}else{
			//옵션값 넘기기
	  		if(selectedValue=='all'){
	  			location.href="<%=contextPath%>/pet.boardSearch";
	  		}else if(selectedValue =='titleSearch'){
	  			 $("#searchForm").append("<input type='hidden' name='searchType' value='title'>");
	  			$("#searchForm").submit();
	  			
	  		}else if(selectedValue =='contentSearch'){
	  			 $("#searchForm").append("<input type='hidden' name='searchType' value='content'>");
	  	        $("#searchForm").submit();
	  	    
	  		}
	  		
	  	}
  	}
  
    $(function(){
        let $topBtn = document.querySelector(".moveTopBtn");

        // 버튼 클릭 시 맨 위로 이동
        $topBtn.onclick = () => {
          window.scrollTo({ top: 0, behavior: "smooth" });  
        }

      });
  </script>
</body>
</html>
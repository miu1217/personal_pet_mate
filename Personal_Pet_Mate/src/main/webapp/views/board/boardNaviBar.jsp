<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메뉴바</title>
  <link rel="stylesheet" href="styles.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<style>
body{
	width: 1400px;
	height: 80px;
	text-align: center;
	margin: auto;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;}

/* 네비바 */
.navbar[data-bs-theme=light] {
	--bs-navbar-color: #000000; 
	--bs-navbar-hover-color: #bc187d; 
	--bs-navbar-active-color: rgb(5, 131, 106);
}

.navbar-expand-lg { 
	--bs-navbar-color: rgba(var(- -bs-emphasis-color-rgb), 0.65);
	--bs-navbar-hover-color: rgba(var(- -bs-emphasis-color-rgb), 0.8); 
	--bs-navbar-active-color: rgba(var(- -bs-emphasis-color-rgb), 1);
	background-color: #DFEDD4;
	width: 1400px;
}

.navbar-nav { 
	--bs-nav-link-color: var(- -bs-navbar-color); 
	--bs-nav-link-hover-color: var(- -bs-navbar-hover-color);
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
</style>
</head>
<body>
		<nav class="navbar navbar-expand-lg" data-bs-theme="light">
		<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active" href="${contextPath }/pet.boardMain?currentPage=1">전체게시글 </a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.notice?currentPage=1">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.freeBoard?currentPage=1">자유게시판</a></li>
			</ul>
		</nav>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="styles.css">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>전체게시글</title>
<style>
/* 영역설정 */
header {
	width: 1400px;
	height: 80px;
	font-family: Arial, sans-serif;
	text-align: center;
	margin: auto;
}

main {
	width: 1200px;
	height: 800px;
	margin: auto;
}

footer {
	width: 1200px;
	height: 15%;
	margin: auto;
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

table {
	text-align: center
}

tbody {
	font-size: small
}

#bNo {
	width: 100px
}

#title {
	width: 600px
}

#writer {
	width: 200px
}

#count {
	width: 100px;
}

tbody #title {
	text-align: left
}
</style>
</head>

<body>
	<%@include file="../common/menubar.jsp"%>
	<header>
		<nav class="navbar navbar-expand-lg" data-bs-theme="light">
		<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					href="${contextPath }/pet.boardMain?currentPage=1">전체게시글 </a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath }/pet.notice?currentPage=1">공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath }/pet.freeBoard?currentPage=1">자유게시판</a></li>
			</ul>
		</nav>
	</header>


	<main>
		<table class="table table-hover">
			<thead>
				<tr style="background-color: #e1eef1;">
					<th scope="col" style="width: 70px">번호</th>
					<th scope="col" style="width: 200px">제목</th>
					<th scope="col">글쓴이</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty flist}">
						<tr>
							<td colspan='6'>게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<!-- 목록이 존재하는 경우(반복문을 통해 list에 담겨있는 객체 하나씩 다 추출해주기) -->
						<c:forEach items="${flist}" var="b">
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


	<footer>
	<div align="center" class="paging=area">
			<c:choose>
				<c:when test="${pb.currentPage eq 1}">
					<button disabled>이전</button>
				</c:when>
				<c:otherwise>
					<button onclick="location.href='pet.freeBoard?currentPage=${pb.startPage-1}'">이전</button>
				</c:otherwise>
			</c:choose>


			<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
				<button onclick="location.href='pet.freeBoard?currentPage=${i}'">${i}</button>
			</c:forEach>
			
			<c:choose>
				<c:when test="${pb.currentPage eq pb.maxPage}">
					<button disabled>다음</button>
				</c:when>
				<c:otherwise>
					<button onclick="location.href='pet.freeBoard?currentPage=${pb.startPage+10}'">다음</button>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 글작성 버튼 -->
		<!-- 관리자는 무조건 공지글만 올릴 수 있다!! -->
		<div id="insert" style="margin: end;">
		<c:choose> 
			<c:when test="${loginUser.userId eq 'admin' }">
					<a href="${contextPath }/pet.insertNo" class="btn btn-info">글작성</a>
			</c:when>
			<c:when test="${not empty loginUser}"> 
				<a href="${contextPath }/pet.insertBo" class="btn btn-info">글작성</a>
			</c:when>
		</c:choose>

		</div>
	</footer>
	
	  <script>
  	$(function(){ //detail.bo
				$("table>tbody>tr").click(function(){
					var bno = $(this).children().eq(0).text();
					
					location.href="<%=contextPath%>/pet.boardDetail?bno="+bno;
				});
			});
  </script>
</body>

</html>
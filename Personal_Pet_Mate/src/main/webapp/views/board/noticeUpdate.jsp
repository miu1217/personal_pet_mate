<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 수정</title>
<link rel="stylesheet" href="styles.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<style>
/* 영역설정 */
body {
	width: 1400px;
	height: 100%;
	margin: auto;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 500;
}

main {
	height: auto;
}

footer {
	height: auto;
	margin: auto;
	margin-top: 2%;
	text-align: center;
}
/* 네비바 */
.navbar[data-bs-theme=light] { -
	-bs-navbar-color: #000000; -
	-bs-navbar-hover-color: #49583b; -
	-bs-navbar-active-color: #49583b;
}

.navbar-expand-lg { -
	-bs-navbar-color: rgba(var(- -bs-emphasis-color-rgb), 0.65); -
	-bs-navbar-hover-color: rgba(var(- -bs-emphasis-color-rgb), 0.8); -
	-bs-navbar-active-color: rgba(var(- -bs-emphasis-color-rgb), 1);
	background-color: #87a56c;
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

.insertTop {
	font-size: 35px;
	margin: auto;
	text-align: center;
}

.filebox {
	width: 60%;
	margin-bottom: 5px;
}

.filebox .upload-name {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid grey;
	width: 50%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 10px;
	color: #fff;
	background-color: #999999;
	cursor: pointer;
	text-align: center;
	margin-left: 10px;
}

/* 기존 파일박스 지워주기 */
input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.insert {
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

.content img {
	margin: auto;
	max-width: 100%;
	height: auto;
	display: block;
}

.subject {
	margin: auto;
	width: 1000px;
	height: 50px;
}

.subject .insertT {
	width: 700px;
	font-size: 21px;
	margin-top: 6px;
}

.num_byte {
	font-size: 14px;
}

#content_limit {
	float: right;
}

.content textarea {
	width: 1000px;
	height: 600px;
	font-size: 15px;
	resize: none;
	overflow: visible;
}

.content textarea:focus {
	outline: none;
}

/* 버튼 스타일 */
#cancle, #submit {
	width: 80px;
	height: 40px;
	margin: auto;
	text-align: center;
	border-radius: 10px;
}

.btn.brown {
	background-color: rgb(211, 195, 176)
}

.btn {
	position: relative;
	border: 0;
	padding: 10px 20px;
	display: inline-block;
	text-align: center;
	color: rgb(0, 0, 0);
	font-weight: bolder;
}

.btn:active {
	top: 4px;
}

.btn.brown {
	box-shadow: 0px 4px 0px rgb(163, 151, 137);
}

.btn.brown:active {
	box-shadow: 0 0 rgb(128, 112, 94);
	background-color: rgb(211, 195, 176);
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
						<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.boardMain?currentPage=1">전체게시글 </a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.notice?currentPage=1">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.freeBoard?currentPage=1">자유게시판</a></li>
					</ul>
				</nav>
			</header>

			<div class="insertTop">공지사항 수정</div>
			<form action="${contextPath }/pet.noticeUpdate" method="post" id="goUpdate">
				<input type=hidden name="bno" value="${b.boardNo }">
				<main>
					<div class="insert">
						<div class="subject">
							<input name="title" id="title" class="insertT" type="text" value="${b.boardTitle }"> <span class="num_byte"> <span id="subject_limit" class="current_num">(${b.boardTitle.length()}/ 30글자)</span>
							</span>
						</div>
						<div class="content" id="mainContent">
							<textarea type="text" id="content" name="content" rows="1" placeholder="내용을 입력하세요.">${b.boardContent }</textarea>
							<br> <span class="num_byte"> <span id="content_limit" class="current_num">(${b.boardContent.length()}/ 2000글자)</span>
							</span>
						</div>
				</main>
				<footer>
					<div class="choose">
						<button type="button" onclick="isertCancle();" id="cancle" class="btn brown small">취소</button>
						<button type="submit" id="submit" onclick="return insertChk();" class="btn brown small">작성</button>
					</div>
				</footer>
			</form>

		</div>
	</div>
	</div>

	<script>
        //제목 글자 수 카운트
        $("#title").keyup(function(e) {
            let content = $(this).val();
            $("#subject_limit").html("(" + content.length + "/ 30글자)"); //실시간 글자수 카운팅
            if (content.length > 30) {
                showError("입력 오류", "최대 30글자까지 입력 가능합니다.", "확인");
                $(this).val(content.substring(0, 30));
                $('#subject_limit').html("(30 / 최대 30글자)");
            }
        });

        // 내용 글자수 카운트
        $("#content").keyup(function(e) {
            let content = $(this).val();
            $("#content_limit").html("(" + content.length + "/ 2000글자)"); //실시간 글자수 카운팅
            if (content.length > 2000) {
                showError("입력 오류", "최대 2000글자까지 입력 가능합니다.", "확인");
                $(this).val(content.substring(0, 2000));
                $('#content_limit').html("(2000 / 최대 2000글자)");
            }
        });

        //글 작성 중 취소 버튼 누를 시
        function isertCancle() {
            showHistoryBack("게시글 작성을 취소하시겠습니까? \n확인을 누르시면 이전페이지로 돌아갑니다.");
        }

        //글작성 버튼 클릭시
        function insertChk() {
            let title = $("#title").val();
            let content = $("#content").val();
            if (title == '') {
                showError("입력 오류", "제목을 입력해주세요.", "확인");
                return false;
            }

            if (content == '') {
                showError("입력 오류", "내용을 입력해주세요.", "확인");
                return false;
            }

        }
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

footer {
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
	border: 1px solid;
}
</style>
</head>

<body>
	<%@include file="../common/menubar.jsp"%>

	<div class="outer">
		<div id="insertBo">
			<div class="insertTop">QnA 작성</div>
			<form action="${contextPath }/mate.insertQna" method="post" id="goInsert" encType="multipart/form-data">
				<input type=hidden name="userNo" value="${loginUser.userNo }">
				<main>
					<div class="insert">
						<div class="subject">
							<input name="title" id="title" class="insertT" type="text" value="" placeholder="제목을 입력하세요."> <span class="num_byte"> <span class="screen_out">입력된 글자 수 : </span> <span id="subject_limit" class="current_num">(0/ 30글자)</span>
							</span>
						</div>
						<div class="filebox">
							<input class="upload-name" value="첨부파일" placeholder="첨부파일"> <label for="file">파일찾기</label> <input type="file" id="file" name="file" onchange="loadImg(this,1);">
						</div>
						<div class="QnACategory">
							<select name="QnAcategory">
								<c:forEach items="${qclist }" var="qc">
									<option value="${qc.categoryNo }">${qc.categoryName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="content" id="mainContent">
							<textarea type="text" id="content" name="content" rows="1" placeholder="내용을 입력하세요."></textarea>
							<span class="num_byte"> <span id="content_limit" class="current_num">(0/ 2000글자)</span>
							</span> <br> <br> <img id="inputImg" src="${contextPath}${at.filePath}${at.changeName}">
						</div>
				</main>
			</form>
			<footer>
				<div class="choose">
					<a onclick="isertCancle();" id="cancle" class="btn btn-waenning">취소</a> <a onclick="insertChk();" id="submit" class="btn btn-success">작성</a>
				</div>
			</footer>

		</div>
	</div>
	</div>

	<script>
        $("#title").keyup(function(e) {
            let content = $(this).val();
            $("#subject_limit").html("(" + content.length + "/ 30글자)"); //실시간 글자수 카운팅
            if (content.length > 30) {
                showError("입력 실패", "최대 30글자까지 입력 가능합니다.", "확인");
                $(this).val(content.substring(0, 30));
                $('#subject_limit').html("(30 / 최대 30글자)");
            }
        });
        
        $("#content").keyup(function(e) {
		let content = $(this).val();
		$("#content_limit").html("(" + content.length + "/ 2000글자)"); //실시간 글자수 카운팅
		if (content.length > 2000) {
		    showError("입력 실패", "최대 2000글자까지 입력 가능합니다.", "확인");
			$(this).val(content.substring(0, 2000));
			$('#content_limit').html("(2000 / 최대 2000글자)");
		}
	});
        //글 작성 중 취소 버튼 누를 시
        function isertCancle() {
            showHistoryBack("게시글 작성을 취소하시겠습니까? \n확인을 누르시면 이전페이지로 돌아갑니다.");
        }
        //이미지 등록하기
        function loadImg(inputFile, num) {
            if (inputFile.files.length == 1) { //파일이 등록되면
                var reader = new FileReader();
                //파일을 읽어줄 메소드 :  reader.readAsDataURL(파일)
                reader.readAsDataURL(inputFile.files[0]);

                reader.onload = function(e) { //e : 이벤트객체

                    if (num == 1) {
                        $("#inputImg").attr("src", e.target.result);
                        adjustMainContentHeight();
                    }
                }
            } else { //사진입력 안할시
                $("#inputImg").attr("src", null);
                adjustMainContentHeight();
            }
        }

        $("#file").on('change', function() {
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
        });

        // 이미지 등록시 main 높이 자동조절
        function adjustContentContainerHeight() {
            var mainContent = document.querySelector("#mainContent");
            var buttonsContainer = document.querySelector(".choose");

            var contentHeight = mainContent.scrollHeight;
            mainContent.mainstyle.height = contentHeight + "px";
            buttonsContainer.buttonsContainerstyle.height = contentHeight
                    + "px";
        }

        /* 글작성 버튼 클릭시 */
        function insertChk() {
            if ($("#title") == null) {
                alert("제목을 입력해주세요.");
                return false;
            }

            if ($("#insertContent") == null) {
                alert("내용을 입력해주세요.");
                return false;
            }

            $("#goInsert").submit();
        }
    </script>

</body>

</html>
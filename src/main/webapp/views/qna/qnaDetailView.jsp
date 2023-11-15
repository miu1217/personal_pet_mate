<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 상세보기</title>
<link rel="stylesheet" href="styles.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
<style>
body {
	width: 1400px;
	height: auto;
	margin: auto;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
}

/* 네비바 */
.navbar[data-bs-theme=light] { -
	-bs-navbar-color: #000000; -
	-bs-navbar-hover-color: #af6c64; -
	-bs-navbar-active-color: #af6c64;
}

.navbar-expand-lg { -
	-bs-navbar-color: rgba(var(- -bs-emphasis-color-rgb), 0.65); -
	-bs-navbar-hover-color: rgba(var(- -bs-emphasis-color-rgb), 0.8); -
	-bs-navbar-active-color: rgba(var(- -bs-emphasis-color-rgb), 1);
	background-color: #DFEDD4;
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
/* 검색창 */
#search {
	margin: auto;
	margin-left: 830px;
	margin-top: 1%;
	margin-bottom: 1%;
}

#selectSearch {
	width: 120px;
	height: 40px;
	border: 1px solid #DFEDD4;
	box-sizing: border-box;
	border-radius: 8px;
	text-align: center;
	font-weight: 400;
	line-height: 16px;
	margin-right: 2%;
}

#selectSearch:focus {
	border: 1px solid #c3e2ac;
	box-sizing: border-box;
	border-radius: 8px;
	outline: 2px solid #cce4b9;
	border-radius: 8px;
}

#searchInput {
	width: 200px;
	height: 40px;
	border: none;
	border: 1px solid #c3e2ac;
	border-right: none;
	margin-right: 2%;
	padding-left: 5px;
}

#searchInput:focus {
	border: 1px solid #c3e2ac;
	box-sizing: border-box;
	border-radius: 8px;
	outline: 2px solid #cce4b9;
	border-radius: 8px;
}

#searchBtn {
	width: 50px;
	height: 40px;
	border: none;
	outline: none;
	margin-left: -5%;
	background-color: #c3e2ac;
}

.detail table {
	width: 1000px;
	text-align: left;
	margin: auto;
	margin-top: 2%;
	border: 2px solid #c3e2ac;
	border-bottom: none;
}

#title, #writer, #date {
	height: 50px;
	border-bottom: 1px solid rgb(146, 135, 135)
}

#img {
	height: 100px;
	text-align: center;
}

.btn {
	height: 70px;
	border-top: 1px solid grey;
	text-align: center;
}

#title {
	border-bottom: 1px solid rgb(160, 149, 149);
	color: rgb(166, 197, 142);
	padding-left: 1%;
}

#writer, #date {
	width: 80px;
	color: rgb(166, 197, 142);
	padding-left: 1%;
}

#writerVal, #dateVal {
	color: black;
}

#count {
	width: 70px;
	height: 30px;
	font-size: 13px;
	margin-right: 1%; /* Align to the right */
	text-align: center;
	float: right;
	background-color: #c3e2ac;
	color: rgb(124, 91, 91);
	border-radius: 10px;
	border: none;
}

#content {
	width: 1000px;
	height: 200px;
	border: none;
	resize: none;
	overflow: hidden;
}

#content:focus {
	outline: none;
}

.btn {
	width: 1000px;
	justify-content: center;
}

.btn-two {
	width: 70px;
	height: 30px;
	font-size: 15px;
	border: none;
	margin-left: 1%;
	background-color: #cce4b9;
	color: rgb(36, 28, 28);
	padding-top: 7px;
	border-bottom-color: rgba(0, 0, 0, 0.34);
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.34) inset, 0 2px 0 -1px
		rgba(0, 0, 0, 0.13), 0 3px 0 -1px rgba(0, 0, 0, 0.08), 0 3px 13px -1px
		rgba(0, 0, 0, 0.21);
	text-decoration: none;
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
}

.btn-two:hover {
	top: 1px;
	text-decoration: none;
	color: rgb(36, 28, 28);
	outline: none;
}

.btn-two:active {
	top: 1px;
	border-color: rgba(0, 0, 0, 0.34) rgba(0, 0, 0, 0.21)
		rgba(0, 0, 0, 0.21);
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.89), 0 1px rgba(0, 0, 0, 0.05)
		inset;
	outline: none;
}

/* 댓글창 css */
.insertReply {
	width: 1000px;
	height: 300px;
	margin: auto;
}

.insertReply table {
	margin: auto;
}

.insertReply table textarea {
	box-sizing: border-box;
	resize: none;
	border: 2px solid grey;
	width: 927px
}

#replyCount {
	width: 100px;
	float: left;
	font-size: 20px;
	margin-top: 3px;
}

#replyCount>label {
	font-size: 13px;
	margin-left: 5%;
}

#reList {
	width: 1000px;
}

#myReW {
	width: 500px;
}

#myReB {
	float: right;
}

#reC {
	width: 100%;
	height: auto;
}

#reW {
	width: 80%;
	text-align: left;
	padding-left: 1%;
}

#reTop, #myReTop {
	background-color: rgb(204, 204, 204);
}

.reListC, #reListC {
	width: 100%;
	height: 120px;
	border: none;
	border-top: 2px solid gray;
	margin-top: 1%;
	resize: none;
	overflow: auto;
}

.reListC, #reListC:focus {
	outline: none;
}

#reBtn {
	padding-bottom: 5px;
	margin-top: 4%
}

#reply_limit {
	font-size: 13px;
}
</style>
</head>

<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer">
		<div id="insertBo">
			<div class="detail">
				<table>
					<tr>
						<td id="title" name="title" colspan="3" style="font-size: 22px;">${q.qnaTitle }<input id="count" value="조회수 : ${q.count }">
						</td>
					</tr>
					<tr>
						<td id="writer">작성자 : <span id="writerVal">${q.userId }</span></td>
					</tr>
					<tr>
						<td id="date">작성일 : <span id="dateVal">${q.createDate }</span></td>
					</tr>
					<tr>
						<td><textarea name="content" id="content" cols="50" rows="40" readonly>${q.qnaContent }</textarea></td>
					</tr>
					<tr>
						<td id="img" class="img"><c:if test="${not empty at }">
								<img id="inputImg" src="${contextPath}${at.filePath}${at.changeName}">
							</c:if></td>
					</tr>
					<tr>
						<td class="btn"><c:choose>
								<c:when test="${loginUser.userId eq 'admin'}">
									<span id="back"><a href="${contextPath}/mate.qna?currentPage=1&category=0" class="btn-two">목록가기</a></span>
									<span id="update"><a href="${contextPath }/mate.qnaUpdate?qno=${q.qnaNo}" class="btn-two">수정</a></span>
									<span id="delete"><a href="${contextPath }/mate.qnaDelete?qno=${q.qnaNo}" class="btn-two">삭제</a></span>
								</c:when>
								<c:when test="${loginUser.userId eq q.userId}">
									<span id="back"><a href="${contextPath}/mate.qna?currentPage=1&category=0" class="btn-two">목록가기</a></span>
									<span id="update"><a href="${contextPath }/mate.qnaUpdate?qno=${q.qnaNo}" class="btn-two">수정</a></span>
									<span id="delete"><a href="${contextPath }/mate.qnaDelete?qno=${q.qnaNo}" class="btn-two">삭제</a></span>
								</c:when>
								<c:otherwise>
									<span id="back"><a href="${contextPath}/mate.qna?currentPage=1&category=0" class="btn-two" style="margin-left: 60%;">목록가기</a></span>
								</c:otherwise>
							</c:choose></td>
					</tr>
					</div>
				</table>
				<div class="insertReply">
					<table>
						<th id="replyCount">댓글<label for="replyCount"><span id="replyCountValue">0</span>개</label></th>
						<tr>
							<td><textarea id="replyContent" rows="3" cols="114" placeholder="로그인 후 이용 가능합니다."></textarea></td>
							<td><span class="num_byte"> <span id="reply_limit" class="current_num">(0/ 400글자)</span>
							</span> <c:choose>
									<c:when test="${loginUser.userId eq 'admin' }">
										<button onclick="return insertReply();" id="reBtn" class="btn-two">작성</button>
									</c:when>
									<c:otherwise>
										<button onclick="window.alert('로그인 후 이용 가능합니다.'); return false;" id="reBtn" class="btn-two">작성</button>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</table>
					<table id="reList">
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
			<div class="upBtn">
				<div class="moveTopBtn">위로</div>
			</div>


			<script>
      //글자 수 카운트
    	$("#replyContent").keyup(function(e) {
    		let content = $(this).val();
  		$("#reply_limit").html("(" + content.length + "/ 400글자)"); //실시간 글자수 카운팅
  		if (content.length > 30) {
  			alert("최대 30글자까지 입력 가능합니다.");
  			$(this).val(content.substring(0, 400));
  			$('#subject_limit').html("(400 / 최대 400글자)");
  		}
  	});
      
      
        //textarea 크기 조정
        function resize() {
          let textarea = document.getElementById("contentText");

          textarea.style.height = "0px";

          let scrollHeight = textarea.scrollHeight;
          let style = window.getComputedStyle(textarea);
          let borderTop = parseInt(style.borderTop);
          let borderBottom = parseInt(style.borderBottom);

          textarea.style.height = (scrollHeight + borderTop + borderBottom) + "px";
        }

        window.addEventListener("load", resize);
        window.onresize = resize;

        //댓글 trxtarea 크기 조정
        function resize2() {
          let textarea = document.getElementById("reListC");

          textarea.style.height = "0px";

          let scrollHeight = textarea.scrollHeight;
          let style = window.getComputedStyle(textarea);
          let borderTop = parseInt(style.borderTop);
          let borderBottom = parseInt(style.borderBottom);

          textarea.style.height = (scrollHeight + borderTop + borderBottom) + "px";
        }

        window.addEventListener("load", resize);
        window.onresize = resize;

        $(function () {
          let $topBtn = document.querySelector(".moveTopBtn");

          // 버튼 클릭 시 맨 위로 이동
          $topBtn.onclick = () => {
            window.scrollTo({ top: 0, behavior: "smooth" });
          }

        });
      </script>

			<script>
        /* 댓글 */
        //댓글입력
        function insertReply() {
        	let replyContent = $("#replyContent").val();
          if (replyContent.length > 400) {
            alert("400자 이하로 작성해주세요.");
            return false;
          } else if(replyContent==''){
        	  alert("내용을 작성해주세요.");
              return false;
          }else {
            $.ajax({
              url: "mate.insertQnaReply",
              data: {
                content: replyContent,
                qno: ${ q.qnaNo }
              },
          type: "post",
            success : function(result) {

              if (result > 0) {//성공
                alert("댓글 작성 성공");
                //추가된 댓글목록 재조회	
                selectReplyList();
                $("#replyContent").val("");
              } else {//실패
                alert("댓글 작성 실패");
              }
            },
          error: function() {
            console.log("통신오류");
          }

        });		
          }
        }

        $(function () {
          selectReplyList();
        });

        //댓글목록 조회 함수
        function selectReplyList() {

          $.ajax({
            url: "mate.qnaReplyList",
            data: { qno: ${ q.qnaNo }},
        success: function(result) {
          let str = "";
          let count = result.length;

          $("#replyCountValue").text(count);

          for (var i in result) {
            //댓글 작성자와 로그인유저 아이디 같을시 수정,삭제 버튼 함께 보임 
            if (result[i].replyWriter == '${loginUser.userId}') {
              str += "<tr id='myReTop'>"
                + "<td id='myReW'>" + result[i].qnaReplyWriter + "   " + result[i].creatDate + "<input type='hidden' id='replyNo' name='replyNo' value='" + result[i].qnaReplyNo + "'></td>"
                + "<td id='myReB'><button type='button' onclick='editReply();'>수정</button><button type='button' onclick='return checkDelete();'>삭제</button></td>"
                + "</tr>"
                + "<tr><td id='reC' colspan='3'><textarea class='reListC' style='border: none' id='reListC+" + result[i].qnaReplyNo + "' readonly>" + result[i].qnaReplyContent + "</textarea></td></tr>";
            } else if ('${loginUser.userId}' == 'admin') { //관리자일 경우 회원댓글 삭제 가능
              str += "<tr id='myReTop'>"
                + "<td id='myReW'>" + result[i].qnaReplyWriter + "   " + result[i].creatDate + "<input type='hidden' id='replyNo' name='replyNo' value='" + result[i].qnaReplyNo + "'></td>"
                + "<td id='myReB'><button type='button' onclick='return checkDelete();'>삭제</button></td>"
                + "</tr>"
                + "<tr><td id='reC' colspan='3'><textarea class='reListC' style='border: none' id='reListC+" + result[i].qnaReplyNo + "' readonly>" + result[i].qnaReplyContent + "</textarea></td></tr>";
            } else { //나머지(비회원, 작성자 본인아닐경우)
              str += "<tr id='reTop'>"
                + "<td id='reW'>" + result[i].qnaReplyWriter + "   " + result[i].creatDate + "</td>"
                + "</tr>"
                + "<tr><td id='reC' colspan='3'><textarea id='reListC' readonly>" + result[i].qnaReplyContent + "</textarea></td></tr>";
            }
          }
          $("#reList>tbody").html(str);
        },
        error: function() {
          console.log("통신오류");
        }
          });
          }

        //댓글 수정 전
        function editReply() {
          // readonly 속성 제거
          $(".reListC").removeAttr("readonly");

          // 수정 완료 버튼 생성
          let updateButton = $("<button>", {
            type: "button",
            text: "완료",
            click: function () {
              updateReply();
            }
          });

          // 기존 수정 버튼 대신에 수정 완료 버튼으로 교체
          $("#myReB").html(updateButton);
        }

        //댓글 수정 후
        function updateReply() {
          let replyNo = $("#replyNo").val();
          let updatedContent = $(".reListC").val();

          $.ajax({
            url: "mate.updateQnAReply",
            type: "post",
            data: {
              replyNo: replyNo,
              updateContent: updatedContent
            },
            success: function (result) {
              if (result == "update") {

                $("#reListC").attr("readonly", true);
                let editButton = $("<button>", {
                  type: "button",
                  text: "수정",
                  click: function () {
                    editReply();
                  }
                });
                $("#myReB").html(editButton);
                alert("수정 성공");
                selectReplyList();

              } else {
                alert("수정 실패");
              }

            }, error: function () {
              alert("댓글 수정 실패");
            }
          });
        }



        //댓글 삭제
        function checkDelete() {
          let replyNum = $("#replyNo").val()
          let result = window.confirm("정말로 삭제하시겠습니까? \n삭제 후 되돌릴 수 없습니다.");

          if (result == false) {
            return false;
          } else {
            deleteReply();
          }
        }


        function deleteReply() {
          let replyNum = $("#replyNo").val()

          $.ajax({
            url: "mate.deleteQnAReply",
            data: { replyNo: replyNum },
            type: "get",
            success: function (result) {
              if (result == "YY") {
                alert("댓글 삭제 성공");
                selectReplyList(); //다시 조회
              } else {
                alert("댓글 삭제 실패");
              }
            }, error: function () {
              console.log("댓글 삭제  통신오류");
            }
          });

        }
      </script>
</body>

</html>
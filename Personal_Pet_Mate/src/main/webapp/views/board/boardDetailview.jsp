<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 보기 </title>
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

    .nav-link:focus,
    .nav-link:hover {
      color: var(--bs-nav-link-hover-color)
    }

    .navbar-nav .nav-link.active,
    .navbar-nav .nav-link.show {
      color: var(--bs-navbar-active-color);
    }
/* 검색창 */
    #search {
      margin: auto;
      margin-left: 850px;
      margin-top: 1%;
	  margin-bottom: -5px;
    }

    #selectSearch {
      width: 120px;
      height: 40px;
      border: 1px solid #87a56c;
      box-sizing: border-box;
      text-align: center;
      font-weight: 400;
      line-height: 16px;
      margin-right: 1%;
    }

    #selectSearch:focus {
      border: 1px solid #87a56c;
      box-sizing: border-box;
      outline: 2px solid #87a56c;
    }

    #searchInput {
      width: 200px;
      height: 40px;
      border: none;
      border: 1px solid #87a56c;
      border-right: none;
      padding-left: 5px;
    }

    #searchInput:focus {
      border: 1px solid #87a56c;
      box-sizing: border-box;
      outline: 2px solid #87a56c;
      
    }

    #searchBtn {
      width: 50px;
      height: 40px;
      border: none;
      outline: none;
      margin-top: 5px;
      margin-left: -5%;
      padding-top: 3px;
      background-color: #87a56c;
	  color: white;
	  

    }
	.detail{
		width: 1000px;
		margin: auto;
	}

    .detail #detailbo {
      width: 100-px;
      text-align: left;
      margin: auto;
      margin-top: 2%;
      border: 2px solid #87a56c;
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

    #title {
      border-bottom: 1px solid rgb(160, 149, 149);
      color: #87a56c;
      padding-left: 1%;
    }


    #writer, #date {
      width: 80px;
      color: #87a56c;
      padding-left: 1%;
    }

    #writerVal,#dateVal {
      color: black;
    }

    #count {
      width: 70px;
      height: 30px;
      font-size: 13px;
	  margin-right: 1%; /* Align to the right */
 	  text-align: center;
 	  float: right;
      background-color: #87a56c;
      color: white;
      border: none;
    }

    #content {
      width: 1000px;
      height: 300px;
      resize: none;
	  border: none;
      overflow: hidden;
	  padding-left: 7px;
    }

    #content:focus {
      outline: none;
    }

      .moveTopBtn {
      position: fixed;
      float: right;
      height: 32px;
      right: 10px;
      bottom: 10px;
      opacity: 0.7;
      border-radius: 20px;
      padding-top: 4px;
    }
    .moveTopBtn:hover {
      background-color: #87A56C;
	  text-align: center;
	  border-radius: 20px;
	  padding-top: 4px;
    }
	.btns{
		text-align: center;
	}

#back, #update, #delete{
	width: 80px;
	height: 40px;
	text-align: center;
	margin-top: 2%;
	margin-bottom: 2%;
}
    

    /* 댓글창 css */

    .insertReply {
		width: 1006px;
		height: auto;
		border-bottom: none;
		border: 2px solid #87a56c;
    }
	
    .insertReply table thead {
		margin-left: 1%;
    }

    .insertReply table .replyContent {
      resize: none;
	  border: none;
      border: 2px solid grey;
      width: 900px;
	  margin-left: 1%;
	  
    }
	#replyCountValue{
		font-size: 20PX;
	}
    #replyCount {
      width: 900px;
      font-size: 20px;
    }

    #replyCount>label {
      font-size: 13px;
	  margin-left: 1%;
    }

	.num_byte .current_num{
		float: right;
		margin-bottom: 1%;
	}
	
	#reply_limit{
	font-size: 12px;
	}

	
    #reBtn {
		width: 70px;
		margin-top: 13%;
		margin-left: 19%;
    }

/* 댓글리스트 */


	.ReW{
		background-color: #87a56c;
		padding-left: 1%;
		width: 1002px;
		height:40px
	} 
	.replyBtn{
		float: right;
		height: 30px;
	}
	.replyBtn button{
		width: 45px;
		height: 30px;
		font-size: 12px;
		text-align: center;
		margin-right: 1px;
	}


    .reListC {
    width: 1000px;
      height: 120px;
      resize: none;
      overflow: auto;
}
    .reListC:focus  {
      outline: none;
    }
    
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div class="outer">
		<div id="detailouter">
			<header>
				<nav class="navbar navbar-expand-lg" data-bs-theme="light">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.boardMain?currentPage=1">전체게시글</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.notice?currentPage=1">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextPath }/pet.freeBoard?currentPage=1">자유게시판</a></li>
					</ul>
				</nav>
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

			        <div class="detail">
          <table id="detailbo">
            <tr>
              <td id="title" name="title" colspan="3" style="font-size: 22px;">${b.boardTitle } <input readonly id="count" value="조회수 : ${b.count }">
              </td>
            </tr>
            <tr>
              <td id="writer">작성자 : <span id="writerVal">${b.boardWriter }</span></td>
            </tr>
            <tr>
              <td id="date">작성일 : <span id="dateVal">${b.createDate }</span></td>
            </tr>
            <tr>
              <td>
                <textarea name="content" id="content" cols="50" rows="40" readonly>${b.boardContent }</textarea>
              </td>
            </tr>
            <tr>
              <td id="img" class="img">
             	 <c:if test="${not empty at }">
					<img id="inputImg" src="${contextPath}${at.filePath}${at.changeName}">
				</c:if>
              </td>
            </tr>
            <tr>
              <td>
				<c:choose>
					<c:when test="${b.boardType eq 1 and loginUser.userId eq 'admin'}">
					<div class="btns">
					  <a href="${contextPath}/pet.boardMain?currentPage=1" class="btn btn-light" id="back">목록가기</a>
					  <a href="${contextPath }/pet.noticeUpdate?bno=${b.boardNo}" class="btn btn-light"  id="update">수정</a>
					  <a href="${contextPath }/pet.boardDelete?bno=${b.boardNo}" class="btn btn-light" id="delete">삭제</a>
					</div>
					</c:when>
					<c:when test="${b.boardType eq 2 and loginUser.userId eq b.boardWriter}">
					 <div class="btns">
					  <a href="${contextPath}/pet.boardMain?currentPage=1" class="btn btn-light" id="back">목록가기</a></span>
					  <a href="${contextPath }/pet.boardUpdate?bno=${b.boardNo}"  class="btn btn-light" id="update">수정</a>
					  <a href="${contextPath }/pet.boardDelete?bno=${b.boardNo}"  class="btn btn-light" id="delete">삭제</a>
					 </div>
					</c:when>
					<c:when test="${b.boardType eq 2 and loginUser.userId eq 'admin'}">
					 <div class="btns">
					  <a href="${contextPath}/pet.boardMain?currentPage=1" class="btn btn-light" id="back">목록가기</a>
					  <a href="${contextPath }/pet.boardUpdate?bno=${b.boardNo}" class="btn btn-light" id="update" hidden>수정</a>
					  <a href="${contextPath }/pet.boardDelete?bno=${b.boardNo}" class="btn btn-light" id="delete">삭제</a>
					 </div>
					</c:when>
					<c:otherwise>
					  <div class="btns">
					  <a href="${contextPath}/pet.boardMain?currentPage=1" class="btn btn-light" id="back">목록가기</a>
					  </div>
					</c:otherwise>
				  </c:choose>
              </td>
            </tr>
        </div>
          </table>
				 <c:if test="${b.boardType eq 2}">
          <div class="insertReply">
            <table>
            <thead id="insertRe">
              <th id="replyCount"><label for="replyCount"><span id="replyCountValue">0</span> 개의 댓글이 있습니다.</label></th>
              <tr>
                <td>
					<textarea class="replyContent" id="reContent" rows="3" cols="110" placeholder="로그인 후 이용 가능합니다."></textarea>
					<span class="num_byte">
						<span id="reply_limit" class="current_num">(0/ 400글자)</span>
					</span>
				</td>
                <td>
					<c:choose>
						<c:when test="${not empty loginUser }">
							<button onclick="return insertReply();" id="reBtn" class="btn btn-light">작성</button>
						</c:when>
						<c:otherwise>
							<button onclick="alertToLogin(); return false;" id="reBtn" class="btn btn-light">작성</button>
						</c:otherwise>
					</c:choose>
                </td>
              </tr>
            </thead>
              <tbody class="reList">

              </tbody>
            </table>
        </c:if>
      </div>
			</div>
      <div class="upBtn">
        <div class="moveTopBtn">위로</div>
      </div>


	<script>
	
	function alertToLogin(){
	    showError("로그인 오류", "로그인 후 이용 가능합니다.", "확인");
	}
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
    
    //댓글 trxtarea 크기 조정
    function resize2() {
        let textarea = document.getElementById("reListC");
 
        textarea.style.height = "0px";
 
        let scrollHeight = textarea.scrollHeight;
        let style = window.getComputedStyle(textarea);
        let borderTop = parseInt(style.borderTop);
        let borderBottom = parseInt(style.borderBottom);
 
        textarea.style.height = (scrollHeight + borderTop + borderBottom)+"px";
    }
    
    window.addEventListener("load", resize);
    window.onresize = resize; 
    
    $(function(){
        let $topBtn = document.querySelector(".moveTopBtn");

        // 버튼 클릭 시 맨 위로 이동
        $topBtn.onclick = () => {
          window.scrollTo({ top: 0, behavior: "smooth" });  
        }

      });

    /* 댓글 */
	//댓글입력
	      //글자 수 카운트
    	$("#reContent").keyup(function(e) {
    		let content = $(this).val();
  		$("#reply_limit").html("(" + content.length + "/ 400글자)"); //실시간 글자수 카운팅
  		if (content.length > 400) {
  		    showError("입력 오류", "최대 400글자까지 입력 가능합니다.", "확인");
  			$(this).val(content.substring(0, 400));
  			$('#subject_limit').html("(400 / 최대 400글자)");
  		}
  	});
	
    
	function insertReply(){
		if($("#reContent").val() == ""){
  		    showError("입력 오류", "내용을 작성해주세요.", "확인");
			return false;
		}
		if($("#reContent").val().length>400){
  		    showError("입력 오류", "최대 400글자까지 입력 가능합니다.", "확인");
			return false;
		}else{
			$.ajax({
				url : "pet.insertReply",
				data : {
					content:$("#reContent").val(), 
					bno : ${b.boardNo}
				},
				type : "post",
				success : function(result){
					
					if(result>0){//성공
			  		    showSuccess("입력 성공", "댓글 작성 성공", "확인");
						//추가된 댓글목록 재조회	
						selectReplyList();
						$("#reContent").val("");
					}else{//실패
			  		    showError("입력 실패", "댓글 작성 실패", "확인");
					}
				},
				error : function(){
					console.log("통신오류");
				}
			
			});		
		}
	}
    
	$(function(){
		selectReplyList();
			});
	
	//댓글목록 조회 함수
	function selectReplyList(){ 
		
		$.ajax({
			url:"pet.replyList",
			data : {bno : ${b.boardNo}},
			success : function(result){
				let str = "";
				let count = result.length;
				
				 $("#replyCountValue").text(count);
				 
				for(var i in result){
						//댓글 작성자와 로그인유저 아이디 같을시 수정,삭제 버튼 함께 보임 
					 if (result[i].replyWriter == '${loginUser.userId}') {
			              str += "<tr>"
			                  + "<td class='ReW' colspan='3'>" + result[i].replyWriter + "   " + result[i].creatDate + "<input type='hidden' id='replyNo' name='replyNo' value='" + result[i].replyNo + "'>"
			  				+ "<span class='replyBtn'>"
			  				+ "<button type='button' class='btn btn-light' onclick='editReply();'>수정</button>"
			  				+ "<button type='button' class='btn btn-light' onclick='return checkDelete();'>삭제</button>"
			  				+ "</span></td>"
			                  + "</tr>"
			                  + "<tr>"
			  				+ "<td class='reC' colspan='3'><textarea class='reListC' id='replyme' style='border: none' id='result[i].replyNo' readonly>"+ result[i].replyContent +"</textarea></td>"
			  				+ "</tr>";
					 }else if('${loginUser.userId}'=='admin'){ //관리자일 경우 회원댓글 삭제 가능
							str += "<tr>"
				                + "<td class='ReW' colspan='3'>" + result[i].replyWriter + "   " + result[i].creatDate + "<input type='hidden' id='replyNo' name='replyNo' value='" + result[i].replyNo + "'>"
								+ "<span class='replyBtn'>"
								+ "<button type='button' class='btn btn-light' onclick='return checkDelete();'>삭제</button>"
								+ "</span></td>"
				                + "</tr>"
				                + "<tr>"
								+ "<td class='reC' colspan='3'><textarea class='reListC' style='border: none' id='result[i].replyNo' readonly>"+ result[i].replyContent +"</textarea></td>"
								+ "</tr>";
					 }else{ //나머지(비회원, 작성자 본인아닐경우)
							str += "<tr>"
				                + "<td class='ReW' colspan='3'>" + result[i].replyWriter + "   " + result[i].creatDate + "<input type='hidden' id='replyNo' name='replyNo' value='" + result[i].replyNo + "'>"
								+ "</td></tr>"
				                + "<tr>"
								+ "<td class='reC' colspan='3'><textarea class='reListC' style='border: none' id='result[i].replyNo' readonly >"+ result[i].replyContent +"</textarea></td>"
								+ "</tr>";
					 }
				}
				$(".reList").html(str);
			},
			error : function(){
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
  	  $(".replyBtn").html(updateButton);
	}
	
	//댓글 수정 후
	function updateReply() {
		let replyNo = $("#replyNo").val();
		let updatedContent = $("#replyme").val();

	    $.ajax({
	    	url : "pet.updateReply",
	    	type : "post",
	    	data : {
	    		replyNo : replyNo,
	    		updateContent : updatedContent 
	    	},
	    	success : function(result){
	    		if(result == "update"){
	    			
			    $(".reListC").attr("readonly", true);
			    let editButton = $("<button>", {
			        type: "button",
			        text: "수정",
			        click: function () {
			            editReply();
			        }
			    });
			    $(".replyBtn").html(editButton);
	  		    showSuccess("수정 성공", "수정 성공", "확인");
			    selectReplyList();
			    
	    		}else{
	  		    showError("수정 실패", "수정 실패", "확인");
	    		}
	    		
	    	},error : function(){
  		    showError("수정 실패", "댓글 수정 실패", "확인");
	    	}
	    });	   
	}
	
	
	
	//댓글 삭제
	function checkDelete(){
		let replyNum = $("#replyNo").val()
		let result = window.confirm("정말로 삭제하시겠습니까? \n삭제 후 되돌릴 수 없습니다.");
		
		if(result==false){
			return false;
		}else{
			deleteReply();
		}
	}
		
			
	function deleteReply(){
		let replyNum = $("#replyNo").val()
		
		$.ajax({
			url : "pet.deleteReply",
			data : { replyNo :  replyNum },
			type : "get",
			success : function(result){
				if(result=="YY"){
		  		    showSuccess("삭제 성공", "댓글 삭제 성공", "확인");
					selectReplyList(); //다시 조회
				}else{
		  		    showError("삭제 실패", "댓글 삭제 실패", "확인");
				}
			},error : function(){
				console.log("댓글 삭제  통신오류");
			}
		});

	}
	
	//검색버튼 누를시
  	function beforeSearch(){
		//검색어 없을때
		let input = $("#searchInput").val();
		
  		if(input == ''){
  		    showError("검색 실패", "검색어를 입력해주세요.", "확인");
  			return false;
  		}
  		
		//옵션값 넘기기
  		let selectedValue = $("#selectSearch").val();
  		
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
</script>

</body>
</html>

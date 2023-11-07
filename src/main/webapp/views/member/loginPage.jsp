<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	String findMyId = (String)request.getAttribute("findMyId");
System.out.println("ㅓ네");
	System.out.println(findMyId);
	//쿠키정보
	 Cookie[] cookies = request.getCookies();

	 String saveId = "";
	 
	for(Cookie c : cookies){
		if((c.getName()).equals("userId")){
			saveId = c.getValue();
		}
	}
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <!-- 폰트 링크 -->
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

    <style>
       @font-face { /*잠실폰트*/
        font-family: 'TheJamsil5Bold';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }   

      .outer{
          height: 1000px;
            width: 100%;
            background: #cbd8c1;
            position: relative;
      }

        .login_box {
            width: 1050px;
            height: 600px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 10px 20px 5px #888d82;
            display: flex;
            overflow: hidden;
            font-family: 'TheJamsil5Bold', sans-serif;
        }
        
        .login_box .left{
        width: 41%;
        height: 100%;
        padding: 25px 25px;
        
        }
        .login_box .right{
        width: 59%;
        height: 100%  
        }

        .left .top_link a {
          color: rgb(117, 100, 82);
          font-weight: 400;
          font-size: 13px;
        }
        .left .top_link{
          margin-left: -6%;
        }

        .left #contact{
          width: 100%;
          margin: 0 auto; /* 수평 가운데 정렬을 위해 좌우 마진을 자동으로 설정합니다. */
          padding: 1px;
          margin-top: 30%;
        }

        /* 체크박스와 span 요소를 가로로 정렬 */
        .left #option{
            text-align: center;/* 요소들을 세로 가운데 정렬 */
            margin-top: -8%;
            font-size: 13px;
        }

        #findIdMo, #join, #findPwdMo {
            text-decoration: none;
            color: #5f5b63;
            margin-left: 1px;
            cursor: pointer;
        }

        #home{
          text-decoration: none;
            color: #5f5b63;
            margin-left: 20px;
            cursor: pointer;
        }
        #findIdMo:hover, #join:hover, #findPwdMo:hover {
            text-decoration: underline;
        }

        
        #save{
          margin-right: 36%;
        }

        #join{
          margin-left: 82%;
        }

        .left h1{
        text-align: center;
        margin-bottom: 40px;
        }

        .left #contact input {
            border: none;
            border-bottom: 2px solid #5f5b637d;
            padding: 19px 0px 15px;
            width: 100%;
            overflow: hidden;
            background: transparent;
            font-weight: 700;
            font-size: 15px;
          }
          
          input::placeholder {
            font-style: italic;
          }



         /* 버튼 스타일 */
        button {
            display: inline-block;
            padding: 10px 15px;
            background: rgb(220, 220, 220);
            font-weight: bold;
            color: rgb(120, 120, 120);
            border: none;
            outline: none;
            border-radius: 3px;
            margin-left: 40%;
            margin-top: 10%;
            cursor: pointer;
            transition: ease 0.3s;
          }
          
          button:hover {
            background: #49be87;
            color: #ffffff;
        } 
          
          /* 홈버튼 */
          .top_link img {
              padding-right: 7px;
              margin-top: -3px;
          }

        /* 오른쪽 */
        .right {
        background: linear-gradient(212.38deg, rgba(0, 0, 0, 0.7) 0%, rgba(115, 187, 139, 0.71) 100%)
                    ,url("resources/버디.jpg");
        background-size: cover;             
        color: #fff;
        position: relative;
        }

        .right .right-text{
        height: 100%;
        position: relative;
        transform: translate(0%, 33%);
        margin-top: 10%;
        color: rgb(248, 237, 225)
        }
        .right-text h2{
        display: block;
        width: 100%;
        text-align: center;
        font-size: 50px;
        font-weight: 500;
        } 
        .right-text h5{
        display: block;
        width: 100%;
        text-align: center;
        font-size: 19px;
        font-weight: 400;
        }

        .right .right-inductor{
        position: absolute;
        width: 70px;
        height: 7px;
        background: #123132;
        left: 50%;
        bottom: 70px;
        transform: translate(-50%, 0%);
        }


         /* 모달 스타일 */
         .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%; 
            background-color: rgba(0,0,0,0.4);
            overflow: auto;

        }

        .modal-content {
            background-color: #fff;
            border-radius: 5px;
            max-width: 400px;
            margin: 330px auto;
            padding: 20px;
            position: relative;
            font-family: 'TheJamsil5Bold', sans-serif;
        }
        .modal #headbox{
          height: 45px;
          border-bottom: 3px solid #cbd8c1;
        }

        #headbox #title{
          font-size:27px;
        }

        #input{
          font-size: 13px;
        }

        #myAccount, #myPwd{
          margin-top: 5%;
          text-align: center;
          font-size: 14px;
          font-weight: 300;
        }

        .modal-content input::placeholder{
          font-size: 12px;
        }

        #modalTable{
          margin-top: 25px;
        }

        /* 모달 안에 버튼 */
        .modal-content button{
            display: inline-block;
            width: 75px;
            height: 40px;
            font-size: 13px;
            margin-top: 20px;
            padding: 12px 24px;
            background: rgb(220, 220, 220);
            color: #fff;
            border: none;
            outline: none;
            border-radius: 3px;
            cursor: pointer;
            transition: ease 0.3s;
        }


        button:hover {
            background: #b5d159;
            color: #ffffff;
            transform:scale(1.1);
        
        }

        .close {
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px;
            cursor: pointer;
        }

        table input{
          border: none;
          border-bottom: 3px solid #cbd8c1;
          font-size: 15px;
        }


    </style>
</head>
<body>
  <%@include file="../common/menubar.jsp"%>

	<script>
		//쿠키 아이디값 가져오기
		$(function(){
			var saveId = "<%=saveId%>";
			if (saveId != "") {
				$("input[name=userId]").val(saveId);
				$("input[name=saveId]").attr("checked", true);
			}
		});
	</script>
	
<form action="<%=contextPath %>/pet.login" id="login-form" method="post">
  <div class="outer">
        <div class="login_box">
          <div class="left">
            <span class="top_link"><a href="<%=contextPath%>" id="home"><img src="https://cdn-icons-png.flaticon.com/128/7468/7468324.png" style="width: 25px; height: 20px;">메인으로</a></span>
            
                  <div id="contact">

                    <h1>SIGN IN</h1> 
                    
                    <input type="text" id="userId" name="userId" placeholder="USERID" required>
                    <input type="password" id="userPwd"  name="userPwd" placeholder="PASSWORD" required>
                    
                  </div>
                  <br><br>
                  <div id="option">
                    <span id="save">
                      <input type="checkbox" id="saveId"> 
                      <span for="saveId">아이디 저장</span>
                    </span>
                    
                    <a id="findIdMo" data-toggle="modal" data-target="#modalId">아이디 찾기</a>
                    <a id="findPwdMo" data-toggle="modal" data-target="#modalPwd">비밀번호 찾기</a>
                    <!-- 모달은 form태그 끝난 뒤에 작성했습니다룽 -->
                    
                    
                    <br>
                    <a onclick="enroll();" id="join">회원가입</a>
                  </div>
                  <button class="submit">로그인</button>
                </div>
              </form>
                
	                <div class="right">
	                  <div class="right-text">
	                    <h2>PERSONAL PET MATE</h2>
	                    <h5>당신의 어쩌구</h5>
	                  </div>
	                </div>
              </div>
            </div>
          

       <!-- 아이디 찾기 모달 -->
    <div class="modal" id="modalId">
      <div class="modal-content">
          <span class="close" data-dismiss="modal" id="close-modalId">&times;</span>
          <div id="headbox">
            <span id="title">아이디 찾기</span>
              <span id="input">이름과 전화번호를 입력하세요.</span>
          </div>
            <table  id="modalTable">
              <tr>
                <td>* 이름 : </td>
                <td><input type="text" id="findUseName" name="findUseName"  placeholder="이름을 입력하세요." required></td>
              </tr>
              <tr>
                <td>* 전화번호 : </td>
                <td><input type="text" id="findUsePhone" name="findUsePhone" placeholder=" - 포함해서 입력하세요." required></td>
              </tr>
            </table>
            <label id="myAccount"></label>
             <button id="findPwdBtn" onclick="findId();">확인</button>
      </div>
  </div>

  <!-- 비밀번호 찾기 모달 -->
  <div class="modal" id="modalPwd">
      <div class="modal-content">
          <span class="close" data-dismiss="modal" id="close-modalPwd">&times;</span>
        <div id="headbox">
          <span id="title">비밀번호 초기화</span>
          <span id="input">아이디와 전화번호를 입력하세요.</span>
        </div>  
          <table id="modalTable">
            <tr>
              <td>* 아이디 : </td>
              <td><input type="text" id="findUseId" placeholder="아이디를 입력하세요." required></td>
            </tr>
            <tr>
              <td>* 전화번호 : </td>
              <td><input type="text" id="findPwdPhone" placeholder=" - 포함해서 입력하세요." required></td>
            </tr>
          </table>
          <label id="myPwd"></label>
          <input type="button" id="findPwdBtn" onclick="findPwd();" value="찾기">
      </div>
  </div>
      
<script>
// 회원가입 버튼 클릭시 페이지 넘기기
function enroll(){
		location.href="<%=contextPath%>/pet.enrollPage";
	}

</script>


   <script>
      var modal = document.getElementById('modal');
      var closeModal = document.getElementById('close-modal');
        
      // 모달 열기
      document.getElementById('find').addEventListener('click', function() {
          modal.style.display = 'block';
          
          // 화면 락 설정
          document.body.style.overflow = 'hidden'; 
      });

      // 모달 닫기 
      closeModal.addEventListener('click', function() {
          modal.style.display = 'none';
          // 화면 락 해제
          document.body.style.overflow = 'auto';
      });

      // 모달 외부 클릭 시 모달 닫기
      window.addEventListener('click', function(event) {
          if (event.target === modal) {
               modal.style.display = 'none';
               // 화면 락 해제
                document.body.style.overflow = 'auto';
          }
       });
 
      </script>


      <script>
       //아이디 찾기
       function findId(){
        var findIdN = $("#findUseName").val();
        var findIdP = $("#findUsePhone").val();
       

        $.ajax({
          url : "pet.findId",
          data : {
            findUseName : findIdN,
            findUsePhone : findIdP
          },
          type : "post",
          success : function(result){
            if(result != null){
              $("#myAccount").text("찾으시는 아이디는 : "+ result + " 입니다.");
            }else{
              $("#myAccount").text("해당 유저정보가 존재하지 않습니다.");
            }
          },
          error : function(){
        	  $("#myAccount").text("창을 재실행 해주세요.");
          }
        });
       }

       //비밀번호 찾기
       function findPwd(){
        var findPwdI = $("#findUseId").val();
        var findPwdP = $("#findPwdPhone").val();
        
        $.ajax({
          url : "pet.findPwd",
          data : {
            findUseId : findPwdI,
            findUsePhone : findPwdP
          },
          type : "post",
          success : function(result){
            if(result == 'YY'){
              $("#myPwd").text("비밀번호 초기화 : 123456789@ 완료. 로그인 후 꼭 변경해주세요.");
            }else{
              $("#myPwd").text("해당 정보가 존재하지 않습니다.");
            }
          },
          error : function(){
        	  $("#myPwd").text("창을 재실행 해주세요.");
          }
        });
       }


    </script>

   
   

</body>
</html>

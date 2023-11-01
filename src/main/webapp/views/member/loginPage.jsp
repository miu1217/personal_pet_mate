<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	
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
<title>로그인 페이지</title>

<style>
      .outer{
          height: 1000px;
            width: 100%;
            background: radial-gradient(#94eb4d, #92b16e);
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
            box-shadow: 1px 4px 22px -8px #0004;
            display: flex;
            overflow: hidden;
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
            color: #452A5A;
            font-weight: 400;
        }
        .left .top_link{
        height: 20px
        }
        .left .contact{
          display: flex;
            align-items: center;
            text-align: center;
            height: 100%;
            width: 73%;
            margin: auto;
        }
        .left h3{
        text-align: center;
        margin-bottom: 40px;
        }

        .left input {
            border: none;
            width: 80%;
            margin: 15px 0px;
            border-bottom: 1px solid #4f30677d;
            padding: 7px 9px;
            width: 100%;
            overflow: hidden;
            background: transparent;
            font-weight: 600;
            font-size: 14px;
        }
        .left{
        background: linear-gradient(-45deg, #dcd7e0, #fff);
        }


        .submit{
            border: none;
            padding: 10px 15px;
            border-radius: 50px;
            margin-top: 20px;
            background: rgb(10, 160, 35);
            color: #fff;
            font-weight: bold;
            -webkit-box-shadow: 0px 9px 15px -11px rgb(245, 27, 27);
            -moz-box-shadow: 0px 9px 15px -11px rgb(42, 107, 228);
            box-shadow: 0px 9px 15px -11px rgb(41, 241, 118);
        }

        #checkbox{
          width: 200px;
          font-size: 10px;
          
        }

        #saveId{
          margin: auto;
        }


        .right {
        background: linear-gradient(212.38deg, rgba(0, 0, 0, 0.7) 0%, rgba(115, 187, 139, 0.71) 100%);  
        color: #fff;
        position: relative;
        }

        .right .right-text{
        height: 100%;
        position: relative;
        transform: translate(0%, 45%);
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
        
       /* .top_link img { //홈돌아가기 이미지
            width: 28px;
            padding-right: 7px;
            margin-top: -3px;
        }*/

    </style>
</head>
<body>
	<%@include file="../common/menubar.jsp"%>

	<script>
	
		var msg ='<%=message%>';
	
		if(msg != 'null'){ 
			alert(msg);
		
			// 한번 띄우고 지우는 작업
			<%session.removeAttribute("message");%>
		}
		
		
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
					<div class="top_link">
						<a href="<%=contextPath%>">Return home</a>
					</div>
					<div class="contact">
						<div>

							<h3>SIGN IN</h3>
							<input type="text" id="userId" name="userId" placeholder="USERID" required>
							 <input type="password" id="userPwd" name="userPwd" placeholder="PASSWORD" required>
							 
							 <label for="saveId">아이디 기억하기</label>
							 <input type="checkbox" id="saveId" name="saveId">


							<button class="submit">로그인</button>


							<button type=button class="submit" onclick="enroll();">회원가입</button>
						</div>

					</div>
				</div>
				<div class="right">
					<div class="right-text">
						<h2>PERSNAL PET MATE</h2>
						<h5>당신의 어쩌구</h5>
					</div>
					<div class="right-inductor">
						<!-- <img src="" alt=""> -->
					</div>
				</div>
			</div>

		</div>
	</form>


</body>
</html>

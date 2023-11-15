<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
 
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <!-- 폰트 링크 -->
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    
    <title>회원가입</title>

 <style>
        @font-face {
        font-family: 'TheJamsil5Bold';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        }   

        .outer {
            height: 1000px;
            width: 100%;
            background: #cbd8c1;
            position: absolute;
        }

        .outer .jointext {
          width: 800px;
          height: 80px;
          font-size: 50px;
          font-weight: 900;
          text-align: center;
          margin: auto;
          margin-top: 5%;
          text-shadow: 5px 20px 10px #91b2a9; 
          color: rgb(117, 100, 82);
          font-family: 'Roboto', sans-serif;        
        }

        .enroll_box {
            width: 1050px;
            height: 600px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0px 10px 20px 5px #888d82;
            display: flex;
            overflow: hidden;
            font-family: 'TheJamsil5Bold', sans-serif;

        }

        .left {
            width: 100%;
            height: 100%;
            color: rgb(117, 100, 82);
            position: relative;
        } 

        /* 오른쪽 스타일 */
        .right .joinAgree{
          width: 94%;
          height: 670px;
          margin-top: 10px;
        }

        .joinAgree textarea{
          width: 488px;
          height: 160px;
        }




        #agreeChk span {
        display: inline-block; /* 옆으로 나열되도록 설정 */
        vertical-align: middle; /* 수직 가운데 정렬 */
        margin-bottom: 2px;
        margin-top: 3px;
        }

        


        #agreeChk input[type="checkbox"]{
          appearance: none;
          width: 15px;
          height: 15px;
          border: 3px solid #b5d159;
          border-radius: 80%;
          background-color: transparent; 
          vertical-align: middle; /* 수직 가운데 정렬 */
          margin: 0; /* 여백 제거 */
          
        }

        #agreeChk input[type="checkbox"]:checked { 
        background-color: #4b5725; 
        }

        /* 왼쪽 스타일 */
        .left .contact{
          width: 94%;
          height: 670px;
          margin: auto;
          margin-top: 2%;
          
        }

        table{
        font-size: 14px;
        border-collapse: collapse;
        width: 100%;
        height: 100%;
        color: #88725b;
        }

        table tr td label{
          font-size: 13px;
        }

        table tr{
          height: 35px;
        }

      

      /* 아이디, 비밀번호, 이름 인풋박스 */
      .input-area{
        border: none;
        border-bottom: 3px solid grey;
        height: 25px;
        font-size: 14px;
      }

      .rest{
        width: 400px;
      }
      .rest input{
        border: none;
        border-bottom: 3px solid grey;
      }

      /* 관심분야 버튼 스타일 */
      .contact table input[type="radio"] {
        appearance: none;
        width: 15px;
        height: 15px;
        border: 3px solid #b5d159;
        border-radius: 50%; 
        background-color: transparent;
        vertical-align: text-bottom; 
        margin: 0; 
        margin-left: 8px;
      }
      .contact table input[type="radio"]:checked{
        background-color: #4b5725; 
      }

      #middleInt{
        /* 관심분야 나누기 선 */
        border-top: 3px  solid #5f5b637d; 
      }



        .enroll_box #enroll{
          font-size: 26px;
          border-bottom: 3px solid ;
          border-bottom-left-radius: 3px;
          border-bottom-right-radius: 3px;
        }

         .left input {
            border: none;
            width: 45%;
            margin: 12px 10px;
            border-bottom: 3px solid #5f5b637d;
            padding: 5px;
            overflow: hidden;
            background: transparent;
            font-weight: 500;
            font-size: 12px;
        }

        input::placeholder {
          font-style: italic;
        }

        form span{
          font-size: 12px;
          margin-left: 3%;
        }


        /* 버튼 스타일 */
        button {
            display: inline-block;
            padding: 12px 24px;
            background: rgb(220, 220, 220);
            font-weight: bold;
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

        #idTest {
            width: 70px;
            height: 21px;
            padding: 3px 10px;
            cursor: pointer;
            font-size: 11px;
        }

        .contact form{
          margin-top: 6%;
          height: 100%;
        }

        form{
          max-height: 550px;
          overflow-y: scroll;
        }

        #submitBtn {
            text-align: right;
        }


        .contact table select {
          appearance: none;
          -webkit-appearance: none;
          -moz-appearance: none;
          background: #fff;
          border: 1px solid #ccc;
          border-radius: 3px;
          padding: 5px 15px;
          font-size: 12px;
          color: #333;
          width: 20%;
          cursor: pointer;
          background-image: linear-gradient(45deg, transparent 50%, #333 50%), linear-gradient(135deg, #333 50%, transparent 50%);
          background-position: calc(100% - 20px) center, calc(100% - 15px) center; /* Adjusted background-position */
          background-size: 5px 5px, 5px 5px;
          background-repeat: no-repeat;
        }

        .contact table select:hover {
          border-color: #b5d159;
        }
        
        
        .inputPwd{
        	margin-left: 148px;
   			 margin-top: 20px;
  		  height: 35px;
        }
        .deleteButton{
        	width: 150px; 
        	height: 40px;
        	 border-radius: 7px; 
        	 background-color: #66CC00; 
        	 color:white; 
        	 border: 1px white; 
        	 box-shadow: 1px 1px 1px 1px rgb(0,0,0,0.2);
    		 margin-left: 15px;    	 
        }
        .cancelButton{
        	width: 150px; 
        	height: 40px; 
        	border-radius: 7px; 
        	background-color: white; 
        	color:grey; 
        	border: 1px white;" 
        	box-shadow: 1px 1px 1px 1px rgb(0,0,0,0.3);
    		margin-bottom: 30px;
    		margin-left: 15px;
        }
        
        
    </style>
</head>
<body>
  <%@include file="../common/menubar.jsp"%>
  
  <div class="outer">
    <div class="jointext"><p id="joinText"></p>UPDATE PERSONAL PET MATE</div>
    <div class="enroll_box" >
      <div class="left" > <!--왼쪽 회원가입창-->
        <div class="contact">
          <span id="enroll" style="color: #88725b;">회원 정보 수정</span>
            <form id="joinPet" action="<%=contextPath%>/pet.updateInfo" method="post">
              <table>
                <tbody>
                    <tr>
                      <th id="coreName">아이디 </th>
                        <td><input type="text" class="input-area" id="userId" name="userId" value="${loginUser.userId }" readonly> </td> <!-- 메뉴바에있는 loginUser를 이용해서 기존정보나타내기 -->	   
                    </tr>
              
                   <tr>
                         <th id="coreName">비밀번호</th>
                        <td>
                            <input type="password" class="input-area" id="userPwd" name="userPwd" value="${loginUser.userPwd }" readonly>
                            
                        </td> 
                        
                  </tr>
                  
                   <tr>
                        <th id="coreName">이름</th>
                       <td><input type="text" class="input-area" id="userName" name="userName" value="${loginUser.userName }" required></td>
                  </tr>
              
                  <tr>
                    <th id="coreName">성별</th>
                    <td>
                         <input type="radio" name="gender" id="gen" value="남"><label for="gen">남</label> 
                         <input type="radio" name="gender" id="gen" value="여"><label for="gen">여</label> 
                    </td>
                </tr>
              
                <tr>
                     <th id="coreName">휴대전화</th>
                    <td>
                        <input type="text" class="input-area" id="phone" name="phone" value="${loginUser.phone}"> 
                    </td>
                </tr>
                
                               <!-- 이메일 @를 기준으로 나눠주기 -->
                               <c:set var="parts" value ="${fn:split(loginUser.email,'@')}"></c:set>
                               
                               <tr>
                                    <th id="coreName">이메일</th>
                                            <td class="rest" colspan="4">    
                                              <c:choose>
                                                  <c:when test="${loginUser.email != null}">
                                                      <input type="text" id="emailId" name="emailId" style="width: 120px;" value="${parts[0] }">
                                                      @
                                                      <input type="text" id="domain" name="domain" style="width: 110px;" value="${parts[1] }">
                                                  </c:when>
                                                  <c:otherwise>
                                                      <input type="text" id="emailId" name="emailId" style="width: 120px;">
                                                      @
                                                      <input type="text" id="domain" name="domain" style="width: 110px;">
                                                  </c:otherwise>
                                          </c:choose>
                                               <select name="emailSelect" id="emailSelect" style="width: 80px;">
                                                   <option value="selec" selected>선택</option>
                                                  <option value="self">직접입력</option>
                                                  <option value="naver.com">naver.com</option>
                                                  <option value="gmail.com">gmail.com</option>
                                                  <option value="daum.com">daum.com</option>
                                                  <option value="nate.com">nate.com</option>
                                                  <option value="hanmail.com">hanmail.com</option>
                                              </select>
                                        </td>              		
                              </tr>
                                        
                           
              
              
                <tr>
                   <th id="coreName">주소 </th>
                    <td>
                          <input type="text" class="input-area" id="address" name="address" value="${loginUser.address}"> 
                    </td>
                </tr>
              </tbody>
              

                      <!--목욕관심분야 나오게 하려고 만들었습니다--> 
                   <div>
           <tr>
              <td></td>
              <td>
          		<button type="submit"  class="btn btn-success">수정하기</button>
          	    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteForm" id="deleteButton"> 회원탈퇴</button>
         	   </td>
          </tr>
          
           <tr><td></td><td></td></tr> 
           <tr></tr>
            <tr></tr>
         
         
          
        </div>
              </table>

              <script> 
      	
                $(function(){
                  //성별 체크박스 체크해주기
                  
                    
            
                    var chooseGender = "${loginUser.gender}"
    
                    
                    $("input[name=gender]").each(function(){   
                        var value1 = $(this).val();     
                        if(chooseGender.includes(value1)) {  
                            $(this).attr("checked",true);
                        }
                    });
          
                    
                    
                    //반려견 음식 관심분야
                    var chooseFoodInterest = "${loginUser.foodInter}"   
                    
                    $("input[name=foodInterest]").each(function(){
                        var value2 = $(this).val();
                        if(chooseFoodInterest.includes(value2)) {
                            $(this).attr("checked",true)
                        }
                    });
                    
                    
                    
                    
                    
                     //반려견 목욕 관심분야
                    var cleanInterest = "${loginUser.cleanInter}"  
                    
                    $("input[name=cleanInterest]").each(function(){
                        var value3 = $(this).val();
                        if(cleanInterest.includes(value3)) {
                            $(this).attr("checked",true)
                        }
                    });
                    
                    
                    
                    
                    
                });
       
        
      
        
        </script>
        
        
         <script>
        //==================이메일 선택
        var domain = $("#emailSelect");
         $(domain).change(function(){
              if($(this).val()=="selec"){
                 $("#domain").attr("readonly", true).attr("placeholder", "선택해주세요.");
            
              }
              if($(this).val() == "naver.com" || $(this).val() == "gmail.com" || 
                $(this).val() == "daum.com" ||$(this).val() == "nate.com" || $(this).val() == "hanmail.com"){
  
                $("#domain").val( $(domain).val()).attr("readonly", true);
  
              }else if($(this).val() == "self"){
                 $("#domain").val("").attr("placeholder", "입력해주세요.").attr("readonly", false).focus();
              }
              
              });
         </script>
        
      
        		
   
            </form>
                </div>
              </div>
              
              
          
    </div> 
  </div>

 <!-- 회원탈퇴 모달 -->
 <div class="modal" id="deleteForm" align="center">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원탈퇴</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body"> 
            <img alt="탈퇴이미지" src="./resources/icons/회원탈퇴 아이콘.png" width="70px" height="70px"> <br> <br>
          <b>정말 탈퇴하시겠어요?</b> <br> <br>
          탈퇴 버튼 선택 시, 계정은 <br>
          삭제되며 복구되지 않습니다. <br>
          
          <form action="${contextPath }/pet.delete" method="post">
         <input type="hidden"  name="userNo" value="${loginUser.getUserNo()}">    <!-- 로그인유저의 회원번호를 숨겨서보내줌 -> 서블렛에서회원번호와 비밀번호를 이용해서 회원삭제하기-->
              <table>  	
                  <tr >
                      <td> <input type="password" class="inputPwd" name="userPwd" placeholder="비밀번호를 입력해주세요." required> </td>
                  </tr>
              </table>
              <br>
              <button type="submit" class="deleteButton" >탈퇴</button> <br>
              <button class="cancelButton" onclick="location.href='<%=contextPath%>/pet.myPage'" >취소</button>
          </form>
        </div>
      </div>
    </div>
  </div>

      
  
</body>
</html>
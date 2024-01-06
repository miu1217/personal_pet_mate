<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        .right, .left {
            width: 50%;
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
        

    </style>
</head>
<body>
  <%@include file="../common/menubar.jsp"%>
  
  <div class="outer">
    <div class="jointext"><p id="joinText"></p>JOIN PERSONAL PET MATE</div>
    <div class="enroll_box" >
      <div class="left" > <!--왼쪽 회원가입창-->
        <div class="contact">
          <span id="enroll" style="color: #88725b;">회원 정보 입력</span>
            <form id="joinPet" action="<%=contextPath%>/pet.enrollPage" onsubmit="return joinPet();" method="post">
              <table>
                <tr id="main">
                  <td>* 아이디</td>
                  <td colspan="4">
                    <input type="text" class="input-area" id="enrollId" name="enrollId" onchange="idCheck();"  placeholder="대/소문자,숫자,5~30" required>
                    <span id="result" class="check"></span>
                  </td>
                </tr>
                <tr id="main">
                  <td>* 비밀번호</td>
                  <td colspan="4">
                    <input type="password" class="input-area" id="userPwd" name="userPwd" onchange="pwdTest();"  placeholder="대/소문자,숫자,특수문자.8~15" required>
                    <span id="pwdTest1" class="check"></span>
                  </td>
                </tr>
                <tr>
                  <td id="main">* 비밀번호 확인</td>
                  <td colspan="4">
                    <input type="password" class="input-area" id="userPwd2" name="userPwd2" onchange="pwdTest2();"  placeholder="비밀번호를 입력해주세요." required>
                    <span id="pwdPass" class="check"></span>
                  </td>
                </tr>
                <tr id="main">
                  <td>* 이름</td>
                  <td colspan="4">
                    <input type="text" class="input-area" id="userName" name="userName" onchange="nameTest();" placeholder="한글, 2글자 이상" required>
                    <span id="nameResult" class="check"></span>
                  </td>
                </tr>
                <tr >
                  <td >* 성별</td>
                  <td colspan="4">
                    <label for="genM">
                      <input type="radio" name="gender" id="genM" value="남"> 남
                    </label>
                    <label for="genF">
                      <input type="radio" name="gender" id="genF" value="여"> 여
                    </label>
                </tr>
                <tr>
                  <td id="main">* 전화번호</td>
                  <td class="rest" colspan="4">
                    <input type="text" class="phoneN" id="firstP" name="firstP" value="010" readonly style="width: 40px;" >
                    - <input type="text" class="phoneN" id="middleP" name="middleP" style="width: 50px;">
                    - <input type="text" class="phoneN" id="lastP" name="lastP" style="width: 50px;"> 
                  </td>
                </tr>
                <tr>
                  <td >이메일</td>
                  <td class="rest" colspan="4">
                    <input type="text" id="emailId" name="emailId" style="width: 100px;" placeholder="이메일아이디">
                    @
                    <input type="text" id="domain" name="domain" style="width: 110px;" placeholder="선택해주세요.">
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
                  <td >주소</td>
                  <td class="rest" colspan="4">
                    <input type="text" id="address" name="address" placeholder="주소를 입력하세요." style="width: 78%;">
                  </td>
                </tr>
                <tr>
                    <td rowspan="2"><p>* 음식 관심분야 (택1)</p></td>
                    <td>
                      <label for="dry">
                        <input type="radio" name="foodInterest" id="dry" value="건식"> 건식
                      </label>
                    </td>
                    <td>
                      <label for="wet">
                        <input type="radio" name="foodInterest" id="wet" value="습식"> 습식
                      </label>
                    </td>
                    <td>
                      <label for="semiwet">
                      <input type="radio" name="foodInterest" id="semiwet" value="반습식"> 반습식
                    </label>
                    </td>
                    <td>
                      <label for="cooked">
                        <input type="radio" name="foodInterest" id="cooked" value="화식"> 화식
                      </label>
                    </td>
                    <tr>
                      <td>
                        <label for="allergy">
                          <input type="radio" name="foodInterest" id="allergy" value="알러지"> 알러지
                        </label>
                      </td>
                      <td>
                        <label for="medicine">
                          <input type="radio" name="foodInterest" id="medicine" value="약품"> 약품
                        </label>
                      </td>
                      <td>
                        <label for="nutrient">
                          <input type="radio" name="foodInterest" id="nutrient" value="영양제"> 영양제
                        </label>
                      </td>
                      <td>
                        <label for="foodNothing">
                          <input type="radio" name="foodInterest" id="foodNothing" value="선택안함"> 선택안함
                        </label>
                      </td>
                    </tr>
              
                  <tr id="middleInt">
                    <td rowspan="2"><p>* 목욕 관심분야 (택1)</p></td>
                    <td>
                      <label for="long">
                        <input type="radio" name="cleanInterest" id="long" value="장모용샴푸"> 장모용샴푸
                      </label>
                    </td>
                    <td>
                      <label for="short">
                        <input type="radio" name="cleanInterest" id="short" value="단모용샴푸"> 단모용샴푸
                      </label>
                    </td>
                    <td>
                      <label for="impulse">
                        <input type="radio" name="cleanInterest" id="impulse" value="저자극샴푸"> 저자극샴푸
                      </label>
                    </td>
                    <td>
                      <label for="unscented">
                        <input type="radio" name="cleanInterest" id="unscented" value="무향샴푸"> 무향샴푸
                      </label>
                    </td>
                    <tr>
                      <td>
                        <label for="conditioner">
                          <input type="radio" name="cleanInterest" id="conditioner" value="컨디셔너"> 컨디셔너
                        </label>
                      </td>
                      <td>
                        <label for="rinse">
                          <input type="radio" name="cleanInterest" id="rinse" value="린스"> 린스
                        </label>
                      </td>
                      <td>
                        <label for="treatment">
                          <input type="radio" name="cleanInterest" id="treatment" value="트리트먼트"> 트리트먼트
                        </label>
                      </td>
                      <td>
                        <label for="cleanNothing">
                          <input type="radio" name="cleanInterest" id="cleanNothing" value="선택안함"> 선택안함
                        </label>
                      </td>
                    </tr>

                  <tr><td></td><td></td></tr> <!--목욕관심분야 나오게 하려고 만들었습니다-->
              </table>
            </form>
                </div>
              </div>
              
              
              <!--오른쪽 약관동의창-->
              <div class="right" >
                <div class="joinAgree">
                  <span id="enroll" style="color: #88725b;">서비스 이용약관</span>
                  <br><br>
                  <div id="agreeChk">
                    <span>
                      <input type="checkbox" id="yes1" name="agreePet" value="yes1">[필수] 서비스 이용약관
                    </span>
                    
                    <br>
                    <textarea name="first"cols="40" rows="8" style="resize: none;">
                      
                    </textarea>
                    <br><br><br>  
                    <!-- 두번째 약관 -->
                    <span>
                      <input type="checkbox" id="yes2" name="agreePet" value="yes2"> [필수] 개인정보 수집 및 이용 동의<br>
                    </span> 
                    <textarea name="약관2"cols="40" rows="8" style="resize: none;">
                      
                    </textarea> <br>
                    <span>
                      <input type="checkbox" id="yesall" name="agreeAll" value="agreeAll" onclick="allAgree();">
                      모두 동의합니다.
                    </span>
                  </div>
                  <div id="submitBtn">
                  	<button onclick="location.href='<%=contextPath %>/pet.login'" id="home" name="home">뒤로가기</button>
                    <button id="signup" name="signup" form="joinPet">Sign Up</button>
                  </div>
                </div>
              </div>
    </div> 
  </div>



      
      <!----------------------------------------- 회원정보입력 스크립트  ----------------------------------------->
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
      
       <script>
      //==================아이디 중복체크
       function idCheck(){
        var userId = $("#enrollId").val();
        console.log (userId);
        
        if(userId == "") {
          $("#result").text("아이디를 입력해주세요.").css("color", "red");
          return false;
        }
        
        $.ajax({
          url : "pet.idCheck",
          data : { checkId : userId },
          type : "post",
          success : function(result){
            //console.log(result);
            if(result == "NNNNN"){
	              $("#result").text("중복된 아이디 입니다.").css("color", "red");
	              $("#enrollId").focus();
	              
	            }else{
		               var idReg = /^[a-zA-z0-9]{5,30}$/ig;
		              if(idReg.test(userId)){
		                $("#result").text("사용가능한 아이디 입니다.").css("color", "green");
		              }else{
		                $("#result").text("사용 불가능한 아이디 입니다.").css("color", "green");
		              }
	            } 
          },
          error : function(){
            console.log("아이디 중복확인 통신실패");
          }
          
        });
      } 
      //=========비밀번호 테스트
       function pwdTest(){
         var pwdReg = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/g;
         
         if(pwdReg.test($("#userPwd").val())){
             $("#pwdTest1").text("유효한 비밀번호입니다.").css("color", "green");
                }else{ //비밀번호 테스트 실패
                  $("#pwdTest1").text("유효한 비밀번호를 입력해주세요.").css("color", "red");
                    return false;
                }
          }	 
      //======비밀번호 확인 테스트
      function pwdTest2(){
          if($("#userPwd2").val() == '') {
            $("#pwdPass").text("비밀번호를 입력해주세요.").css("color", "red");
            return false;
          }
               if(($("#userPwd").val()) == ($("#userPwd2").val())){ //비번, 비번확인 일치하면
                 $("#pwdPass").text("비밀번호가 일치합니다.").css("color", "green");
               }else{ //비밀번호 확인 틀렸을시
                 $("#pwdPass").text("비밀번호가 일치하지 않습니다.").css("color", "red");
                   return false;
               }
      }
      
      
      //이름 테스트
      function nameTest(){
         var nameReg = /^[가-힣]{2,10}$/g;
         
         if(nameReg.test($("#userName").val())){
           $("#nameResult").text("사용가능한 이름 입니다.").css("color", "green");
                      
              }else{ // 이름 테스트 실패
                 $("#nameResult").text("유효한 이름을 입력해주세요.").css("color", "red");
                      return false;
              }
         
      }
     </script>
     
     
     
         <!------------------------------------------ 약관동의 버튼 스크립트 ------------------------------------------>
    <script>
   
      $(function(){
        $("#yesall").click(function(){
          if($("#yesall").is(":checked")) {
            $("input[name=agreePet]").prop("checked", true);
          } else $("input[name=agreePet]").prop("checked", false);
        });
    
        $("input[name=agreePet]").click(function(){
          var total = $("input[name=agreePet]").length;
          var checked = $("input[name=agreePet]:checked").length;
    
          if(total != checked) {
            $("#yesall").prop("checked", false);
          }else{
            $("#yesall").prop("checked", true);
          }
        });
    
      })
    
    </script>
       
       
      <script>
      //=======================Sign Up 버튼 클릭시    
      function joinPet(){
        var idReg = /^[a-zA-z0-9]{5,30}$/ig;
        if(! idReg.test($("#enrollId").val())){
           showError("회원가입 오류","아이디는 대/소문자, 숫자, 5~30자 입니다. ","확인");
          $("#enrollId").select();
          return false;
        }
    
        //==================비밀번호 입력 정규표현식 
         var pwdReg = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/g;
         if(! pwdReg.test($("#userPwd").val())){
             showError("회원가입 오류","비밀번호는 대/소문자, 숫자, 특수문자(!@#$%^&*), 8~15자리 입니다.","확인");
                  $("#userPwd").select();
                  return false;
         }
      
      //==================비밀번호 일치 확인
      
               if(($("#userPwd").val()) != ($("#userPwd2").val())){ //비번, 비번확인 일치하면

                   showError("회원가입 오류","비밀번호가 일치하지 않습니다.","확인");
                 $("#userPwd2").select();
                   return false;
               }
         
    
      //==================이름 테스트
         var nameReg = /^[가-힣]{2,10}$/g;
         
         if(! nameReg.test($("#userName").val())){

             showError("회원가입 오류","유효한 이름을 입력해주세요.","확인");
                      return false;
              }
         
         
         //=============성별 선택 안했을시
         var genChk = $("input[name=gender]:checked").length;
         if(genChk == 0){
             showError("회원가입 오류","성별을 선택해주세요.","확인");
           
           return false;
         }

         //============전화번호 잘못 입력시
         var midNumReg = /^[2-9]{4}$/g;
         var lastNumReg = /^[1-9]{4}$/g;

         if(midNumReg.test($("#middleP").val()) && lastNumReg.test($("lastP").val())){
             showError("회원가입 오류","전화번호를 정확하게 입력해주세요.","확인");
          return false;
         }
         
      
        //==========관심분야 선택 안했을시
        var foodChk = $("input[name=foodInterest]:checked").length;
          var cleanChk = $("input[name=cleanInterest]:checked").length;
          
    
          if(foodChk == 0) {
              showError("회원가입 오류","음식 관심분야를 선택해주세요.","확인");
             return false;
           }
            
           if(cleanChk == 0){
               showError("회원가입 오류","목욕 관심분야를 선택해주세요.","확인");
            return false;
           }
    
        //==================약관동의 안되어있을시
        let allCk = document.querySelector("#yesall");
        
         if(! allCk.checked ){
             showError("회원가입 오류","모두 동의해주세요.","확인");
              
              return false;
            }
         
      }
      
    
      </script>

</body>
</html>
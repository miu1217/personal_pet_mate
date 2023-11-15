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
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    
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
            font-family: 'Noto Sans KR', sans-serif;
             font-weight: 600;

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
          margin-left: 2%;
          border-left: 1px solid block;
          font-size: 14px;
        }
        
         .joinAgree textarea:focus {
        	 outline: none;
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
    <div class="jointext"><p id="joinText"></p>WELCOME PERSONAL PET MATE</div>
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
                        <input type="radio" name="cleanInterest" id="long" value="장모용 샴푸"> 장모용 샴푸
                      </label>
                    </td>
                    <td>
                      <label for="short">
                        <input type="radio" name="cleanInterest" id="short" value="단모용 샴푸"> 단모용 샴푸
                      </label>
                    </td>
                    <td>
                      <label for="impulse">
                        <input type="radio" name="cleanInterest" id="impulse" value="저자극 샴푸"> 저자극 샴푸
                      </label>
                    </td>
                    <td>
                      <label for="unscented">
                        <input type="radio" name="cleanInterest" id="unscented" value="무향 샴푸"> 무향 샴푸
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
                      <input type="checkbox" id="yes1" name="agreePet" value="yes1"> [필수] 서비스 이용약관
                    </span>
                    
                    <br>
                    <textarea name="first"cols="40" rows="8" style="resize: none;" readonly>
제1조(목적) 이 약관은 PERSONAL PET MATE 회사(전자상거래 사업자)가 운영하는 PERSONAL PET MATE (이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)

  ① “몰”이란 PERSONAL PET MATE가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정) 

  ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

  ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

  ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

  ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 

  ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경) 

  ① “몰”은 다음과 같은 업무를 수행합니다.

    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
    2. 구매계약이 체결된 재화 또는 용역의 배송
    3. 기타 “몰”이 정하는 업무

  ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.

  ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.

  ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단) 

  ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

  ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

  ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
                      
                    </textarea>
                    <br><br><br>  
                    <!-- 두번째 약관 -->
                    <span>
                      <input type="checkbox" id="yes2" name="agreePet" value="yes2"> [필수] 개인정보 수집 및 이용 동의<br>
                    </span> 
                    <textarea name="약관2"cols="40" rows="8" style="resize: none;" readonly>
제6조(회원가입) 

  ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.

  ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.

    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
    3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우

  ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.

  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등) 

  ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.

  ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.

    1. 가입 신청 시에 허위 내용을 등록한 경우
    2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
    3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
    4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

  ③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.

  ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(회원에 대한 통지)

  ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.

  ② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
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
        //console.log (userId);
        
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
          alert("아이디는 대/소문자, 숫자, 5~30자 입니다. ");
          $("#enrollId").select();
          return false;
        }
    
        //==================비밀번호 입력 정규표현식 
         var pwdReg = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/g;
         if(! pwdReg.test($("#userPwd").val())){
                  alert("비밀번호는 대/소문자, 숫자, 특수문자(!@#$%^&*), 8~15자리 입니다.");
                  $("#userPwd").select();
                  return false;
         }
      
      //==================비밀번호 일치 확인
      
               if(($("#userPwd").val()) != ($("#userPwd2").val())){ //비번, 비번확인 일치하면
      
                 alert("비밀번호가 일치하지 않습니다.");
                 $("#userPwd2").select();
                   return false;
               }
         
    
      //==================이름 테스트
         var nameReg = /^[가-힣]{2,10}$/g;
         
         if(! nameReg.test($("#userName").val())){
    
                 alert("유효한 이름을 입력해주세요.");
                      return false;
              }
         
         
         //=============성별 선택 안했을시
         var genChk = $("input[name=gender]:checked").length;
         if(genChk == 0){
           alert("성별을 선택해주세요.");
           
           return false;
         }

         //============전화번호 잘못 입력시
         var midNumReg = /^[2-9]{4}$/g;
         var lastNumReg = /^[1-9]{4}$/g;

         if(midNumReg.test($("#middleP").val()) && lastNumReg.test($("lastP").val())){
          alert("전화번호를 정확하게 입력해주세요.")
          return false;
         }
         
      
        //==========관심분야 선택 안했을시
        var foodChk = $("input[name=foodInterest]:checked").length;
          var cleanChk = $("input[name=cleanInterest]:checked").length;
          
    
          if(foodChk == 0) {
             alert("음식 관심분야를 선택해주세요.");
             return false;
           }
            
           if(cleanChk == 0){
             alert("목욕 관심분야를 선택해주세요.");
            return false;
           }
    
        //==================약관동의 안되어있을시
        let allCk = document.querySelector("#yesall");
        
         if(! allCk.checked ){
              alert("모두 동의해주세요.");
              
              return false;
            }
         
      }
      
    
      </script>

</body>
</html>
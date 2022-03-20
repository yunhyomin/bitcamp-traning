<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | more more</title>
<script src=https://code.jquery.com/jquery-3.6.0.min.js></script>
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />

</head>
<body>
    <div id="header">
      <!-- <img src="/images/Naver_Logotype.svg.png" width="200px" /> -->
      <h1 class="loginLogo"><span style="cursor:pointer;" onclick="javascript:location.href='home.jsp'"><img src="resources/images/logo2.png"></span></h1>
    </div>
    <form action="signup.do" method="post" name="frm">
      <div id="joinContainerWrapper">
        <div class="joinContainer">
          <div class="row_group">
            <div>
              <h3><label class="join" for="id">아이디</label></h3>
              	<span class="ps_box">
                <input
                  style="border:none;"
                  type="text"
                  id="id"
                  name="user_id"
                  maxlength="20"
                  placeholder="아이디 입력"
                  onblur="chk_id_email(this)" />
                  <span class="step_url">@###.com</span>
                </span>
              <span class="error"></span>
            </div>
            <div>
              <h3><label class="join" for="password">비밀번호</label></h3>
                <input
                  class="ps_box"
                  type="password"
                  id="password"
                  placeholder="비밀번호(5~20자리)"/>
              <span class="error"></span>
            </div>
            <div>
              <h3>
                <label class="join" for="validatePassword"
                  >비밀번호 재확인</label>
              </h3>
                <input
                  class="ps_box"
                  type="password"
                  id="validatePassword"
                  name="user_pwd"
                  placeholder="비밀번호 재입력"/>
              <span class="error"></span>
            </div>
          </div>
          <div>
            <h3><label class="join" for="name">이름</label></h3>
            <input class="ps_box" type="text" id="name" name="user_name" placeholder="이름 입력"/>
            <span class="error"></span>
          </div>
          <div>
            <h3><label class="join" for="birthday">생년월일</label></h3>
            <input class="ps_box" type="text" id="birthday"  name="user_birthday" placeholder="생년월일 입력"/>
            <span class="error"></span>
          </div>
          <div>
            <h3><label class="join" for="birthday">휴대폰 번호</label></h3>
            <input class="ps_box" type="text" id="user_phone"  name="user_phone" placeholder="휴대폰 번호 입력"/>
            <span class="error"></span>
          </div>
          <!-- <div class="join_birthday">
            <h3><label class="join" for="year">생년월일</label></h3>
            <div class="bir_wrap">
              <div class="bir_yy">
                  <input
                    class="ps_box"
                    type="text"
                    placeholder="년(4자)"
                    id="year"
                    name="user_name"
                    maxlength="4"
                  />
              </div>
                <div class="bir_mm">
                  <span class="ps_box">
                    <select id="month" class="sel">
                      <option value="월" disabled>월</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                    </select>
                  </span>
                </div>
                <div class="bir_dd">
                    <input
                      class="ps_box"
                      type="text"
                      placeholder="일"
                      id="date"
                      maxlength="2"
                    />
                </div>
              </div>
              <span class="error"></span>
            </div> -->

            <div>
              <h3><label class="join sel" for="gender">성별</label></h3>
              <span class="ps_box">
                <select id="gender" name="user_gender">
                  <option selected value="noneGender">성별</option>
                  <option value="남">남</option>
                  <option value="여">여</option>
                  <option value="genderUnchecked">선택 안함</option>
                </select>
              </span>
              <span class="error"></span>
            </div>
            <div>
            	<h3><label class="join">주소</label></h3>
				<input class="d_btn" type="button" onclick="FindAddrDaumPostcode()" value="우편번호 찾기"><br>
            	<input type="text" id="userPostcode" name="user_address_number" class="ps_box" placeholder="우편번호">
				<input type="text" id="userAddress" name="user_address" class="ps_box" placeholder="주소">
				<input type="text" id="userDetailAddress" class="ps_box"  placeholder="상세주소">
            </div>
            <div>
              <h3>
                <label class="join" for="email">본인 확인 이메일</label>
              </h3>
                <input class="ps_box" type="email" placeholder="선택입력" id="email" name="user_email" onblur="chk_id_email(this)"/>
                <span class="error"></span>
            </div>
            <!-- <div id="mobDiv">
              <h3><label for="phone">휴대전화</label></h3>
              <span class="ps_box">
                <select class="sel" name="phone">
                  <option>대한민국 +82</option>
                </select></span>
              <div class="mobile_area" id="box_space">
              <span class="ps_box">
                <input type="tel" placeholder="전화번호 입력" id="phone" />
              </span>
              <a href="#" class="btn_verify btn_primary" id="btnSend" role="button">
                <span class>인증번호 받기</span>
              </a>
            </div>
              <div class="ps_box" id="box_space">
                <input
                  type="tel"
                  placeholder="인증번호를 입력하세요"
                  id="validatePhone"
                  maxlength="4"
                />
              </div>
              <span class="error"></span>
            </div> -->
            <div class="btn_area">
              <button id="btnJoin" class="btn_type btn_primary">
                <span>가입하기</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>
    <div id="joinFooter">@ moremore Corp.</div>
    <script>
 // 변수 선언
    const id = document.querySelector("#id");
    const password = document.querySelector("#password");
    const validatePassword = document.querySelector("#validatePassword");
    const name = document.querySelector("#name");
    const year = document.querySelector("#year");
    const month = document.querySelector("#month");
    const date = document.querySelector("#date");
    const gender = document.querySelector("#gender");
    const email = document.querySelector("#email");
    const phone = document.querySelector("#phone");
    const validatePhone = document.querySelector("#validatePhone");
    const error = document.querySelectorAll(".error");

    // 이벤트 리스너
    id.addEventListener("input", checkId);
    password.addEventListener("input", checkPassword);
    validatePassword.addEventListener("input", checkValidatePassword);
    name.addEventListener("input", checkName);
    /* year.addEventListener("input", checkBirth);
    month.addEventListener("input", checkMonth);
    date.addEventListener("input", checkDate); */
    gender.addEventListener("input", checkGender);
    email.addEventListener("input", checkEmail);
    /* phone.addEventListener("input", checkPhone);
    validatePhone.addEventListener("input", checkValidatePhone); */

    // 함수 작성
    function checkId() {
      const korPattern = /[a-zA-Z0-9_-]{5,20}/;
      if (id.value === "") {
        error[0].innerHTML = "아이디를 입력해주세요.";
        error[0].style.color = "red";
      } else if (!korPattern.test(id.value)) {
        error[0].innerHTML =
          "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.color = "red";
      } else if (korPattern.test(id.value)) {
        error[0].innerHTML = "";
        error[0].style.color = "red";
      }
    }

    function checkPassword() {
      const pwPattern = /[a-zA-Z0-9\[\]\{\}\/\(\)\.\?\<\>!@#$%^&*]{8,16}/;
      if (password.value === "") {
        error[1].innerHTML = "비밀번호를 입력해주세요.";
        error[1].style.color = "red";
      } else if (pwPattern.test(password.value)) {
        error[1].innerHTML = "";
      } else if (!pwPattern.test(password.value)) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        error[1].style.color = "red";
      }
    }

    function checkValidatePassword() {
      if (password.value == validatePassword.value) {
        error[2].innerHTML = "";
      } else if (password.value !== validatePassword.value) {
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.color = "red";
      }
    }

    function checkName() {
      const namePattern = /[a-zA-Zㄱ-ㅎ가-힣]/;
      if (namePattern.test(name.value)) {
        error[3].innerHTML = "";
        error[3].style.color = "red";
      } else if (!namePattern.test(name.value)) {
        error[3].innerHTML =
          "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.color = "red";
      }
    }

    function checkBirth() {
      const yy = /[0-9]{4,4}/;
      if (yy.test(year.value)) {
        error[4].innerHTML = "";
      } else if (!yy.test(year.value)) {
        error[4].innerHTML = "생년월일을 다시 확인해주세요.";
        error[4].style.color = "red";
      }
    }

    // function checkMonth() {
    // }

    function checkDate() {
      const dd = /[0-9]{2,2}/;
      if (dd.test(date.value)) {
        error[4].innerHTML = "";
      } else if (!dd.test(date.value)) {
        error[4].innerHTML = "생년월일을 다시 확인해주세요.";
        error[4].style.color = "red";
      }
    }

    function checkGender() {
      if (gender.value == "noneGender") {
      }
    }

    function checkEmail() {
      const emailPattern =
        /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
      if (emailPattern.test(email.value)) {
        error[6].innerHTML = "";
      } else if (!emailPattern.test(email.value)) {
        error[6].innerHTML = "이메일 주소를 다시 확인해주세요.";
      } 
    }
    function checkPhone() {
      // const phonePattern = /\d{2,3}-\d{3,4}-\d{4}/g;
      const phonePattern = /[0-9]{3}-[0-9]{3}-[0-9]{4}/;
      if (phonePattern.test(phone.value)) {
        error[7].innerHTML = "";
      } else if (!phonePattern.test(phone.value)) {
        error[7].innerHTML = "인증이 필요합니다.";
      }
    }
    // function checkValidatePhone() {}

    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function FindAddrDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                }
	            } 
	            
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('userPostcode').value = data.zonecode;
	            document.getElementById("userAddress").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("userDetailAddress").focus();
	        }
	    }).open();
	}
	
	// 태용
	// 아이디와 이메일 중복 확인
	chk_id_email = (e) => {
		let info = {};
		console.log(e);
		if (e === document.getElementById("id")) {
			info.user_id = frm.user_id.value;	
		} else {
			info.user_email = frm.user_email.value; 
		}
		
		console.log(info.user_id);
		console.log(info.user_email);
		$.ajax("chkIdAndEmail.do",{
			type: "post",
			data: JSON.stringify(info),
			dataType: "JSON",
			contentType: "application/json",
			success: (data) => {
				console.log(data.id);
				if (data.empty === "empty"){
					if (e === document.getElementById("id")) {
						error[0].innerHTML = "아이디를 입려해주세요!";
						error[0].style.color = "red";
					} else {
						error[7].innerHTML = "이메일을 입려해주세요!";
						error[7].style.color = "red";
					}
				} else if (data.email === "emptyEmail") {
					error[7].innerHTML = "좋은 이메일이네요!";
					error[7].style.color = "blue";
					document.getElementById("btnJoin").disabled = false;
				} else if (data.id === "emptyId") {
					error[0].innerHTML = "좋은 아이디네요!";
			        error[0].style.color = "blue";
					document.getElementById("btnJoin").disabled = false;
				}  else if (data.id === "notEmptyId"){
					error[0].innerHTML = "이미 존재하는 아이디입니다!";
			        error[0].style.color = "red";
					frm.user_id.value = "";
					document.getElementById("btnJoin").disabled = true;
				} else if (data.email === "notEmptyEmail") {
					error[7].innerHTML = "사용할 수 없는 이메일입니다!";
					error[7].style.color = "red";
					frm.user_email.value = "";
					document.getElementById("btnJoin").disabled = true;
				} 
			},
			error: (data, error, request, status,) => {
				alert("관리자에게 문의하세요. (02-2222-2222)\n" + data.empty + "\n" + error + "\n" + request + "\n" + status);
				
			}
		});
	}
	// 서브밋 빈칸 없이 쓰도록 처리
	window.onload = () => {
		document.getElementById("btnJoin").onclick = chk_before_submit;
	}
	chk_before_submit = () => {
		if (frm.user_id.value.trim() === "") {
			alert("아이디를 입력해주세요.");
			frm.user_id.focus();
			frm.user_id.value = "";
			return false;
		} else if (document.getElementById("password").value.trim() == "" ) {
			alert("비밀번호를 입력해주세요.");
			document.getElementById("password").focus();
			document.getElementById("password").value = "";
			return false;
		} else if (frm.user_pwd.value.trim() === "" ) {
			alert("비밀번호를 입력해주세요.");
			frm.user_pwd.focus();
			frm.user_pwd.value = "";
			return false;
		} else if (frm.user_name.value.trim() === "") {
			alert("이름을 입력해주세요.");
			frm.user_name.focus();
			frm.user_name.value = "";
			return false;
		} else if (frm.user_birthday.value.trim() === "") {
			alert("생일을 입력해주세요.");
			frm.user_birthday.focus();
			frm.user_birthday.value = "";
			return false;
		} else if (frm.user_phone.value.trim() === "") {
			alert("핸드폰 번호를 입력해주세요.");
			frm.user_phone.focus();
			frm.user_phone.value = "";
			return false;
		} else if (frm.user_gender.selected === false) {
			alert("성별을 선택해주세요.");
			frm.user_gender.value = "";
			frm.user_gender.focus();
			return false;
		} else if (frm.user_address_number.value.trim() === "") {
			alert("우편번호를 입력해주세요.");
			frm.user_address_number.focus();
			frm.user_address_number.value = "";
			return false;
		} else if (frm.user_address.value.trim() === "") {
			alert("주소를 입력해주세요.");
			frm.user_address.focus();
			frm.user_address.value = "";
			return false;
		} else if (frm.user_email.value.trim() === "") {
			alert("이메일을 입력해주세요.");
			frm.user_email.value = "";
			frm.user_email.focus();
			return false;
		}
		frm.action="signup.do";
		frm.submit();
	}
	</script>
  </body>
</html>
<%@page import="com.spring.more.users.service.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 | moremore</title>
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
</head>
<body style="position: relative; background: #f5f6f7;">
    <div id="loginHeader">
      <a href="home.jsp"><h1 class="loginLogo"><span ><img src="resources/images/logo2.png"></span></a>
    </div>
    <form action="login.do" method="post" id="FormLogin" name="logInForm">
      <div id="loginContainer">
        <div id="loginContent">
          <div class="row_group">
            <div>            
              <h3><label class="join" for="id">아이디</label></h3>
              <span class="ps_box">
                <input
                  class="logininput"
                  type="text"
                  id="mid"
                  name="user_id"
                  maxlength="20"
                  placeholder="아이디 입력"
                  value="" />
                  <span class="step_url">@###.com</span>
                  </span>
              <span class="error"></span>
            </div>
            <div>
              <h3><label class="join" for="password">비밀번호</label></h3>
              <span class="ps_box">
                <input
                  class="logininput"
                  type="password"
                  id="mpw"
                  name="user_pwd"
                  value=""
                  placeholder="비밀번호(5~20자리)"/></span>
              <span class="error"></span>
            </div>
            
          </div>    
          <div class="btn_area">
              <input type="button" id="btnJoin" onclick="logIn_btn()" class="btn_type btn_primary" value="로그인"/>
          </div>      
            <div>
            	<div>
            		<a href="findPassword.jsp" class="findLoginInfo" onclick="window.open(this.href,'_blank','width=300,height=400, left=((window.screen.width / 2) - (300 / 2)), top=((window.screen.height / 2) - (400 / 2))') scrollbars=yes">비밀번호찾기</a>
	            	<a href="findId.jsp" class="findLoginInfo" onclick="window.open(this.href,'_blank','width=300,height=400, scrollbars=yes');return false;">아이디찾기</a>
	            	<a href="joinMembership.jsp" class="findLoginInfo">회원가입</a>
            	</div>
            </div>
          </div>
        </div>
    </form>
    <div id="loginFooter">@ moremore Corp.</div>
    </body>
    <script>
	const id = document.querySelector("#mid");
	const password = document.querySelector("#mpw");
	const error = document.querySelectorAll(".error");
	
	// 이벤트 리스너
	id.addEventListener("input", checkId);
	password.addEventListener("input", checkPassword);
	
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

	function logIn_btn() {
		var form = document.logInForm // 폼 변수에 액션태그 loginForm 연결 (name값에 연결)
		if (!form.mid.value){
			alert("아이디를 입력해주세요");
			return;
		}
		
		if (!form.mpw.value) {
			alert("비밀번호를 입력해주세요");
			return;
		}
		form.submit();
	}
	</script>
</html>
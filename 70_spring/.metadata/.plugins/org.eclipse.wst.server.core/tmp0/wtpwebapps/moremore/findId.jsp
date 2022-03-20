<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8"); // 한글처리 여기서 해줘야한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src=https://code.jquery.com/jquery-3.6.0.min.js></script>

<style>
	.text_input
	{
		border: none;
		border-bottom: 2px #dcdcdc solid;
	}
	.d_btn {
	    display: inline-block;
		padding: 0.5em 0.5em;
		margin: 0.4em 0.15em;
		border: 1px solid #ccc;
		border-color: #dbdbdb #d2d2d2 #b2b2b2 #d2d2d3;
		cursor: pointer;
		color: #464646;
		border-radius: 0.2em;
		vertical-align: middle;
		font-size: 16px;
		line-height: 1.25em;
		background-image: -webkit-gradient(linear,left top,left bottom,from(#fff),to(#f2f2f2));
	}
	#findIdForm
	{
		position: relative;
		left: 60px; top: 60px;
	}
	h1
	{
		position: relative;
		left: 60px; top: 60px;
	}
</style>
<script>	
	function findId_btn() {
		var nameExp = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // 이름 유효성 검사
		
		var form = document.findIdForm
		if (!form.mname.value) {
			alert("이름을 입력해주세요");
			return;
		}
		if(nameExp.test(form.mname.value) == false) {
			alert("이름 형식이 맞지 않습니다. 다시 입력해주세요.");
			return;
		}
		
		if (!form.mphone.value) {
			alert("전화번호를 입력해주세요");
			return;
		}
		
		form.submit();
	}
	
	 // 전화번호 하이픈 처리
	function inputPhoneNumber(obj) {
		 var number = obj.value.replace(/[^0-9]/g, "");
		 var phone = "";
		 
		 if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		}

</script>
</head>
<body>
	<h1>아이디 찾기</h1>
	<div>
		<div class="loginFormContainer">
			<form action="findId" method="get" id="findIdForm" name="findIdForm">
				<!-- <p>
					<button class="findId" id="mid" onclick="location.herf=findId.jsp">아이디찾기</button>
					<button class="findPassword" id="mpw" onclick="location.href=findPassword.jsp">비밀번호찾기</button>
				</p> -->
				<p>
				<input type="text" id="mname" name="mname" placeholder="이름 입력" class="text_input">
				</p>
				<p>
				<input type="text" id="mphone" name="mphone" onkeyup="inputPhoneNumber(this);" maxlength="13"  placeholder="전화번호 '-' 없이 입력" class="text_input">
				<!-- <input type="button" name="본인인증">인증요청 -->
				</p>
				<p>
				<input type="button" value="아이디찾기" onclick="findId_btn()" class="d_btn">
				<input type="button" value="취소" onclick="window.close()" class="d_btn">
				</p>
				<img src="images/logo4.png" style="width: 60px; height: 50px">
			</form>
		</div>
	</div>
</body>
</html> 

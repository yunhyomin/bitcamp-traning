<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩회원되기</title>
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0, minimum-scale=1, user-scalable=yes,initial-scale=1.0" />
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Swiper's Style -->
<style>
html, body {
	position: relative; ]
	height: 100%;
}

body {
	background: #eee;
	color: #000;
	margin: 0;
	padding: 0;
}
#footer {
	position: relative;
	top: 1000px;
}
</style>
</head>
<%@include file="homeHeader.jsp"%>
<div id="containerWrapper">
	<div class="container" style="margin-top: 20px;">
		<div id="main_container">
			<h3>펀딩 관리자가 되어 보세요!</h3>
			<form name="frm" method="post">
				<p>
					<span>펀딩명(기업명)*필수</span>
					<input type="text" name="company_name" placeholder="내용을 입력해주세요.">
				</p>
				<p>
					<span>관리자명</span>
					<input type="text" name="name" placeholder="내용을 입력해주세요." value="${sessionScope.loginUsers.user_name }" disabled>
				</p>
				<p>
					<span>이메일</span>
					<input type="text" name="email" placeholder="내용을 입력해주세요." value="${sessionScope.loginUsers.user_email }" disabled>
				</p>
				<p>
					<span>휴대폰 번호</span>
					<input type="text" name="phone" placeholder="내용을 입력해주세요." value="${sessionScope.loginUsers.user_phone }" disabled>
				</p>
				<p>
					<span>필수약관 동의</span>
					<input type="checkbox" name="chk" id="chk_box"><br>
					<label for="chk_box"><textarea rows="3" cols="15" style="resize:none; overflow:scroll">약관약관약관약약관약관약관약약관약관약관약약관약관약관약관약관약관약관약약관약관약관약약관약관약관약약관약관약관약관</textarea></label>
				</p>
				<input type="hidden" name="user_no" value="${sessionScope.loginUsers.user_no }">
				<input type="hidden" name="user_id" value="${sessionScope.loginUsers.user_id }">
				<input type="hidden" name="user_pwd" value="${sessionScope.loginUsers.user_pwd }">
				<button name="submit_btn">시작하기</button>
			</form>
		</div>
	</div>
</div>
<div id="footer">
	<%@include file="homeFooter.jsp"%>
</div>
</body>
<script>
window.onload = () => {
	frm.submit_btn.onclick = chk_before_send;
}
chk_before_send = () => {
	if (frm.company_name.value.trim() === "") {
		alert("펀딩명(기업명)을 입력해주세요!");
		frm.company_name.focus();
		frm.company_name.value = "";
		return false;
	} else if (frm.chk.checked === false) {
		alert("필수약관에 동의해주세요!");
		frm.chk.focus();
		return false;
	}
	frm.action = "updateProjectAdminSingup.do";
	frm.submit();
}
</script>
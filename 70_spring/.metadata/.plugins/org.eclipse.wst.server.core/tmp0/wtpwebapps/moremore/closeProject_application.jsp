<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 중단 신청</title>
  	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
<!-- 얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	:root
	{
		--blue: #1E82FF;
		--green: #22D6B2;
		--red: #FF98A3;
		--yellow: #FFAF00;
		--purple: #A841DB;
	}
	.adminMenuItem:hover 
	{
	 	background-color: white;
	 	border-top-left-radius: 15px;
	 	border-bottom-left-radius: 15px;
	 	padding-left: 10px;
	 	z-index: 1;
	 	
	}
	.adminMenuItem:hover a
	{
		color: #CECECE;
	}
	.select_input, .etc_reason {
		-webkit-animation: tracking-out-contract 0.7s cubic-bezier(0.550, 0.085, 0.680, 0.530) reverse both;
	        animation: tracking-out-contract 0.7s cubic-bezier(0.550, 0.085, 0.680, 0.530) reverse both;
	}
	@-webkit-keyframes tracking-out-contract {
	  0% {
	    opacity: 1;
	  }
	  50% {
	    opacity: 1;
	  }
	  100% {
	    letter-spacing: -0.5em;
	    opacity: 0;
	  }
	}
	@keyframes tracking-out-contract {
	  0% {
	    opacity: 1;
	  }
	  50% {
	    opacity: 1;
	  }
	  100% {
	    letter-spacing: -0.5em;
	    opacity: 0;
	  }
	}
.etc_reason, .char_limit
{
	display: none;
}
#notice
{
	position: relative;
	width: 810px;
	font-size: 20px;
	left: 150px; top: 100px;
}
.frm_class
{
	position: relative;
	left: 150px; top: 100px;
}
#btn_go_back
{
	position: relative;
	width: 80px; 
	background-color: #dcdcdc;
	text-align: center;
	line-height: 25px;
	float: left;
	bottom: -3px;
}
/*                       */
button, #btn_go_back{
  background:#b4b4b4;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size: 15px;
  margin-left: 5px;
  cursor:pointer;
  border-radius: 5px;
  transition:800ms ease all;
  outline:none;
  width: 80px;
  transform: translate(0px, 15px);
}
button:hover, #btn_go_back:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after, #btn_go_back:before, #btn_go_back:after {
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after, #btn_go_back:after {
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after, #btn_go_back:hover:before, #btn_go_back:hover:after {
  width:100%;
  transition:800ms ease all;
}
/*                       */
.char_limit
{
	font-size: 15px;
}
.frm_class > div, .frm_class > span 
{
	font-size: 18px;
}
</style>
</head>
<body>
	<%@include file="adminHeader.jsp" %>
	<div class="adminContainerWrapper">
		<div class="adminContainerLeft">
			<ul class="adminLeftMenu">
				<li class="adminMenuItem"><a href="fundingAdminHome.jsp">메인</a></li>
				<li class="adminMenuItem"><a href="guideForSellerAndInvestor.jsp">펀딩 준비</a></li>
				<li class="adminMenuItem"><a href="funding_submit.jsp">펀딩 관리</a></li>
				<li class="adminMenuItem"><a href="fundingAdminPaymentStatus.jsp?cPage=1">주문 관리</a></li>
				<li class="adminMenuItem"><a href="fundingAdminInventoryManage.jsp?cPage=1">재고 관리</a></li>
				<li class="adminMenuItem"><a href="fundingAdminInquiryManage.jsp?cPage=1">문의 관리</a></li>
			</ul>
		</div>
			<div class="adminContainerRightWrapper">
				<div class="adminContainerRight">
					<div class="adminLocationArea">
						<h8>펀딩 중단 신청</h8>
					</div>
					<div class="adminContainerContent">
						<div id="main_container">
							<div id="notice">
								<h3>투명한 커뮤니티 운영을 위해, 프로젝트 페이지는 펀딩의 성공/실패/중지 여부와 상관없이 진행자가 임의로 삭제하실 수 없습니다.</h3>
								<h3>검토 후 중단 처리 요청 결과를 안내 드리겠습니다.</h3>
							</div>
							<form name="frm" class="frm_class">
									<span>프로젝트 제목 : </span><input type="text" name="pro_title" value="${project.pro_title }" readonly>
								<div>
									신청사유 : <select class="select_input" name="reasonTOCloseProject" onchange="etc_show(this)">
										<option value="noSend" disabled selected >사유를 선택해주세요.</option>
										<option value="그냥">품질상의 문제로 인한 중단</option>
										<option value="저냥">다른 펀딩사이트가 좋아서</option>
										<option value="서비스가 마음에 들지 않아서">서비스가 마음에 들지 않아서</option>
										<option value="etc" class="etc">기타(직접입력)</option>
									</select>
									<textarea name="reasonTOCloseProject_content" placeholder="기타사유를 입력해주세요." class="etc_reason" rows="5" cols="30" style="resize:none"
											  onkeyup="char_show()"></textarea>
									<div class="char_limit">(0/100)</div>
								</div>
								<button id="btn_submit" name="btn_submit_go" >중단신청</button>
								<input type="hidden" name="pro_no" value="${project.pro_no}">
								<input type="hidden" name="pro_status" value="중단신청">
								<div onclick="go_back()" id="btn_go_back">뒤로가기</div>
							</form>
								
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script>
window.onload = () => {
	frm.btn_submit_go.onclick = btn_submit_fn;	
}
// 기타옵션 클릭시 출력 온/오프
etc_show = (e) => {
	let etc = document.querySelector(".etc_reason");
	let char_limit = document.querySelector(".char_limit");
	if (e.value === "etc") {
		etc.style.display = "inherit";
		char_limit.style.display = "inherit";
		etc.disabled = false;
	} else {
		etc.style.display = "none";
		char_limit.style.display = "none";
		etc.disabled = true;
	}
}
// 문자열 제한
char_show = () => {
	let etc = document.querySelector(".etc_reason");
	let char_limit = document.querySelector(".char_limit");
	if (etc.value.length > 100) {
		etc.value = etc.value.substring(0,100);
	}
	char_limit.innerHTML = "("+etc.value.length+ "/100)";
}
// 뒤로가기 버튼
go_back = () => {
	location.href="closeProject.do?nowPage=${param.nowPage}&min=${param.min}&max=${param.max}&user_no=${project.user_no}&pro_no=${project.pro_no}";
}
// 서브밋 버튼
btn_submit_fn = () => {
	
	if (frm.reasonTOCloseProject.value === "noSend" &&
		frm.reasonTOCloseProject_content.value.trim() === "") {
		swal("신청사유가 없이는 신청할 수 없습니다!!");
		frm.reasonTOCloseProject.focus();
		console.log(frm.reasonTOCloseProject.value);
		return false;
	}	
	frm.action = "updateCloseProject.do";
	frm.submit();	
}
</script>
</html>
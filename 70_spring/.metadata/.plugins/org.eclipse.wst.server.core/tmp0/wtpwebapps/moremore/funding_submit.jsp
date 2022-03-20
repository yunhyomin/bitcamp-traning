<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8" />
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
<style>
#headerSlide {
	position: absolute;
	top: 210px; left: 310px;
	height: 300px;
}

#headerSlide::after {
	position: relative;
	content: "프로젝트를 오픈해서 펀딩메이커가 되어 보세요!";
	font-size: 40px;
	font-weight: bold;
	left: 72px;
	top: 60px;
}
/*                       */
button{
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
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after {
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after {
  right:inherit;
  top: 100%;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after {
  width:100%;
  transition:800ms ease all;
}
/*                       */

#headerSlide button {
	position: absolute;
	font-weight: bold;
	cursor: pointer;
}

#open_funding {
	left: 100px;
	top: 170px;
	width: 280px;
	height: 100px;
}

#update_funding {
	left: 500px;
	top: 220px;
	width: 280px;
	height: 50px;
}
#close_funding {
	left: 500px;
	top: 170px;
	width: 280px;
	height: 50px;
}
/* #container {
	height: 200px;
} */
/* .adminContainerWrapper, .adminContainerLeft {height: 550px; } */
</style>

<script>
	window.onload = () => {
		document.getElementById("open_funding").onclick = go_funding;
		document.getElementById("update_funding").onclick = update_funding;
		document.getElementById("close_funding").onclick = close_funding;
	}
	go_funding = () => {
		location.href = "funding_submit.do";
	}
	update_funding = () => {
		location.href = "paging_update.do?user_no=${sessionScope.loginUsers.user_no}";
	}
	close_funding = () => {
		location.href = "closeProject.do?user_no=${sessionScope.loginUsers.user_no}";
	}
</script>
</head>
<body>
	<%@ include file="adminHeader.jsp"%>
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
					<h8>펀딩관리</h8>
				</div>
				<div class="adminContainerContent">
					<div id="headerSlide">
						<button id="open_funding">펀딩 오픈하기</button>
						<button id="update_funding">수정하기</button>
						<button id="close_funding">중단하기</button>
					</div>
					<div id="container"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

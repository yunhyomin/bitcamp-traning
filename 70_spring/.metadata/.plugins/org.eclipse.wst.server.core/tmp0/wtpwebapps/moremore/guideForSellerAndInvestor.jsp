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
#content_container {
	position: relative;
	width: 720px;
	height: 620px;
	left: 50px;
	top: 40px;
	padding: 10px;
	border-radius: 15px;
}

.content {
	border-radius: 15px;
	padding: 5px;
	font-size: 16px;
	margin: 0px;
	text-align: left;
}
#content_header {
	position: relative;
	width: 100%;
	height: 70px;
	top: -20px;
	border-radius: 15px;
}

#content_header h1 {
	line-height: 120px;
	color: black;
	text-align: center;
}

</style>
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
							<h8>이용가이드</h8>
						<div id="container">
							<div id="content_container">
								<div id="content_header">
									<h1>※ 프로젝트 제출 전 꼭 확인해주세요.</h1>
								</div>
								<img src="images/guide_funder.png" width="600px" height="300px"><br><br>
								<p class="content">
									- 프로젝트 진행 가능 여부를 파악하기 위해서는 반드시 다음 두 가지 사항을 스토리에 작성한 후 프로젝트를 제출해주셔야합니다.
									  <br>&nbsp;&nbsp;○ 리워드 제작 상태 및 완성도 (리워드 실물 이미지)<br>
									  &nbsp;&nbsp;○ 리워드만의 차별점 및 개선사항 <br>
									&nbsp;&nbsp;&nbsp;&nbsp;* 리워드와 유사한 제품이 이미 판매되었거나 판매 중인 경우
								</p>

								<p class="content">
									- 또한 스토리 필수 항목을 모두 작성한 후 프로젝트를 제출해주셔야 합니다.<br>
									&nbsp;&nbsp;○ 스토리 필수 항목: 리워드 핵심 포인트 및 소개, 메이커 소개, moremore 펀딩
									이유, 리워드 발송정보<br> &nbsp;&nbsp;○
									리워드만의 차별점 및 개선사항<br> &nbsp;&nbsp;&nbsp;&nbsp;*리워드와 유사한 제품이
									이미 판매되었거나 판매 중인 경우
								</p>
								<p class="content">
									- 위의 내용을 반영하여 프로젝트를 제출해주시면, 프로젝트 진행 가능 여부에 관해 심사 담당자로부터
									보다 명확한 답변 들으실 수 있습니다.<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※
									프로젝트 승인 전 서류 제출이 필요할 경우 추가 요청이 있을 수 있습니다.<br> - 이 경우 개별적으로
									안내 메일이 발송되니 필히 확인 바랍니다.<br>
								</p>
							</div>
						</div>
						<!-- 틀 넣기  -->
					</div>
					<div class="adminContainerContent"></div>
				</div>
			</div>
		</div>
</body>
</html>

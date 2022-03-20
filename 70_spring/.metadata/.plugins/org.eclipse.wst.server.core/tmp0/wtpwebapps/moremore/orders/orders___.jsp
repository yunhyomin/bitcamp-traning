<%@page import="com.spring.more.project.service.ProjectVO"%>
<%@page import="com.spring.more.users.service.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	UsersVO user = (UsersVO) session.getAttribute("user");
	System.out.println(">>>>>>>>>>>>> : " + user);
%> --%>
<%
	ProjectVO pro = (ProjectVO) session.getAttribute("pro");
	System.out.println(">>>>>>>>>>>>> : " + pro);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>

</head>
<style>
/* order_select.jsp 전체 영역 */
#container {
	position: relative;
	width: 1080px;
	height: 1500px;
	text-align: center;
	margin-bottom: 100px;
	padding-bottom: 1000px;
}

/* container 안에 있는 div 영역 */
#option {
	position: relative;
	width: 1080px;
	height: 1500px;
	left: 50%;
	margin: 50px 0px 50px -540px;
}

/* 원형 3개 영역을 감싸는 div*/
#order_circle {
	position: relative;
	width: 1080px;
	height: 100px;
	line-height: 100px;
	display: inline;
	list-style: none; /* li 태그 숫자 없애기 */
	margin: 20px 0px;
}

/* 현재 진행중인 결제 단계*/
#circle_two {
	background-color: #837eff;
	width: 100px;
	height: 100px;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	border-radius: 50%;
	font-size: 17px;
	color: white;
	line-height: 100px;
	border: 1px dashed black;
	margin-left: 50px;
	
}

/* 이전.다음 단계 */
#circle_one, #circle_three {
	background-color: white;
	width: 100px;
	height: 100px;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	border-radius: 50%;
	font-size: 17px;
	line-height: 100px;
	border: 1px dashed black;
}

/* 펀딩내역 */
#order_history {
	position: relative;
	width: 1000px;
	height: 250px;
	margin: 10px auto;
	border: 1px solid silver;
}

/* 펀딩내역 - 텍스트 영역 */
#order_history_text {
	position: relative;
	width: 1000px;
	height: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	margin: 15px 0px 0px 30px;
}

/* 펀딩내역 - 선 style */
#order_border {
	position: relative;
	width: 1000px;
	border-top: 1px solid silver;
	margin: 15px 0px;
}

/* 펀딩내역 - 펀딩 옵션내역 전체 */
#order_history1, #order_history2, #order_history3 {
	position: relative;
	width: 1000px;
	height: 30px;
	line-height: 30px;
	font-size: 17px;
	margin-bottom: 5px;
}

/* 펀딩내역 - 펀딩 옵션내역 좌측 */
#order_history_content, #order_donation, #order_delivery_text, #order_delivery_date{
	width: 500px;
	float: left;
	text-align: left;
	margin-left: 30px;
	color: #515151;
	
}

/* 펀딩내역 - 펀딩 옵션내역 우측 */
#order_history_price, #order_donation_price, #order_delivery_price, #order_All {
	width: 300px;
	float: left;
	text-align: right;
	margin-left: 160px;
	color: #515151;
	
}

/* 펀딩내역 - 펀딩 옵션 제목 데이터 */
#order_history_content {
	font-weight: bold;
	color:black;
}

/* 펀딩내역 - 갯수, 금액 데이터 */
#or_number, #or_price, #order_history_price {
	font-weight: bold;
	color: #551A8B;;
}

/* 펀딩내역 - "펀더에게 응원하기" 텍스트 영역 */
#order_donation {
	color : #363636;
}

/* 펀딩내역 - 배송 출발 데이터 영역 */
#delivery_date {
	font-weight: bold;
	color: #551A8B;;
}

/* 펀딩내역 - 결제 날짜 데이터 영역 */
#order_delivery_date {
	font-size: 18px;
	font-weight: bold;
}

/* 펀딩내역 - 총 결제 금액 및 결제 날짜 */
#order_All {
	font-size: 20px;
	font-weight: bold;
	color: #551A8B;;
	
}
/* ================== */
/* 배송지 정보 전체 */
#order_delivery {
	position: relative;
	width: 1000px;
	height: 250px;
	margin: 30px auto;
	border: 1px solid silver;
}

/* 배송지 정보 - "배송지 정보" 텍스트 영역 */
#delivery_text {
	position: relative;
	width: 1000px;
	height: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	margin: 15px 0px 0px 30px;
}

/* 배송지 정보 - 기본배송지, 직접입력 선택 영역[라디오]*/
#radio_delivery {
	position: relative;
	width: 1080px;
	text-align: left;
	margin: 0px 0px 30px 30px;
}

/* 배송지 입력 전체 영역 */
#delivery_name, #delivery_phone, #delivery_address {
	position: relative;
	width: 1000px;
	height: 30px;
	line-height: 30px;
	font-size: 17px;
	margin-bottom: 5px;
}

/* 배송지 입력 - 좌측 */
#delivery_name_text, #delivery_phone_text, #delivery_address_text {
	width: 500px;
	float: left;
	text-align: left;
	margin-left: 30px;
	color: #515151;
}

/* 배송지 입력 - 우측 */
#delivery_name_data, #delivery_phone_data, #delivery_address_data {
	width: 300px;
	font-weight: bold;
	float: left;
	text-align: left;
	margin-left: -400px;
	color: #515151;
}

/* 결제정보 */
#order_price {
	position: relative;
	width: 1000px;
	height: 250px;
	margin: 30px auto;
}

/* 결제정보 - "결제정보" 텍스트 영역 */
#order_price_text {
	position: relative;
	width: 1000px;
	height: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	margin: 15px 0px 20px 30px;
}

/* 결제정보 - "결제정보" 라디오 선택 영역 전체 */
#order_select {
	position: relative;
	width: 500px;
	height: 150px;
	text-align: left;
	margin-left: 30px;
	border: 1px solid silver;
}

/* 결제정보 - 박스 가운데 선  */
#price_border {
	position: relative;
	width: 500px;
	border-top: 1px solid silver;
}

/* 결제정보 - 결제정보 라디오 "현금" 선택 영역 */
#order_money {
	position: relative;
	width: 500px;
	height: 75px;
	line-height: 75px;
	margin-left: 20px;
}

/* 결제정보 - 결제정보 라디오 "카드" 선택 영역 */
#order_card {
	width: 500px;
	height: 75px;
	line-height: 75px;
	margin-left: 20px;
}

/* 유의사항 및 약관동의 - 전체 영역 */
#order_terms {
	position: relative;
	width: 1000px;
	height: 250px;
	margin: 30px auto;
}

/* 유의사항 및 약관동의 - 텍스트 영역*/
#order_agreement {
	position: relative;
	width: 1000px;
	height: 30px;
	line-height: 30px;
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	margin: 15px 0px 20px 30px;
}

/* 유의사항 및 약관동의 - 박스 영역 */
#order_box {
	position: relative;
	width: 900px;
	height: 150px;
	text-align: left;
	margin: 0 auto;
	border: 1px solid silver;
	background: #fafafa;
}

/* 하단 버튼 - 전체 영역 */
#next_cancle {
	position: relative;
	width: 1080px;
	height: 100px;
}

/* 하단 버튼 - 좌측 : 펀딩 참여하기*/
#order_success, #order_cancle {
	width: 150px;
	height: 40px;
	font-size: 18px;
	color: white;
	background-color: #551A8B;;
	border-radius: 10px;
	border: 0px solid white;
	
}

/* 하단 버튼 - 우측 : 취소 */
#order_cancle {
	width: 150px;
	height: 40px;
	font-size: 18px;
	color: black;
	background-color: silver;
	border-radius: 10px;
	border: 0px solid white;
} 

</style>
<script>
	var IMP = window.IMP; // 생략 가능
	IMP.init("imp33858457"); // 예: imp00000000
	var msg;
	
	function requestPay() {
		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({ // param
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : "ORD20180131-0000020",
			name : "moremore 결제",
			amount : 10,
			buyer_email : "eunji0000@gmail.com",
			buyer_name : "김은지",
			buyer_tel : "010-0000-0000",
			buyer_addr : "서울특별시",
			buyer_postcode : "00000"
		}, function(rsp) { // callback
			console.log(rsp);
			if (rsp.success) {
				// 결제 성공 시 로직,
				msg += '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				// 결제 실패 시 로직,
				msg += '결제에 실패하였습니다.';
				msg += '에러 내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	}
	
	$(function(){
		deliveryData();
		
	});
	
	//예상배송일
	function deliveryData() {
		var delivery_day = new Date("${pro.pro_close_dt }");
		alert("delivery_day : " + delivery_day.toLocaleString());
		delivery_day.setDate(delivery_day.getDate() + 3);
		delivery_start = delivery_day.toLocaleString().substring(0,12);
		$(".delivery_start").html(delivery_start);
		
		/* alert("today + 3 : " + today + 3); */
	}
	
	
	
</script>
<style>

</style>
<%@ include file="../common/homeHeader.jsp" %> <!-- header-->
<body>
	<div id="container">
		<div id="option">
		
		<!-- 현재 진행 단계를 보여주는 원형 영역 -->
			<div>
				<ol id="order_circle">
					<li id="circle_one">리워드선택</li>
					<li id="circle_two">결제예약</li>
					<li id="circle_three">참여완료</li>
				</ol>
			</div>
			
			<!-- 펀딩전체 내역 -->
			<div id="order_history">
				<div id="order_history_text">펀딩내역</div>
				<div id="order_border"></div>
				
				<!-- 펀딩 내역 : 선택한 옵션 -->
				<div id="order_history1">
				<c:forEach var="vo" items="${selectList }">
					<c:if test="${vo.goods_ea != '0'}">
					<div id="order_history_content">${vo.goods_title }</div>
					<div id="order_history_price">
						<span id="or_number">${vo.goods_ea }</span>개｜ 
						<span id="or_price">${vo.goods_ea * vo.goods_price }</span>원
					</div>
					</c:if>
				</c:forEach>
				</div>
				<!-- 펀딩 내역 : 후원금 영역 -->
				<div id="order_history2">
					<div id="order_donation">펀더에게 응원하기</div>
					<div id="order_donation_price">
						<span>${privName_donaPrice.donation_price }</span>원
					</div>
				</div>
				<div id="order_history2">
					<div id="order_donation">이름 공개여부</div>
					<div id="order_donation_price">
						<span>${privName_donaPrice.private_name }</span>
					</div>
				</div>
				<!-- 펀딩 내역 : 배송비 영역 -->
				<div id="order_history3">
					<div id="order_delivery_text">
						배송비 : 
						<span id="delivery_date" class="delivery_start">2021.11.23</span>
						<span id="delivery_date">발송예상</span>
					</div>
					<div id="order_delivery_price">
						<span>2,500</span>원
					</div>
				</div>
				<div id="order_border"></div>
				<!-- 펀딩 내역 : 결제금액 및 날짜 -->
				<div id="order_delivery_date">
					<span id="payment_date">2021.11.11</span>결제예정
				</div>
				<div id="order_All">
					총 <span>1</span>개｜
					총 <span>79,000</span>원
				</div>
			</div>
			
			<!-- 배송비 정보 -->			
			<div id="order_delivery">
				<div id="delivery_text">배송지 정보</div>
				<div id="order_border"></div>
				
				<!-- 기본배송지 / 직접입력 영역 -->
				<div id="radio_delivery">
					<input type="radio" name="basic" id="basic_address" value="basic_address"><label for="basic_address">기본배송지</label>
					<input type="radio" name="directly" id="directly_address" value="directly_address"><label for="directly_address">직접입력</label>
				</div>
				
				<!-- 배송지 입력 영역 -->
				<div id="delivery_name">
					<div id="delivery_name_text">이름</div>
					<div id="delivery_name_data">홍길순</div>
				</div>
				<div id="delivery_phone">
					<div id="delivery_phone_text">연락처</div>
					<div id="delivery_phone_data">010-0000-0000</div>
				</div>
				<div id="delivery_address">
					<div id="delivery_address_text">주소</div>
					<div id="delivery_address_data">
						<span>00000</span> 
						<span>서울시 은평구</span>
						<span>불광로</span>
					</div>
				</div>
			</div>
			
			<!-- 결제정보 -->
			<div id="order_price">
				<div id="order_price_text">결제정보</div>
				<div id="order_select">
					<div id="order_money">
						<input type="radio" name="transfer" id="order_transfer" value="transfer"><label for="order_transfer">계좌이체</label>
						<input type="radio" name="bank" id="order_bank" value="bank"><label for="order_bank">무통장입금</label>
					</div>
					<div id="price_border"></div>
					<div id="order_card">
						<input type="radio" name="card" id="order_card" value="card"><label for="order_card">신용카드</label>
					</div>
				</div>
			</div>
			
			<!-- 유의사항 및 약관동의 --> 
			<div id="order_terms">
				<div id="order_agreement">유의사항 및 약관동의</div>
				<div id="order_border"></div>
				<div id="order_box">1.~ 2.~ 3.~</div>
			</div>
			
			<div id="next_cancle">
				<button id="order_success" onclick="requestPay()">펀딩 참여하기</button>
				<button id="order_cancle">취 소</button>
			</div>
  			
 			
		</div>
	</div>
</body>
<%@ include file="../common/homeFooter.jsp" %> <!-- footer -->
</html>
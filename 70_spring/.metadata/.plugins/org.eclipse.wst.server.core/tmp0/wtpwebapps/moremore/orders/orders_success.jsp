<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/styles.css" type="text/css" />
</head>
<style>
/* order_select.jsp 전체 영역 */
#container {
   position: relative;
   width: 100%;
   height: 600px;
   text-align: center;
   margin-bottom: 100px;
   /* padding-bottom: 600px; */
   cursor: pointer;
}

/* container 안에 있는 div 영역 */
#option {
   position: relative;
   width: 1080px;
   height: 600px;
   left: 50%;
   margin: 50px 0px 50px -540px;
}

/* 현재 진행중인 단계를 보여주는 전체 원형 영역 */
#order_circle_All {
   margin: 30px 0px;
   cursor: pointer;
}


/* 원형 3개 영역을 감싸는 div*/
#order_circle {
   position: relative;
   width: 1080px;
   height: 100px;
   display: inline;
   list-style: none; /* li 태그 숫자 없애기 */
   margin: 20px 0px;
   
}

/* 현재 진행중인 결제 단계*/
#circle_three {
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

/* 이전 단계 */
#circle_one, #circle_two {
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

/* 상단 전체 div - 이미지, 상품정보영역 */
#order_top {
   position: relative;
   width: 1080px;
   height: 270px;
   margin-top: 60px;
}

/* 상단 - 이미지 */
#order_top_thumb {
   position: relative;
   width: 200px;
   height: 200px;
   border: 1px solid black; 
   margin-left: 235px;
   float: left;
}
#order_top_thumb>img {
   position: relative;
   width: 200px;
   height: 200px;
   float: left;
   margin-top: 0px;
}

/* 상단 - 상품정보영역 */
#order_top_right {
   position: relative;
   width: 370px;
   height: 200px;
   margin-left: 10px;
   float: left;
}

/* 상품정보영역 - 카테고리 */
#order_cate {
   width: 370px;
   height: 20px;
   color: #6a6767;
   font-size: 17px;
   text-align: left;
   margin: 10px 0px 0px 10px;
}

/* 상품정보영역 - 상품 제목 */
#order_title {
   width: 370px;
   height: 50px;
   font-size: 21px;
   font-weight: bold;
   text-align: left;
   margin: 10px 0px 0px 10px;
}

/* 상품정보영역 - 목표(목표금액, 현재성공률), 남은기간 */
#order_goal {
   width: 370px;
   height: 30px;
   font-size: 18px;
   font-weight: bold;
   text-align: left;
   margin: 15px 0px 0px 10px;
}

/* 상품정보영역 - 현재성공률(컬러지정) */
#order_percent {
   color: #551A8B;
}

/* 상품정보영역 - 남은기간 */
#order_day {
   width: 370px;
   height: 30px;
   font-size: 17px;
   text-align: left;
   margin: 5px 0px 0px 10px;
}

/* 펀딩신청완료 - 전체영역 */
#order_success {
   width: 1080px;
   height: 100px;
   margin: 0 auto;
   cursor: pointer;
}

/* 펀딩신청완료 - "펀딩신청이완료되었습니다." 텍스트 영역 */
#order_success_text {
   height: 100px;
   margin-left: 10px;
   font-size: 30px;
   font-weight: bold;
}

/* 후원정보 - 전체영역 */
#order_bottom {
   width: 250px;
   height: 200px;
   margin: 40px auto;
   margin-bottom: 0px;
}

/* 후원정보 - "후원정보" 텍스트 영역 */
#order_bottom_text {
   width: 250px;
   height: 30px;
   font-size: 20px;
   font-weight: bold;
   text-align: left;   
}

/* 후원정보 - 후원정보 전체 영역 */
#funding_order {
   width: 250px;
   height: 30px;
   text-align: left;
}

/* 후원정보 - 좌측 텍스트 영역 */
#funding_order_text {
   width: 100px;
   font-size: 17px;
   font-weight: bold;
   text-align: left;
}

/* 후원정보 - 우측 실제 데이터 영역  */
#funding_order_data {
   font-size: 17px;
   padding-left: 10px;
}

/* 후원정보 - 우측 실제 데이터 영역(컬러지정)*/
#funding_order_data_color {
   font-size: 17px;
   font-weight: bold;
   color: #551A8B;
   padding-left: 10px;
}
#order_go_home {
	width: 100px;
    height: 20px;
    font-size: 10px;
}   
</style>
<%@ include file="../common/homeHeader.jsp" %> <!-- header-->
<body>
	<div id="container">
		<div id="option">

			<!-- 현재 진행 단계를 보여주는 원형 영역 -->
			<div id="order_circle_All">
				<ol id="order_circle">
					<li id="circle_one">리워드선택</li>
					<li id="circle_two">결제예약</li>
					<li id="circle_three">참여완료</li>
				</ol>
			</div>
			
			<hr style="width: 900px; border-color: #551A8B; background: #551A8B;">
			
			<!-- 상단 -->
			<!-- <div id="order_top">
				이미지
				<div id="order_top_thumb">
					이미지	
				</div>
				상품정보영역
				<div id="order_top_right">
					<div id="order_cate">뷰티</div>
					<div id="order_title">[슈퍼 얼리버드]코코넛 워터 에센스 토너 1개 구성</div>
					<div id="order_goal">
						<span id="order_amount">157,732,000원</span>
						<span id="order_percent">1577%</span>
					</div>
					<div id="order_day">2일 남음</div>
				</div>	
			</div> -->
			
			<!-- 펀딩 성공 영역 -->
			<div id="order_success">
				<img alt="check" src="../images/order_success.png" style="display: block; margin: 0 auto;" width="50px;" height="50px;" /> 
				<span id="order_success_text">펀딩 신청이 완료되었습니다.</span>
			</div>
			
			<!-- 하단 -->
			<div id="order_bottom">
				<div id="order_bottom_text">후원정보</div>
			
				<hr style="width: 250px; border-color: silver; background: #bcb9b9;">
				
				<!-- 펀딩 주문 내역 -->			
				<div id="funding_order">
					<span id="funding_order_text">펀딩 날짜</span> 
					<span id="funding_order_data">2021-11-23</span>
				</div>
				<div id="funding_order">
					<span id="funding_order_text">주문 번호</span> 
					<span id="funding_order_data">2021112301</span>
				</div>
				<div id="funding_order">
					<span id="funding_order_text">펀딩 마감</span> 
					<span id="funding_order_data">2021-12-31</span>
				</div>
				<div id="funding_order">
					<span id="funding_order_text">펀딩 상태</span>
					<span id="funding_order_data_color">펀딩 진행중</span>
				</div>
				<div>
					<button id="order_go_home" class="d_btn" onclick="home_go()">홈으로 이동</button>
				</div>
			</div>

		</div>
	</div>
</body>
<%@ include file="../common/homeFooter.jsp" %> <!-- footer -->
<script>
function home_go() {
	location.href = "home.jsp";	
}	
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	ProjectVO p_pro = (ProjectVO) session.getAttribute("pro");
	//D-day 계산
	String Pro_close_dt = p_pro.getPro_close_dt().replace("-", "").substring(0, 8); //20211115
	String close_year = Pro_close_dt.substring(0, 4);
	int close_month = Integer.parseInt(Pro_close_dt.substring(4, 6));
	close_month = close_month - 1;
	String close_day = Pro_close_dt.substring(6, 8);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/styles.css" type="text/css" />
<style>

/* 체크박스 버튼 css */
input[type="checkbox"] {
	margin: 10px;
	display: none;
	cursor: pointer;
}

/* 체크박스 버튼 css */
input[type="checkbox"]+label {
	color: #777777;
	min-width: 76px;
	border: 1px solid #d9d9d9;
	padding: 3px 14px 3px 14px;
	font-size: 13px;
	line-height: 20px;
	text-align: center;
	position: relative;
	cursor: pointer;
}

/* 체크박스 버튼 css */
input[type="checkbox"]:checked+label {
	border-color: black;
	cursor: pointer;
}

/* 펀딩 상세 전체영역 */
#container {
	width: 100%;
	height: auto;
	text-align: center;
	position: relative;
	/* margin-bottom: 100px; */
	padding-bottom: 1500px;
	margin-bottom: 500px;
	cursor: pointer;
}

/* ======= 펀딩페이지 상단 영역 ======= */
/* 펀딩 상세 윗부분 영역 */
#pro_top {
	position: relative;
	width: 1080px;
	height: 540px;
	margin-bottom: 50px;
	left: 50%;
	margin-left: -540px;
	cursor: pointer;
}

/* 썸네일 이미지 들어가는 영역 */
#pro_top_left {
	position: relative;
	width: 680px;
	height: 540px;
	margin-bottom: 50px;
	left: 50%;
	margin-left: -540px;
	float: left;
	
}

/* 썸네일 이미지 들어가는 영역 */
#pro_thumb {
	width: 480px;
	height: 480px;
	/* border: 1px solid black; */
	display: inline-block;
	/* margin-top: 30px; */
	overflow: hidden;
}

#pro_thumb>img {
	margin-top: 0px;
	width: 100%;
}

/* 상품정보 영역 */
#pro_top_right {
	position: relative;
	width: 400px;
	height: 540px;
	margin-bottom: 50px;
	margin-left: -540px;
	float: right;
}

#pro_top_right img {
	position: absolute;
	width: 400px;
	margin-top: 0px;
}

/*========= 상품정보 영역 CSS =========*/
/* --- 디데이  --- */
#d_day {
	width: 60px;
	height: 27px;
	border-radius: 20px; /* 둥근 모서리 */
	font-size: 14px;
	text-align: center;
	background: #551A8B;
	color: white;
	margin-left: 20px;
}

/* 디데이 텍스트부분 수직정렬 */
#d_day>p {
	width: 70px;
	height: 27px;
	display: table-cell;
	vertical-align: middle;
}

/* ----- 투자금액 ----- */
#inve_amount {
	text-align: left;
	width: 350px;
	height: 90px;
	margin-top: 10px;
	margin-left: 25px;
	margin-top: 10px;
}

/* 투자금액 - "투자 금액" 영역 */
#inve_amount_text {
	width: 350px;
	height: 20px;
	font-size: 13px;
	font-weight: bold;
	padding-bottom: 5px;
}

/* 투자금액 - 실제로 금액 데이터가 들어오는 영역*/
#inve_price {
	width: 350px;
	height: 40px;
	font-size: 25px;
	font-weight: bold;
}

/* 투자금액 - "원 투자" 영역*/
#inve_text {
	width: 350px;
	height: 40px;
	font-size: 13px;
	color: #5C518B;
}

/* 투자금액 - 퍼센트 영역*/
#inve_percent, #invePercent {
	color: #551A8B;
	font-size: 14px;
	font-weight: 700;
	float: right;
	padding: 10px 3px 0px 0px;
}

/* 투자금액 - 성공률 차트 영역*/
#inve_chart {
	
}

/* 투자금액 - 목표금액 */
#target_amount {
	width: 340px;
	height: 40px;
	font-size: 13px;
	text-align: right;
}

/* ----- 투자자 ----- */
#investor {
	width: 350px;
	height: 90px;
	margin-top: 10px;
	margin-left: 25px;
}

/* 투자자 - "투자자" 텍스트 영역 */
#investor_text {
	width: 350px;
	height: 30px;
	font-size: 13px;
	font-weight: bold;
	text-align: left;
}
/* 투자자를 감싸는 div*/
#investor_num {
	text-align: left;
}

/* 투자자 - 실제 투자자 숫자가 들어오는 영역 */
#investor_num_data {
	width: 350px;
	height: 30px;
	font-size: 25px;
	font-weight: bold;
}

/* 투자자 - "명" 텍스트 영역 */
#investor_num_text {
	width: 350px;
	height: 30px;
	font-size: 13px;
	font-weight: bold;
}

/* ----- 남은기간 ----- */
#remaining_days {
	width: 350px;
	height: 90px;
	margin-top: 10px;
	margin-left: 25px;
}

/* 남은기간 - "남은기간" 텍스트 영역*/
#remaining_days_text {
	width: 350px;
	height: 30px;
	font-size: 13px;
	font-weight: bold;
	text-align: left;
}

/* 남은기간 - 남은기간을 감싸는 div */
#remaining_days_data {
	text-align: left;
}

/* 남은기간 - 실제 남은 일수가 들어오는 영역 */
#re_days_data {
	width: 350px;
	height: 30px;
	font-size: 25px;
	font-weight: bold;
}

/* 남은기간 - "일" 텍스트 영역*/
#re_days_day {
	width: 350px;
	height: 30px;
	font-size: 13px;
	font-weight: bold;
}

/* 남은기간 - 마감일을 보여주는 영역 */
#re_days_text {
	width: 350px;
	height: 30px;
	font-size: 13px;
	padding-left: 10px;
}

/* 투자하기, 하트, 공유 버튼 */
#pro_btn {
	width: 300px;
	height: 20px;
	text-align: center;
}
#invest_btn {
	width: 350px;
	height: 50px;
	background-color: #551a8b;
	border: 0px solid white;
	border-radius: 15px;
	margin-left: 15px;
	color: white;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
}
#bottom_btn {
	position: relative;
	width: 350px;
	height: 50px;
	border-radius: 15px;
	margin: 10px 0px 0px 15px;
	cursor: pointer;
}

#wishList_btn {
	position: relative;
	width: 170px;
	height: 50px;
	background-color: #fff;
	border: 1px solid #dadce0;
	border-radius: 15px;
	font-weight: bold;
	float: left;
	cursor: pointer;
}
#wishList_btn>img {
	position: relative;
	width:25px;
	height: 25px;
	margin-top: 7px;
	cursor: pointer;
}
#wishList_btn>span {
	position: relative;
	width:30px;
	height: 30px;
	margin-top: 7px;
	margin:7px 0px 0px 10px; 
	font-size: 20px;
	color: #c0c0c0;
	cursor: pointer;
}
#share_btn  {
	position: relative;
	width: 170px;
	height: 50px;
	background-color: #fff;
	border: 1px solid #dadce0;
	border-radius: 15px;
	font-weight: bold;
	float: left;
	margin-left: 10px;
	cursor: pointer;
}
#share_btn>img {
	position: relative;
	width:25px;
	height: 25px;
	margin-top: 7px;
	cursor: pointer;
}

/* ======= 펀딩페이지 중간 영역 ======= */

/* 펀딩 상세 아랫부분 - 탭메뉴 영역 */
#pro_menu {
	position: absolute;
	width: 100%;
	margin: 0;
	padding: 0;
}

/* 탭메뉴 영역 */
#pro_menu li {
	list-style: none;
	float: left;
	height: 40px;
	width: 20%;
}

/* 탭메뉴 영역 호버  */
#pro_menu li:hover {
   color: #AD19EC;
   transition: all .3s ease;
   font-weight: bold;
}

/* 탭메뉴 스타일 */
#pro_menu li>span::after {
	content: '';
	width: 0%;
	left: 50%;
	height: 1px;
	position: absolute;
	margin-top: 3px;
	transition: all .3s ease;
}

/* 탭메뉴 스타일 */
#pro_menu li:hover>span::after {
	content: '';
	width: 100%;
	left: 0px;
	height: 1px;
	position: absolute;
	margin-top: 3px;
	transition: all .3s ease;
}

/* 탭메뉴 영역 선택됐을때  */
#pro_menu .on {
   color: #551A8B;
   text-decoration: underline;
   font-weight: bold;
}

/* ======= 펀딩페이지 하단 영역 ======= */

/* 펀딩 상세 아랫부분 영역 */
#pro_bottom {
	position: relative;
	width: 1080px;
	/* height: 800px; */
	height: auto;
	margin-bottom: 200px; left : 50%;
	margin-left: -540px;
	left: 50%;
	left: 50%;
}

/* 펀딩 상세 아랫부분 - 내용 영역  */
#pro_bottom_left>div {
	position: absolute;
	left: 0px;
	top: 80px;
	width: 65%;
	height: auto;
	/* height: 600px; */
	padding: 0px;
	float: left;
}

/* 옵션 영역 */
#pro_bottom_right {
	position: absolute;
	left: 648px;
	top: 109px;
	width: 30%;
	height: 1200px;
	/* padding-top: 100px; */
	float: right;
	clear: both;
	margin-left: 100px;      /* 1118 */
}

/* 옵션 영역 */
#pro_bottom_right>div {
	border: 1px solid silver;
	margin-bottom: 20px;
}
#pro_bottom_right>div:hover {
	border: 1px solid #551A8B;
}
.pro_option {
	padding: 15px;
}

#pro_top_All {
   position: relative;
   width: 100%;
   height: 200px;
   margin: 100px 0px;
}
#pro_top_imt_border {
   width: 100%; 
   height: 200px;

}

/* 타이틀 뒤에 이미지 넣기 */
#pro_top_img {
position: absolute;
   width: 100%;
   height: 200px;
   background-image: url("https://cdn.wadiz.kr/wwwwadiz/green001/2021/1029/20211029140037985_128563.jpg/wadiz/format/jpg/quality/80/optimize");
   background-repeat:no-repeat;
   background-position: 30% 30%;
/*    -webkit-filter: blur(2px); 
   -moz-filter: blur(2px); 
   -o-filter: blur(2px); 
   -ms-filter: blur(2px);  */
   filter: blur(2px); 
   z-index: -1; 
   margin-bottom: 50px;
   box-shadow: none
} 

/* 카테고리 영역 */
#category {
   position: absolute;
   margin-bottom: 20px;
   font-size: 25px;
   text-align: center; 
   z-index: 1;
   top: 40%;
   left: 48%;
   transform: translate( -50%, -50% );

}
/* 타이틀 영역 전체 */
#title_All {
   position: absolute;
   width: 100%;
   height: 40px;
   display: flex;
   margin: 30px auto;
   z-index: 1;
   top: 50%;
   left: 65%;
   transform: translate( -50%, -50% );
}

/* 타이틀 영역 */
#title {
   position: absolute;
   height: 40px;   
   font-size: 30px;
   font-weight: bold;
}

/* 서브타이틀 영역 */
#stitle {
   position: absolute;
   height: 40px;
   font-size: 30px;
   margin-left: 180px;
}
/* 옵션 - 금액 */
.pro_opt_price {
	font-size: 23px;
	font-weight: 600;
	text-align: left;
	padding: 5px 0px 7px 10px;
}

/* 옵션 - 제목 */
.pro_opt_title {
	font-size: 17px;
	font-weight: 300;
	text-align: left;
	padding: 5px 0px 5px 10px;
}

/* 옵션 - 내용 */
.pro_opt_content {
	font-size: 15px;
	text-align: left;
	padding: 5px 0px 5px 10px;
	color: #70658B;
}

/* 옵션 - "배송비" 텍스트 영역 */
.pro_opt_deli_content {
	font-size: 15px;
	text-align: left;
	padding: 5px 0px 5px 10px;
	color: #70658B;
}

/* 옵션 - 배송비 */
.pro_opt_deli_price {
	font-size: 16px;
	text-align: left;
	padding: 5px 0px 5px 10px;
}

.pro_opt_stock {
    font-size: 16px;
    font-weight: bold;
    text-align: left;
    padding: 5px 0px 5px 10px;
    color: #551a8b;
}

/* 옵션 - 총 펀딩 갯수 가지고 오는 영역 */
.pro_opt_goodsAll {
	font-size: 16px;
	text-align: left;
	padding: 5px 0px 5px 10px;
}
/* ----------------------------- */
/* 상세이미지(스토리) */
#pro_detail {
	width: 100%;
	/* height: auto; */
	height: 3000px;
	overflow: hidden;
}
/* 상세이미지(스토리) 이미지 */
#pro_detail img {
	width: 100%;
	height: auto;
	margin-top: 0px;
}
</style>
<script type="text/javascript">
	//alert("페이지 도착~");
	
	var q_menu_index = "${q_menu_index }";
	$(document).ready(function() {

		//아래 스토리,리뷰,qna,서포터,회사정보 부분 처리
		var pro_menu = $('#pro_menu li');
		$('#pro_bottom_left>div').css('display', 'none');
		$('#pro_bottom_left>.detail_box' + q_menu_index).css('display', 'block');
		pro_menu.eq(q_menu_index - 1).addClass('on');
		//alert(" 돌아온 q_menu_index : " + q_menu_index);

		pro_menu.click(function() {
			var n = $(this).index() + 1;
			pro_menu.removeClass('on');
			$(this).addClass('on');
			$('#pro_bottom_left>div').css('display', 'none');
			$('.detail_box' + n).css('display', 'block');
			q_menu_index = n ;
			//alert(" 업데이트 된 q_menu_index : " + q_menu_index);
			location.href = "getQnaListStart.do?q_menu_index=" + q_menu_index;
		}); 
//////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////
		///////////////////////////좋아요///////////////////////////
	 	var pro_no = "${pro.pro_no }";
		var user_no = "${user.user_no }"; 
		
		var sendData = {
			pro_no : pro_no,
			user_no : user_no
		};
		

		// 좋아요 등록 function
		$(".addWish_btn").click(function() {
		
			$.ajax({
				url : "wishlistInsert.do",
				type : "post",
				data : sendData,
				contentType: "application/json",
				success : function() {
					alert("관심 프로젝트에 등록되었습니다.\n마이페이지에서 확인하세요.");
					addtodelWishButton();
					getWishListCnt();
				},
				error : function() {
					alert("좋아요 실패");
				}
			}); 
			});
		
		// 좋아요 취소 function
		$(".delWish_btn").click(function() {
		
			$.ajax({
				url : "wishlistDelete.do",
				type : "post",
				data : sendData,
				contentType: "application/json",
				success : function() {
					alert("관심 프로젝트에서 삭제되었습니다.");
					deltoaddWishButton();
					getWishListCnt();
				},
				error : function() {
					alert("삭제 실패");
				}
			});
		});
		
		
		//좋아요 갯수 불러오기
		getWishListCnt();
		//////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////
		
		//D-day
		dDay_select();
		
		// 퍼센트구하기
		percent_select();
	})
	
	function addtodelWishButton() { // ♡ -> ♥ 
		$("#add").fadeOut(function() {
			$("#del").fadeIn();
		});
	}
	
	function deltoaddWishButton() { //  ♥->♡ 
		$("#del").fadeOut(function() {
			$("#add").fadeIn();
		});
	}
	
	//내가 좋아요한 상품인지 확인하기
	function wishConfirm() {
		let sendData = {};
		sendData.pro_no = "${pro.pro_no}";
		sendData.user_no = "${sessionScope.loginUsers.user_no}";
		console.log(sendData)
		//여기서 바로 그냥 조회하는 함수
		$.ajax({
			url : "/more/project/getWishConfirm.do",
			type : "post",
			data : sendData,
			success : function(responseData) {
				console.log("데이터 있음", responseData);
				if(responseData!==''){
					addtodelWishButton();
				}else{
					deltoaddWishButton();
				}
			},
			error : function(data) {
				
				console.log("일단 에러"+data);
			}
		});
	}
		// 좋아요 등록 function
		$(document).on("click",".addWish_btn",function (){
			let sendData = {};
			sendData.pro_no = "${pro.pro_no}";
			sendData.user_no = "${sessionScope.loginUsers.user_no}";
			
			$.ajax({
				url : "/more/project/wishlistInsert.do",
				type : "post",
				data : sendData,
				success : function() {
					alert("관심 프로젝트에 등록되었습니다.\n마이페이지에서 확인하세요.");
					addtodelWishButton();
				},
				error : function() {
					alert("좋아요 실패");
				}
			}); 
		});
		
		// 좋아요 취소 function
		$(document).on("click",".delWish_btn",function (){	
			let sendData = {};
			sendData.pro_no = "${pro.pro_no}";
			sendData.user_no = "${sessionScope.loginUsers.user_no}";
			
			$.ajax({
				url : "/more/project/wishlistDelete.do",
				type : "post",
				data : sendData,
				success : function() {
					alert("관심 프로젝트에서 삭제되었습니다.");
					deltoaddWishButton();
				},
				error : function() {
					alert("삭제 실패");
				}
			});
		});
		
	
	//좋아요 갯수 불러오기
	function getWishListCnt() {
		let p_vo = {};
		p_vo.pro_no = "${pro.pro_no }";
		
		$.ajax("getWishListCnt.do", {
			type: "post",
			data: JSON.stringify(p_vo),
			dataType: "json",
			contentType: "application/json",
			success: function(data) {
				$("#wishList_ea").html(data);
			},
			error: function() {
				/* alert("실패~~"); */
			}
		});
	}
	
	
	///////////////////////////////////////////////////////
	//D-day구하기
	function dDay_select() {
		var close_year = '<%=close_year %>';
		var close_month = '<%=close_month %>';
		var close_day = '<%=close_day %>';
		
		var end_day = new Date(close_year, close_month, close_day); // D-day 셋팅
		var today = new Date(); // 현재(오늘) 날짜

		var gap = end_day.getTime() - today.getTime();
		var result = Math.ceil(gap / (24 * 60  *60 * 1000)); 
		
		$("#d_day>p").html("D-" + result);
		$("#re_days_data").html(result);
	}
	
	/* 판매율 구하기 */
	function percent_select() {
		
		var pro_gprice = ${pro.pro_gprice } // 목표금액
		var investment_amount = ${funding_investment_amount } // 투자금액
		var pro_percent = (investment_amount / pro_gprice) * 100.0  
		var inve_percent = Math.ceil(pro_percent) // 소수점 반올림 
		$("#invePercent").html(inve_percent);
	}
	
	/* 주문페이지로 이동 */		
	function ordersSelect() {
		location.href = "../orders/ordersSelect.do";
	}
	
	//클릭한 상품 보내기
	function ordersGo(goods_rnum, pro_no) {
		let g_vo = {};		
		g_vo.goods_rnum = goods_rnum;
		g_vo.pro_no = pro_no;
		
		var answer = confirm("상품을 구매하시겠습니까?");
		if (answer) {
			$.ajax("../orders/ordersOne.do", {
				type: "post",
				data: JSON.stringify(g_vo),
				dataType: "text",
				contentType: "application/json",
				success: function(data){
					alert("상품 주문 페이지로 이동합니다");
					console.log(data);
					location.href = "../orders/orders_select.jsp";
				},
				error : function() {
					alert("실패~~~");
				}
			});
		} else {
			alert ("선택이 취소되었습니다.");
		} 
	}
	
	
</script>
</head>
<%@include file="../common/homeHeader.jsp" %>
<!-- header-->
<body>
	<div id="container">
		<div id="pro_top_All">
         <div id="pro_top_imt_border">
         <div id="pro_top_img"></div>
         </div>
         <!-- 카테고리 -->
         <div id="category">${pro.pro_catename }</div>
         <!-- 타이틀-->
         <!-- <div id="title">코코넛, 식물유래 성분 97%ㅣ강력한 보습효과. 순하고 촉촉한 토너</div> -->
         <div id="title_All">
            <div id="title">${pro.pro_title }</div>
            <div id="stitle">${pro.pro_stitle }</div>
         </div>
      </div>

		<!-- ========= 상품정보영역 ========= -->
		<div id="pro_top">
			<!-- 썸네일 -->
			<!-- 썸네일 사진 -->
			<div id="pro_top_left">
				<div id="pro_thumb">
					<img src="${pro.pro_thumbnail_path }">
				</div>
			</div>
			<!-- 상품정보영역 -->
			<div id="pro_top_right">
				<!-- 디데이 영역 -->
				<div id="d_day">
					<p>D-${dDay }</p>
				</div>
				<!-- 투자금액 영역 -->
				<div id="inve_amount">
					<div id="inve_amount_text">투자금액</div>
					<span id="inve_amount_data"> <span id="inve_price">
					<fmt:formatNumber value="${funding_investment_amount }" pattern="#,###,###" /></span>
						<span id="inve_text">원 투자</span><span id="inve_percent">%</span><span id="invePercent"></span>
					</span>
					<div id="inve_chart">────────────────────</div>
					<div id="target_amount">목표금액 : <fmt:formatNumber value="${pro.pro_gprice }" pattern="#,###,###" /></div>
				</div>
				<!-- 투자자 영역 -->
				<div id="investor">
					<div id="investor_text">투자자</div>
					<div id="investor_num">
						<span id="investor_num_data">${investor }</span> <span
							id="investor_num_text">명</span>
					</div>
				</div>
				<!-- 남은기간 영역 -->
				<div id="remaining_days">
					<div id="remaining_days_text">남은기간</div>
					<div id="remaining_days_data">
						<span id="re_days_data">${dDay }</span> <span id="re_days_day">일</span>
						<span id="re_days_text">${pro.pro_close_dt.substring(0, 10) }
							00:00 마감</span>
					</div>
				</div>
				<!-- 후원금 영역 -->
				<!-- 
				<div id="donation">
					<div id="donation_select">추가 후원금(선택)</div>
					<input type="text" id="donation_price" placeholder="0"><br>
					<div id="donation_text">* 더 후원해주시면 프로젝트 성사가 앞당겨집니다.</div>
					<div id="price_checkbox">
						<input type="checkbox" name="price5000" id="price5000" value="5천원"><label
							for="price5000">5천원</label> <input type="checkbox"
							name="price10000" id="price10000" value="5천원"><label
							for="price10000">1만원</label> <input type="checkbox"
							name="price50000" id="price50000" value="5천원"><label
							for="price50000">5만원</label> <input type="checkbox"
							name="price100000" id="price100000" value="5천원"><label
							for="price100000">10만원</label>
					</div>
				</div> -->
				<!-- 투자하기, 찜하기, 공유 영역 -->
				<div id="pro_btn">
					<button id="invest_btn" onclick="ordersSelect()">투자하기</button>
					<div id="bottom_btn">
						<button id="wishList_btn">
							<img src="../images/wishList.png" alt="wishList" id="add" class="addToWish addWish_btn">
							<img src="../images/wishList_insert.png" alt="wishList" id="del" class="delToWish delWish_btn" style="display: none"> 
							<!-- ================================================ -->
							<!-- <p id="add" class="addToWish">
								<button type="button" class="addWish_btn">좋아요♡</button>
							</p>
							
							<p id="del" class="delToWish"
								style="display: none;">
								<button type="button" class="delWish_btn">좋아요 취소♥</button>
							</p> -->
							<!-- ================================================ -->
							<span id="wishList_ea">${wishList_ea }</span>
						</button>
						<button id="share_btn"><img src="../images/share.png" alt="share"></button>
					</div>
				</div>
			</div>
			<!-- 상품 정보 영역 -->
		</div>
		<div id="pro_bottom">
			<ul id="pro_menu">
				<li>스토리</li>
				<li>리뷰</li>
				<li>QnA</li>
				<li>서포터</li>
				<li>회사 정보</li>
			</ul>
			<div id="pro_bottom_left">
				<div id="pro_detail" class="detail_box1">
					<c:forEach var="img" items="${proImgs }">
						<p>
							<img src="${img }" alt="상세이미지">
						</p>
					</c:forEach>

				</div>
				<div id="pro_review" class="detail_box2">
					<%@ include file="funding_review.jsp"%>
				</div>
				<div id="pro_qna" class="detail_box3">
					<%@ include file="funding_qna.jsp"%>
				</div>
				<div id="pro_supporter" class="detail_box4">
					<%@ include file="funding_supporter.jsp"%>
				</div>					
				<div id="pro_company_info" class="detail_box5">
					<%@ include file="funding_company.jsp"%>
				</div>	
			</div>
			<div id="pro_bottom_right">
				<c:forEach var="goods" items="${goodsList }" varStatus="status">
					<div id="pro_option${goods.goods_rnum }" class="pro_option" onclick="ordersGo('${goods.goods_rnum }','${goods.pro_no }')">
						<div class="pro_opt_price">
							<fmt:formatNumber value="${goods.goods_price }" pattern="#,###" />원 펀딩
						</div>
						<div class="pro_opt_title">${goods.goods_title }</div>
						<div class="pro_opt_content">${goods.goods_content }</div>
						<div class="pro_opt_deli_content">배송비</div>
						<div class="pro_opt_deli_price">2,500원</div>
						<div class="pro_opt_stock">
							<%-- <span>제한수량 
								<fmt:formatNumber value="${goods.goods_stock }" pattern="#,###" />개
							</span> --%>
							<span>
								현재
								<fmt:formatNumber value="${goods.goods_stock }" pattern="#,###" />
								개남음
							</span>
						</div>
						<div class="pro_opt_goodsAll">
							<%-- 총 ${goods_order_ea.order_ea }개 펀딩완료 --%>
							총 ${goodsEaList[status.index].order_ea }개 펀딩완료
							<%-- <fmt:formatNumber value="${완료펀딩건수 }" pattern="#,###" /> --%>
						</div>
						<div id=""></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<%@include file="../common/homeFooter.jsp" %>
<!-- footer -->

</html>
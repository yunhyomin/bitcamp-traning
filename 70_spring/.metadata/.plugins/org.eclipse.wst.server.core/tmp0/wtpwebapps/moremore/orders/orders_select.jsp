<%@page import="com.spring.more.project.service.ProjectVO"%>
<%@page import="com.spring.more.users.service.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	/* UsersVO user = (UsersVO) session.getAttribute("user"); */
	/* System.out.println(user + " <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"); */
	ProjectVO pro = (ProjectVO) session.getAttribute("pro");
	System.out.println(">>>>>>>>>>>>> : " + pro);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리워드 선택 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/styles.css" type="text/css" />
<style>
/* 체크박스 버튼 css */
input[type="checkbox"] {
	margin: 10px;
	display: none;
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
}

/* order_select.jsp 전체 영역 */
#container {
	position: relative;
	width: 100%;
	height: 1500px;
	text-align: center;
	margin-bottom: 100px;
	padding-bottom: 100px;
	cursor: pointer;
}

/* container 안에 있는 div 영역 */
#option {
	position: relative;
	width: 1080px;
	height: 1500px;
	left: 50%;
	margin: 50px 0px 50px -540px;
	cursor: pointer;
}

/* 펀딩 상품 제목 */
#select_title {
	position: relative;
	width: 1080px;
	height: 50px;
	line-height: 50px; /* height값과 같은 값을 주어서 수직정렬 시킴 */
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 30px;
	text-align: center;
	cursor: pointer;
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
	cursor: pointer;
}

/* 현재 진행중인 결제 단계*/
#circle_one {
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

/* 다음 단계 */
#circle_two, #circle_three {
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

/* 리워드 수량 입력 - 전체 영역*/
#option_All {
	position: relative;
	width: 1080px;
	height: 700px;
	font-size: 20px;
	margin-top: 30px;
	cursor: pointer;
}

/* 리워드 수량 입력 - "리워드 수량 입력" 텍스트 영역 */
#option_text {
	position: relative;
	width: 1080px;
	height: 50px;
	line-height: 50px;
	font-size: 25px;
	font-weight: bold;
	text-align: left;
	margin: 0px 0px 10px 50px;
	cursor: pointer;
}

/* 리워드 수량 입력 - 옵션 관련 내용 및 수량 선택 하는 영역 */
#option_select1, #option_select2, #option_select3 {
	position: relative;
	width: 900px;
	height: 200px;
	margin: 0px 0px 20px 50px;
	border: 1px solid silver;
	cursor: pointer;
}

/* 리워드 수량 입력 - 금액 부분 */
.option_price {
	position: relative;
	width: 900px;
	height: 50px;
	line-height: 50px;
	font-size: 23px;
	font-weight: bold;
	text-align: left;
	margin-left: 30px;
}

/* 리워드 수량 입력 - 재고(총재고, 펀딩갯수) 영역 */
.option_inven {
	position: relative;
	width: 450px;
	height: 20px;
	line-height: 20px;
	text-align: left;
	margin-left: 30px;
}

/* 리워드 수량 입력 - 총재고 영역 */
.option_All_inventory {
	position: relative;
	width: 450px;
	height: 20px;
	line-height: 20px;
	font-size: 15px;
	font-weight: bold;
}

/* 리워드 수량 입력 - 현재 펀딩 갯수 영역*/
.option_inventory {
	position: relative;
	width: 450px;
	height: 20px;
	line-height: 20px;
	font-size: 15px;
}

/* 옵션 - 현재 진행중인 펀딩 옵션 제목 */
.option_title {
	position: relative;
	width: 450px;
	height: 20px;
	line-height: 20px;
	font-size: 19px;
	font-weight: bold;
	text-align: left;
	margin: 20px 0px 0px 30px;
}

/* 옵션 - 현재 진행중인 펀딩 옵션 내용 */
.option_content {
	position: relative;
	width: 450px;
	height: 20px;
	line-height: 20px;
	font-size: 15px;
	text-align: left;
	margin: 10px 0px 0px 30px;
}

/* 옵션 - 현재 진행중인 펀딩 옵션 수량 */
.option_number {
	text-align: left;
	margin-top: 15px;
	margin-left: 35px;
}

/* 옵션 - 현재 진행중인 펀딩 옵션 플러스 마이너스 버튼*/
.option_plus_btn, .option_minus_btn {
	text-align: center;
	width: 30px;
	height: 30px;
	font-size: 17px;
	margin: 0px -6px;
	border: 1px solid silver;
	cursor: pointer;
}

/* 옵션 - 현재 진행중인 펀딩 옵션 선택 갯수 */
.option_plus_minus {
	text-align: center;
	width: 26.5px;
	height: 26.5px;
	font-size: 16px;
	border: 1px solid silver;
	cursor: pointer;
}

/* 후원금 - 전체 영역 */
#donation {
	position: relative;
	width: 900px;
	height: 200px;
	margin: 30px 0px 0px 80px;
}

/* 후원금 - "추가후원금(선택)" 텍스트 영역*/
#donation_select {
	width: 900px;
	height: 30px;
	font-size: 17px;
	font-weight: bold;
	margin: 50px 0px 10px 0px;
	text-align: left;
}

/* 후원금 - 후원금을 입력하는 영역*/
#donation_price {
	width: 300px;
	height: 30px;
	text-align: left;
	border: 1px solid silver;
	margin-bottom: 10px;
	float: left;
	cursor: pointer;
}

/* 후원금 - "더 후원해주시면 ~" 텍스트 영역*/
#donation_text {
	width: 900px;
	height: 30px;
	font-size: 13px;
	margin-top: 10px;
	text-align: left;
	float: left;
}

/* 후원금 - 체크박스 */
#price_checkbox {
	width: 900px;
	height: 20px;
	text-align: left;
}

/* 공개여부(선택) */
#name_secret {
	position: relative;
	width: 900px;
	height: 200px;
	margin-left: 80px;
}

#name_secret_text1 {
	width: 900px;
	height: 30px;
	font-size: 17px;
	font-weight: bold;
	text-align: left;
	margin-bottom: 10px;
}

#name_secret_text2 {
	width: 900px;
	height: 30px;
	font-size: 14px;
	text-align: left;
}

#name_secret_text3 {
	width: 900px;
	height: 30px;
	font-size: 14px;
	color: #828282;
	text-align: left;
}

/* 이름, 금액 공개 비공개 여부 */
#name_secret_select {
	position: relative;
	width: 900px;
	text-align: left;
	margin-bottom: 50px;
}

/* 최종 결제내역 전 hr 선 형태로 영역 나누기 */
hr {
	border: 2px solid #551A8B;;
	background-color: #551A8B;;
	width: 700px;
}

#allSelect {
	margin: 20px 0px;
}

/* 펀딩 참여 총 갯수 및 총 금액 */
#all_number, #all_price {
	color: red;
	font-weight: bold;
}

/* 다음단계 버튼 */
#next_btn {
	width: 100px;
	height: 35px;
	line-height: 35px;
	background: #551A8B;
	border: 0px;
	border-radius: 5px;
	font-weight: bold;
	color: white;
	cursor: pointer;
}
</style>
<%@ include file="../common/homeHeader.jsp"%>
<!-- header-->
<script>
	var all_order_price = "";
	var goods_price_pm ="";
	var all_order_ea = "";
	
	//후원금 누르면 총 금액 변경되게
	$(function(){
        var totalVal = parseInt($("#donation_price").val());    
        all_order_price = parseInt($("#all_order_price").val()); //참여금액
        all_order_ea = parseInt($("#all_order_ea").val()); //총 구매수량
        
			
		$(".donation").change(function(){
            if ($(this).is(":checked") == true) {
                totalVal += parseInt($(this).val());
                all_order_price += parseInt($(this).val());
            } else {
                totalVal -= parseInt($(this).val());
                all_order_price -= parseInt($(this).val());
            }           
            $("#donation_price").val(totalVal.toLocaleString());            
            $("#all_order_price").val(all_order_price);
    		$("#all_price").html(all_order_price.toLocaleString() + '원');
        });
        
        //옵션 눌러서 들어오면 선택 미리 되어있게
        (function() {
			for (var i = 0; i <= $(".o_option").length; i++) {
				if ($(".option_plus_minus").eq(i).val() == 1) {
					all_order_ea += 1
					$("#all_number").html(all_order_ea);
					let price_val = parseInt($(".o_option>.gd_price").eq(i).val());
					all_order_price += price_val;
					$("#all_price").html(all_order_price.toLocaleString() + '원');
				}
			}
		}());
        
        
        
        
    });
	
	
	//+, - 버튼 누를떄마다 숫자 증감
	function option_plus_minus(type, goods_rnum, goods_price) {
		var totPM = parseInt($("#goods_ea" + goods_rnum).val());
		/* all_order_ea = parseInt($("#all_order_ea").val()); //총 구매수량
		all_order_price = parseInt($("#all_order_price").val()); //참여금액 */
		goods_price_pm = parseInt(goods_price);
		if(type == 'p') {
			totPM += 1;
			all_order_ea += 1;
			all_order_price += goods_price_pm;
		} else {
			if(0 < totPM || 0 < all_number) {
				totPM -= 1;
				all_order_ea -= 1;
				all_order_price -= goods_price_pm;
			}
		}
		$("#goods_ea" + goods_rnum).val(totPM);
		$("#all_order_ea").val(all_order_ea);
		$("#all_number").html(all_order_ea);
		$("#all_order_price").val(all_order_price);
		$("#all_price").html(all_order_price.toLocaleString() + '원');
		
	}
	
	//주문하기(다음단계)
	function order() {
		let opt_vo = {};
		opt_vo.goods_ea1 = $("#goods_ea1").val();
		opt_vo.goods_ea2 = $("#goods_ea2").val();
		opt_vo.goods_ea3 = $("#goods_ea3").val();
		opt_vo.goods_rnum1 =$("#goods_rnum1").val();
		opt_vo.goods_rnum2 = $("#goods_rnum2").val();
		opt_vo.goods_rnum3 = $("#goods_rnum3").val();
		opt_vo.goods_no1 = $("#goods_no1").val();
		opt_vo.goods_no2 = $("#goods_no2").val();
		opt_vo.goods_no3 = $("#goods_no3").val();
		opt_vo.goods_price1 = $("#goods_price1").val();
		opt_vo.goods_price2 = $("#goods_price2").val();
		opt_vo.goods_price3 = $("#goods_price3").val();
		opt_vo.goods_title1 = $("#goods_title1").val();
		opt_vo.goods_title2 = $("#goods_title2").val();
		opt_vo.goods_title3 = $("#goods_title3").val();
		opt_vo.pro_no = '<%=pro.getPro_no() %>';
		opt_vo.donation_price = $("#donation_price").val();
		opt_vo.private_name = $(".private_name:checked").val();
		
		//alert(JSON.stringify(opt_vo ));
		//console.log(opt_vo);
				
		var answer = confirm("펀딩 결제를 진행하시겠습니까?");
		if (answer) {
			$.ajax("orders.do", {
				type: "post",
				data: JSON.stringify(opt_vo),
				dataType: "text",
				contentType: "application/json",
				success: function(data){
					alert("결제 페이지로 이동합니다");
					location.href = "orders.jsp";
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("review_delete() Ajax 처리 실패 : \n"
							+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
							+ "textStatus : " + textStatus + "\n"
							+ "errorThrown : " + errorThrown);
				}
			});
		} else {
			alert ("펀딩 결제가 취소되었습니다.");
		} 
	}
</script>
</head>
<body>
	<div id="container">
		<div id="option">

			<!-- 현재 결제중인 펀딩 제목 -->
			<div id="select_title">${pro.pro_title }</div>

			<!-- 현재 진행 단계를 보여주는 원형 영역 -->
			<div>
				<ol id="order_circle">
					<li id="circle_one">리워드선택</li>
					<li id="circle_two">결제예약</li>
					<li id="circle_three">참여완료</li>
				</ol>
			</div>

				<div id="option_All">
					<div id="option_text">리워드 수량 입력</div>
					<c:forEach var="goods" items="${goodsList }" varStatus="status">
						<!-- 옵션 영역 1-->
						<div id="option_select${goods.goods_rnum }" class="o_option">
							<div class="option_price">
								<fmt:formatNumber value="${goods.goods_price }" pattern="#,###" />
								원 펀딩
							</div>
							<div class="option_inven">
								<span class="option_All_inventory">
									<fmt:formatNumber value="${goods.goods_stock }" pattern="#,###" />
									개
								</span>
								<span class="option_inventory">| ${goodsEaList[status.index].order_ea }개 펀딩</span>
							</div>
							<div class="option_title">${goods.goods_title }</div>
							<div class="option_content">${goods.goods_content }</div>
							<!-- hidden 버튼으로 나머지 정보 전달 -->
							<input type="hidden" id="goods_no${goods.goods_rnum }" name="goods_no${goods.goods_rnum }" value="${goods.goods_no }">
							<input type="hidden" id="goods_title${goods.goods_rnum }" name="goods_title${goods.goods_rnum }" value="${goods.goods_title }">
							<input type="hidden" id="goods_rnum${goods.goods_rnum }" name="goods_rnum${goods.goods_rnum }" value="${goods.goods_rnum }">
							<input type="hidden" id="goods_price${goods.goods_rnum }" name="goods_price${goods.goods_rnum }" class="gd_price" value="${goods.goods_price }">
							<div class="option_number">
								<button type="button" class="option_minus_btn"
									onclick="option_plus_minus('m', '${goods.goods_rnum }', '${goods.goods_price }')">-</button>
								<c:if test="${goods.goods_rnum == gvo.goods_rnum }">
									<input type="text" class="option_plus_minus" id="goods_ea${goods.goods_rnum }"
										name="goods_ea${goods.goods_rnum }"	value="1" readonly="readonly" />
								</c:if>
								<c:if test="${goods.goods_rnum != gvo.goods_rnum }">
									<input type="text" class="option_plus_minus" id="goods_ea${goods.goods_rnum }"
										name="goods_ea${goods.goods_rnum }"	value="0" readonly="readonly" />
									</c:if>
								<button type="button" class="option_plus_btn"
									onclick="option_plus_minus('p', '${goods.goods_rnum }', '${goods.goods_price }')">+</button>
								
							</div>
						</div>
					</c:forEach>

				</div>


				<!-- 후원금  영역 -->
				<div id="donation">
					<div id="donation_select">추가 후원금(선택)</div>
					<input type="text" id="donation_price" name="donation_price" value="0"><br> <!-- placeholder="0" -->
					<div id="donation_text">* 더 후원해주시면 프로젝트 성사가 앞당겨집니다.</div>
					<div id="price_checkbox">
						<input type="checkbox" class="donation" id="price5000" value="5000">
							<label for="price5000">5천원</label>
						<input type="checkbox" class="donation" id="price10000" value="10000">
							<label for="price10000">1만원</label>
						<input type="checkbox" class="donation" id="price50000" value="50000">
							<label for="price50000">5만원</label>
						<input type="checkbox" class="donation" id="price100000" value="100000">
							<label for="price100000">10만원</label>
					</div>
				</div>

				<!-- 이름 공개 여부 선택 -> 서포터에 반영 -->
				<div id="name_secret">
					<div id="name_secret_text1">공개여부(선택)</div>
					<div id="name_secret_text2">서포터 목록에 서포터 이름과 펀딩 금액이 공개됩니다. 조용히
						펀딩하고 싶으시다면, 비공개로 선택해주세요.</div>
					<div id="name_secret_text3">커뮤니티, 새소식 댓글 작성 시에는 비공개 여부와 상관없이
						펀딩 참여자 표시가 노출됩니다.</div>
					<div id="name_secret_select">
						<input type="radio" name="private_name" id="noSecret" class="private_name" value="공개" checked>
							<label for="noSecret">공개</label>
						<input type="radio"	name="private_name" id="secret" class="private_name" value="비공개">
							<label for="secret">비공개</label>
					</div>
					<hr>

					<!-- 펀딩 참여 총 갯수 및 총 금액 -->
					<div id="allSelect">
						선택한 리워드 총 <span id="all_number"> 0 </span> 개 이며 참여금액 <span
							id="all_price">0원</span> 입니다
					</div>
					<!-- <input type="submit" id="next_btn" value="다음단계" onclick="order()"> -->
					<input type="button" id="next_btn" value="다음단계" onclick="order()">
					<input type="hidden" id="all_order_ea" value="0">
					<input type="hidden" id="all_order_price" value="0">
				</div>
		</div>
	</div>
</body>
<%@ include file="../common/homeFooter.jsp"%>
<!-- footer -->
</html>
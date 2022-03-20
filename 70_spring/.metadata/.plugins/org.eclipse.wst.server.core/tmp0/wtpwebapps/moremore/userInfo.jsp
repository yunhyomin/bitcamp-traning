<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1, user-scalable=yes,initial-scale=1.0" />
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <style>
 .sub_title
 {
 	position: relative;
 	left: 400px;
 }
 .title_like
 {
 	left: 430px;
 }
 .adminContainerContentHeader
 {
 	position: relative;
 	right: 200px;
 	width: 1000px;
 }
 .wishtitle, .ordertitle {
    margin: 10px 70px 70px;
    box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
    width: 870px;
}

.funding_table {
    border-radius: 5px;
    font-size: 12px;
    font-weight: normal;
    border: none;
    border-collapse: collapse;
    width: 100%;
    max-width: 100%;
    white-space: nowrap;
    background-color: white;
}

.funding_table td, .funding_table th {
    text-align: center;
    padding: 8px;
}

.funding_table td {
    border-right: 1px solid #f8f8f8;
    font-size: 12px;
}

.funding_table thead th {
    color: black;
    background: #dcdcdc;
}


.funding_table thead th:nth-child(odd) {
    color: black;
    background: white;
}

.funding_table tr:nth-child(even) {
    background: #F8F8F8;
    color: black;
}
.literal {position: relative; right: 30px;}
 </style>
</head>
<body>
	<%@include file="homeHeader.jsp" %>
	<div class="adminContainerWrapper">
		<div class="myPageContainerLeft">
			<ul class="myPageLeftMenu">
				<li class="myPageMenuItem"><a href="userInfo.jsp">메인</a></li>
				<li class="myPageMenuItem"><a href="userInfoValidate.jsp">My 회원 정보</a></li>
				<li class="myPageMenuItem"><a href="myPage.jsp">관심 프로젝트</a></li>
				<li class="myPageMenuItem"><a href="withdrawal.jsp">회원 탈퇴</a></li>
				<c:if test="${loginUsers.user_type == '펀딩 판매자'}">
					<li class="myPageMenuItem"><a href="fundingAdminHome.jsp">펀딩 관리 페이지</a></li>
				</c:if>
				<c:if test="${loginUsers.user_type == '상품 판매자'}">
					<li class="myPageMenuItem"><a href="productAdminHome.jsp">상품 관리 페이지</a></li>
				</c:if>
				<c:if test="${loginUsers.user_type == '관리자'}">
					<li class="myPageMenuItem"><a href="siteAdminHome.jsp">관리자 페이지</a></li>
				</c:if>
			</ul>
		</div>
		<div class="adminContainerRightWrapper">
			<div class="adminContainerRight">
				<div class="myPageLocationArea">
					<h8>마이 페이지</h8>
				</div>
				<!-- 동적으로 데이터를 넣어줄 폼태그 -->
				<form action="getWishList.do" method="post"></form>
				
<!-- 				실 데이터를 담는 디바이으 -->
				<div class="adminContainerContentArea">
					<div class="adminContainerContentHeader">
						<p class="sub_title">구매 목록</p>
						<div class="boughtContainer"><div></div></div>
					</div>
					<div class="adminContainerContent">
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="homeFooter.jsp" %>
</body>
<script>
window.onload = () => {
	// 참여펀딩리스트 불러오기 실행
	getOrderListData();
}
	// 참여한 펀딩 목록 띄우기
	function getOrderListData() {
		const user_no = '${sessionScope.loginUsers.user_no}'; // 데이터 화면에 띄우기 위한 임시 데이터 (코드 통합할 떈 유저넘버 받아오도록 변경해야함)
		console.log("getOrderListData: " + user_no);
		var param = {
				user_no : user_no
		}
		console.log(param.user_no);
		
		$.ajax("getOrderList.do", {
			type: "get",
			contentType: "application/json",
			data: param
		}).done(function(data, status, xhr) {
			let dispHtml = '<div class="main_div">';
			dispHtml += "<p class='sub_title'>참여한 펀딩</p>";
			dispHtml += "</div>";
			
			dispHtml += "<div class='ordertitle'>";
			dispHtml += head_table("");
			dispHtml += '<tbody class="orderlist">';	
			$.each(data, function(index, obj) {
				if (index <= 5) {
					dispHtml += '<tr class="orderinfo">';
					dispHtml += '<td class="thumb">';
					dispHtml += "<img src='"+this.pro_thumbnail_path+"' width='115px' height='80px' style='margin-top: 0px'>";
					dispHtml += "</td>";
					
					dispHtml += '<td class="orderleft">';
					dispHtml += "<strong>";
					dispHtml += this.pro_title;
					dispHtml += "</strong>";
					dispHtml += '<div class="option">';
					dispHtml += '<div class="reward">';
					dispHtml += this.goods_title;
					dispHtml += "</div>";
					dispHtml += '<div class="state">';
					dispHtml += this.pro_status;
					dispHtml += "</div>";
					dispHtml += "</div>";
					dispHtml += "</td>";
					
					dispHtml += "<td>";
					dispHtml += this.order_ea;
					dispHtml += "</td>";
					
					dispHtml += '<td class="orderdate">';
					dispHtml += "<p>";
					dispHtml += this.order_date.substring(0,10);
					dispHtml += "</p>";
					dispHtml += "<p>";
					dispHtml += this.order_no;
					dispHtml += "</p>";
					dispHtml += "</td>";
					
					dispHtml += '<td class="orderright">';
					dispHtml += "<strong>[";
					dispHtml += this.payment_price;
					dispHtml += "]</strong>";
					dispHtml += "<p>";
					dispHtml += this.payment_status;
					dispHtml += "</p>";
					if(this.order_status!=='반품완료'){ /* 취소 요청 버튼 만듦 */
						dispHtml += "<button class='requestCancelBtn' data-order_no='"
						dispHtml += this.order_no
						dispHtml += "'>취소요청</button>";
					}
					dispHtml += "</td>";
					dispHtml += "</tr>";
				}
			});
			if (data.length === 0 || data.user_no === null) {
				
				dispHtml += "<tbody class='orderlist'>"
					+ "<tr class='orderinfo'>"
				    + "<td class='thumb' colspan=1>"
					+ "<img src='images/logo4.png' width='50px' height='20px' alt='없음'>"
					+ "</td>"
					+ "<td class='orderleft' colspan='4'>"
					+ "<span class='literal'>데이터가 존재하지 않습니다.</span></td>"
					+ "</tr>"
				
			}
			
			dispHtml += "</tbody>";
			dispHtml +=	"</table>";	
			dispHtml += "</div>";
			console.log("데이터 끝.");
			$(".boughtContainer").html(dispHtml);
		}).fail(function(data, status, error) {
			console.log("실패,,", data);
			
		});
	}
	
	$(document).on("click",".requestCancelBtn",function (){ /* 취소 요청 기능 추가 */
		const data = this.dataset;
		const btn=this;
		console.log(btn);
		console.log(data);
		$.ajax("requestOrderCancel.do", {
			type: "get",
			contentType: "application/json",
			data: data,
			success : function(data) {
				console.log("수정 완.");
				btn.previousSibling.innerText=data.order_status;
				console.log("수신데이터"+data);
			},error : function() {
				alert("지금은 오류가 발생합니다. 잠시 후에 다시 신청해 주세요...");
			}
		
		});
		
	});
	
head_table = (e) => {
	e += '<table border="1" summary class="funding_table">';
	e += "<thead>";
	e += "<tr>";
	e += '<th scope="col">이미지</th>';
	e += '<th scope="col">펀딩 정보</th>';
	e += '<th scope="col">수량</th>';
	e += '<th scope="col">참여 일자<br>구매 번호</th>';
	e += '<th scope="col">결제금액<br>결제 현황</th>';
	e += "</tr>";
	e += "</thead>";
	return e;
}
</script>
</html>
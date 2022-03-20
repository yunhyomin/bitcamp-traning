<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심목록</title>
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
    background: #dcdcdc;
    color: black;
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
				<form action="getOrderList.do" method="post"></form>
				
<!-- 				실 데이터를 담는 디바이으 -->
				<div class="adminContainerContentArea">
					<div class="adminContainerContentHeader">
						<p class="sub_title title_like">좋아요</p>
						<div class="wishContainer"><div></div></div>
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
	// 좋아요리스트 불러오기 실행
	getWishlistData();
}
	// 좋아요 목록 띄우기 
	function getWishlistData() {
		//좋아요 목록을 불러오기 위해 필요한 작업 
		//1.user_no 받아서 controller로 전달해야한다
		// 주석 1: ajax의 기본 값이 async작동이 true로 되어있으므로 이걸 false로 적용 => 에러ㅠㅠ
		// 주석2: ajax코드로 접속시에 data타입이 맞지않아 파스 에러가 떴다 해결방법은 data타입을 text로 바꾸는것 원래는 json이었음 
		let user_no = '${sessionScope.loginUsers.user_no}';//데이터를 화면으로 불러오기 위해 필요한 임시 데이터
		console.log("getWishlistData : "+user_no);
		var param={
				user_no: user_no
		} 
		console.log(param.user_no);
		
		
		$.ajax("getWishList.do",{
			type: "get",
			/* contentType:"application/json", */
			data: param	
		}).done(function(data, status, xhr) {

			// var dispHtml=''	 
			let dispHtml = '<div class="main_div">';
			dispHtml += "<p class='sub_title'>관심 프로젝트</p>";
			dispHtml += "</div>";
			dispHtml += "<div class='wishtitle'>";
			
			dispHtml += head_table("");
			dispHtml += '<tbody class="wish">';	
			$.each(data, function(index, obj) {
				console.log(index + "<<<<index");
				if (index <= 5) {
					dispHtml += '<tr class="wishinfo">';
					dispHtml += '<td class="thumb" style="width:80px; height:80px">';
					dispHtml += '<img src='+this.pro_thumbnail_path+' width="115px" height="80px" style="margin-top: 0px">'; 
					dispHtml += "</td>";
					dispHtml += '<td class="wishleft">';
					dispHtml += "<strong>";
					dispHtml += this.pro_title; 
					dispHtml += "</strong></td>";
					/* dispHtml += "<br><br>"; */
					dispHtml += '<td class="date">';
					dispHtml += this.pro_close_dt.substring(0,10); 
					/* dispHtml += "</div>"; */
					dispHtml += "</td>";
					dispHtml += '<td class="state">';
					dispHtml += this.pro_status; 
					dispHtml += "</td>";
					dispHtml += "</tr>";
				}
				
			});
				
			
			if (data.length === 0) {
				dispHtml += ""
					+ "<tr class='orderinfo'>"
				    + "<td class='thumb' colspan=1>"
					+ "<img src='images/logo4.png' width='50px' height='20px' alt='없음'>"
					+ "</td>"
					+ "<td class='orderleft' colspan='4'>"
					+ "<span class='literal'>데이터가 존재하지 않습니다.</span>"
					+ "</td></tr>";
				
			}
			dispHtml += "</tbody>";
			dispHtml +=	"</table>";	
			dispHtml += "</div>";
			$(".wishContainer").html(dispHtml);
		}).fail(function(data, status, error){
			console.log("실패", data);
			//callback(data);
			
		});
	}

	
head_table = (e) => {
	e += '<table border="1" summary class="funding_table">';
	e += "<thead>";
	e += "<tr>";
	e += '<th scope="col">이미지</th>';
	e += '<th scope="col">펀딩 정보</th>';
/* 	e += '<th scope="col">수량</th>'; */
	e += '<th scope="col">참여 일자<br>구매 번호</th>';
	e += '<th scope="col">결제금액(원)<br>결제 현황</th>';
	e += "</tr>";
	e += "</thead>";
	return e;
}
</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 중단 신청</title>
<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	/* .project_container_li 
	{
		list-style: none;	
		border: 1px solid red;
		padding: 3px;
	}
	.project_container_li span 
	{
		color: red;
		font-size: 15px;
	} */
	.project_container_li 
	{
		list-style: none;	
		border: 1px ridge #dcdcdc;
		padding: 3px;
		position: relative;
		width: 800px;
		left: 20%;
	}
	.project_container_li span 
	{
		color: black;
		font-size: 15px;
		padding: 10px 0px 10px 0px;
	}
	.project_container_li a {
		display: grid;
		grid-template-columns: 25% 62% 13%;	
	}
	.ongoing
	{
		transform: translate(50px,0px);
	}
	
	.project_container_li p
	{
		display: grid;
		grid-template-columns: 25% 62% 13%;	
		background-color: #dcdcdc;
		margin: 0px;
	}
	.content_span {text-align: center;}
	.pro_conta:hover span{color: black; font-weight: bold;}
	.project_container_li:first-child {background-color: #dcdcdc;}
	.pro_conta:hover {background-color: rgb(249, 249, 249);}
	.btn_page:active {background-color: var(--green); color: var(--purple);}
		#btn_main
	{
		position: absolute;
		transform: translate(400px, -5px);
		
	}
	#goMainBtn
	{
		position: absolute;
		transform: translate(650px, -2px);
		width: 100px;
		text-align: center;
		line-height: 25px;
	}
/*                       */
button, #goMainBtn{
  background:#d2d2d2;
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
}
button:hover, #goMainBtn:hover{
  background:#fff;
  color:black;
}
button:before,button:after, #goMainBtn:before, #goMainBtn:after {
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #d2d2d2;
  transition:400ms ease all;
}
button:after, #goMainBtn:after {
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after, #goMainBtn:hover:before, #goMainBtn:hover:after {
  width:100%;
  transition:800ms ease all;
}
/*                       */
	
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
						<div id="board_main">
							<ul id="project_container_ul">
								<li class="project_container_li">
									<p>
										<span>프로젝트명</span>
										<span class="content_span">내용</span>
										<span class="ongoing">상태</span>
									</p>
								</li>
								<c:if test="${fn:length(project) != 0}">
									<c:forEach var="project" items="${project }">
										<li class="project_container_li pro_conta">
											<a href="closeProject_application.do?user_no=${project.user_no }&pro_no=${project.pro_no}&nowPage=1&min=1&max=10" id = "span_container_a">
												<span>${project.pro_title }</span>
												<span>${project.pro_stitle }</span>
												<span class="ongoing">${project.pro_status }</span>
											</a>
										</li>
									</c:forEach>
								</c:if>						
								<c:if test="${fn:length(project) == 0}">
									<li class="project_container_li pro_conta">
										<h3>진행중인 프로젝트가 존재하지 않습니다.</h3>
									</li>
								</c:if>	
							</ul>
							<div id="btn_main"></div>
							<div id="goMainBtn"><a href="fundingAdminHome.jsp">메인페이지로</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
</body>
<script>
	
	//////////////////////////////////////////////////////// 페이징 처리 스크립트 영역
	// 페이징 처리 변수 시작
	nowPage = 1;
		let min = 1;
		let max = 10;
	if ('${param.nowPage}'.trim() !== '') {
		nowPage = "${param.nowPage}";
		let min = "${param.min}";
		let max = "${param.max}";
		ajax_data ("NaN");
	}
	
	let totalPage = Math.floor((${totalPage} -1) / 10) + 1;
	let startPage = Math.floor((nowPage-1)/5) * 5 +1;
	let endPage = startPage + 5 - 1;
	console.log("현재 : " + nowPage + "\n최소 : " + min + "\n최대 : " + max + "\n시작 : " + startPage + "\n끝 : " + endPage);
	// 페이징 처리 변수 끝
	
	// 페이징 처리 버튼 생성
	for (let i = startPage; i <= totalPage; i++) {
		let board = document.getElementById("btn_main");
		if (i === startPage){
			board.innerHTML += "<button class='btn_next_prev' onclick='page_back(this)'>이전으로</button>";
		}
		board.innerHTML += "<button class='btn_page' onclick='ajax_data(this)'>" + i + "</button>";
		if (i === totalPage){
			board.innerHTML += "<button class='btn_next_prev' onclick='page_go(this)'>다음으로</button>";
		}
	}
	page_go = (e) => {
		if (nowPage >= totalPage) {
			alert("앞으로 갈 페이지가 없다.");
		} else {
			nowPage++;
			ajax_data("NaN");
		}
	}
	page_back = (e) => {
		if (nowPage <= 1) {
			alert("뒤로갈 페이지가 없다.");
		} else {
			nowPage--;
			ajax_data("NaN");
		}
		
	}
	// 페이징 처리 버튼 생성 끝
	
	function ajax_data (e) {
		if (e !== "NaN") {
			nowPage = e.innerHTML;
		} else {
			nowPage = nowPage;	
		}
		
		if (nowPage > 1) {
			min = ((nowPage-1) * 10) + 1;
			max = nowPage * 10;
		} else {
			min = 1;
			max = 10;
		}
		let sendData = {user_no:"${project[0].user_no}","nowPage":String(nowPage),"min":String(min),"max":String(max)};
		$.ajax("paging.do",{
			type: "post",
			data: JSON.stringify(sendData),
			dataType: "JSON",
			contentType: "application/json",
			success: (data) => {
				console.log(data + "<<");
				let changedData = "<li class='project_container_li'><p>"
					+ "<span>프로젝트명</span>"
					+ "<span class='content_span'>내용</span>"
					+ "<span class='ongoing'>상태</span>"
					+ "</p></li>";
				$.each(data,(idx, e) => {
					changedData += "<li class='project_container_li pro_conta'>"
						+ "<a href=closeProject_application.do?user_no=" + e.user_no + "&pro_no="+ e.pro_no + "&nowPage=" + nowPage + "&min=" + min + "&max=" + max
						+ " class = span_container_a>"
						+ "<span>" + e.pro_title + "</span>"
						+ "<span>" + e.pro_stitle + "</span>"
						+ "<span class=ongoing>" + e.pro_status + "</span>"
						+ "</a></li>";
				});
				document.getElementById("project_container_ul").innerHTML = changedData;
			},
			error: (request, status, error) => {
				alert("실패");
				alert("request : " + request + "\n" + "status : " + status + "\nerror : " + error);
			}
			
		});	
	}
	//////////////////////////////////////////////////////// 페이징 처리 스크립트 영역 끝
	
	
</script>
</html>
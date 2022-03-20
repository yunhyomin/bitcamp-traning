<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
:root {
	--purple: #551A8B;
	--green: #80c72d; 
}
	.adminContainerContent > h3
	{
		position: absolute;
		left: 630px; top: 150px;
	}
	#btnWrapper 
	{
		position: relative;
		width: 600px; height: 600px;
		display: grid;
		grid-template-columns: 200px 200px 200px;
		left: 300px; top: 130px;
		border-radius: 18px;
		overflow: hidden;
	}
	.grid 
	{
		width: 197px; height: 197px;
		background-color: white;
		float: left;
	}
	.grid:after 
	{
		position: relative;		
		
		width: 150px; height: 40px;
		top: -160px; left: 46px;
		
		background-color: #787878;
		border: 1px solid #FFEFD5;
		color: black;
		opacity: 0.8;
		border-radius: 15px;
		padding: 10px;
		
		cursor: pointer;
	}
	.g1:after { content: "카테고리";}
	.g2:after { content: "제목"; left: 66px;}
	.g3::after { content: "부제목"; left: 57px;}
	
	.g4:after { content: "목표금액";}
	.g5:after { content: "썸네일"; left: 57px;}
	.g6:after { content: "내용사진";}
	
	.g7:after { content: "펀딩기간";}
	.g8:after { content: "해시태그";}
	.g9:after { content: "뒤로가기"; top: -101px;}
	
		/* background-color: var(--purple); border: 1px solid var(--green); color: var(--green); */
	.imgTag 
	{	
		transform: translate(-1px, -30px);
		width: 197px; height: 197px;
		border: 1px solid black;
		cursor: pointer;
		opacity: 0.6;
	}
	.img9 {height: 98px;}
	.img10 {height: 96px; transform: translate(-8px, -34px);}
	.g10::after 
	{
		position: relative;		
		content: "수정하기";
		
		width: 150px; height: 40px;
		top: -100px; left: 3px;
		
		background-color: #787878;
		border: 1px solid #FFEFD5;
		color: black;
		opacity: 0.8;
		border-radius: 15px;
		padding: 10px;
		font-size: 24px;
		
		cursor: pointer;
	}
	.g10
	{	
		/* position: fixed;
		right: 160px; top: 350px;
		width: 60px; height: 60px; */
		position: absolute;
		right: 1px; bottom: 1px;
		width: 200px; height: 97px;
		cursor: pointer;
	}
	.after_change::after { 
		background-color: var(--purple); 
		border: 1px solid var(--green); 
		color: var(--green);
	}
</style>
<script>
	window.onload = () => {
		document.querySelector(".img9").onmouseover = changeColor;
		document.querySelector(".img9").onmouseout = offColor;
		document.querySelector(".img10").onmouseover = changeColor;
		document.querySelector(".img10").onmouseout = offColor;
		
		document.getElementById("btnWrapper").onclick = checkBtn;
	}
	// 수정할 리스트들을 담당하는 함수임.
	// 콘솔 나중에 지우기
	let box = new Map();
	function checkBtn (e) {
		if (e.target === document.querySelector(".img1")) {
			if (box.has(1)){
				document.querySelector(".img1").src = "img/picForupdate/off_category.png";
				box.delete(1);
				document.querySelector(".g1").classList.toggle("after_change");
				document.querySelector(".img1").style.opacity = "0.6";
				frm.i1.value = "";
			} else {
				box.set(1, "a");
				document.querySelector(".img1").src = "img/picForupdate/category.png";
				document.querySelector(".g1").classList.toggle("after_change");
				document.querySelector(".img1").style.opacity = "1";
				frm.i1.value = box.get(1);
			}
			
		} else if (e.target === document.querySelector(".img2")) {
			if (box.has(2)){
				document.querySelector(".img2").src = "img/picForupdate/off_title.png";
				box.delete(2);
				document.querySelector(".g2").classList.toggle("after_change");
				document.querySelector(".img2").style.opacity = "0.6";
				frm.i2.value = "";
			} else {
				box.set(2, "b");
				document.querySelector(".img2").src = "img/picForupdate/title.png";
				document.querySelector(".g2").classList.toggle("after_change");
				document.querySelector(".img2").style.opacity = "1";
				frm.i2.value = box.get(2);
			}
			
		} else if (e.target === document.querySelector(".img3")) {
			if (box.has(3)){
				document.querySelector(".img3").src = "img/picForupdate/off_subTitle.png";
				box.delete(3);
				document.querySelector(".img3").style.opacity = "0.6";
				document.querySelector(".g3").classList.toggle("after_change");
				frm.i3.value = "";
			} else {
				box.set(3, "c");
				document.querySelector(".img3").src = "img/picForupdate/subTitle.png";
				document.querySelector(".g3").classList.toggle("after_change");
				document.querySelector(".img3").style.opacity = "1";
				frm.i3.value = box.get(3);
			}
			
		} else if (e.target === document.querySelector(".img4")) {
			if (box.has(4)){
				document.querySelector(".img4").src = "img/picForupdate/off_goal_price.png";
				box.delete(4);
				document.querySelector(".img4").style.opacity = "0.6";
				document.querySelector(".g4").classList.toggle("after_change");
				frm.i4.value = "";
			} else {
				box.set(4, "d");
				document.querySelector(".img4").src = "img/picForupdate/goal_price.png";
				document.querySelector(".g4").classList.toggle("after_change");
				document.querySelector(".img4").style.opacity = "1";
				frm.i4.value = box.get(4);
			}
			
		} else if (e.target === document.querySelector(".img5")) {
			if (box.has(5)){
				document.querySelector(".img5").src = "img/picForupdate/off_thumb.png";
				box.delete(5);
				document.querySelector(".g5").classList.toggle("after_change");
				document.querySelector(".img5").style.opacity = "0.6";
				frm.i5.value = "";
			} else {
				box.set(5, "e");
				document.querySelector(".img5").src = "img/picForupdate/thumb.png";
				document.querySelector(".g5").classList.toggle("after_change");
				document.querySelector(".img5").style.opacity = "1";
				frm.i5.value = box.get(5);
			}
			
		} else if (e.target === document.querySelector(".img6")) {
			if (box.has(6)){
				document.querySelector(".img6").src = "img/picForupdate/off_content_img.png";
				box.delete(6);
				document.querySelector(".img6").style.opacity = "0.6";
				document.querySelector(".g6").classList.toggle("after_change");
				frm.i6.value = "";
			} else {
				box.set(6, "f");
				document.querySelector(".img6").src = "img/picForupdate/content_img.png";
				document.querySelector(".img6").style.opacity = "1";
				document.querySelector(".g6").classList.toggle("after_change");
				frm.i6.value = box.get(6);
			}
			
		} else if (e.target === document.querySelector(".img7")) {
			if (box.has(7)){
				document.querySelector(".img7").src = "img/picForupdate/off_date.png";
				box.delete(7);
				box.delete(8);
				document.querySelector(".img7").style.opacity = "0.6";
				document.querySelector(".g7").classList.toggle("after_change");
				frm.i7.value = "";
				frm.i8.value = "";
			} else {
				box.set(7, "$g");
				box.set(8, "$h");
				document.querySelector(".img7").src = "img/picForupdate/date.png";
				document.querySelector(".g7").classList.toggle("after_change");
				document.querySelector(".img7").style.opacity = "1";
				frm.i7.value = box.get(7);
				frm.i8.value = box.get(8);
			}
			
		} else if (e.target === document.querySelector(".img8")) {
			if (box.has(9)){
				document.querySelector(".img8").src = "img/picForupdate/off_hashTag.png";
				box.delete(9);
				document.querySelector(".g8").classList.toggle("after_change");
				document.querySelector(".img8").style.opacity = "0.6";
				frm.i9.value = "";
			} else {
				box.set(9, "i");
				document.querySelector(".img8").src = "img/picForupdate/hashTag.png";
				document.querySelector(".g8").classList.toggle("after_change");
				document.querySelector(".img8").style.opacity = "1";
				frm.i9.value = box.get(9);
			}
			
		}
		
	} 
	
	// 뒤로가기 버튼 호버기능 함수
	changeColor = (e) => {
		/* document.querySelector(".img9").src = "img/picForupdate/backspace.png";
		document.querySelector(".g9").classList.toggle("after_change"); */
		if (e.target === document.querySelector(".img9")){
			e.target.src = "img/picForupdate/backspace.png";
			document.querySelector(".g9").classList.toggle("after_change");
			document.querySelector(".img9").style.opacity = "1";
		} else {
			e.target.src = "img/picForupdate/repare.png";
			document.querySelector(".g10").classList.toggle("after_change");
			document.querySelector(".img10").style.opacity = "1";
		}
	}
	offColor = (e) => {
		if (e.target === document.querySelector(".img9")){
			e.target.src = "img/picForupdate/off_backspace.png";
			document.querySelector(".g9").classList.toggle("after_change");
			document.querySelector(".img9").style.opacity = "0.6";
		} else {
			e.target.src = "img/picForupdate/off_repare.png";
			document.querySelector(".g10").classList.toggle("after_change");
			document.querySelector(".img10").style.opacity = "0.6";
		}
	}
	
	// 수정서브밋 버튼 함수
	go_submit = () => {
		let arrEle = Array.from(frm.getElementsByTagName("input"));
		for (let i = 0; i< arrEle.length-3; i++) {
			if (arrEle[i].value.trim() !== ""){
				frm.sendBtn.value = "existedData";
			}
		}
		frm.action="readyCateToUpdate.do";
		frm.submit();
	}
</script>
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
						<h8>펀딩수정</h8>
					</div>
					<div class="adminContainerContent">
						<h3>수정할 정보를 선택해주세요!</h3>
						<div id="btnWrapper">
							<a class="grid g1"><img class="imgTag img1" src="img/picForupdate/off_category.png"></a>
							<a class="grid g2"><img class="imgTag img2" src="img/picForupdate/off_title.png"></a>
							<a class="grid g3"><img class="imgTag img3" src="img/picForupdate/off_subTitle.png"></a>
							
							<a class="grid g4"><img class="imgTag img4" src="img/picForupdate/off_goal_price.png"></a>
							<a class="grid g5"><img class="imgTag img5" src="img/picForupdate/off_thumb.png"></a>
							<a class="grid g6"><img class="imgTag img6" src="img/picForupdate/off_content_img.png"></a>
							
							<a class="grid g7"><img class="imgTag img7" src="img/picForupdate/off_date.png"></a>
							<a class="grid g8"><img class="imgTag img8" src="img/picForupdate/off_hashTag.png"></a>
							<a class="grid g9" href="paging_update.do?nowPage=${param.nowPage}&min=${param.min}&max=${param.max}&user_no=${project.user_no}&pro_no=${project.pro_no}"><img class="imgTag img9" src="img/picForupdate/off_backspace.png"></a>
							<button onclick="go_submit()" id="submit_btn" class="g10"><img class="imgTag img10" src="img/picForupdate/off_repare.png"></button>
						</div>
						<form name="frm" method="get">
						<%--  action="<c:url value='readyCateToUpdate.do'>
							<c:param name="project_data" value="${ projectOne.pro_title }" />
							</c:url>"> --%>
							<input type="hidden" name="i1">
							<input type="hidden" name="i2">
							<input type="hidden" name="i3">
							
							<input type="hidden" name="i4">
							<input type="hidden" name="i5">
							<input type="hidden" name="i6">
							
							<input type="hidden" name="i7">
							<input type="hidden" name="i8">
							<input type="hidden" name="i9">
							<input name="sendBtn" type="hidden">
							<input type="hidden" name="user_no" value="${param.user_no }">
							<input type="hidden" name="pro_no" value="${param.pro_no }">
						</form>
						
					</div>
				</div>
			</div>
		</div>
</body>
</html>
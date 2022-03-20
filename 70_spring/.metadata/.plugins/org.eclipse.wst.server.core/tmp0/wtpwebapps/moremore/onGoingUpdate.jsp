<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정진행중</title>
<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
<!-- 달력 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<!-- 얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
:root {
	--purple: #551A8B;
	--green: #80c72d; 
}
	.adminContainerContent {padding-left: 20px;}
	#datepicker, #datepicker2 {cursor: pointer;}
	
#datepicker, #datepicker2 {
	cursor: pointer;
	width: 130px;
	height: 20px;
	margin-bottom: 5px;
}

form {
	position: relative;
	left: 240px;
	top: 100px;
	height: inherit;
}

form h2:not(.notCss) {
	color: #CD3C3C;
}

form h2 {
	margin: 0px;
	font-size: 20px;
	font-weight: normal;
}

form input, select {
	margin-bottom: 15px;
	width: 500px;
	height: 40px;
	border: none;
	border-bottom: 2px solid #dcdcdc;
	background-color: inherit;
}

#exHashTag {
	width: 300px;
	height: 40px;
	background-color: #d2d2d2;
	border-radius: 15px;
	color: white;
	font-size: 15px;
}

#exHashTag p {
	float: left;
	margin-left: 20px;
	transform: translate(35px, -5px);
}

.size_down {
	width: 200px;
	height: 25px;
	background-color: white;
	border: inset;
	padding-top: 2px;
}


#D-day {
	margin-bottom: 15px;
}

#expectedDay {
	color: #dcdcdc;
	font-weight: bold;
}

.img_content {
	width: 300px;
	height: 150px;
}

.img_main {
	position: absolute;
	left: 210px;
	transform: translate(-3px, 27px);
	background-color: white;
	width: 300px;
	height: 200px;
	overflow: scroll;
	z-index: 1;
	display: none;
}

.bx-x {
	cursor: pointer;
	position: absolute;
	top: 5px;
}

#show_img {
	cursor: pointer;
	position: absolute;
	left: 210px;
	transform: translate(0px, -47px);
	color: orange;
	font-size: 15px;
	border: 1px ridge #FAE6B9;border-radius: 15px;
	background-color: #FAE6B9;
	padding: 5px;
	
}
/* 등록취소하기 버튼 */
a#cancelBtn {
	position: absolute;
	transform: translate(-50px, 30px);
	width: 90px; height: 28.5px;
	font-size: 15px;
	padding: 5px;
	text-align: center;
	line-height: 25px;
	margin-bottom: 50px;
}

/* 등록하기 버튼 */
#insertFunding {
	position: relative;
	right: -300px; top: 30px;
	width: 100px; height: 40px;
	font-size: 15px;
	cursor: pointer;
	margin-bottom: 50px;
}
.option_cl
{
	position: relative;
	right: 0px; top: 15px;
}
#goods_container 
{
	display: grid;
	position: relative;
	width: 600px;
	top: 10px; left: 0px;
	grid-template-columns: 30% 30% 30%;
}
#goods_container input
{
	width: 150px; height: 20px;
	margin: 0px;
	border: none;
	border-bottom: 2px solid #d2d2d2;
	background-color: inherit;
}
#goods_container p {margin: 0px; margin-top: 5px; font-size: 15px;}
#goods_container .goods_sub_container {margin: 10px;}


 /* 메인 이미지 더보기를 위한 버튼들 */
:root {
	--outerPink: #3c3c3c;
	--innerPink: #FFC31E;
}
/* ---------------------------------show btn */
/* ---------- Useful Button styling ---------- */

#show_btn{
  position: relative;
  background-color: #dcdcdc;
  border-radius: 4em;
  font-size: 14px;
  color: white;
  width: 30px; height: 30px;
  padding: 0.8em 1.8em;
  cursor:pointer;
  user-select:none;
  text-align: center;
  text-decoration: none;
  transition-duration: 0.4s;
  -webkit-transition-duration: 0.4s; /* Safari */
}

#show_btn:hover {
  transition-duration: 0.1s;
  background-color: #aaaaaa;
}

#show_btn:after {
  content: "";
  display: block;
  position: absolute;
  border-radius: 4em;
  left: 0;
  top:0;
  width: 100%;
  height: 100%;
  opacity: 0;
  transition: all 0.5s;
  box-shadow: 0 0 10px 40px #aaaaaa;
}

#show_btn:active:after {
  box-shadow: 0 0 0 0 #aaaaaa;
  position: absolute;
  border-radius: 4em;
  left: 0;
  top:0;
  opacity: 1;
  transition: 0s;
}

#show_btn:active {
  top: 1px;
}
.innerSaying {
  font-size: 13px;
  margin: -2em 0 2em;
  text-align:center;
  line-height:1.3em;
}
/* #show_btn 
{
	position: relative;
	background-color: var(--outerPink);
	width: 60px;
	height: 60px;
	border-radius: 50%;
}
#show_btn::after
{
	position: absolute;
	content: "";
	background-color: var(--innerPink);
	width: 30px;
	height: 30px;
	border-radius: 50%;
	left: 15px; top: 15px;
}
#show_btn::before
{
	position: absolute;
	z-index: 1;
	content: "수정⥱";
	font-size: 10px;
	left: 17px; top: 24px;
	
} */
/* ---------------------------------show btn */

/* 메인 이미지 더보기를 위한 버튼들 */
:root {
	--outerPink: #3c3c3c;
	--innerPink: #FFC31E;
}
.show_content 
{
	position: absolute;
	width: 300px;
	height: 500px;
	background-color: inherit;
	left: 100px; transform: translate(0px, -50px);
	overflow: scroll;
	display: none;
	z-index: 1;
}
.hide_content
{
	display: inherit;
}
.img_title_h2
{
	position: relative;
	left: 0px;
}
.img_class 
{
	position: relative;
	left: 0px;
	width: 260px; height: 240px;
	
}
/* 메인 이미지 사이즈 끝 */
.file
{
	position: relative;
	right: 50px;
	width: 70px; height: 40px;
	background-color: white;
	border-radius: 50%;
	font-size: 15px;
	line-height: 40px;
	border: none;
}
.file::after 
{
	position: absolute;
	content: "사진추가";
	right: -64px;
	width: 200px; height: 50px;
	background-color: white;
	color: black;
	text-align: center;
}
.del_btn
{
	position: relative;
	left: 160px; bottom: 55px;
	width: 70px; height: 40px;
	background-color: black;
	border-radius: 50%;
}
.del_btn::after
{
	content: "삭제하기";
	position: relative;
	font-size: 14px;
	left: 1px;
	top: 10px;
}

#backToHome_btn
{
	position: absolute;
	right: -50px; bottom: 0%;
	width: 60px; height: 60px;
	border-radius: 50%;
	background-color: #dcdcdc;
	border-color: #dcdcdc;
	color: black;
	cursor: pointer;
	font-size: 15px;
	text-align: center;
	line-height: 15px;
}
#backToHome_btn::before
{
	content: "";
	position: absolute;
	width: 3px; height: 40.5px;
	background-color: black;
	top: -40px; right: 28px;
	cursor: default;
}
#submit_btn
{	
	position: absolute;
	right: -50px; bottom: 100px;
	width: 60px; height: 60px;
	border-radius: 50%;
	background-color: #dcdcdc;
	border-color: #dcdcdc;
	color: black;
	cursor: pointer;
}
#submit_btn::before
{
	content: "";
	position: absolute;
	width: 3px; height: 40.5px;
	background-color: black;
	top: -42px; right: 27px;
	z-index: 0.5;
	cursor: default;
}
input[type=reset]
{
	position: absolute;
	right: -50px; bottom: 185px;
	width: 60px; height: 60px;
	border-radius: 50%;
	background-color: #dcdcdc;
	border-color: #dcdcdc;
	color: black;
	cursor: pointer;
}

/* ------------------------------------------------ */
input.upload_text {/*읽기전용 인풋텍스트*/
	float:left;
	width:230px;/* 버튼 포함 전체 가로 길이*/
	height:19px;
	line-height:19px;
	padding:0 3px;
	border:1px solid #bbb;
}

div.upload-btn_wrap input.size_down {/*파일찾기 폼 투명하게*/
	position:absolute;
	top:0;
	right:0;
	cursor:pointer;
	opacity:0;
	filter:alpha(opacity=0);
	-ms-filter:"alpha(opacity=0)";
	-moz-opacity:0;
}
.btn_div {
 	border: 1px solid black;
}
div.upload-btn_wrap {/*버튼테두리 감싼 div*/
	overflow:hidden;
	position:relative;
	float:left;
	width:70px;/*width, height 값은 button(찾아보기)값과 같아야함 */
	height:21px;
	padding-left:3px;
	font-size: 15px;
}
div.upload-btn_wrap div {/*버튼 div*/
	width:70px;
	height:21px;
	font-weight:bold;
	background:#dcdcdc;
	border:1px solid #dcdcdc;
	color:#fff;
}
/* ------------------------------------------------ */


.adminContainerLeft {height: inherit;}
.adminContainerWrapper {height: 1500px;}
</style>
<script>

confirm_al = () => {
	//param.sendBtn
	swal("선택된 수정사항이 없습니다.", {
		buttons: {
			go_main:"메인페이지로 이동",
			go_update:"수정사항 선택하러 이동"
			}
	})
	.then ((e) => {
		if (e === "go_main") {
			location.href="fundingAdminHome.jsp";
		} else {
			location.href="updateProject.do?user_no=${param.user_no}&pro_no=${param.pro_no}";
		}
	});
}
window.onload = () => {
	// 고객이 수정사항 없이 들어왔을 경우 보여줄 컨펌창
	if ("${param.sendBtn}" === '') {
		confirm_al();		
	}
	$("#datepicker,#datepicker2").datepicker({
		dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
	});
	
	// 달력값을 사용자가 선택해야 켜짐.
	if ("${param.i7}" !== '') {
		timeSetting();	
		document.getElementById("datepicker").onchange = invalidAccessToDate;
		document.getElementById("datepicker2").onfocus = chk_date;
		document.getElementById("datepicker2").onchange = date1;
	}
		
	// 초기 이미지 값 생성
	if ("${param.i6}" !== '') {
		create_img();
		// 메인이미지 더보기 버튼
		document.getElementById("show_btn").onclick = show_img;
	}
	
	// 서브밋
		document.getElementById("submit_btn").onclick = blockBlankSubmit;
}
// 초기 이미지 미리보기 값 생성
let img_box = "";
// 이미지 스트링으로 디비에 전달해줄 변수
let img_main_full = "";
create_img = () => {
	img_box = "${projectOne.pro_img_path}".split("^");
	for (let i = 0; i < img_box.length; i++) {
		// 이미지 태그
		console.log(img_box.length);
		
		let pic_box = document.createElement("img");
		pic_box.src = img_box[i];
		pic_box.setAttribute("class", "img_class img"+i);
		pic_box.setAttribute("id",img_box[i]);
		document.querySelector(".show_content").appendChild(pic_box);
		
		// 이미지 추가를 위한 태그
		let create_file = document.createElement("input");
		create_file.setAttribute("type","file");
		create_file.setAttribute("name","pro_img_path_fake");
		/* create_file.setAttribute("value",img_box[i]); */
		create_file.setAttribute("onchange","activity_img(this)");
		create_file.className = "file file"+i;
		document.querySelector(".show_content").appendChild(create_file);
		
		// 삭제버튼
		let create_del_btn = document.createElement("div");
		create_del_btn.setAttribute("onclick","delete_img(this)");
		create_del_btn.setAttribute("class", "del_btn");
		
		document.querySelector(".show_content").appendChild(create_del_btn);
	}
}

// 이미지 생성

let add_img_idx = 0;
function activity_img (e) {
	// 이미지 추가를 위한 인풋 파일 태그
	let create_file = document.createElement("input");
	create_file.setAttribute("type","file");
	create_file.setAttribute("name","pro_img_path_fake");
	/* create_file.setAttribute("value","img/main_img/" + e.value.slice(e.value.lastIndexOf("\\")+1)); */
	create_file.setAttribute("onchange","activity_img(this)");
	create_file.className = "file num_file";
	add_img_idx++;
	e.after(create_file);
	
	
	/* let create_img = document.createElement("img");
	create_img.src = "img" + e.value.slice(e.value.lastIndexOf("\\"));
	create_img.setAttribute("class", "img_class"); */
	let create_img = document.createElement("img");
	const file = new FileReader();
	file.readAsDataURL(e.files[0],"UTF-8");
	file.onload = function () {
		create_img.src = this.result;
	}
	create_img.setAttribute("class", "img_class"); 
	create_img.setAttribute("id","img/main_img/" + e.value.slice(e.value.lastIndexOf("\\")+1));
	e.after(create_img);
	
	
	// 삭제버튼
	let create_del_btn = document.createElement("div");
	create_del_btn.setAttribute("onclick","delete_img(this)");
	create_del_btn.setAttribute("class", "del_btn del_btn1");

	e.after(create_del_btn);
	
}

// 메인이미지 삭제를 위한 함수
function delete_img (e) {
	e.previousSibling.remove();
	e.previousSibling.remove();
	e.remove();
	
	// 사진이 0개일 때 파일인풋 만들기 위한 조건문
	if (document.querySelector(".show_content").getElementsByTagName("img").length === 0) {
		create_img();
	}
}


// 타임세팅
timeSetting = () => {
	 	let start = "${projectOne.pro_start_dt }".slice(0,"${projectOne.pro_start_dt}".lastIndexOf(" "))
	 	let close = "${projectOne.pro_close_dt }".slice(0,"${projectOne.pro_close_dt}".lastIndexOf(" "));
	 
		 frm.pro_start_dt.value = start;
		 frm.pro_close_dt.value = close;
		 let calDay = calDate(frm.pro_start_dt, frm.pro_close_dt);
		 
		 document.getElementById("expectedDay").innerHTML = calDay[0] + "일";	
	 
}
//시작일이 0보다 적어질 때 얼럿.
invalidAccessToDate = () => {
	let day1 = document.getElementById("datepicker");
	let day2 = document.getElementById("datepicker2");
	
	let calDay = calDate(day1, day2);
	
	if (day2.value.trim() !== "" && calDay[2] <= calDay[1]) {
		swal("시작일이 선택된 진행기간보다 적을 수 없습니다!\n다시 선택해주세요!");
		day1.value = "";
		day2.value = "";
		document.getElementById("expectedDay").innerHTML = "0일";
	} else {
		document.getElementById("expectedDay").innerHTML = calDay[0] + "일";
	}
}
// 프로젝트 시작~종료일 계산 후 view에 그 일정을 출력하기 위한 메소드임.
date1 = () => {
	let day1 = document.getElementById("datepicker");
	let day2 = document.getElementById("datepicker2");
	
	let calDay = calDate(day1, day2);
	
	if (day2.value.trim() !== "" && calDay[2] <= calDay[1]) {
		swal("시작일이 선택된 진행기간보다 적을 수 없습니다!\n다시 선택해주세요!");
		day1.value = "";
		day2.value = "";
		document.getElementById("expectedDay").innerHTML = "0일";
	}
	
	document.getElementById("expectedDay").innerHTML = calDay[0] + "일";
}
// 시작일부터 선택시키기 위해.
chk_date = () => {
	if (document.getElementById("datepicker").value.trim() === "") {
		swal("희망 시작일부터 선택해주세요!");
	}
}
// 일수 차이 계산
calDate = (day1, day2) => {
	let splDay1 = day1.value.split("-");
	let splDay2 = day2.value.split("-");
	
	ymd2 = new Date(splDay2[0], splDay2[1]-1, splDay2[2]);
	ymd = new Date(splDay1[0], splDay1[1]-1, splDay1[2]);
	
	// 계산
	let day_diff = ymd2.getTime() - ymd.getTime();
	let calDay = Math.ceil(day_diff / (1000 * 3600 * 24));
	
	let arrDay = [calDay, ymd, ymd2];
	return arrDay;
}
// 썸네일 컨트롤러로 보낼 파라미터 및 이미지 변경
function changeThumb (e) {
	let path = frm.pro_thumbnail_path_fake;
	const file = new FileReader();
	file.readAsDataURL(e.files[0],"utf-8");
	file.onload = function () {
		document.getElementById("imgTag").src = this.result;	
	}
	frm.pro_thumbnail_path.value = "img/thumb/" + path.value.slice((path.value.lastIndexOf("\\")+1));
	document.querySelector('.upload_text').value = e.value;
}

backToHome = () => {
	location.href="funding_submit.jsp";
}

// 메인 이미지 더보기 버튼
function show_img (e) {
	let show_background = document.querySelector(".show_content");
	if (!Array.from(show_background.getElementsByClassName("file")).includes(e.target) && !Array.from(show_background.getElementsByClassName("del_btn")).includes(e.target)) {
		show_background.classList.toggle("hide_content");	
	};
}

// 리셋 시 사진값 넣어주기.
reset_btn = () => {
	console.log("초기화버튼 클릭시 사진, 달력 수치가 변하지 않아서 해결을 위한 코드 입력해줘야함.");
	if ("${param.i6}" !== '') {
		while (document.querySelector(".show_content").hasChildNodes()) {
			document.querySelector(".show_content").lastChild.remove();
		}
		create_img();
	}
	if ("${param.i5}" !== '') {
		frm.pro_thumbnail_path.value = "${projectOne.pro_thumbnail_path }";
		document.getElementById("imgTag").src = "${projectOne.pro_thumbnail_path }";
	}
	if ("${param.i7}" !== '') {
		console.log("로그7");
		timeSetting();
	}
}

//필수항목 여백일 때 전송 막아주기 함수
function blockBlankSubmit () {
	if (frm.pro_cateno.value.trim() === "") {
		swal("카테고리 선택은 필수항목입니다!");
		frm.cate_no.focus();
		return false;	
	} else if (frm.pro_title.value.trim() === "") {
		swal("제목은 필수항목입니다!");
		frm.pro_title.focus();
		return false;
	} else if (frm.pro_stitle.value.trim() === "") {
		swal("부제목은 필수항목입니다!");
		frm.pro_stitle.focus();
		return false;
	} else if (frm.pro_gprice.value.trim() === "") {
		swal("목표금액은 필수항목입니다!");
		frm.pro_gprice.focus();
		return false;
	} else if (frm.pro_thumbnail_path.value.trim() === "") {
		swal("썸네일 사진은 필수항목입니다!");
		frm.pro_thumbnail_path_fake.focus();
		return false;
	} else if ("${param.i6}" !== '') {
		if (Array.from(frm.querySelector(".show_content")).includes(frm.pro_img_path_fake) && Array.from(document.querySelector(".show_content")).includes(document.querySelector(".num_file"))) {
			swal("내용에 들어갈 사진은 필수항목입니다!");
			document.querySelector("#show_btn").focus();
			return false;	
		} else {
			let arr_img = "";
			console.log(arr_img + " : 포문 들어가기 전 arr_img상태");
			// 스트링 링크 생성
			for (let i of document.querySelector(".show_content").getElementsByTagName("img")) {
				arr_img += "^"+i.getAttribute("id");
				console.log(i.getAttribute("id")+ " <<<");
				console.log(arr_img.substring(1) + " : 아르르이미지");
			}
			frm.pro_img_path.value = arr_img.substring(1);
			frm.pro_count.value = document.querySelector(".show_content").getElementsByClassName("num_file").length;	
		}
		
	} else if (frm.pro_start_dt.value.trim() === "" || frm.pro_close_dt.value.trim() === "") {
		swal("행사일정 중 시작일 혹은 종료일이 지정되지 않았습니다. \n시작일 혹은 종료일은 필수항목입니다!");
		frm.pro_start_dt.focus();
		return false;
	}
	
	frm.action = "completeUpdateProject.do";
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
						<form name="frm" method="post" enctype="multipart/form-data">
							<!-- 카테고리 -->
							<c:if test="${param.i1 != ''}">
								<h2>카테고리</h2>
									<select name="pro_cateno">
										<c:forEach var="test" items="${cateList }">
											<option value="${test.key }">${test.value }</option>
										</c:forEach>
									</select>
							</c:if>
							<c:if test="${param.i1 == ''}">
								<input type="hidden" name="pro_cateno" value="${ projectOne.pro_cateno }">
							</c:if>
							<!-- 제목 -->
							<c:if test="${param.i2 != ''}">
								<h2>제목</h2>
								<input type="text" name="pro_title" value="${ projectOne.pro_title }">
							</c:if>
							<c:if test="${param.i2 == ''}">
								<input type="hidden" name="pro_title" value="${ projectOne.pro_title }">
							</c:if>
							<!-- 부제목 -->
							<c:if test="${param.i3 != ''}">
								<h2>부제목</h2>
								<input type="text" name="pro_stitle" value="${ projectOne.pro_stitle }">
							</c:if>
							<c:if test="${param.i3 == ''}">
								<input type="hidden" name="pro_stitle" value="${ projectOne.pro_stitle }">
							</c:if>
							<!-- 금액 -->
							<c:if test="${param.i4 != ''}">
								<h2>목표금액</h2>
								<input type="text" name="pro_gprice" value="${ projectOne.pro_gprice }">
							</c:if>
							<c:if test="${param.i4 == ''}">
								<input type="hidden" name="pro_gprice" value="${ projectOne.pro_gprice }">
							</c:if>
							<!-- 썸네일 -->
							<c:if test="${param.i5 != ''}">
								<h2>썸네일</h2>
								<img src="${projectOne.pro_thumbnail_path }" width="200px" height="200px" id="imgTag"><br>
								<input type="text" class="upload_text upload_text_main" readonly="readonly">
								<div class="upload-btn_wrap">
					  				<div class="btn_div">
							   			<span>썸네일추가</span>  
						  			</div>
									<input type="file" name="pro_thumbnail_path_fake" class="size_down" value="${ projectOne.pro_thumbnail_path }" onchange="changeThumb(this)">
								</div><br>
								<input type="hidden" name="pro_thumbnail_path" value="${ projectOne.pro_thumbnail_path }">
							</c:if>
							<c:if test="${param.i5 == ''}">
								<input type="hidden" name="pro_thumbnail_path" value="${ projectOne.pro_thumbnail_path }">
							</c:if>
							<!-- 메인이미지 -->
							<c:if test="${param.i6 != ''}"><br>
								<h2 class="img_title_h2">메인이미지</h2>
								<div id="show_btn">
									<span class="innerSaying">확인하기</span>
									<div class="show_content"></div>
								</div>
								<input type="text" name="pro_img_path" style="display: none">
								<input type="hidden" name="pro_count">
							</c:if>
							<c:if test="${param.i6 == ''}">
								<input type="hidden" name="pro_img_path" value="${projectOne.pro_img_path }">
							</c:if><br>
							<!-- 일정 -->
							<c:if test="${param.i7 != ''}">
								<h2>펀딩 시작/종료일</h2>
								희망하는 프로젝트 기간 : <input type="text" name="pro_start_dt"
							id="datepicker" readonly placeholder="시작일을 선택해주세요." value="${fn:substring(projectOne.pro_start_dt,0,10) }"> ~ <input
							type="text" name="pro_close_dt" id="datepicker2" readonly
							placeholder="종료일을 선택해주세요." value="${fn:substring(projectOne.pro_close_dt,0,10) }">
						<div id="D-day">
							펀딩기간 : <span id="expectedDay">0일</span>
						</div>
							</c:if>
							<c:if test="${param.i7 == ''}">
								<input type="hidden" name="pro_start_dt" value="${fn:substring(projectOne.pro_start_dt,0,10) }">
								<input type="hidden" name="pro_close_dt" value="${fn:substring(projectOne.pro_close_dt,0,10) }">
							</c:if>
							<!-- 해시태그 -->
							<c:if test="${param.i9 != ''}">
								<h2>해시태그</h2>
								<input type="text" name="pro_hashtag" value="${ projectOne.pro_hashtag }" class="notCss">
								<div id="exHashTag">
									<p>#반려동물</p>
									<p>#야채</p>
									<p>#스프링</p>
								</div>
							</c:if>
							<c:if test="${param.i9 == ''}">
								<input type="hidden" name="pro_hashtag" value="${ projectOne.pro_hashtag }">
							</c:if><br>
							
							<div id="goods_div">
								<h2 class="option_cl">상품옵션 선택</h2>
								<div id="goods_container">
									<c:forEach var="goods" items="${Goods }" varStatus="idx">
										<c:if test="${goods.goods_title != '' }">
											<div class="goods_wrapper goods_${idx.count }">
												<h5>옵션${idx.count }</h5>
												<p>상품명 : <input type=text name=goods_title class=goods_class value="${goods.goods_title}"></p>
												<p>내용 : <input type=text name=goods_content class=goods_class value="${goods.goods_content }"></p>
												<p>금액 : <input type=number name=goods_price class=goods_class value="${goods.goods_price}"></p>
												<p><br></p>
												<input type="hidden" name="goods_no" value="${goods.goods_no }">
											</div>
										</c:if>
									</c:forEach>
									<input type="hidden" name="goods_type" value="펀딩">
									
								</div>
							</div>
							<button id="submit_btn">수정<br>하기</button>
							<input type="reset" value="초기화" onclick="reset_btn()">
							<input type="hidden" name="user_no" value="${projectOne.user_no }">
							<input type="hidden" name="pro_no" value="${projectOne.pro_no }">
							<input type="hidden" name="company_no" value="${projectOne.company_no }">
							<input type="hidden" name="pro_status" value="${projectOne.pro_status}">
							<input type="hidden" name="pro_type" value="${projectOne.pro_type}">
							<div onclick="backToHome()" id="backToHome_btn"><br>취소<br>하기</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
</body>
</html>
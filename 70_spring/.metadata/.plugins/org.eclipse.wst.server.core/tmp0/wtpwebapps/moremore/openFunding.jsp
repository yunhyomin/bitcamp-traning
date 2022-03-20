<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩</title>
<style>
.adminContainerContent
{
	position: relative;
	left: 140px; top: 50px;
}
.adminLeftMenu
{
	height: 1300px;
}
#datepicker, #datepicker2 {
	cursor: pointer;
	width: 130px;
	height: 20px;
	margin-bottom: 5px;
}

form {
	position: relative;
	left: 140px;
	top: 30px;
	height: inherit;
}

form h2:not(.notCss) {
	color: #CD3C3C;
}

form h2 {
	margin: 0px;
	margin-top: 10px;
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
/* .size_down {
	width: 200px;
	height: 25px;
	background-color: white;
	border: inset;
	padding-top: 2px;
} */
/* ------------------------------------------------ */
.adminContainerRightWrapper {
	
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
	transform: translate(130px, -33px);
	color: white;
	font-size: 15px;
	border: 1px solid #dcdcdc;
	border-radius: 15px;
	background-color: #dcdcdc;
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
	top: 10px; left: -10px;
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

/*                       */
button, .goMainBtn{
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
button:hover, .goMainBtn:hover{
  background:#fff;
  color:black;
}
button:before,button:after, .goMainBtn:before, .goMainBtn:after {
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #d2d2d2;
  transition:400ms ease all;
}
button:after, .goMainBtn:after {
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after, .goMainBtn:hover:before, .goMainBtn:hover:after {
  width:100%;
  transition:800ms ease all;
}
/*                       */


.adminContainerLeft {height: 1500px;}
/* .adminContainerWrapper {height: 1550px;} */
</style>
<!-- 박시콘 -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>

<!-- 달력 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<!-- 얼럿 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
<script>
	window.onload = () => {
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
		document.getElementById("datepicker").onchange = invalidAccessToDate;
		document.getElementById("datepicker2").onfocus = chk_date;
		document.getElementById("datepicker2").onchange = date1;
		document.getElementById("insertFunding").onclick = blockBlankSubmit;
		document.getElementById("closeDiv").onclick = closeDiv;
		document.getElementById("show_img").onclick = showDiv;
		
		//굿즈태그생성
		goods_quantity();
	}
	// 사진미리보기 클릭 시 미리보기 화면을 띄워줄 함수
	showDiv = () => {
		document.getElementById("img_div").style.display = "inherit";
	}
	
	// 사진미리보기 DIV를 닫아줄 함수
	closeDiv = () => {
		document.getElementById("img_div").style.display = "none";
	}
	
	// 시작일이 0보다 적어질 때 얼럿.
	invalidAccessToDate = () => {
		let day1 = document.getElementById("datepicker");
		let day2 = document.getElementById("datepicker2");
		
		let calDay = calDate(day1, day2);
		
		if (day2.value.trim() !== "" && calDay[2] <= calDay[1]) {
			swal("시작일이 선택된 진행기간보다 적을 수 없습니다!\n다시 선택해주세요!");
			day1.value = "";
			day2.value = "";
			document.getElementById("expectedDay").innerHTML = "0일";
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
	
	// 필수항목 여백일 때 전송 막아주기 함수
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
		} else if (frm.pro_thumbnail_path_fake.value.trim() === "") {
			swal("썸네일 사진은 필수항목입니다!");
			frm.pro_thumbnail_path_fake.focus();
			return false;
		} else if (document.querySelector(".pro_img").value.trim() === "") {
			swal("내용에 들어갈 사진은 필수항목입니다!");
			document.querySelector(".pro_img").focus();
			return false;
		} else if (frm.pro_start_dt.value.trim() === "" || frm.pro_close_dt.value.trim() === "") {
			swal("행사일정 중 시작일 혹은 종료일이 지정되지 않았습니다. \n시작일 혹은 종료일은 필수항목입니다!");
			frm.pro_start_dt.focus();
			return false;
		} else {
			frm.action = "insertFunding.do";
			frm.submit();	
		}
		
	}
	
	// 이미지 미리보기를 위한 함수
	show_img = (e) => {
		let main = frm.pro_thumbnail_path_fake;
		let file = new FileReader();		
		let imgName = "img/thumb/"+e.value.slice(e.value.lastIndexOf("\\")+1);
		file.readAsDataURL(e.files[0],"utf-8");	
		file.onload = function () {
			document.getElementById("thumb_img").src = this.result;	
		}
		console.log(imgName);
		document.getElementById("push_thumbPath").value = imgName;
		
		document.querySelector('.upload_text').value = e.value;
	}
	
	// 메인 페이지 이미지를 미리보기 위한 함수
	show_imgs = (e) => {
		let main = document.getElementById("show_img");
		if (document.getElementById("push_imgPath").value.trim() !== "") {
			document.getElementById("push_imgPath").value = "";
			// 이미지를 담는 디아이브이 접근 변수
			let img_div = document.getElementById("img_div");
			while (document.getElementById("img_div").hasChildNodes()) {
				img_div.removeChild(img_div.lastChild);
				
				if (img_div.lastChild === document.getElementById("deleteNonPTag")){
					break;
				}
		}
		
	}
		let str = "";
		
		for (let i = 0; i < e.files.length; i++) {
			file = new FileReader();
			file.readAsDataURL(e.files[i],"utf-8");
			str += "^img/main_img/"+e.files[i].name;
			
			let imgName = str;
			let imgTag = document.createElement("img");
			file.onload = function () {
				imgTag.setAttribute("src",this.result);
			}
			imgTag.style.width = "260px";
			imgTag.style.height = "150px";
			
			document.getElementById("img_div").appendChild(imgTag);
			
		}
		document.getElementById("push_imgPath").value += str.substring(1);
		// 소스 보여줄 디아이브이에 넣기
		document.querySelector('.upload_text_main').value = e.files.length + "개 파일 등록됨";
	}
	
	// 상품 관련 스크립트 영역
	goods_quantity = () => {
		let goods = "";
		// 가공
		for (let i = 1; i < 4; i++) {
			goods += "<div class='goods_sub_container sub_"+i+"'<h6>옵션"+i+"</h6><p><input type=text name=goods_title class=goods"+i+" value='${Goods[0].goods_title}' placeholder='상품명을 입력해주세요.'></p>"
			+ "<p><input type=text name=goods_content class=goods"+i+" value='${Goods[0].goods_content}' placeholder='상품정보를 입력해주세요.'></p>"
			+ "<p><input type=number name=goods_price class=goods"+i+" value='${Goods[0].goods_price}' placeholder='가격을 입력해주세요.'></p>"
			+ "</div>";
		}
		document.getElementById("goods_container").innerHTML = goods;
	}
	
</script>
</head>
<body>
	<%@include file="adminHeader.jsp"%>
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
					<h8>프로젝트 관리</h8>
				</div>
				<div class="adminContainerContent">
					<form name="frm" enctype="multipart/form-data" method="post">
						<h2>*카테고리 선택</h2>
						<select name="pro_cateno">
							<option value="" disabled selected>카테고리를 선택해주세요.</option>
							<c:forEach var="cateList" items="${cateList }">
								<option value="${cateList.key}">${cateList.value }</option>
							</c:forEach>
						</select>

						<h2>*펀딩제목</h2>
						<input type="text" name="pro_title" placeholder="제목을 입력해주세요.">
						<h2>*부제목</h2>
						<input type="text" name="pro_stitle" placeholder="부제목을 입력해주세요.">
						<h2>*목표금액</h2>
						<input type="text" name="pro_gprice"
							placeholder="목표액을 입력해주세요.ex)5000000">
						<h2>*썸네일 사진</h2>
						<img src="" alt="썸네일 사진을 등록해주세요." class="img_content"
							id="thumb_img"><br>
						<!--input box-->
						<input type="text" class="upload_text" readonly="readonly">
						<!--button-->
						<div class="upload-btn_wrap">
				  			<div class="btn_div">
						   		<span>썸네일추가</span>  
					  		</div> 
							<input type="file" name="pro_thumbnail_path_fake" class="size_down" onchange="show_img(this)">
					  	</div><br>
						<h2>*홍보 사진</h2>
						<div class="img_content img_main" id="img_div">
							<p id="deleteNonPTag">
								<i class='bx bx-x' id="closeDiv"></i>
							</p>
						</div>
						<!--input box-->
						<input type="text" class="upload_text upload_text_main" readonly="readonly">
						<div class="upload-btn_wrap">
				  			<div class="btn_div">
						   		<span>내용추가</span>  
					  		</div> 
						<input type="file" name="pro_img_path_fake"
							multiple="multiple" class="size_down pro_img" onchange="show_imgs(this)">
						</div><br>
						<div id="show_img">등록사진 미리보기</div>
						
						<h2>*펀딩 시작/종료일</h2>
						희망하는 프로젝트 기간 : <input type="text" name="pro_start_dt"
							id="datepicker" readonly placeholder="시작일을 선택해주세요."> ~ <input
							type="text" name="pro_close_dt" id="datepicker2" readonly
							placeholder="종료일을 선택해주세요.">
						<div id="D-day">
							펀딩기간 : <span id="expectedDay">0일</span>
						</div>
						<h2 class="notCss">해시태그(선택)</h2>
						<input type="text" name="pro_hashtag" placeholder="내용을 입력해주세요.">
						<div id="exHashTag">
							<p>#반려동물</p>
							<p>#야채</p>
							<p>#스프링</p>
						</div>
						<div id="goods_div">
								<h2 class="option_cl">상품옵션 선택</h2>
								<div id="goods_container"></div>
								<input type="hidden" name="goods_type" value="펀딩">
								<input type="hidden" name="goods_no" value="${Goods.goods_no }">
							</div>
						<button id="insertFunding" class="goMainBtn">등록하기</button>
						<a href="fundingAdminHome.jsp" id="cancelBtn" class="goMainBtn">취소하기</a> 
						<input type="hidden" name="pro_img_path" value="" id="push_imgPath">
						<input type="hidden" name="pro_thumbnail_path" value="" id="push_thumbPath">
						<input type="hidden" name="pro_status" value="신청">
						<input type="hidden" name="pro_count" value="100">
						<input type="hidden" name="pro_type" value="펀딩">
						
						<!-- 여기는 추후 통합 시 회원정보를 이어 받아 컨트롤러에서 불러와야 함. 
								지금은 임시용으로 만든 것임.
						-->
						<input type="hidden" name="user_no" value="${sessionScope.loginUsers.user_no }">
						<input type="hidden" name="company_no" value="${param.company_no }">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
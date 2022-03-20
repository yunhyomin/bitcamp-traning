<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>HELP CENTER</title>
<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
</head>
<style>
		/************** 페이징 표시영역 ****************/
		.paging {
			list-style: none;
		}
		
		.paging li { /* 페이지넘버 리스트 한줄로 나오게 */
			float: left;
			margin-right: 8px;
		}
		
		.paging li a { /* 페이지넘버 */
			text-decoration: none;
			display: block;
			padding: 3px 7px;
			border: none;
			font-weight: bold;
			color: black;
			background-color: white;
		}
		
		.paging li a:hover {
			color: #10C0D5;
		} /* 페이지넘버 호버 됐을떼 */
		.paging .disable { /* 처음으로,다음으로 비활성화 처리 */
			border-radius: 5px;
			padding: 3px 7px;
			color: silver;
		}
		
		.paging  .now { /* 현재 페이지 일때 페이지번호 처리 */
			padding: 3px 7px;
			background-color: #d3d3d3;
			/* border-radius: 5px;  */
			color: black;
		}
		
		#pagingBOX { /* 하단 페이징 영역 */
			display: inline-block;
			left: 5px;
			width: 100%;
			font-size: 0.8em;
			text-align: center;
			position: relative;
		}
</style>
<script>
	
</script>
<style>
.listOne li {
	list-style: none;
	padding:16px;
	min-height: 103px;
}
.listOne a {
	text-decoration: none;
	color: black;
}

.img {
	width: 100px;
	hight: 30px;
	position: absolute;
	left: 80%;
	transform: translate(30%, -120px);
}
img {
	margin-top: 0px;
	
}
/* 
	.titleBox{
		display: grid;
		grid-template-columns:1% 1% 1% 25%;
	} */
#headerSlide { 
	background-color: #e9f1e77d;
	boder-bottom: 1px solid color:rgb(230,230,230);
	boder-bottom: 1px;
	boder-bottom: solid;
	boder-bottom-color: rgb(230,230,230);
	padding: 40px 40px 18px;
}
.help{
	padding: 32px 50px 60px;
	tranform: translate(10px, 800px);
}
#helpCenter{
	weight: 100px;
	font-size: 50px;
	font-weiht: lighter;
	color: #767676;
}
.searchContainer{
	
	transform: translate(0px, 30px);
}
.tabWrap{
	display: inline-flex;
	word-break: keep-all;
	magin-top: 10px;
	align-items: center;
	
}
.tabMenu{
	margin: 0px 24px 0px 0px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	height: 100%;
	color: #767676;
	cursor: pointer;
}
.tabMenu:hover {
	color: rgb(0,0,0,1);
}
ul.listOne{
	width: 100%;
	list-style: none;
	padding; 0px;
	margin: 0px;
	border-bottom: 0px;
}
.category{
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	font-size: 20px;
	font-weight: bold;
	color: rgb(161,161,161);
	transform: translate(0,40%);
}
.title{
	position: relative;
	height: 50px;
	font-size: 30px;
	line-height: 27px;
	letter-spacing: -0.02em;
	margin:0px 0px 12px;
	cursor: pointer;
	
}
.title:hover
{
	font-weight: bold; 
}
.date{
	transform: translate(0,-50%);
	font-size: 15px;
	display: block;
	color: rgb(109,109,109);
}
.titleBox{
	width: 1000px;
	height: 50px;
}
.searchK{
	width:200px;
	background:transparent;
	border: none;
	border-bottom: 2px solid #dcdcdc;
	padding: 11px 20px;
	box-size: border-box;
	height:100%;
	outline: none;
	margin:0px;
	font-size: 14px;
	transform: translate(0px, -5px);
	
}
#sss{
	height: 30px;
	font-size: 14px;
	color: rgb(61,61,61);
	border: 1px solid rgb(228, 228, 228);
	justify-content: center;
	align-items: center;
	border-radius: 4px;
	cursor: pointer;
}
select {
	height: 30px;
	font-size: 14px;
    cursor: pointer;
	
}

.write{
		display:flex;
		height: 50px;
		font-size: 14px;
		color: rgb(61,61,61);
		border: 1px solid rgb(228, 228, 228);
		justify-content: center;
		align-items: center;
		border-radius: 4px;
		cursor: pointer;
		float:right;
	}
#guide
{
	cursor: pointer;
	top: 70px;
	color: #767676;
	margin-right: 25px;
}
#guide:hover
{
	font-weight: bold; 
	color: black;
}
.inner_container_for_guide
{
	position: absolute;
	width: 500px;
	height: 925px;
	background-color: white;
	display: none;
	z-index: 1;
	border-radius: 15px;
}
.show_container_for_guide
{
	display: inline-block;
}
</style>
<body>
	<%@include file="homeHeader.jsp"%>

	<div id="headerSlide">
		<div class="help">
			<div id="helpCenter"> HelpCenter</div>
			<!-- 검색폼 공지사항/FAQ 중에 하나를 고르고 제목으로 검색 -->
			<div class="searchContainer">
				<form action="notice.do">
					<div class="search">
						<select name="searchCondition">
							<option value="">검색</option>
							<c:forEach var="option" items="${searchNotice }">
								<option value="${option.value }">${option.key }</option>
							</c:forEach>
						</select>
						<input class="searchK" type="text" name="searchKeyword" placeholder="검색어를 입력해주세요."
							autocomplete="off" autocapitalize="off"> 
						<input id="sss" type="submit" value="검색">
					</div>
				</form>
			</div>
		</div>
	<div class="tabContainerBox">
		<div class="tabContainer">
			<div class="tabWrap">
				<span class="tabMenu" onclick="location.href='notice.do'">전체보기</span>
				<span class="tabMenu"
					onclick="location.href='notice.do?searchCondition=공지사항'">공지사항</span>
				<span class="tabMenu"
					onclick="location.href='notice.do?searchCondition=FAQ'">FAQ</span>
					<span id="guide" onclick="show_guide(this)">이용가이드 보기
						<span class="inner_container_for_guide">
							<%@ include file="userguide.jsp" %>
						</span>
					</span>
		<div class="button">
		<c:if test="${sessionScope.loginUsers.user_type == '관리자'}">
			<input  class="write" type="button" onclick="location.href='insertNotice.jsp'"
				value="작성하기">
		</c:if>
		</div>
			</div>
		</div>
	</div>
	
	</div>
<hr>

	<div class="mainContainer">
		<div class="listWrapper">
			<ul class="listOne">
				<li>
				<div class="Box">
				<c:if test="${not empty noticeList}">
						<c:forEach var="notice" items="${noticeList }">
									<span class="category">${notice.customer_category }</span><br> 
							<a class="detail"
								href="detailNotice.jsp?customer_no=${notice.customer_no }">
								<div class="titleBox">
									<span class="title">${notice.customer_subject }</span>
								</div>
							</a><br>
									<c:set var="rdate" value="${notice.customer_regdate }"/>
									 <span class="date">${fn:substring(rdate,0,10)}</span>
									  
									  <c:set var="imagename" value="${notice.customer_image }"></c:set> 
									  <c:choose>
										<c:when test="${fn: contains(imagename,'^')}">
											<img class="img"
												src="${fn: substringBefore(imagename, '^') }" alt="moremore">
										</c:when>
										<c:otherwise>
											<img class="img" src="${imagename }">
										</c:otherwise>
									</c:choose>
									
									<hr>
						</c:forEach>
					</c:if> <c:if test="${empty noticeList }">
						<span>데이터가 없습니다</span>
					</c:if>
				</div>
				</li>
			</ul>
			<table class="table">
				<tr>
					<td colspan="4">
						<ol class="paging">
							<c:choose>
								<%-- [이전으로]에 대한 사용 여부 처리 --%>
								<c:when test="${pvo.beginPage == 1 }">
									<li class="disable">이전으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="notice.do?cPage=${pvo.beginPage - 1 }">이전으로</a>
									</li>
								</c:otherwise>
							</c:choose>

							<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }"
								end="${pvo.endPage }">
								<c:choose>
									<c:when test="${pageNo == pvo.nowPage }">
										<li class="now">${pageNo }</li>
									</c:when>
									<c:otherwise>
										<li><a href="notice.do?cPage=${pageNo }">${pageNo }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<%-- [다음으로]에 대한 사용 여부 처리 --%>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a href="notice.do?cPage=${pvo.endPage + 1 }">다음으로</a></li>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">다음으로</li>
							</c:if>
						</ol>
					</td>
			</table>
		</div>
		
	</div>
	<%@include file="homeFooter.jsp"%>
</body>
<script>
	show_guide = (e) => {
		document.querySelector(".inner_container_for_guide").classList.toggle("show_container_for_guide");
	}
</script>
</html>
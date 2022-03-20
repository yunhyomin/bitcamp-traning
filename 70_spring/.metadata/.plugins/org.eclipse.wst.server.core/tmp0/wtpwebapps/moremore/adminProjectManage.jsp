<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>사이트 관리자 페이지 | more more</title>
<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
</head>
<style>
	/* 테이블에 있는 프로젝트 진행 신청 완료 타이 */
	a.upCnt
	{
		position: relative;
		left: 70px;
		font-size: 15px;
		border: 2px solid #dcdcdc;
		border-radius: 4px;
		padding: 3px 6px 3px 6px;
	}
	a.cnt2
	{
		left: 90px;
	}
	a.cnt3
	{
		left: 110px;
	}
	/* 테이블에 있는 프로젝트 진행 신청 완료 타이 */
</style>
<script>
	//완료, 진행중, 대기중 인 프로젝트 건수 조회
	$.ajax("getAdminMain.do",{
						type : "get",
						dataType : "json",
						success : function(data) {
							console.log(data);
							str = "<a class='upCnt cnt1' href='getProj.do?pro_status=완료'> 완료된 프로젝트 : "
									+ data.endProj
									+ "</a>"
									+ "<a class='upCnt cnt2' href='getProj.do?pro_status=진행'> 진행중인 프로젝트 : "
									+ data.ingProj
									+ "</a>"
									+ "<a class='upCnt cnt3' href='getProj.do?pro_status=신청'> 신청상태인 프로젝트 : "
									+ data.waitProj + "</a>";

							document.getElementById("cntProj").innerHTML = str;
						},
						error : function() {
							alert("실패!");
						}
					});

	//프로젝트 상세보기
	function getProjDetail(e) {
		console.log("상세보기 시작");
		console.log(e);
		let no = {
			"pro_no" : e
		};
		$.ajax("getProjDetail.do", {
			data : no,
			type : "get",
			dataType : "json",
			success : function(data) {
				console.log("성공!");
				console.log(data);
				//태그해서 넣어주기 !!!!!!**************************8
				//pro_status가 신청이면 승인/반려 넣어주기 승인->신청에서 진행으로 업데이트 
				//									반려->신청에서 반려로 업데이트 
				//진행이면 중단 넣어주기 중단->진행에서 중단으로 업데이트 
			},
			error : function() {
				console.log("실패!");
			}
		});
	}

	//프로젝트 반려/승인 
	function yesNo() {

	}

	//프로젝트 중단 
	function proStop() {

	}
</script>
<style>
		/************** 페이지 표시영역 ****************/
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

<style>
.tableDIV{
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
.funding_table tr:not(.funding_table tfoot tr):hover
{
	background-color: #dcdcdc;
	font-weight: bold;
	cursor: pointer;
}
.funding_table td, .funding_table th {
    text-align: center;
    padding: 8px;
}

.funding_table td {
    border-right: 1px solid #f8f8f8;
    font-size: 12px;
}

.funding_table th {
    color: #ffffff;
    background: #dcdcdc;
}

  	#search
  	{
  		position: relative;
  		left: 70px;
  		height: 57px;
  		margin-top: 25px;
  	}
  	select 
  	{
  		text-align: center;
    	width: 94px;
    	height: 41px;
  	}
  	input[type="text" i]
  	{
  		height: 34px;
    	width: 368px;
	}
	input[type="submit" i] 
  	{
  		width: 65px;
    	height: 41px;
  	}
</style>
<body>

	<%@include file="siteAdminHeader.jsp" %>
	<div class="adminContainerWrapper">
		<div class="adminContainerLeft">
			<ul class="adminLeftMenu">
				<li class="adminMenuItem"><a href="siteAdminHome.jsp">MAIN</a></li>
				<li class="adminMenuItem"><a href="getUserList.do">회원관리</a></li>
				<li class="adminMenuItem"><a href="getProj.do">프로젝트관리</a></li>
				<li class="adminMenuItem"><a href="adminSalesManage.jsp">매출관리</a></li>
				<li class="adminMenuItem"><a href="notice.do">FAQ / 공지</a></li>
			</ul>
		</div>
		<div class="adminContainerRightWrapper">
			<div class="adminContainerRight">
				<div class="adminLocationArea">
					<h8>프로젝트 관리</h8>
				</div>
				<div class="adminContainerContent">
					<!-- 검색을 위한 폼 -->
					<div class="formDIV">
						<form action="getProj.do" method="get">
							<div id="search">
								<select name="searchCondition">
									<option value="">검색</option>
									<c:forEach var="option" items="${searchMap }">
										<option value="${option.value }">${option.key }</option>
									</c:forEach>
								</select> <input type="text" name="searchKeyword"> <input
									type="submit" value="검색">
							</div>
							<div id="cntProj"></div>
						</form>
						<!-- 프로젝트 정보  -->
						<div class="tableDIV">
							<table class="funding_table">
								<tr>
									<th>프로젝트 번호</th>
									<th>현황</th>
									<th>제목</th>
									<th>시작일</th>
									<th>종료일</th>
								</tr>
								<c:if test="${not empty projectList }">
									<c:forEach var="projects" items="${projectList }">
										<tr>
											<td>${projects.pro_no }</td>
											<td>
												<a href="javascript:getProjDetail(${projects.pro_no })">${projects.pro_status }</a>
											</td>
											<td>${projects.pro_title }</td>
											<c:set var="start" value="${projects.pro_start_dt  }"/>
											<c:set var="close" value="${projects.pro_close_dt  }"/>
											<td>${fn:substring(start,0,10)}</td>
											<td>${fn:substring(close,0,10)}</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty projectList }">
									<tr>
										<td>데이터가 없습니다</td>
									</tr>
								</c:if>
								<tfoot>
									<tr>
										<td colspan="4">
											<ol class="paging">
												<c:choose>
													<%-- [이전으로]에 대한 사용 여부 처리 --%>
													<c:when test="${pvo.beginPage == 1 }">
														<li class="disable">이전으로</li>
													</c:when>
													<c:otherwise>
														<li><a href="getProj.do?cPage=${pvo.beginPage - 1 }">이전으로</a>
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
															<li><a href="getProj.do?cPage=${pageNo }">${pageNo }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
				
												<%-- [다음으로]에 대한 사용 여부 처리 --%>
												<c:if test="${pvo.endPage < pvo.totalPage }">
													<li><a href="getProj.do?cPage=${pvo.endPage + 1 }">다음으로</a></li>
												</c:if>
												<c:if test="${pvo.endPage >= pvo.totalPage }">
													<li class="disable">다음으로</li>
												</c:if>
											</ol>
									  </td>
								</tfoot>								
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
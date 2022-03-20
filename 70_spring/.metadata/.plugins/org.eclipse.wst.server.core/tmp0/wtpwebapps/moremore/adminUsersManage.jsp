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
<script>
	$.ajax("getAdminMain.do", {
		type : "get",
		dataType : "json",
		success : function(data) {
			console.log("data받기 성공!!");
			document.getElementById("totalCnt").innerHTML += " : "+data.cntTot + "명";
		}
	});
</script>
<style>
		/************** 페이지 표시영역 ****************/
		.paging {
			list-style: none;
			width: 400px;
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
.userContainer{
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
.funding_table tr:not(.funding_table tfoot tr):hover
{
	background-color: #dcdcdc;
	cursor: pointer;
}
.funding_table td {
    border-right: 1px solid #f8f8f8;
    font-size: 12px;
}

.funding_table th {
    color: #ffffff;
    background: #dcdcdc;
}

/* <!-- 테이블 헤더 --> */
#totalCnt
	{
		position: relative;
		left: 70px;
		font-size: 15px;
		border: 2px solid #dcdcdc;
		border-radius: 4px;
		padding: 3px 6px 3px 6px;
		display: inline;
	}
/* <!-- 테이블 헤더 --> */
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
	<%-- <c:if test="${empty sessionScope.tot || sessionScope.tot eq null }">
		<c:set var="tot" value="${cntTot }" scope="session"></c:set>
	</c:if> --%>

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
					<h8>회원관리</h8>
				</div>
				<div class="adminContainerContent">
					<!-- 검색을 위한 폼 -->
					<div class="formDIV">
						<form action="getUserList.do" method="get">
							<div id="search">
								<select name="searchCondition">
									<option value="">검색</option>
									<c:forEach var="option" items="${conditionMap }">
										<option value="${option.value }">${option.key }</option>
									</c:forEach>
								</select> <input type="text" name="searchKeyword"> 
								<input type="submit" value="검색">
							</div>
							<div id="totalCnt">전체 회원 수</div>
						</form>
						<!-- 회원정보  -->
						<div class="userContainerBox">
							<div class="userContainer">
								<table class="funding_table">
									<tr>
										<th>회원번호</th>
										<th>회원아이디</th>
										<th>회원이름</th>
										<th>PHONE</th>
										<th>EMAIL</th>
										<th>주소</th>
										<th>우편번호</th>
										<th>성별</th>
										<th>회원가입일</th>
										<th>회원구분</th>
										<th>탈퇴 사유</th>
									</tr>
									<c:if test="${not empty userList }">
										<c:forEach var="users" items="${userList }">
											<tr>
												<td>${users.user_no }</td>
												<td>${users.user_id }</td>
												<td>${users.user_name }</td>
												<td>${users.user_phone }</td>
												<td>${users.user_email }</td>
												<td>${users.user_address }</td>
												<td>${users.user_address_number}</td>
												<td>${users.user_gender }</td>
												<c:set var="date" value="${users.user_joindate }"/>
												<td>${fn:substring(date,0,10)}</td>
												<td>${users.user_type }</td>
												<td>${users.user_withdrawal_reason }</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty userList }">
										<tr>
											<td colspan="5">
												<h2>현재 가입된 회원이 없습니다</h2>
											</td>
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
														<li><a href="getUserList.do?cPage=${pvo.beginPage - 1 }">이전으로</a>
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
															<li><a href="getUserList.do?cPage=${pageNo }">${pageNo }</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
				
												<%-- [다음으로]에 대한 사용 여부 처리 --%>
												<c:if test="${pvo.endPage < pvo.totalPage }">
													<li><a href="getUserList.do?cPage=${pvo.endPage + 1 }">다음으로</a></li>
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
	</div>
</body>
</html>
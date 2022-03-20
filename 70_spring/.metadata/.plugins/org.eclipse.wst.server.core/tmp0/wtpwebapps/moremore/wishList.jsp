<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요</title>
<!-- 마이페이지에 통합함 / 버려도 됨 -->
<style>
	.wishContainer {
		margin: 0;
		padding: 0;
		border: 0;
		font: inherit;
		vertical-align: middle;
	}
	.wishtitle {
		font-size: 14px;
	}
	table {
		border-collapse: collapse;
		border-spacing: 0;
		position: relative;
		margin: 10px 0 0;
		border: 1px solid #d7d5d5;
		border-top-color: #d7d5d5;
		line-height: 1.5;
	}
	th {
		padding: 10px 0 10px;
		border-left: 1px solid #dfdfdf;
		border-bottom: 1px solid #dfdfdf;
		vertical-align: middle;
		font-weight: normal;
		font-size: 16px;
		background-color: #fbfafa;
	}
	.wish {
		text-align: center;
	}
	.wishleft {
		text-align: left;
		padding-left: 10px;
		font-size: 17px;
	}
	.proname {
		text-decoration: none;
		font-weight: bold;
	}
	.date {
		margin: 9px 0 0;
		color: #757575;
		line-height: 12px;
		font-size: 14px;
	}
	td {
		padding: 11px 10px 10px;
		border-top: 1px solid #dfdfdf;
		vertical-align: middle;
	}	
</style>
</head>
<body>

<form action="getWishList.do" method="post"></form>	
<div class="wishContainer">
<div>
	<div class="wishtitle">
		<p>관심 프로젝트</p>
	</div>
	<table border="1" summary>
		<colgroup>
			<col style="width:135px;">
			<col style="width:420px;"> <!-- auto -->
			<col style="width:111px;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">이미지</th>
				<th scope="col">펀딩 정보</th>
				<th scope="col">진행 상황</th>
			</tr>
		</thead>
		<tbody class="wish">
			<tr class="wishinfo">
				<td class="thumb">
					<a href="project.jsp"> <!-- 프로젝트로 연결 -->
						썸네일 <%-- ${wishlist.pro_thumbnail_path} --%>
					</a> 
				</td>
				<td class="wishleft">
					<a href="project.jsp"> <!-- 프로젝트로 연결 -->
						<div class="proname">프로젝트 명</div> <%-- ${wishlist.pro_title} --%> <br><br>
					</a> 
					<div class="date">종료 일자 <%-- ${wishlist.pro_close_dt} --%></div> 
				</td>
				<td class="state">
					펀딩 진행 중 <%-- ${wishlist.pro_status} --%>
				</td>
			</tr>
		</tbody>
	</table>
</div>	
</div>	

</body>
</html>
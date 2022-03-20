<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여 프로젝트 리스트</title>
<style>
	.orderContainer {
		margin: 0;
		padding: 0;
		border: 0;
		font: inherit;
		vertical-align: middle;
	}
	.ordertitle {
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
	.orderlist {
		text-align: center;
	}
	.orderleft {
		text-align: left;
		padding-left: 10px;
		font-size: 17px;
	}
	.option {
		display: flex;
		margin: 9px 0 0;
		color: #757575;
		line-height: 12px;
		font-size: 14px;
		justify-content: space-between;
	}
	td {
		padding: 11px 10px 10px;
		border-top: 1px solid #dfdfdf;
		vertical-align: middle;
	}
	.orderright {
		padding-left: 0;
		padding-right: 0;
	}
</style>
</head>
<body>

<form action="getOrderList.do" method="post"></form>
<div class="ordertitle">
	<p>참여한 펀딩</p>
</div>
<div class="orderContainer">
	<table border="1" summary>
		<colgroup>
			<col style="width:135px;">
			<col style="width:420px;"> <!-- auto -->
			<col style="width:65px;">
			<col style="width:111px;">
			<col style="width:111px;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">이미지</th>
				<th scope="col">펀딩 정보</th>
				<th scope="col">수량</th>
				<th scope="col">
					참여 일자<br>
					구매 번호
				</th>
				<th scope="col">
					결제금액<br>
					결제 현황
				</th>
			</tr>
		</thead>
		<tbody class="orderlist">
			<tr class="orderinfo">
				<td class="thumb">
					<a href="#"> <!-- 프로젝트로 연결 -->
						썸네일  <!-- pro_thumbnail_path -->
					</a> 
				</td>
				<td class="orderleft">
					<a href="order.jsp"> <!-- 결제정보로 연결 -->
						<strong>프로젝트 명 <!-- pro_title --></strong><br><br>
					</a> 
					<div class="option">
						<div class="reward">리워드 옵션 <!-- goods_title --></div> 
						<div class="state">펀딩 진행 중 <!-- pro_status --></div>
					</div> 
				</td>
				<td>1 <!-- order_ea --></td>
				<td class="orderdate">
					<p>날짜 <!-- order_date --></p> 
					<p>구매 번호 <!-- order_no --></p>
				</td>
				<td class="orderright">
					<strong>[금액] <!-- payment_price --></strong>  
					<p>결제 현황 <!-- order_ea --></p>   
				</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>
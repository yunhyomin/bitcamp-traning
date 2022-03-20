<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/jsCalendar.css">
    <!-- font 설정-->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

    <!--jsCalendarAPI -->
    <script type="text/javascript" src="calender/jsCalendar.js"></script>
    <script src="calender/jsCalendar.datepicker.js"></script>
    
<meta charset="UTF-8">
<title>사이트 관리자 페이지 | more more</title>
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
  <style>
  </style>
</head>
<script>



	//페이지 열리자 마자 모든기간 매출금액과 건수, 반품완료 금액과 건수 
	$.ajax("datePick.do",{
		type: "get",
		dateType: "json",
		success:function(data){
			console.log(data);
			document.querySelector(".saleMoney").innerHTML = data.sales[0].SALESUM.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			document.querySelector(".saleCount").innerHTML = data.sales[0].COUNT +"건";
			
			document.querySelector(".cancelMoney").innerHTML = data.cancel[0].SALESUM.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			document.querySelector(".cancelCount").innerHTML = data.cancel[0].COUNT + "건";
			
			new Chart(document.getElementById("topDoughnut-chart"), {
			    type: 'doughnut',
			    data: {
			      labels: ["여성","남성"],
			      datasets: [
			        {
			          label: "Population (millions)",
			          backgroundColor: ["#c45850","#3cba9f"],
			          data: [data.womanSale[0].WOMANTOTAL,(data.sales[0].SALESUM)-(data.womanSale[0].WOMANTOTAL)]
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			        text: ''
			      }
			    }
			});
			
			new Chart(document.getElementById("bottomDoughnut-chart"), {
			    type: 'doughnut',
			    data: {
			      labels: ["뷰티", "홈&리빙", "푸드", "반려동물"],
			      datasets: [
			        {
			          label: "Population (millions)",
			          backgroundColor: ["#29577b", "#35c09c","#f6ce49","#f7a35c"],
			          data: [data.category[0].CATESUM,data.category[1].CATESUM,data.category[2].CATESUM,data.category[3].CATESUM]
			        }
			      ]
			    },
			    options: {
			      title: {
			        display: true,
			        text: ''
			      }
			    }
			});

			let result = "";
				for(let i=0; i<=4; i++){
				    const total = (data.rankProj[i].TOTAL).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				result += "<tr>"
						+"<td>"+data.rankProj[i].PRO_NO+"</td>"
						+"<td>"+data.rankProj[i].USER_NO+"</td>"
        			    +"<td>"+data.rankProj[i].PRO_TITLE+"</td>";
        			    if (data.rankProj[i].PRO_HASHTAG == undefined) {
	        			     result +="<td>-</td>";	
	        			    } else {
	        			    	result += "<td>"+data.rankProj[i].PRO_HASHTAG+"</td>";
	        			    }	        			    
	        			   result += "<td>"+total+"</td>"
	        			    		+"</tr>";
				}
					document.querySelector(".ProjTable").innerHTML = result;
			let customer = "";
				for(let i=0; i<=4; i++){
					const total = (data.rankUser[i].TOTAL).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					customer += "<tr>"
								+"<td>"+data.rankUser[i].USER_NO+"</td>"
								+"<td>"+data.rankUser[i].USER_ID+"</td>"
								+"<td>"+data.rankUser[i].USER_EMAIL+"</td>"
								+"<td>"+total+"</td>"
		        			    +"</tr>";
				}
				document.querySelector(".customerTable").innerHTML = customer;
				
				
		},
		error:function(){
			alert("불러오기 실패!");
		}
	});
	//기간별 매출금액과 건수, 반품완료 금액과 건수 
	const getDate = () =>{
		let startDate = document.getElementById("jsCal1-text").value;
		let endDate = document.getElementById("jsCal2-text").value;
		const date = {"startDate":startDate , "endDate":endDate};
		$.ajax("datePick.do",{
			type: "get",
			dateType: "json",
			data: date,
			success:function(data){
				console.log(data);
				
				document.querySelector(".saleMoney").innerHTML = data.sales[0].SALESUM.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				document.querySelector(".saleCount").innerHTML = data.sales[0].COUNT +"건";
				
				document.querySelector(".cancelMoney").innerHTML = data.cancel[0].SALESUM.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				document.querySelector(".cancelCount").innerHTML = data.cancel[0].COUNT + "건";
				
				
				new Chart(document.getElementById("topDoughnut-chart"), {
				    type: 'doughnut',
				    data: {
				      labels: ["여성","남성"],
				      datasets: [
				        {
				          label: "Population (millions)",
				          backgroundColor: ["#c45850","#3cba9f"],
				          data: [data.womanSale[0].WOMANTOTAL,(data.sales[0].SALESUM)-(data.womanSale[0].WOMANTOTAL)]
				        }
				      ]
				    },
				    options: {
				      title: {
				        display: true,
				        text: ''
				      }
				    }
				});
				
				new Chart(document.getElementById("bottomDoughnut-chart"), {
				    type: 'doughnut',
				    data: {
				      labels: ["뷰티", "홈&리빙", "푸드", "반려동물"],
				      datasets: [
				        {
				          label: "Population (millions)",
				          backgroundColor: ["#29577b", "#35c09c","#f6ce49","#f7a35c"],
				          data: [data.category[0].CATESUM,data.category[1].CATESUM,data.category[2].CATESUM,data.category[3].CATESUM]
				        }
				      ]
				    },
				    options: {
				      title: {
				        display: true,
				        text: ''
				      }
				    }
				});

				
				let result = "";
					for(let i=0; i<=4; i++){
					    const total = (data.rankProj[i].TOTAL).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					result += "<tr>"
							+"<td>"+data.rankProj[i].PRO_NO+"</td>"
							+"<td>"+data.rankProj[i].USER_NO+"</td>"
	        			    +"<td>"+data.rankProj[i].PRO_TITLE+"</td>";
	        			    if (data.rankProj[i].PRO_HASHTAG == undefined) {
	        			     result +="<td>-</td>";	
	        			    } else {
	        			    	result += "<td>"+data.rankProj[i].PRO_HASHTAG+"</td>";
	        			    }	        			    
	        			   result += "<td>"+total+"</td>"
	        			    		+"</tr>";
					}
						document.querySelector(".ProjTable").innerHTML = result;
				let customer = "";
					for(let i=0; i<=4; i++){
						const total = (data.rankUser[i].TOTAL).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						customer += "<tr>"
									+"<td>"+data.rankUser[i].USER_NO+"</td>"
									+"<td>"+data.rankUser[i].USER_ID+"</td>"
									+"<td>"+data.rankUser[i].USER_EMAIL+"</td>"
									+"<td>"+total+"</td>"
			        			    +"</tr>";
					}
					document.querySelector(".customerTable").innerHTML = customer;

			},
			error:function(){
				alert("날짜로 검색 실패!");
			}
		});
	}						
	
</script>
<script>

	//프로젝트 상세보기 
	function getProjDetail(){
		console.log("상세보기 시작");
		$.ajax("getProj.do",{
			type: "get",
			dataType: "json",
			success: function(data){
				console.log("성공!");
				
			},
			error: function(){
				console.log("실패!");
			}
		});
	}
</script>
<style>
	.adminContainerContent{
    	width: 850px;
    	height: 1100px;
	}
	.date span button{
		float: right;
	}
	input{
		width: 200px;
		height: 25px;
	}
	button{
		width: 50px;
    	height: 30px;
    	position: relative;
    	right: 160px;
    	bottom: -2px;
	}
	.date{
		position: relative;
    	left: 200px;
    	margin-top: 30px;
	}
	.infoSales{
		position: relative;
	    left: 100px;
	    margin-top: 60px;
	    width: 650px;
	    height: inherit;
	}
	.infoSales div{
		width: 100%;
	}
	
	.first div{
		float: left;
		width:50%;
		position:relative;
		height: 200px;
		text-align: center;
	}
	
	.first{
		height: 200px;
    	border: 1px solid #dde2e6;
    	border-radius: 14px;
    	background-color: white;
}
	.totalSales div{
		float: none;
	}
	
	.second{
		border: 1px solid #dde2e6;
    	border-radius: 14px;
    	margin-top: 40px;
    	height: 300px;
    	background-color: white;
    	text-align: center;
   	    text-transform: capitalize;
    	
	}
	.third{
		border: 1px solid #dde2e6;
    	border-radius: 14px;
    	margin-top: 40px;
    	height: 300px;
    	background-color: white;
    	text-transform: capitalize;
    	text-align: center;	
    	
	}
	.tableTitle{
		font-size:19px;
	}
	
	th{
		font-size:19px;
	}
	.saleMoney{
		color: #5d5dcf;
    	font-size: 36px;
    	margin-top: 20px;
	}
	.saleCount{
		color: darkgray;
	}
	.cancelMoney{
		font-size: 36px;
    	margin-top: 20px;
    	color: #df6f5b;
	}
	.cancelCount{
		color: darkgray;
	}
	.saler{
		position: relative;
    	right: -5%;
   	 	width: 595px;
	}
	.customer{
		width: 544px;
    	position: relative;
    	right: -8%;
	}

		#top-container{
		 height: 500px; 
		}
		#bottom-container{
		 height: 500px; 
		}
		.input-date
		{
			cursor: pointer;
		}
	#doughnut-chart
	{
		}
		
		.graph
		{
			position: relative;
   			right: -128%;
   			top: -86%;
    		width: 479px;
    		text-align: center;
		}
		
		.graph div
		{
			margin-bottom: 80px;
		}
		.graph span
		{
			position: absolute;
    		left: 32%;
   			 color: darkslategray;
		}
		#jsCal1-text, #jsCal2-text {cursor: pointer;}
		
		.headerUtil button
		{
			float: right;
			width: 60px;
			right:7px;
			position: relative;
		}
</style>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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
					<h8>매출 관리</h8>
				</div>
				<div class="adminContainerContent">
				  <div id="salesInfo">
					<!-- 기간별 매출정보 검색공간  -->
					<div class="date">
						<span class="input-date">
						  <input type="text" id="jsCal1-text" name="startDate"
		                         value="시작 날짜"
		                         data-datepicker=''
		                         data-class="auto-jsCalendar clean-theme green" readonly/>   
		                </span>
		                <span class="input-date">
		                   <input type="text" id="jsCal2-text" name="endDate"
		                          value="마지막 날짜"
		                          data-datepicker=''
		                          data-class="auto-jsCalendar  clean-theme green" readonly/>                    
		                </span>
		                <span>
		                   	<button type="button" onclick="getDate()">검색</button>
		                </span>
		            </div>
		           <!-- 왼쪽 -->
		            <div class="infoSales">
		           	 	<!-- 첫번째  -->
		            	<div class="first">
		            		<!-- 총매출 금액, 건수 -->
			            	<div class="totalSales">
			            		<p class="saleTitle">
			            			총매출
			            		</p>
			            		<p class="saleMoney">
			            		</p>
			            		<p class="saleCount">
			            		</p>
			            	</div>
			            	<!-- 취소 금액, 건수  -->
			            	<div class="cancelSales">
			            		<p class="cancelTitle">
			            			취소
			            		</p>
			            		<p class="cancelMoney">
			            		</p>
			            		<p class="cancelCount">
			            		</p>
			            		
			            	</div>
		            	</div>
		            	<!-- 두번째  -->
		            	<div class="second">
			            	<!-- 가장많이 판매한 프로젝트  -->
				            <div class="saleKing">
				            	<p class="tableTitle">#많이 판매한 프로젝트 순위 
				            	<table class="saler">
				            		<thead>
					            		<tr>
						            		<th>NO</th>
						            		<th>판매자 번호</th>
						            		<th>제목</th>
						            		<th>해시태그</th>
						            		<th>금액</th>
				            			</tr>
				            		</thead>
				            		<tbody class="ProjTable">
				            		
				            		</tbody>
				            		<tfoot></tfoot>
				            	</table>
				            </div>
		            	</div>
		            	<!-- 세번째 -->
		            	<div class="third">
		            		<!-- 가장많이 구매한 유저 --> 
		            		<div class="customerKing">
		            			<p class="tableTitle">#많이 구매한 회원 순위
		            			<table class="customer">
				            		<thead>
					            		<tr>
						            		<th>NO</th>
						            		<th>아이디</th>
						            		<th>이메일</th>
						            		<th>금액</th>
				            			</tr>
				            		</thead>
				            		<tbody class="customerTable">
				            		
				            		</tbody>
				            		<tfoot></tfoot>
				            	</table>
		            		</div>
		            	</div>
		            </div>
		           <!-- 오른쪽 그래프 공간 -->
		           <div class="graph">
		           		<span class="topTitle">성비별 매출비율</span>
		           		<div class="topGraph">
							<canvas id="topDoughnut-chart"></canvas>
						</div>
						<span class="bottomTitle">카테고리별 매출비율</span>
						<div class="bottomGraph">
		           			<canvas id="bottomDoughnut-chart"></canvas>
						</div>
		           </div>
		           
		           </div>
				</div>
			</div>
			</div>
		</div>
	<div>
	</div>
	
<script>
		

</script>
</body>
</html>
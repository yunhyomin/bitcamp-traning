<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.setAttribute("admin",21 );	
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<meta charset="UTF-8">
<title>사이트 관리자 메인페이지 | more more</title>
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
</head>
<script>
		$.ajax("getAdminMain.do", {
			type: "get",
			dataType: "json",
			success: function(data){
				console.log(data);
				console.log(data.today[0].COUNT);
				//document.querySelector(".c1").href += data.cntTot;
				document.querySelector(".New").innerHTML += data.cntNew+"명";
				document.querySelector(".Tot").innerHTML += data.cntTot+"명";
				document.querySelector(".Out").innerHTML += data.cntOut+"명";
				document.querySelector(".ingProj").innerHTML += data.ingProj+"건";
				document.querySelector(".waitProj").innerHTML += data.waitProj+"건";
				document.querySelector(".endProj").innerHTML += data.endProj+"건";
				document.querySelector(".cntPayment").innerHTML += data.cntPayment+"건";
				document.querySelector(".cntSale").innerHTML += data.cntSale.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원"; //수수료 20%
				document.querySelector(".cntCancel").innerHTML += data.cntCancel+"건";
				document.querySelector(".todaySale").innerHTML += data.today[0].TODAYSUM.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원";
				document.querySelector(".todayCnt").innerHTML += data.today[0].COUNT+"건";
				
			},
			error: function(){
				alert("실패!");
			}
		});
	
</script>
<style>
	.adminContainerContent{
		
	}
	.adminContainerContent div{
		border-radius: 14px;
	    box-shadow: 3px 3px 6px 0 rgb(33 37 41 / 13%);
	    background-color: #fff;
	    margin-right: 50px;
	    margin-top: 35px;
	    margin-left: 35px;
	    width: 350px;
	    height: 250px;	 
	    font-size: 20px;
	    text-align: center;
	}
	
	#title{
		margin-bottom: 20px;
	}
	
	.todayBox{
		border: 1px solid #dde2e6;
    	width: 400px;
	    height: 300px;
	    margin-top: 60px;
	    margin-left: 40px;
	    border-radius: 14px;
	    background-color: #fff;
	    box-shadow: 3px 3px 6px rgb(33 37 41 / 13%);
	    text-align: center;
	    
	}
	ul{
		padding-left:0;
		margin-top: 50px;
	}
	.all{
		position: relative;
		width: 700px;
	    border: 1px solid #dde2e6;
	    border-radius: 14px;
	    transform: translate(78%,-77.5%);
	    background-color: white;
	    box-shadow: 3px 3px 6px rgb(33 37 41 / 13%);
	}
	.todaytitle{
		font-size: 24px;
	}
	.todaySale{
		color: #286DB4;
	    font-weight: bold;
	    font-size: 50px;
	    margin-top: 40px;
	    margin-bottom: 20px;
	}
	.todayCnt{
		color: darkgray;
		margin-top: 40px;
	}
	.requestProj li{
		float: left;
		margin-right: 35px;
		margin-top: 38px;
	}
	.listPro
	{
		margin-top: 15px;
	}
	.request{
		width: 404px;
	    border: 1px solid #dde2e6;
	    height: 300px;
	    border-radius: 14px;
	    box-shadow: 3px 3px 6px rgb(33 37 41 / 13%);
	    transform: translate(9.5%,-140%);
	    background-color: white;
	    
	}
	.requestProj{
		margin-left: 30px;
    	font-size: 15px;
	}
	.margin_fake_data li 
	{
		margin-top: 8px;
	}
	#title_box
	{
		position: absolute;
	    left: 100px;
	    top: 10px;
	    margin-top: 21px;
	    font-size: 22px;
	}
	.chartTitle
	{
		position: relative;
    	right: -26px;
	}
	.adminLocationArea
	{
		width: 1266px;
	}
</style>
<body>
	<%@include file="siteAdminHeader.jsp" %>
	<div class="adminContainerWrapper">
		<div class="adminContainerLeft">
			<ul class="adminLeftMenu">
				<li class="adminMenuItem"><a href="siteAdminHome.jsp">MAIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
				<li class="adminMenuItem"><a href="getUserList.do">회원관리</a></li>
				<li class="adminMenuItem"><a href="getProj.do">프로젝트관리</a></li>
				<li class="adminMenuItem"><a href="adminSalesManage.jsp">매출관리</a></li>
				<li class="adminMenuItem"><a href="notice.do">FAQ / 공지</a></li>
			</ul>
		</div>
		<div class="adminContainerRightWrapper">
			<div class="adminContainerRight">
				<div class="adminContainerRight_top">
					<div class="adminLocationArea">
						<h8>MAIN</h8>
					</div>
					<div class="adminContainerContent">
						<div class="cntUser">
							<ul class="cnt">
								<li id="title"># 회원현황</li>
								<li class="New" style="margin-bottom: 10px;">최근 가입한 회원 </li>
								<li class="Tot" style="margin-bottom: 10px;">총 회원 </li>
								<li class="Out" style="margin-bottom: 10px;">탈퇴한 회원 </li>
							</ul>
						</div>
						<div class="cntProj">
							<ul class="cnt">
								<li id="title"># 프로젝트 현황</li>
								<li class="endProj" style="margin-bottom: 10px;">완료된 펀딩 </li>
								<li class="waitProj" style="margin-bottom: 10px;">신청 펀딩 </li>
								<li class="ingProj" style="margin-bottom: 10px;">진행중 펀딩 </li>
							</ul>
						</div>
						<div class="cntSales">
							<ul class="cnt">
								<li id="title"># 매출현황</li>
								<li class="cntPayment" style="margin-bottom: 10px;">결제완료 </li>
								<li class="cntSale" style="margin-bottom: 10px;">최근(30일) 매출 </li>
								<li class="cntCancel" style="margin-bottom: 10px;">취소된 결제 </li>
							</ul>
						</div>
					</div>
			  	</div>
			  	<div class="adminContainerRight_bottom">
					<div class="todayBox">
						<ul class="today">
							<li class="todaytitle">금일 매출 현황</li>
							<li class="todaySale"></li>
							<li class="todayCnt">금일 판매건수 </li>
						</ul>
					</div>
					<br><div class="chartdiv">
							<div class="all">
								<p class="chartTitle"># 월별 매출액</p>
								<canvas id="myChart"></canvas>
							</div>
						</div>
					<div class="request">
						<div class="reqProj">
						<span id="title_box">#신청중인 프로젝트</span>
						<ul class="requestProj">
							<li class="listPro">프로젝트 번호</li>
							<li class="listPro" style="margin-right: 75px;">현황</li>
							<li class="listPro">제목</li>
						</ul>
						<ul class="requestProj margin_fake_data">
							<li class="listPro" style="margin-right: 75px; margin-left: 35px">319</li>
							<li class="listPro">신청</li>
							<li class="listPro">아로마 테라피</li>
						</ul>
						<ul class="requestProj margin_fake_data">
							<li class="listPro" style="margin-right: 75px; margin-left: 35px">318</li>
							<li class="listPro">신청</li>
							<li class="listPro">통원목 벽시계</li>
						</ul>
						<ul class="requestProj margin_fake_data">
							<li class="listPro" style="margin-right: 75px; margin-left: 35px">317</li>
							<li class="listPro">신청</li>
							<li class="listPro">코코넛 토너</li>
						</ul>
						<ul class="requestProj margin_fake_data">
							<li class="listPro" style="margin-right: 75px; margin-left: 35px">316</li>
							<li class="listPro">신청</li>
							<li class="listPro">찰랑샴푸</li>
						</ul>
						<ul class="requestProj margin_fake_data">
							<li class="listPro" style="margin-right: 75px; margin-left: 35px">315</li>
							<li class="listPro">신청</li>
							<li class="listPro">황금 횃불화로</li>
						</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
<!-- chart.js -->
	<script type="text/javascript">
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '5월','6월','7월','8월','9월','10월','11월'
                    ],
                    datasets: [
                        { //데이터
                            label: '매출액', //차트 제목
                            fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                10,14,21,18,23,26,30 //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
</body>
</html>
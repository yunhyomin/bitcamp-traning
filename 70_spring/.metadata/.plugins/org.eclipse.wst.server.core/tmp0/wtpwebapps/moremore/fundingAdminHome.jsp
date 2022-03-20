<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.more.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩관리자 | more more</title>
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      $(document).ready(function () {
        console.log("getJSONDealHistoryList 실행~~~ ");
        
        var link = document.location.href;
        console.log("link : " + link );
        
        getJSONCurrentSalesStatus(); // 현재 매출 현황 
        getJSONHomeSalesRelatedStatusWeekly(); // 이번주 판매건수,판매금액
        getJSONHomeSalesRelatedStatusMonthly(); // 이번달 판매건수, 판매금액
        getJSONhomeRecentTransaction(); // 최근 판매내역
        getJSONnewInquiryHistory(); // 신규 문의내역
                       
      });
      
      // 펀딩관리 메인 - 금일 매출 현황
      function getJSONCurrentSalesStatus() {
          console.log(">> getJSONCurrentSalesStatus() 실행~~~");

          $.ajax("homeCurrentSalesStatus.do", {
            type: "post",
            dataType: "json", 
            contentType: "application/json; UTF-8;",
            
            success: function (data) {
              console.log(data); 
               
              // 데이터 넣기 전 공백으로 초기화 
              $("#currentSalesStatus").html("");
              
              var result = "";
  		      result += "<h1 class='blueItem' style='text-align: center;'>" + data.current_sales_status.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "</h1>";
  		      result += "<ul class='adminContentinfoUl'><li class='adminContentInfoItem'>#금일 판매 건수</li>"
  		      result += "<li class='adminContentInfoItem blueItem'>" + data.current_sales_number_of_cases + "건</li>";
  		      result += "</ul>";							
              console.log("result : " + result);
              $("#currentSalesStatus").html(result);
      
      		},
          error: function (request, status, error) {
            alert(
              "Ajax 처리 실패, " + "\n" +
                "code : " + request.status + "\n" +
                "message : " + request.responseText + "\n" +
                "error : " + error
            );
          },	
      	})
      };
      
      // 펀딩 관리 메인 - 이번주 판매건수/ 판매금액
      function getJSONHomeSalesRelatedStatusWeekly() {
          console.log(">> getJSONHomeSalesRelatedStatusWeekly() 실행~~~");

          $.ajax("homeSalesRelatedStatus.do", {
            type: "post",
            dataType: "json", 
            contentType: "application/json; UTF-8;",
            
            success: function (data) {
              console.log(data); 
               
              // 데이터 넣기 전 공백으로 초기화 
              $("#adminSalesInfoTop").html("");
              
              var result = "";
              result += "<li class='adminContentInfoItem'> # 이번주 판매 건수</li>";
              result += "<li class='adminContentInfoItem blueItem'>"+ data.weekly_sales_number_of_cases + "건</li>";
		      result += "<li class='adminContentInfoItem'># 이번주 판매 금액 </li>";
		      result += "<li class='adminContentInfoItem blueItem'>" + data.weekly_sales_amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원</li>";
              console.log("result : " + result);
              $("#adminSalesInfoTop").html(result);
      
      		},
          error: function (request, status, error) {
            alert(
              "Ajax 처리 실패, " + "\n" +
                "code : " + request.status + "\n" +
                "message : " + request.responseText + "\n" +
                "error : " + error
            );
          },	
      	})
      };
      
   	  // 펀딩 관리 메인 - 이번달 판매건수/ 판매금액
      function getJSONHomeSalesRelatedStatusMonthly() {
          console.log(">> getJSONHomeSalesRelatedStatusMonthly() 실행~~~");

          $.ajax("homeSalesRelatedStatusMonthly.do", {
            type: "post",
            dataType: "json", 
            contentType: "application/json; UTF-8;",
            
            success: function (data) {
              console.log(data); 
               
              // 데이터 넣기 전 공백으로 초기화 
              $("#adminSalesInfoBottom").html("");
              
              var result = "";
              result += "<li class='adminContentInfoItem'> # 이번달 판매 건수</li>";
              result += "<li class='adminContentInfoItem blueItem'>"+ data.monthly_sales_number_of_cases + "건</li>";
		      result += "<li class='adminContentInfoItem'># 이번달 판매 금액 </li>";
		      result += "<li class='adminContentInfoItem blueItem'>" + data.monthly_sales_amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원</li>";
              console.log("result : " + result);
              $("#adminSalesInfoBottom").html(result);
      
      		},
          error: function (request, status, error) {
            alert(
              "Ajax 처리 실패, " + "\n" +
                "code : " + request.status + "\n" +
                "message : " + request.responseText + "\n" +
                "error : " + error
            );
          },	
      	})
      };
      
      // 최근 판매내역
      function getJSONhomeRecentTransaction() {
        console.log(">> homeRecentTransaction() 실행~~~");

        $.ajax("homeRecentTransaction.do", {
          type: "post",
          dataType: "json", 
          success: function (data) {
              console.log(data); 
            
            // 데이터 넣기 전 공백으로 초기화 
            $("#fundingAdminRecentTransactionList").html("");
            
            var result = "";
            $.each(data, function(index, item){
		             result += "<tr>";
	            	 result += "<td>" + item.order_date + "</td>";
		             result += "<td>" + item.user_no + "</td>";
		             result += "<td>" + item.payment_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원</td>";
		             result += "<td>" + item.payment_type + "</td>";
		             result += "<td>" + item.payment_status + "</td>";
		             result += "<td>" + item.payment_delivery_status + "</td>";
		             result += "</tr>";
         	});
            console.log("result : " + result);
            $("#fundingAdminRecentTransactionList").html(result);
          },
          error: function (request, status, error) {
            alert(
              "Ajax 처리 실패, " + "\n" +
                "code : " + request.status + "\n" +
                "message : " + request.responseText + "\n" +
                "error : " + error
            );
          },
        });
      } 
      
  	  // 신규 문의 내역
      function getJSONnewInquiryHistory() {
        console.log(">> newInquiryHistory() 실행~~~");

        $.ajax("newInquiryHistory.do", {
          type: "post",
          dataType: "json", 
          success: function (data) {
              console.log(data); 
            
            // 데이터 넣기 전 공백으로 초기화 
            $("#newInquiryHistoryList").html("");
            
            var result = "";
            $.each(data, function(index, item){
		             result += "<tr>";
		             result += "<td><a href='"+"fundingAdminInquiryManageOne.do?rnum="+item.rnum+"'>";
		        	 result += item.qna_name + "</td>";
		             result += "<td>" + item.user_name + "</td>";
		             result += "<td>" + item.qna_regdate + "</td>";
		             result += "</tr>";
         	});
            console.log("result : " + result);
            $("#newInquiryHistoryList").html(result);
          },
          error: function (request, status, error) {
            alert(
              "Ajax 처리 실패, " + "\n" +
                "code : " + request.status + "\n" +
                "message : " + request.responseText + "\n" +
                "error : " + error
            );
          },
        });
      } 
      
    </script>
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
					<h8>대시보드</h8>
				</div>
				<div class="adminContainerContent">
					<div class="fundingAdminContainerLeftContentArea">
						<div class="fundingAdminContainerContentHeader" style="height: 500px;">
							<p class="adminContentTitle">#총 매출액</p>
							<canvas id="myChart"></canvas>
						</div>
						<div class="fundingAdminContainerContentHeader" style="height: 100px">
							
							<div id="fundingAdminInfo">
								<!-- 이번주 판매건수/ 판매금액 -->
								<ul class="adminContentInfoList" id="adminSalesInfoTop">
								</ul>
								<!-- 이번달 판매건수/ 판매금액 -->
								<ul class="adminContentInfoList" id="adminSalesInfoBottom">
								</ul>
							</div>
						</div>
						<div class="fundingAdminContainerContentHeader"  style="height: 380px;" >
							<div style="display:flex; justify-content: space-between">
								<p class="adminContentTitle" style="margin-bottom: 0px;">#최근 판매내역</p>
								<a href="fundingAdminPaymentStatus.jsp?cPage=1"><p style="font-size: 18px; margin-right: 10px; font-weight: 600;">더보기</p></a>
							</div>
							<div id="fundingAdminMainArea">
						    <div class="fundingAdminMainContent">
						      <table class="fundingAdmintableContent" style="width: 730px;">
						        <thead>
						          <tr>
						            <th>주문일시</th>
						            <th>회원번호</th>
						            <th>결제금액</th>
						            <th>결제타입</th>
						            <th>결제진행상태</th>
						            <th>배송현황</th>
						          </tr>
						        </thead>
						        <tbody id="fundingAdminRecentTransactionList">
						        	
						        </tbody>
						        <tfoot id="pageBlock">
						        </tfoot>
						      </table>
						    </div>
						  </div>
						</div>
					</div>
					<div class="fundingAdminContainerRightContentArea">
						<div class="fundingAdminContainerContentHeader" style="height: 200px;">
							<div>
								<h4 class="currentSalesStatusTitle">금일 매출 현황(원)</h4>
								<h3 id="currentSalesStatus"></h3>
								
							</div>
						</div>
						<div class="fundingAdminContainerContentHeader" style="height: 250px;">
							<p class="adminContentTitle">#이번달 인기 판매 상품</p>
							<table class="fundingAdmintableContent" style="width: 400px;">
								<thead>
						          <tr>
						          	<th>상품명</th>
						            <th>구매수량</th>
						            <th>결제금액</th>
						          </tr>
						        </thead>
						        <tbody id="fundingAdminPopularSalesList">
						        	<tr>
						        	  <td>꿀잠방석 L 사이즈</td>
						        	  <td>32</td>
						        	  <td>643,200</td>
						        	</tr>
						        	<tr>
						        	  <td>쓰담이쓰다미</td>
						        	  <td>28</td>
						        	  <td>583,800</td>
						        	</tr>
						        	<tr>
						        	  <td>행복셋(쓰담이+로얄캣닢)</td>
						        	  <td>25</td>
						        	  <td>519,500</td>
						        	</tr>
						        </tbody>
							</table>
						</div>
						<div class="fundingAdminContainerContentHeader" style="height: 300px;">
							<div style="display:flex; justify-content: space-between">
								<p class="adminContentTitle" style="margin-bottom: 0px;">#신규 문의내역</p>
								<a href="fundingAdminInquiryManage.jsp?cPage=1"><p style="font-size: 18px; margin-right: 10px; font-weight: 600;">더보기</p></a>
							</div>
							<table class="fundingAdmintableContent" style="width: 400px;">
					        <thead>
					          <tr>
					            <th>제목</th>
					            <th>회원명</th>
					            <th>문의날짜</th>
					          </tr>
					        </thead>
					        <tbody id="newInquiryHistoryList">
					        </tbody>
					        </table>
						</div>
						<!-- <div class="fundingAdminContainerContentHeader" style="height: 200px;">
							<p class="adminContentTitle">#판매자 성비 현황</p>
						</div> -->
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
                            	10225900,12225900,18125900,8225900,14225500,12355900,16725900 //x축 label에 대응되는 데이터 값
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
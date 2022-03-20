<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.more.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<% String cPage = request.getParameter("cPage");%> 
<% pageContext.setAttribute("cPage", cPage);%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩관리자 - 주문관리 | more more</title>
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      $(document).ready(function () {
        console.log("getJSONfundingAdminPaymentStatus 스크립트 실행~~~ ");
        
        var link = document.location.href;
        console.log("link : " + link );
		
        var cPage = "<c:out value='${cPage }'/>";
        console.log("cPage : " + cPage );
        
       getJSONfundingAdminPaymentStatus(cPage); //  판매내역 리스트
       

       $(document).on("click", ".orderStatusUpdateBtn", function(e){ 
            console.log("orderStatusUpdateBtn 실행~~~");
            console.log(e.target.value);
            var order_no = e.target.value;
            console.log("order_no : " + order_no);
			
            if(confirm("주문 현황을 변경 하시겠습니까?")){
         	  location.href = "orderDetailReturnUpdate.do?order_no=" + order_no;
               	
             } else{
 				return;
 			}	
         });
      });

      // 판매내역
      function getJSONfundingAdminPaymentStatus(cPage) {
        console.log(">> fundingAdminPaymentStatus() 실행~~~");

        $.ajax("fundingAdminPaymentStatus.do?cPage=" + cPage, {
          type: "get",
          dataType: "json",
          contentType: "application/json",
          success: function (data) {
        	  const list = data["list"];
              const plist = data["plist"];
              console.log(data); 
              console.log("list : " + list); 
              console.log("plist : " + plist); 
              const begin = plist.begin;
              var cPage = plist.beginPage;
              var cPagePrev = plist.beginPage - 1;
              var cPageNext = plist.beginPage + 1;
              console.log("begin : " + begin); 
              console.log("cPage : " + cPage); 
              console.log("cPagePrev : " + cPagePrev); 
              console.log("cPageNext : " + cPageNext); 
              
            // 데이터 넣기 전 공백으로 초기화 
            $("#fundingAdminPaymentStatusList").html("");
            
            var result = "";
            $.each(list, function(index, item){
           		 result += "<tr>";
	             result += "<td>" + item.rnum + "</td>";
	             result += "<td>" + item.order_no + "</td>";
            	 result += "<td>" + item.order_date + "</td>";
	             result += "<td>" + item.user_no + "</td>";
	             result += "<td>" + item.payment_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원</td>";
	             result += "<td>" + item.payment_bankname + "</td>";
	             result += "<td>" + item.payment_type + "</td>";
	             result += "<td>" + item.payment_status + "</td>";
	             result += "<td>" + item.payment_delivery_status + "</td>";
	  	     	 if(item.order_status == '주문완료'|| item.order_status == '반품완료'){
		  	     	 result += "<td>" + item.order_status + "</td>";
	  	     	 } else if(item.order_status == '반품신청' || item.order_status == '취소요청'){
		  		 	 result += "<form id='fundingAdminPaymentReturnForm' action='fundingAdminPaymentReturnUpdate.do' method='get'>";
	  	     		 result += "<td><select name='orderStatusChoice' style='color:#286DB4; font-size: 15px;'>";
		  	     	 result += "<option id='orderStatusNum" + item.order_no + "' type='text' style='width: 90px;' value='" + item.order_status +"' selected>" + item.order_status +"</option>";
		  	     	 result += "<option id='orderStatusUpdateNum" + item.order_no + "' type='text' style='width: 90px;' value='반품완료'>반품완료</option>";
		  	     	 result += "</td></select>";
		  	     	 result += "<input type='hidden' name='' value='" + item.order_no + "'>";
		  	     	 result += "</form>";
		  	     	 result += "<td><button type='button' class='orderStatusUpdateBtn' value='" + item.order_no + "' style='font-size: 15px;'>반품완료</button></td>";
	  	     	 }
	  		 	 result += "<td></td>";
	  	     	 result += "</tr>";		
         	});
            console.log("result : " + result);
            $("#fundingAdminPaymentStatusList").html(result);
          	
            var page = "";
            page += "<tr>"
            page += "<td colspan='10'>"
            
            // 이전으로에 대한 사용여부 처리
            if(plist.begin == 1){
         	  page += "<button type='button' class='pageBtn paging' disabled>이전으로</button>"
            }else {
        	  page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href='fundingAdminPaymentStatus.jsp?cPage="+(cPagePrev)+"'>이전으로</button>"
            }
            
            // 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지)
            for(var i = plist.beginPage; i <= plist.endPage; i++){
          	  if(i == plist.nowPage){
      	  			page += "<button type='button' class='pageBtn pageNow paging'>"+i+"</button>"
          	  }else {
          		  	page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href='fundingAdminPaymentStatus.jsp?cPage="+i+"'>"+i+"</button>"
          	  }
            }
            // [다음으로]에 대한 사용여부 처리
            if(plist.endPage <= plist.totalPage){
          	  page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href='fundingAdminPaymentStatus.jsp?cPage="+(cPageNext)+"'>다음으로</button>"
            }else if(plist.endPage >= plist.totalPage){
          	  page += "<button type='button' class='pageBtn paging' disabled>다음으로</button>"
            }
            page +="</ol>"
            page +="</td>"
            page +="</tr>"
            
            console.log("page : " + page);
            $("#pageBlock").html(page);
            
          },
          error: function (request, status, error,data) {
            alert(
              "Ajax 처리 실패, " + "\n" +
                "code : " + request.status + "\n" +
                "message : " + request.responseText + "\n" +
                "error : " + error
            );
            alert(data);
          },
        });
      } 
      
      // 검색하기
      function getSearchPaymentList() {
    	  console.log(">> getSearchPaymentList() 실행~~~");

          $.ajax("getSearchPayment.do", {
            type: "get",
            dataType: "json",
            data : $("form[name=search-form]").serialize(),
            contentType: "application/json",
            success: function (data) {
          	  /* const list = data["list"];
                const plist = data["plist"]; */
                console.log(data); 
                /* console.log("list : " + list); 
                console.log("plist : " + plist); 
                const begin = plist.begin;
                var cPage = plist.beginPage;
                var cPagePrev = plist.beginPage - 1;
                var cPageNext = plist.beginPage + 1;
                console.log("begin : " + begin); 
                console.log("cPage : " + cPage); 
                console.log("cPagePrev : " + cPagePrev); 
                console.log("cPageNext : " + cPageNext);  */
                
              // 데이터 넣기 전 공백으로 초기화 
              $("#fundingAdminPaymentStatusList").html("");
              
              var result = "";
              
              if(data.length>=1){
              $.each(data, function(index, item){
           		 result += "<tr>";
   	             result += "<td>" + item.rnum + "</td>";
   	             result += "<td>" + item.order_no + "</td>";
               	 result += "<td>" + item.order_date + "</td>";
   	             result += "<td>" + item.user_no + "</td>";
   	             result += "<td>" + item.payment_price + "원</td>";
   	             result += "<td>" + item.payment_bankname + "</td>";
   	             result += "<td>" + item.payment_type + "</td>";
   	             result += "<td>" + item.payment_status + "</td>";
   	             result += "<td>" + item.payment_delivery_status + "</td>";
   	  		 	 result += "<form action='fundingAdminOrderStatusUpdate.do' method='get'>"
   	  	     	 if(item.order_status == '주문완료'||'반품완료'){
   		  	     	 result += "<td>" + item.order_status + "</td>";
   	  	     	 } else {
   	  	     		 result += "<td><select name='orderStatusChoice'>";
   		  	     	 result += "<option id='orderStatusNum" + item.rnum + "' type='text' style='width: 90px;' value='" + item.order_status +"' selected>" + item.order_status +"</option>";
   		  	     	 result += "<option id='orderStatusUpdateNum" + item.rnum + "' type='text' style='width: 90px;' value='반품완료'>반품완료</option>";
   		  	     	 result += "</td></select>";
   	  	     	 }
   	  		 	 if(item.order_status == '반품신청'){
   	  	     	 result += "<td><button type='button' class='orderStatusUpdateBtn' value='" + item.rnum + "'>반품완료</button></td>";
   	  		 	 }
   	  	     	 result += "</tr>";		           
           		});
              } else {
            	  result += "<tr>";
            	  result += "<td colspan='8'>검색 결과가 존재하지 않습니다.</td>";
            	  result += "</tr>";
              }
              console.log("result : " + result);
              $("#fundingAdminPaymentStatusList").html(result);
            	/* 
              var page = "";
              page += "<tr>"
              page += "<td colspan='8'>"
              
              // 이전으로에 대한 사용여부 처리
              if(plist.begin == 1){
           	  page += "<button type='button' class='pageBtn paging' disabled>이전으로</button>"
              }else {
          	  page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href='fundingAdminPaymentStatus.jsp?cPage="+(cPagePrev)+"'>이전으로</button>"
              }
              
              // 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지)
              for(var i = plist.beginPage; i <= plist.endPage; i++){
            	  if(i == plist.nowPage){
        	  			page += "<button type='button' class='pageBtn pageNow paging'>"+i+"</button>"
            	  }else {
            		  	page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href='fundingAdminPaymentStatus.jsp?cPage="+i+"'>"+i+"</button>"
            	  }
              }
              // [다음으로]에 대한 사용여부 처리
              if(plist.endPage <= plist.totalPage){
            	  page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href='fundingAdminPaymentStatus.jsp?cPage="+(cPageNext)+"'>다음으로</button>"
              }else if(plist.endPage >= plist.totalPage){
            	  page += "<button type='button' class='pageBtn paging' disabled>다음으로</button>"
              }
              page +="</ol>"
              page +="</td>"
              page +="</tr>"
              
              console.log("page : " + page);
              
              $("#pageBlock").html(page); */
              
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
					<h8>주문관리</h8>
				</div>
				<div class="adminContainerContent">
					<div class="fundingAdminContainerLeftContentAreaWide">
						<!-- <div class="fundingAdminContainerContentHeader" style="height: 100px">
							
							<div id="fundingAdminInfo">
								이번주 판매건수/ 판매금액
								<ul class="adminContentInfoList" id="adminSalesInfoTop">
								</ul>
								이번달 판매건수/ 판매금액
								<ul class="adminContentInfoList" id="adminSalesInfoBottom">
								</ul>
							</div>
						</div> -->
						<div class="fundingAdminContainerContentHeader"  style="height: 900px;" >
														<div style="display:flex;">
								<p class="adminContentTitle" style="margin-bottom: 0px;"></p>
<!-- 								<form action="" method="get" style="margin-right: 140px; margin-left: 40px;"> -->
								<div class="fundingAdminMainContent" style="display:flex; margin-bottom: 0px; margin-right: 30px;">
									<div style="font-size: 18px; margin-right: 20px;">
										<p style="padding-top: 10px;">조건검색</p>
									</div>
									<div style="margin-top: 10px; font-size: 18px;">
									    <form action="getSearchPayment.do" method="get" name="search-form" style="margin-right: 140px; margin-left: 40px;">
									    <div>
									    	<select name="searchCondition">
												<option value="">검색</option>
												<option value="user_no">회원번호</option>
												<option value="payment_bankname">은행/카드사</option>
												<option value="payment_type">결제타입</option>
												<option value="payment_status">결제진행상태</option>
												<option value="payment_delivery_status">배송현황</option>
											</select>
									    	<input type="search" name="searchKeyword" placeholder="검색명 입력" style="margin-left: 10px; margin-top: 15px;">
									    	<button type="button" class="d_btn" value="검색" onclick="getSearchPaymentList()">검색</button>
									    </div>	
									    </form>
									</div>
								</div>
								
							</div>
							<div class="fundingAdminMainAreaCenter" style="width: 850px;">
						    <div class="fundingAdminMainContent">
						      <table class="fundingAdmintableContent" style="width: 850px;">
						        <thead>
						          <tr>
						            <th>번호</th>
						            <th>주문번호</th>
						            <th>주문일시</th>
						            <th>회원번호</th>
						            <th>결제금액</th>
						            <th>은행/카드사</th>
						            <th>결제타입</th>
						            <th>결제진행상태</th>
						            <th>배송현황</th>
						            <th>주문현황</th>
						            <th>기능</th>
						          </tr>
						        </thead>
						        <tbody id="fundingAdminPaymentStatusList">
						        </tbody>
						        <tfoot id="pageBlock">
							        </tfoot>
							       </table>
							       <form id="paymentNumSubmit" action="fundingAdminOrderStatusUpdate.do" method="get">
						           </form>
							    </div>
							  </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
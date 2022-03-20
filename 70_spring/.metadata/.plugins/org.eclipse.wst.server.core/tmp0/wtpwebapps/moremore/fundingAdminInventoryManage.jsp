<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.more.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String cPage = request.getParameter("cPage");
%>
<%
	pageContext.setAttribute("cPage", cPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩관리자 - 재고관리 | more more</title>
<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
      $(document).ready(function () {
        console.log("getJSONDealHistoryList 실행~~~ ");
        
        var link = document.location.href;
        console.log("link : " + link );
        
        var cPage = "<c:out value='${cPage }'/>";
        console.log("cPage : " + cPage );
        
        getJSONInventoryManageList(cPage); // 재고 관리
        
       
        $(document).on("click", ".inventoryUpdateBtn", function(e){ 
            console.log("inventoryUpdateBtn 실행~~~");
            console.log(e.target.value);
            var val = e.target.value;
            console.log("val : " + val);
            
            var goodsNo = $("#goods_no" + val).val();
            console.log("goodsNo : " + goodsNo);
            var inventoryNum = $("#inventoryNum" + val).val();
            console.log("inventoryNum : " + inventoryNum);
			
            if(confirm("재고 수량을 변경 하시겠습니까?")){
            	location.href = "fundingAdminInventoryManageUpdate.do?goodsNo=" + goodsNo + "&inventoryNum=" + inventoryNum;
            } else{
				return;
			}	
        });
                       
      });

      // 재고 관리
      function getJSONInventoryManageList(cPage) {
        console.log(">> InventoryManageList() 실행~~~");

        $.ajax("fundingAdminInventoryManageList.do?cPage=" + cPage, {
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
            $("#fundingAdminInventoryManageList").html("");
            
            var result = "";
            $.each(list, function(index, item){
            	 var spare = item.goods_stock - 100;
            	 console.log("spare : " + spare);
            	 result += "<table>";
           	     result += "<tr>";
           	     result += "<td>" + item.goods_rnum + "</td>";
            	 result += "<td>" + item.goods_no + "</td>";
            	 result += "<input type='hidden' id='goods_no" + 
            	item.goods_rnum + "' value='"+ item.goods_no +"'>";
            	     result += "<td>" + item.goods_title + "</td>";
            	     result += "<td>" + item.goods_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원</td>";
            	     result += "<td>100</td>";
            	     if(spare < 0){
            	result += "<td style='color:red;'>" + spare + "</td>";
            	     } else {
            	result += "<td>" + spare + "</td>";   
            	     }
            	 result += "<form action='fundingAdminInventoryManageUpdate.do' method='get'>";
            	 if(spare < 0){
	            	result += "<td><input id='inventoryNum" + item.goods_rnum +
	            	"' type='number' style='color:red;' name='inventoryNum' value='"+ item.goods_stock 
	            	+"'></td>";
            	 } else {
	            	result += "<td><input id='inventoryNum" + item.goods_rnum +
	            	"' type='number' name='inventoryNum' value='"+ item.goods_stock +"'></td>";
            	 }
            	     result += "<td><button type='button' class='inventoryUpdateBtn' value='" + item.goods_rnum + "'>수정</button></td>";
            	     result += "</tr></table></form>";
            	});

            console.log("result : " + result);
            $("#fundingAdminInventoryManageList").html(result);
            
            var page = "";
            page += "<tr>";
            page += "<td colspan='8'>";
            
            // 이전으로에 대한 사용여부 처리
            if(plist.begin == 1){
           		page += "<button type='button' class='pageBtn paging' disabled>이전으로</button>";
            }else {
           		page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href=fundingAdminInventoryManage.jsp?cPage="+(cPagePrev)+">이전으로</button>";
            }
            
            // 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지)
            for(var i = plist.beginPage; i <= plist.endPage; i++){
              if(i == plist.nowPage){
                page += "<button type='button' class='pageBtn pageNow paging'>"+i+"</button>";
              }else {
                  page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href=fundingAdminInventoryManage.jsp?cPage="+i+">"+i+"</button>";
              }
            }
            // [다음으로]에 대한 사용여부 처리
            if(plist.endPage <= plist.totalPage){
              page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href=fundingAdminInventoryManage.jsp?cPage="+(cPageNext)+">다음으로</button>";
            }else if(plist.endPage >= plist.totalPage){
              page += "<button type='button' class='pageBtn paging' disabled>다음으로</button>";
            }
            page +="</ol>";
            page +="</td>";
            page +="</tr>";
            
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
          }
        });
      } 
      
    </script>
<body>
	<%@include file="adminHeader.jsp"%>
	<div class="adminContainerWrapper">
		<div class="adminContainerLeft">
			<ul class="adminLeftMenu">
				<li class="adminMenuItem"><a href="fundingAdminHome.jsp">메인</a></li>
				<li class="adminMenuItem"><a
					href="guideForSellerAndInvestor.jsp">펀딩 준비</a></li>
				<li class="adminMenuItem"><a href="funding_submit.jsp">펀딩
						관리</a></li>
				<li class="adminMenuItem"><a
					href="fundingAdminPaymentStatus.jsp?cPage=1">주문 관리</a></li>
				<li class="adminMenuItem"><a
					href="fundingAdminInventoryManage.jsp?cPage=1">재고 관리</a></li>
				<li class="adminMenuItem"><a
					href="fundingAdminInquiryManage.jsp?cPage=1">문의 관리</a></li>
			</ul>
		</div>
		<div class="adminContainerRightWrapper">
			<div class="adminContainerRight">
				<div class="adminLocationArea">
					<h8>재고관리</h8>
				</div>
				<div class="adminContainerContent">
					<div class="fundingAdminContainerLeftContentAreaWide">
						<!-- <div class="fundingAdminContainerContentHeader" style="height: 100px"> 
						</div> -->
						<div class="fundingAdminContainerContentHeader"
							style="height: 850px;">
							<div style="display: flex; justify-content: space-between">
								<p class="adminContentTitle" style="margin-bottom: 0px;"></p>
								<form action="getSearchGoods.do" method="get"
									style="margin-right: 140px;">
									<div class="fundingAdminMainContent"
										style="display: flex; margin-bottom: 0px; margin-right: 30px;">
										<div style="font-size: 18px; margin-right: 20px;">
											<!-- <p>재고상태</p> -->
											<p style="margin-top: 24px;">검색조건</p>
										</div>
										<div style="margin-top: 10px; font-size: 18px;">
											<!-- <div>
											<label><input type="radio" name="inventory" value="all" selected> 전체</label>
		      								<label><input type="radio" name="inventory" value="soldOut"> 품절</label>
										    <label><input type="radio" name="inventory" value="lack"> 부족</label>
									    </div> -->
											<div>
												<select name="searchCondition">
													<option value="">검색</option>
													<option value="goods_no">상품코드</option>
													<option value="goods_title">상품명</option>
												</select> <input type="search" name="searchKeyword"
													placeholder="검색명 입력"
													style="margin-left: 10px; margin-top: 10px;">
												<button type="submit" class="d_btn" value="검색">검색</button>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="fundingAdminMainAreaCenter" style="width: 850px;">
								<div class="fundingAdminMainContent">
									<table class="fundingAdmintableContent" style="width: 850px;">
										<thead>
											<tr>
												<th style="width: 70px;">번호</th>
												<th style="width: 70px;">상품코드</th>
												<th>상품명</th>
												<th style="width: 80px;">판매가</th>
												<th style="width: 70px;">안전재고</th>
												<th style="width: 50px;">여유</th>
												<th>현재재고</th>
												<th style="width: 70px;">기능</th>
											</tr>
										</thead>
										<tbody id="fundingAdminInventoryManageList">

										</tbody>
										<tfoot id="pageBlock">

										</tfoot>
									</table>
									<form id="inventoryNumSubmit"
										action="fundingAdminInventoryManageUpdate.do" method="get">
									</form>
								</div>
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
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
<title>펀딩관리자 - 문의관리 | more more</title>
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      $(document).ready(function () {
        console.log("getJSONfundingAdminInquiryManage 스크립트 실행~~~ ");
        
        var link = document.location.href;
        console.log("link : " + link );
        
        var cPage = "<c:out value='${cPage }'/>";
        console.log("cPage : " + cPage );
        
        getJSONfundingAdminInquiryManage(cPage); // 신규 문의내역
        
      });
      
  	  // 문의 내역
      function getJSONfundingAdminInquiryManage(cPage) {
        console.log(">> fundingAdminInquiryManage() 실행~~~");
        $.ajax("fundingAdminInquiryManage.do?cPage=" + cPage, {
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
            $("#fundingAdminInquiryManageList").html("");
            
            var result = "";
            $.each(list, function(index, item){
		             result += "<tr>";
	            	 result += "<td>" + item.rnum + "</td><td>";
		             result += "<a href='"+"fundingAdminInquiryManageOne.do?rnum="+item.rnum+"'>";
	            	 result += item.qna_name + "</td>";
		             result += "<td>" + item.user_name + "</td>";
		             result += "<td>" + item.qna_status + "</td>";
		             result += "<td>" + item.qna_regdate + "</td>";
		             result += "</tr>";
         	});
            console.log("result : " + result);
            $("#fundingAdminInquiryManageList").html(result);
          
            var page = "";
            page += "<tr>";
            page += "<td colspan='5'>";
            
            // 이전으로에 대한 사용여부 처리
            if(plist.begin == 1){
         	  page += "<button type='button' class='pageBtn paging' disabled>이전으로</button>";
            }else {
        	  page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href=fundingAdminInquiryManage.jsp?cPage="+(cPagePrev)+">이전으로</button>";
            }
            
            // 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지)
            for(var i = plist.beginPage; i <= plist.endPage; i++){
          	  if(i == plist.nowPage){
      	  			page += "<button type='button' class='pageBtn pageNow paging'>"+i+"</button>";
          	  }else {
          		  	page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href=fundingAdminInquiryManage.jsp?cPage="+i+">"+i+"</button>";
          	  }
            }
            // [다음으로]에 대한 사용여부 처리
            if(plist.EndPage <= plist.TotalPage){
          	  page += "<button type='button' class='pageBtn paging' onclick=javascript:location.href=fundingAdminInquiryManage.jsp?cPage="+(cPageNext)+">다음으로</button>";
            }else if(plist.EndPage >= plist.TotalPage){
          	  page += "<button type='button' class='pageBtn paging' disabled>다음으로</button>";
            }
            page +="</ol>";
            page +="</td>";
            page +="</tr>";
            
            console.log("page : " + page);
            
            $("#pageBlock").html(page);
          },
          error: function (request, status, error) {
            alert(
              "Ajax 처리 실패, " + "\n" +
                "code : " + request.status + "\n" +
                "message : " + request.responseText + "\n" +
                "error : " + error
            );
          }
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
					<h8>문의관리</h8>
				</div>
				<div class="adminContainerContent">
					<div class="fundingAdminContainerLeftContentAreaWide">
						<!-- <div class="fundingAdminContainerContentHeader" style="height: 100px">
						
						</div> -->
						<div class="fundingAdminContainerContentHeader"  style="height: 700px;" >
							<div style="display:flex;">
								<p class="adminContentTitle" style="margin-bottom: 0px;"></p>
								<form action="" method="get" style="margin-left: 40px;">
								<div class="fundingAdminMainContent" style="display:flex; margin-bottom: 0px; margin-right: 30px;">
									<div style="font-size: 18px; margin-right: 20px;">
										<!-- p>재고상태</p> -->
										<p style="margin-top: 24px;">검색조건</p>
									</div>
									<div style="margin-top: 10px; font-size: 18px;">
										<!-- <div>
											<label><input type="radio" name="inventory" value="all" selected> 전체</label>
		      								<label><input type="radio" name="inventory" value="soldOut"> 답변예정</label>
										    <label><input type="radio" name="inventory" value="lack"> 답변완료</label>
									    </div> -->
									    <form action="getSearchQna.do" method="get">
									    <div>
									    	<select name="searchCondition">
												<option value="">검색</option>
												<option value="qna_name">제목</option>
												<option value="user_no">작성자</option>
												<option value="qna_status">답변여부</option>
											</select>
									    	<input type="search" name="searchKeyword" placeholder="검색명 입력" style="margin-left: 10px; margin-top: 10px;">
									    	<button type="submit" class="d_btn" value="검색">검색</button>
									    </div>	
									    </form>
									</div>
								</div>
								</form>
							</div>
							<div class="fundingAdminMainAreaCenter">
						    <div class="fundingAdminMainContent">
						      <table class="fundingAdmintableContent" style="width: 730px;">
						        <thead>
						          <tr>
						          	<th>번호</th>
						            <th>제목</th>
					           		<th>작성자</th>
					           		<th>답변여부</th>
					           		<th>문의날짜</th>
						          </tr>
						        </thead>
						        <tbody id="fundingAdminInquiryManageList">
						        </tbody>
						        <tfoot id="pageBlock">
						        </tfoot>
						      </table>
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
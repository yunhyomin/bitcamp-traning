<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.more.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

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
        console.log("getJSONDealHistoryList 실행~~~ ");
        
        var link = document.location.href;
        console.log("link : " + link );
        
        $("#adminQnaAnswerUpdateBtn").click(function(){
        	
        	if($("#adminQnaAnswerText").val().length==0){ //주소 빈칸확인
				alert("답변을 입력해주세요.");
				$("#adminQnaAnswerText").focus();
				return;
			}

        	if(confirm("답변 내용을 수정하시겠습니까?")){
        				var adminQnaAnswerText = $("#adminQnaAnswerText").val();
        	            console.log("adminQnaAnswerText : " + adminQnaAnswerText);
        	            
        	            var adminQnaAnswerTextHidden = $("#adminQnaAnswerTextHidden").val(adminQnaAnswerText);
        	            
        	            var adminQnaAnswerTextHiddenQQQ = $("#adminQnaAnswerTextHidden").val();
        	            console.log("adminQnaAnswerTextHiddenQQQ : " + adminQnaAnswerTextHiddenQQQ);


        	            var selsectOneqnaNum = $("#selsectOneqnaNum").val();
        	            console.log("selsectOneqnaNum : " + selsectOneqnaNum);

        		/* location.href = "fundingAdminQnaAnswer.do?qna_answer_content=" + adminQnaAnswerText + "&qna_no=" + selsectOneqnaNum; */

        	            $("#adminQnaAnswer").submit();
			}else{
				$("#adminQnaAnswerText").focus();
			return;
			}
		});
                       
      });
      
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
					
						<c:if test="${ !empty qnaOne.qna_answer_regdate }">
						<div class="fundingAdminContainerContentHeader"  style="height: 1000px;" >
						</c:if>  
						
						<c:if test="${ empty qnaOne.qna_answer_regdate }">
						<div class="fundingAdminContainerContentHeader"  style="height: 900px;" >
						</c:if>  
							
							<div class="fundingAdminMainAreaCenter">
						    <div class="fundingAdminMainContent">
						      <div>						      	
						      	 <table id="prodItems"  style="position: relative; top : 10px; left:50px; width:500px;">
						        <tr>
						        <td colspan="2"><h2 class="myPageUserInfo">상품문의 Q&A</h2></td>
						        </tr>
						        <tr>
						          <td><label>글 처리여부<span style="color: red"></span></label></td>
						          <td><input type="text" class="addr_box" required="required" value=${qnaOne.qna_status } readonly></td>
						        </tr>
						        <tr>
						          <td><label>이름<span style="color: red"></span></label></td>
						          <td><input type="text" class="addr_box" required="required" value=${qnaOne.user_name } readonly></td>
						        </tr>
						         <tr>
						          <td><label>핸드폰번호<span style="color: red"></span></label></td>
						          <td><input type="text" class="addr_box" required="required" value=${qnaOne.user_phone } readonly></td>
						        </tr>
						        <tr>
						          <td><label>이메일<span style="color: red"></span></label></td>
						          <td><input type="text" class="addr_box" required="required" value=${qnaOne.user_email } readonly></td>
						        </tr>
						        <tr>
						          <td><label>작성일<span style="color: red"></span></label></td>
						          <td><input type="text" class="addr_box" required="required" value=${qnaOne.qna_regdate } readonly></td>
						        </tr>
						        <tr>
						          <td><label>문의 제목<span style="color: red"></span></label></td>
						          <td><input type="text" class="addr_box" required="required" value=${qnaOne.qna_name } readonly></td>
						        </tr>
						        <tr>
						          <td><label>문의 내용<span style="color: red"></span></label></td>
						          <td><textarea type="text" class="addr_box" required="required" rows=5 readonly>${qnaOne.qna_content }</textarea></td>
						        </tr>
						        
						        <c:if test="${ !empty qnaOne.qna_answer_regdate }">
						        <tr>
						          <td><label>답변 작성일<span style="color: red"></span></label></td>
						          <td><input type="text" class="addr_box" required="required" value=${qnaOne.qna_regdate } readonly></td>
						        </tr>
						        </c:if>  
						        
						        <tr>
						          <td><label>관리자 답변<span style="color: red"></span></label></td>
						          <td><textarea type="text" id="adminQnaAnswerText" class="addr_box" required="required" rows=5>${qnaOne.qna_answer_content }</textarea></td>
						        </tr>
							    </table>
							    <div style="text-align: center; margin-top: 60px;">
							    	<button type="button" class="d_btn" onclick="javascript:history.back()">목록으로 가기</button>
							    	<c:if test="${ empty qnaOne.qna_answer_content }">
							    	<button type="button" class="d_btn" id="adminQnaAnswerUpdateBtn">답글 작성하기</button>
							    	</c:if>
							    	<c:if test="${ !empty qnaOne.qna_answer_content }">
							    	<button type="button" class="d_btn" id="adminQnaAnswerUpdateBtn">답글 수정하기</button>
							    	</c:if>
							    </div>
							    <form id="adminQnaAnswer" action="fundingAdminQnaAnswer.do" method="post">
							    	<input type="hidden" id="selsectOneqnaNum" name="qna_no" value=${qnaOne.qna_no }>
							    	<input type="hidden" id="adminQnaAnswerTextHidden" name="qna_content" value="">
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
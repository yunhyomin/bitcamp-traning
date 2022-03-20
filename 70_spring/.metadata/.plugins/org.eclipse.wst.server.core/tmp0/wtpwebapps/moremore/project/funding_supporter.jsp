<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서포터</title>
<style>
/* 투자자 전체 영역 */
#investor_container {
   position:relative;
   width: 600px;
   height: 600px;
   border: 1px solid #c0c0c0;
   margin-top: 30px;
}
/* 투자자 내역 전체 영역 */
#support_data_All {
   position: relative;
   width: 600px;
   height: 600px;
   margin-top: 20px;
}
/* 투자자수 텍스트 영역 */
#investor_ea {
   position:relative;
   width: 600px;
   height: 30px;
   line-height: 30px;
   font-size: 23px;
   font-weight: 100;
   color: #551a8b;
   margin-top: 20px;
}
/* 투자자수 데이터 영역 */
#investor_data {
   position:relative;
   width: 600px;
   height: 30px;
   line-height: 30px;
   font-size: 23px;
   font-weight: bold;
   margin-top: 20px;
}
/* 투자자 공개 전체 */
#open_name_All {
   position: relative;
   width: 600px;
}
#private_name_All {
   position: relative;
   width: 600px;
}
/* 투자자 비공개 전체*/
/* 투자자 텍스트영역(공개) */
#open_name {
   position: relative;
   width: 450px;
   height: 30px;
   line-height: 30px;
   font-size: 17px;
   margin: 15px 0px 0px 60px;
   text-align: left;
}
/* 투자자 데이터영역(공개) */
#open_data {
   position: relative;
   width: 450px;
   height: 30px;
   line-height: 30px;
   font-size: 17px;
   font-weight: bold;
   color: #551a8b;
}
/* 투자자 텍스트영역(비공개) */
#private_name {
   position: relative;
   width: 450px;
   height: 30px;
   line-height: 30px;
   font-size: 17px;
   margin: 15px 0px 0px 60px;
   text-align: left; 
   
}
/* 투자자 데이터영역(비공개) */
#private_data {
   position: relative;
   width: 450px;
   height: 30px;
   line-height: 30px;
   font-size: 17px;
   font-weight: bold;
   color: #551a8b;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

   <!-- 투자자수 -->
   <div id="investor_container">
      <div id="investor_ea">현재 이 프로젝트에<span id="investor_data"> ${investor }</span> 명의 참여가 이루어졌습니다</div>
      <div id="support_data_All">
         <c:forEach var="support" items="${getSupporterList }">
            <!-- 공개 -->
            <div id="open_name_All">
               <c:if test="${support.private_name == '공개' }">
                  <span><img alt="user" src="../images/address_name.png" width="20px;" height="20px;" style="float: left; margin: 0px 0px 0px 30px;"></span>
                  <div id="open_name">
                     <span id="open_data">${support.user_name }</span>님이
                     <span id="open_data"><fmt:formatNumber value="${support.payment_price }" pattern="#,###" /></span>원 펀딩으로 참여하셨습니다.
                  </div>
               </c:if>
            </div>
            <!-- 비공개 -->
            <div id="private_name_All">
               <c:if test="${support.private_name == '비공개' }">
                  <img alt="user" src="../images/address_name.png" width="20px;" height="20px;" style="float: left; margin: 0px 0px 0px 30px;">
                  <div id="private_name">
                     <span id="private_data">익명</span>님이
                     <span id="private_data"><fmt:formatNumber value="${support.payment_price }" pattern="#,###" /></span>원 펀딩으로 참여하셨습니다.
                  </div>
               </c:if>
            </div>
         </c:forEach>
      </div>
   </div>
</body>
</html>
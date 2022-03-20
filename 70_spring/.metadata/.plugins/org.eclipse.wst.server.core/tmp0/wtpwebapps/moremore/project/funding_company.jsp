<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#company_container {
   position: relative;
   width: 600px;
   height: 130px;
   margin-left: 100px;
   border: 1px solid #c0c0c0;
   margin-top: 30px;
}
/* 전체 영역 -> 이미지 제외*/
#company_info_All {
   position: relative;
   width: 500px;
   height: 130px;
   margin-left: 110px;
}
/* 텍스트 + 데이터 영역 */
#company_info_name, #company_user_name, #company_user_phone, #company_user_email {
   position: relative;
   width: 600px;
   font-size: 15px;
   margin-top: 10px;
   display: flex;
}  
/*  텍스트 영역 */
#company_info_name_text, #company_user_name_text, #company_user_phone_text, #company_user_email_text {
   position: relative;
   float: left;
   font-weight: bold;
}

/* 데이터 영역 */
#company_info_name_data, #company_user_name_data, #company_user_phone_data, #company_user_email_data {
   position: relative;
   float: left;
}
</style>
</head>
<body>
<div id="company_container">
   <img alt="company_icon" src="../images/company_icon.png" width="50px;" height="50px;" style="float:left; margin-left: 30px; border: 1px solid white; border-radius: 50%">
   <div id="company_info_All">
      <c:forEach var="company" items="${companyInformation }">
         <div id="company_info_name">
            <span id="company_info_name_text">&nbsp;회사명 :&nbsp;&nbsp; </span>
            <span id="company_info_name_data">${company.company_name }</span>
         </div>
         <div id="company_user_name">
            <span id="company_user_name_text">&nbsp;대표자 :&nbsp;&nbsp; </span>
            <span id="company_user_name_data">${company.user_name }</span>
         </div>
         <div id="company_user_phone">
            <span id="company_user_phone_text">&nbsp;회사연락처 :&nbsp;&nbsp; </span>
            <span id="company_user_phone_data">${company.user_phone }</span>
         </div>
         <div id="company_user_email">
            <span id="company_user_email_text">&nbsp;회사이메일 :&nbsp;&nbsp; </span>
            <span id="company_user_email_data">${company.user_email }</span>
         </div>
      </c:forEach>
   </div>
</div>   
</body>
</html>
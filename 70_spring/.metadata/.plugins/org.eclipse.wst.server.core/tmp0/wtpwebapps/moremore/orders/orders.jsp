<%@page import="com.spring.more.orders.service.DeliveryVO"%>
<%@page import="com.spring.more.project.service.GoodsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.more.project.service.ProjectVO"%>
<%@page import="com.spring.more.users.service.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   /* UsersVO user = (UsersVO) session.getAttribute("user"); */

   ProjectVO pro = (ProjectVO) session.getAttribute("pro");

   GoodsVO gvo = (GoodsVO) session.getAttribute("gvo");

   DeliveryVO dvo = (DeliveryVO) session.getAttribute("dvo");
   System.out.println("========= dvo ========== " + dvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../resources/css/styles.css" type="text/css" />
</head>
<style>
/* order_select.jsp 전체 영역 */
#container {
   position: relative;
   width: 100%;
   height: 1500px;
   text-align: center;
   /* margin-bottom: 100px; */
   /* padding-bottom: 100px; */
}

/* container 안에 있는 div 영역 */
#option {
   position: relative;
   width: 1080px;
   height: 1500px;
   left: 50%;
   margin: 50px 0px 50px -540px;
}

/* ========================== 원형 3개 시작 ======================== */
/* 원형 3개 영역을 감싸는 div*/
#order_circle {
   position: relative;
   width: 1080px;
   height: 100px;
   line-height: 100px;
   display: inline;
   list-style: none; /* li 태그 숫자 없애기 */
   margin: 20px 0px;
}

/* 현재 진행중인 결제 단계*/
#circle_two {
   background-color: #837eff;
   width: 100px;
   height: 100px;
   display: table-cell;
   vertical-align: middle;
   text-align: center;
   border-radius: 50%;
   font-size: 17px;
   color: white;
   line-height: 100px;
   border: 1px dashed black;
   margin-left: 50px;
   
}

/* 이전.다음 단계 */
#circle_one, #circle_three {
   background-color: white;
   width: 100px;
   height: 100px;
   display: table-cell;
   vertical-align: middle;
   text-align: center;
   border-radius: 50%;
   font-size: 17px;
   line-height: 100px;
   border: 1px dashed black;
}

/* 펀딩내역 */
#order_history {
   position: relative;
   width: 1000px;
   height: 280px;
   margin: 10px auto;
   border: 1px solid silver;
}
/* ========================== 원형 3개 끝 ======================== */

/* ========================== 펀딩내역 시작 ======================== */
/* 펀딩내역 - 텍스트 영역 */
#order_history_text {
   position: relative;
   width: 1000px;
   height: 30px;
   line-height: 30px;
   font-size: 20px;
   font-weight: bold;
   text-align: left;
   margin: 15px 0px 0px 30px;
}

/* 펀딩내역 - 선 style */
#order_border {
   position: relative;
   width: 1000px;
   border-top: 1px solid silver;
   margin: 15px 0px;
}

/* 펀딩내역 - 펀딩 옵션내역 전체 */
#order_history1, #order_history2, #order_history3 {
   position: relative;
   width: 1000px;
   height: 30px;
   line-height: 30px;
   font-size: 17px;
   margin-bottom: 5px;
}

/* 펀딩내역 - 펀딩 옵션내역 좌측 */
#order_history_content, #order_donation, #order_delivery_text, #order_delivery_date{
   width: 500px;
   float: left;
   text-align: left;
   margin-left: 30px;
   color: #515151;
   
}

/* 펀딩내역 - 펀딩 옵션내역 우측 */
#order_history_price, #order_donation_price, #order_delivery_price, #order_All {
   width: 300px;
   float: left;
   text-align: right;
   margin-left: 160px;
   color: #515151;
   
}

/* 펀딩내역 - 펀딩 옵션 제목 데이터 */
#order_history_content {
   font-weight: bold;
   color:black;
}

/* 펀딩내역 - 갯수, 금액 데이터 */
.or_number, .or_price, #order_history_price {
   font-weight: bold;
   color: #551A8B;;
}

/* 펀딩내역 - "펀더에게 응원하기" 텍스트 영역 */
#order_donation {
   color : #363636;
}

/* 펀딩내역 - 배송 출발 데이터 영역 */
#delivery_date {
   font-weight: bold;
   color: #551A8B;;
}

/* 펀딩내역 - 결제 날짜 데이터 영역 */
#order_delivery_date {
   font-size: 18px;
   font-weight: bold;
}

/* 펀딩내역 - 총 결제 금액 및 결제 날짜 */
#order_All {
   font-size: 20px;
   font-weight: bold;
   color: #551A8B;;
   
}
/* ========================== 펀딩내역 끝 ======================== */

/* ========================== 배송지 시작 ======================== */
/* 배송지 정보 전체 */
#order_delivery {
   position: relative;
   width: 1000px;
   height: 280px;
   margin: 30px auto;
   border: 1px solid silver;
}

/* 배송지 정보 - "배송지 정보" 텍스트 영역 */
#delivery_text {
   position: relative;
   width: 1000px;
   height: 30px;
   line-height: 30px;
   font-size: 20px;
   font-weight: bold;
   text-align: left;
   margin: 15px 0px 0px 30px;
}

/* 배송지 정보 - 기본배송지, 직접입력 선택 영역[라디오]*/
#radio_delivery {
   position: relative;
   width: 1080px;
   text-align: left;
   margin: 0px 0px 30px 30px;
}

/* 배송지 입력 전체 영역 */
#delivery_name, #delivery_phone, #delivery_address {
   position: relative;
   width: 1000px;
   height: 30px;
   line-height: 30px;
   font-size: 17px;
   margin-bottom: 5px;
}

/* 배송지 입력 - 좌측 */
#delivery_name_text, #delivery_phone_text, #delivery_address_text {
   width: 500px;
   float: left;
   text-align: left;
   margin-left: 30px;
   color: #515151;
}

/* 배송지 입력 - 우측 */
#delivery_name_data, #delivery_phone_data, #delivery_address_data {
   width: 300px;
   font-weight: bold;
   float: left;
   text-align: left;
   margin-left: -400px;
   color: #515151;
}

/* 배송지 popup */
#popup_insert {
   width: 400px;
   height: 600px;
   position: absolute;
   left: 50%;
   top: 50%;
   margin-left: -440px;
   margin-top: -350px;
   background-color: white;
   border: 1px solid silver;
   display: none;
   padding: 20px 40px 40px 40px;
   text-align: left;
   overflow: scroll;
}

/* ========================== 배송지 끝 ======================== */

/* ========================== 결제정보 시작 ======================== */
/* 결제정보 */
#order_price {
   position: relative;
   width: 1000px;
   height: 150px;
   margin: 30px 10px;;
}

/* 결제정보 - "결제정보" 텍스트 영역 */
#order_price_text {
   position: relative;
   width: 1000px;
   height: 30px;
   line-height: 30px;
   font-size: 20px;
   font-weight: bold;
   text-align: left;
   margin: 15px 0px 20px 30px;
}

/* 결제정보 - "결제정보" 라디오 선택 영역 전체 */
#order_select {
   position: relative;
   width: 500px;
   height: 75px;
   text-align: left;
   margin-left: 30px;
   border: 1px solid silver;
}

/* 결제정보 - 박스 가운데 선  */
#price_border {
   position: relative;
   width: 500px;
   border-top: 1px solid silver;
}

/* 결제정보 - 결제정보 라디오 "현금" 선택 영역 */
#order_money {
   position: relative;
   width: 500px;
   height: 75px;
   line-height: 75px;
   margin-left: 20px;
}

/* 결제정보 - 결제정보 라디오 "카드" 선택 영역 */
/* #order_card {
   width: 500px;
   height: 75px;
   line-height: 75px;
   margin-left: 20px;
} */
/* ========================== 결제정보 끝 ======================== */

/* ========================== 약관 및 버튼 시작 ======================== */
/* 유의사항 및 약관동의 - 전체 영역 */
#order_terms {
   position: relative;
   width: 1000px;
   height: 250px;
   margin: 30px auto;
}

/* 유의사항 및 약관동의 - 텍스트 영역*/
#order_agreement {
   position: relative;
   width: 1000px;
   height: 30px;
   line-height: 30px;
   font-size: 20px;
   font-weight: bold;
   text-align: left;
   margin: 15px 0px 20px 30px;
}

/* 유의사항 및 약관동의 - 박스 영역 */
#order_box {
   position: relative;
   width: 900px;
   height: 250px;
   text-align: left;
   margin: 0 auto;
   border: 1px solid silver;
   background: #fafafa;
}

/* 하단 버튼 - 전체 영역 */
#next_cancle {
   position: relative;
   width: 1080px;
   height: 100px;
}

/* 하단 버튼 - 좌측 : 펀딩 참여하기*/
#order_success, #order_cancle {
   width: 150px;
   height: 40px;
   font-size: 18px;
   color: white;
   background-color: #551A8B;;
   border-radius: 10px;
   border: 0px solid white;
   margin-top: 90px;
   cursor: pointer;
}

#notice_ok {
   width: 1000px;
   height: 30px;
}

#notice_ok_text {
   height: 30px;
   font-size: 15px;
}

#notice_ok_check {
   width: 15px;
   height: 15px;
}


/* ========================== 약관 및 버튼 끝 ======================== */

/* ========================== popup 관련 css 시작 ======================== */
/* 배송지 텍스트*/
#address_text {
   width: 350px;
   margin-left: 10px;
   font-size: 16px;
}
/* 배송지 추가 버튼 */
#adress_insert_btn, #adress_close_btn {
   width: 100px;
   height: 30px;
   background-color: #551A8B;
   font-size: 15px;
   color: white;
   font-weight: 100;
   border: 0px solid white;
   border-radius: 5px;
   margin-left: 10px;
}

/* 배송지 추가 전체 div */
#address_insert {
   position: relative;
   width: 350px;
   height: 440px;
   border: 1px solid silver;
   font-size: 18px;
   display: none;
   margin-top: 10px;
}

/* 배송지 추가 div - 각각의 div */
#add_name, #add_number ,#add, #add_phone, #add_class, #add_select_number {
   width: 300px;
   height: 50px;
   line-height: 50px;
   margin: 10px 0 0 10px;
   border: 1px solid black;
}

/* input-type css */
#address_name, .address_number, .address, #address_phone, #address_class, #address_select_number {
   width: 230px;
   height: 40px;
   line-height: 40px;
   margin-left: 15px;
   border: 0px solid white;
}

/* 우편번호 찾기 버튼 수정*/
#address_select_number {
   height: 50px;
   line-height: 50px;
   color: #696969;
   border: 0px solid white;
   background-color: white;
   float: left;
   text-align: left;
   margin-left: 10px;
}

/* 배송지 추가(제출) 버튼 */
#address_submit, #address_cancle {
   width: 100px;
   height: 30px;
   background-color: #551A8B;
   font-size: 15px;
   color: white;
   font-weight: 100;
   border: 0px solid white;
   border-radius: 5px;
   margin-top: 20px;
   margin-left: 10px;
}
/* =========================== */
/* Select */
#delivery_address_select {
   width: 350px;
   height: 130px;
   border: 1px solid #bfbfbf;
   margin-top: 10px;
   font-size: 15px;
}

#address_name_select {
   width: 300px;
   height: 30px;
   line-height: 30px;
   font-weight: bold;
   margin: 3px 0px 0px 10px;
}

#address_class_select {
   width: 100px;
   height: 20px;
   line-height: 20px;
   margin: 3px 0px 0px 10px;
   border: 1px solid white;
   border-radius: 10px;
   font-size: 13px;
   text-align: center;
   background-color: #f5f5f5;
}

#address_All {
   width: 300px;
   height: 30px;
   line-height: 30px;
   margin: 3px 0px 0px 0px;
}

#address_number_select {
   width: 300px;
   height: 30px;
   line-height: 30px;
   margin: 3px 0px 0px 10px;
}

#address_select_data {
   width: 300px;
   height: 30px;
   line-height: 30px;
   margin: 3px 0px 0px 10px;
}

#address_phone_select {
   width: 300px;
   height: 30px;
   line-height: 30px;
   margin: 3px 0px 0px 10px;
}

#adderss_send {
   width:300px;
}
   
/* ========================== popup 관련 css 끝 ======================== */
</style>
<script>
   var user_no = ${sessionScope.loginUsers.user_no};
   var or_price_sum = "";   
   
   $(document).ready(function(){
      basic_address_Select();
      address_check();
      payment_date();
   });
   
   /* ===================== [ 배송지 영역 시작 ]============================ */
   // 배송지 변경 팝업창 열기
   function basic_address() {
      $("#popup_insert").css("display", "block");      
      getDeliveryList();
   }
   
   // 배송지 변경 팝업창 닫기
   function popup_close() {
      $("#popup_insert").css("display", "none");
   }
   
   // 배송지 조회
   function getDeliveryList() {
      
      let d_vo = {};
      d_vo.user_no = user_no;
      
      $.ajax("addressSelect.do", {
         type: "post",
         data: JSON.stringify(d_vo),
         dataType: "json",
         contentType: "application/json",
         success: function(data){
            // alert(data); 
             
            let dispHtml = '';
            
            dispHtml += '<div id="confrim">';
            $.each(data, function(index, delivery) {
               dispHtml += '<div id="delivery_address_select">';
               
               dispHtml += '<img alt="close" src="../images/address_close.png" width="15px" height="15px" style="float:right; margin: 10px 10px 0px 0px; border:2px solid red;"' 
                           + 'onclick="addressDetlet(\'' 
                           + delivery.delivery_arrival_date + '\', \'' + delivery.delivery_class + '\')">';
                           
               dispHtml += '<div id="adderss_send"  onclick="address_check(\'' 
                  + delivery.delivery_name + '\', \'' + delivery.delivery_address + '\', \''   
                  + delivery.delivery_address_number + '\', \'' + delivery.delivery_address_phone + '\')">';            
                  
               dispHtml += '<div id="address_name_select">' + delivery.delivery_name + '</div>';
               dispHtml += '<div id="address_class_select">' + delivery.delivery_class + '</div>';
               
               dispHtml += '<div id="address_All">'
                  dispHtml += '<span id="address_number_select">' + delivery.delivery_address_number + '</span>';
                  dispHtml += '<span id="address_select_data">' + delivery.delivery_address + '</span>';
               dispHtml += '</div>'
               
               dispHtml += '<div id="address_phone_select">' + delivery.delivery_address_phone + '</div>';
               
               dispHtml += '</div>'
               dispHtml += '</div>';
            }); 
            dispHtml += '</div>';
            
            $("#delivery_list").html(dispHtml);
         },
         error : function(jqXHR, textStatus, errorThrown) {
            alert("getDeliveryList() Ajax 처리 실패 : \n" + "jqXHR.readyState : "
                  + jqXHR.readyState + "\n" + "textStatus : "
                  + textStatus + "\n" + "errorThrown : " + errorThrown);
         }
      });
   }
   
   // - 배송지 추가 열기
   function addressInsert() {
      $("#address_insert").css("display", "block");

   }

   // - 배송지 추가 닫기
   function addressCancle() {
      $("#address_insert").css("display", "none");
   }
   
   // - 배송지 삭제
   function addressDetlet(delivery_arrival_date, delivery_class) {

      let d_vo = {};
      d_vo.user_no = user_no;
      d_vo.delivery_arrival_date = delivery_arrival_date;
      d_vo.delivery_class = delivery_class;

      var answer = confirm("배송지를 삭제하시겠습니까??");
      if (answer) {
         $.ajax("addressDelete.do", {
            type : "post",
            data : JSON.stringify(d_vo),
            dataType : "text",
            contentType : "application/json",
            success : function(data) {
               getDeliveryList();
            },
            error : function(jqXHR, textStatus, errorThrown) {
               alert("addressDetlet() Ajax 처리 실패 : \n"
                     + "jqXHR.readyState : " + jqXHR.readyState + "\n"
                     + "textStatus : " + textStatus + "\n"
                     + "errorThrown : " + errorThrown);
            }
         });

      } else {
         alert("배송지 삭제가 취소되었습니다.");
      }

   }
   
   // 기본 배송지 설정
   function basic_address_Select() {
      
      let o_vo = {};
      o_vo.user_no = user_no;
      
      $.ajax("basic_address_Select.do", {
         type: "post",
         data: JSON.stringify(o_vo),
         dataType: "json",
         contentType: "application/json",
         success: function(data){
            //alert("성공");
            //alert(data);
            //console.log(data);
            
            let dispHtml = '';
            
            if(data.length < 1) {
               dispHtml += "<p>";
               dispHtml += "기본배송지가 없습니다.";
               dispHtml += "</p>" ;
            } else {
               dispHtml += '<div" id="delivery_data_All">';
               $.each(data, function(index, delivery) {
                  dispHtml += '<div id="delivery_name">'
                  dispHtml += '<div id="delivery_name_text">이름</div>'
                  dispHtml += '<div id="delivery_name_data">' + delivery.delivery_name + '</div>';
                  dispHtml += '</div>'
                  dispHtml += '<div id="delivery_phone">'
                  dispHtml += '<div id="delivery_phone_text">연락처</div>'
                  dispHtml += '<div id="delivery_phone_data">' + delivery.delivery_address_phone + '</div>';
                  dispHtml += '</div>'
                  dispHtml += '<div id="delivery_address">'
                  dispHtml += '<div id="delivery_address_text">주소</div>'
                  dispHtml += '<div id="delivery_address_data">';
                  dispHtml += '<span id="delivery_address_number">' + delivery.delivery_address_number + '</span>';
                  dispHtml += '<span id="delivery_address_detail">' + delivery.delivery_address + '</span>';
                  dispHtml += '</div>'
               }); 
               dispHtml += '</div">';
            }
            $("#delivery_data_All").html(dispHtml);
         },
         error : function(jqXHR, textStatus, errorThrown) {
            alert("basic_address_Select() Ajax 처리 실패 : \n"
               + "jqXHR.readyState : " + jqXHR.readyState + "\n"
               + "textStatus : " + textStatus + "\n"
               + "errorThrown : " + errorThrown);
         }
      });
   }
   
   // 배송지 변경하는 팝업창 
   /* function directly_address() {
      alert("직접입력");
      
      let dispHtml = '';
      
      dispHtml += '<div id="delivery_data_All">';
      dispHtml += '<div id="delivery_name">';
      dispHtml += '<div id="delivery_name_text">이름</div>';
      dispHtml += '<div id="delivery_name_data"><input type="text" id="directyly_name_data" name="name" style="border: 1px solid silver;"></div>';
      dispHtml += '</div>';
      dispHtml += '<div id="delivery_phone">';
      dispHtml += '<div id="delivery_phone_text">연락처</div>';
      dispHtml += '<div id="delivery_phone_data"><input type="text" id="directyly_phone_data" name="phone" style="border: 1px solid silver;"></div>';
      dispHtml += '</div>';
      dispHtml += '<div id="delivery_address">';
      dispHtml += '<div id="delivery_address_text">주소</div>';
      dispHtml += '<div id="delivery_address_data">';
      dispHtml += '<input type="button" class="d_btn"  onclick="FindAddrDaumPostcode()" value="우편번호 찾기" ' 
                  + 'style="height=16px; line-height=16px; font-size:12px; border: 1px solid silver; margin: 10px 10px 0px 0px; background-color: #f5f5f5;">'
      dispHtml += '<span id="delivery_address_number"><input type="text" name="address_number" id="address_number"' 
               + 'style="width:50px; border: 1px solid silver; margin-right:10px; "></span>';
      dispHtml += '<span id="delivery_address_detail"><input type="text" name="address_detail" id="address"' 
               + 'style="width:300px; border: 1px solid silver;"></span>';
      dispHtml += '</div>';
      dispHtml += '</div>';
      
      dispHtml += '</div>';
      
      $("#delivery_data_All").html(dispHtml);
      
   } */
   
   // 회원이 원하는 배송지 선택
   function address_check(delivery_name, delivery_address, delivery_address_number, delivery_address_phone) {
      
      var delivery_name = delivery_name;
      var delivery_address_phone = delivery_address_phone;
      var delivery_address = delivery_address;
      var delivery_address_number = delivery_address_number;
      
      $("#delivery_name_data").html(delivery_name);
      $("#delivery_phone_data").html(delivery_address_phone);
      $("#delivery_address_number").html(delivery_address_number);
      $("#delivery_address_detail").html(delivery_address);
      
      popup_close();
   }
   
   /* ===================== [ 배송지 영역 끝 ]============================ */
   
   /* ===================== [ 결제 시작 ]============================ */
   var IMP = window.IMP; // 생략 가능
   IMP.init("imp33858457"); // 예: imp00000000
   var msg;

   function requestPay() {
      //alert("신용카드");
      
      var user_email = "${sessionScope.loginUsers.user_email }";
      var delivery_name = $("#delivery_name_data").text();
      var delivery_phone = $("#delivery_phone_data").text();
      var delivery_address_number = $("#delivery_address_number").text();
      var delivery_address = $("#delivery_address_detail").text();
      
      //alert(delivery_name);
      
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ 
         pg : "html5_inicis", //PG사 선택
         pay_method : "card", //지불 수단
         merchant_uid : "ORD20180131-0000060", // 가맹점에서 구별할 수 있는 고유한 id
         name : "MOREORE펀딩결제",
         amount : 23400,
         buyer_email : user_email,
         buyer_name : delivery_name,
         buyer_tel : delivery_phone,
         buyer_addr : delivery_address,
         buyer_postcode : delivery_address_number
      }, function(rsp) { // callback
         console.log(rsp);
         if (rsp.success) {
        	//결제 성공시 로직에서 
        	msg += '결제가 완료되었습니다.'; 
         } else {
            // 결제 실패 시 로직,
            msg += '결제에 실패하였습니다.';
            msg += '에러 내용 : ' + rsp.error_msg;
         }
         alert(msg);
      });
   }
   
   /* ===================== [ 결제 끝 ]============================ */
     function FindAddrDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
  
              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }
  
              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
              if(data.userSelectedType === 'R'){
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                  }
              } 
              
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('address_number').value = data.zonecode;
              document.getElementById('address').value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("address").focus();
          }
      }).open();

  }
   
     /*  //예상배송일
   	function deliveryData() {
   		var delivery_day = new Date("${pro.pro_close_dt }");
   		alert("delivery_day : " + delivery_day.toLocaleString());
   		delivery_day.setDate(delivery_day.getDate() + 3);
   		delivery_start = delivery_day.toLocaleString().substring(0,12);
   		$(".delivery_start").html(delivery_start);
   	}
 	 
   	 //총갯수 총금액
     function order_all_sum_ea() {
     	var all_sum = $("#order_donation_price>span").val();
     	var all_ea = $("#od_ea_sum").val();
     	for (var i = 0; i <= $(".od_price_sum").length; i++) {
     		all_ea += parseInt($(".od_ea").eq(i).val());
     		all_sum += parseInt($(".od_price_sum").eq(i).val());
 		}
     	$("#order_all_ea_sum").html(all_ea); //총갯수
     	$("#order_all_sum").html(all_sum); //총금액
 	} */
 	
 // 현재 날짜 구하기 -> 결제예정 부분에 넣을 것
    function payment_date() {
       let today = new Date();
       let year = today.getFullYear();
       let month = today.getMonth() + 1;
       let day = today.getDate();
       let dString = year + '-' + month + '-' + day;
       
       $("#payment_date").html(dString);
    }
    
    // 다음페이지로 이동     
    function orderSuccess() {
       
       location.href = "orders_success.jsp";
    }
</script>
<style>

</style>
<%@ include file="../common/homeHeader.jsp" %> <!-- header-->
<body>
   <div id="container">
      <div id="option">

         <!-- 현재 진행 단계를 보여주는 원형 영역 -->
         <div>
            <ol id="order_circle">
               <li id="circle_one">리워드선택</li>
               <li id="circle_two">결제예약</li>
               <li id="circle_three">참여완료</li>
            </ol>
         </div>

         <!-- 펀딩전체 내역 -->
         <div id="order_history">
            <div id="order_history_text">펀딩내역</div>
            <div id="order_border"></div>

           <!-- 펀딩 내역 : 선택한 옵션 -->
            <div id="order_history1">
            <c:set var = "total_ea" value = "0" />
            <c:set var = "total_price" value = "0" />
            <c:forEach var="vo" items="${selectList }">
               <c:if test="${vo.goods_ea != '0'}">
               <div id="order_history_content">${vo.goods_title }</div>
               <div id="order_history_price">
                  <span class="or_number">${vo.goods_ea }</span>개｜ 
                  <span id="or_price_sum" class="or_price">
                 
                     <fmt:formatNumber value="${vo.goods_price }" pattern="#,###" />
                  
                  </span>원
               </div>
               </c:if>
                <c:set var= "total_ea" value="${total_ea + vo.goods_ea }"/>
               <c:set var= "total_price" value="${total_price + (vo.goods_ea * vo.goods_price) }" />
              </c:forEach>
            </div>
            <!-- 펀딩 내역 : 후원금 영역 -->
            <div id="order_history2">
               <div id="order_donation">펀더에게 응원하기</div>
               <div id="order_donation_price">
                  <span>${privName_donaPrice.donation_price }</span>원
               </div>
            </div>
            <div id="order_history2">
               <div id="order_donation">이름 공개여부</div>
               <div id="order_donation_price">
                  <span>${privName_donaPrice.private_name }</span>
               </div>
            </div>
            <!-- 펀딩 내역 : 배송비 영역 -->
            <div id="order_history3">
               <div id="order_delivery_text">
                     배송비
               </div>
               <div id="order_delivery_price">
                  <span>2,500</span>원
               </div>
            </div>
            <div id="order_border"></div>
            <!-- 펀딩 내역 : 결제금액 및 날짜 -->
            <div id="order_delivery_date">
               <span id="payment_date"></span>결제예정
            </div>
            <div id="order_All">
                     총 <span id="all_order_ea_sum"><c:out value="${total_ea }"/></span>개｜
                   <!--   총 <span id="all_order_price_sum">79,000</span>원 -->
                     총 <span id="all_order_price_sum">
                    <fmt:formatNumber pattern="#,###"><c:out value="${total_price + 2500 + privName_donaPrice.donation_price.replace(',', '') }"/></fmt:formatNumber>
               </span>원
            </div>
         </div>
         
         <!-- 배송비 정보 -->   
         <div id="order_delivery">
            <div id="delivery_text">배송지 정보</div>
            <div id="order_border"></div>

            <!-- 기본배송지 / 직접입력 영역 -->
            <div id="radio_delivery">
               <input type="radio" name="address" id="basic_address"
                  value="basic_address" checked onclick="basic_address()"> <label
                  for="basic_address">배송지변경</label> <input type="radio"
                  name="address" id="directly_address" value="directly_address"
                  onclick="directly_address()"> <label
                  for="directly_address">직접입력</label>
            </div>

            <!-- 배송지 변경 영역 -->
            <div id="delivery_data_All">
               <div id="delivery_name">
                  <div id="delivery_name_text">이름</div>
                  <div id="delivery_name_data"></div>
               </div>
               <div id="delivery_phone">
                  <div id="delivery_phone_text">연락처</div>
                  <div id="delivery_phone_data"></div>
               </div>
               <div id="delivery_address">
                  <div id="delivery_address_text">주소</div>
                  <div id="delivery_address_data">
                     <span id="delivery_address_number"></span>
                     <span id="delivery_address_detail"></span>
                  </div>
               </div>
            </div>
            
         </div>

         <!-- 결제정보 -->
         <div id="order_price">
            <div id="order_price_text">결제정보</div>
            <div id="order_select">
               <div id="order_money">
                  <input type="radio" name="moneycard" id="order_transfer" value="transfer" checked><label for="order_transfer">계좌이체</label>
                  <input type="radio" name="moneycard" id="order_bank" value="bank"><label for="order_bank">무통장입금</label> 
                  <input type="radio" name="moneycard" id="order_card" value="card" onclick="requestPay()"><label for="order_card">신용카드</label>
               </div>
               <!-- <div id="price_border"></div>
               <div id="order_card"></div> -->
            </div>
         </div>

         <!-- 유의사항 및 약관동의 -->
         <div id="order_terms">
            <div id="order_agreement">유의사항 및 약관동의</div>
            <div id="order_border"></div>
            <div id="order_box">
               <%@ include file="order_notice.jsp"%>
            </div>
            <div id="notice_ok">
                  <span id="notice_ok_text">약관에 동의하십니까?</span>
               <input type="checkbox" name="order_check" id="notice_ok_check" value="ok" checked>
            </div>
         </div>

         <div id="next_cancle">
            <button id="order_success" onclick="orderSuccess()">펀딩 참여하기</button>
            <button id="order_cancle">취 소</button>
         </div>
         
         <!-- 배송지 popup창 생성 -->
         <div id="popup_insert">
            <div id="address_text">배송지</div>
            <hr style="width: 350px; border-color: #e6e0e0; float: left;">
            <br>
            <button id="adress_insert_btn" onclick="addressInsert()">배송지 추가</button>
            <button id="adress_close_btn" onclick="popup_close()">닫기</button>

            <!-- 배송지 추가 -->
            <div id="address_insert">
               <form action="addressInsert.do" method="post">
                  <input type="hidden" name="user_no" value="${sessionScope.loginUsers.user_no }">
                  <div id="add_name">
                     <img alt="name" src="../images/address_name.png" width="30px"
                        height="30px" style="float: left; margin: 10px 0px 0px 20px;">
                     <input type="text" name="delivery_name" id="address_name"
                        placeholder="받는 사람">
                  </div>
                  <div id="add_select_number">
                     <img alt="name" src="../images/address.png" width="30px" height="30px" style="float: left; margin: 10px 0px 0px 20px;">
                     <input type="button" id="address_select_number" onclick="FindAddrDaumPostcode()" value="우편번호 찾기">
                  </div>   
                  <div id="add_number">
                     <img alt="name" src="../images/address.png" width="30px"
                        height="30px" style="float: left; margin: 10px 0px 0px 20px;">
                     <input type="text" id="address_number" name="delivery_address_number" class="address_number" placeholder="우편번호">
                  </div>
                  <div id="add">
                     <img alt="name" src="../images/address.png" width="30px" height="30px" style="float: left; margin: 10px 0px 0px 20px;">
                     <input type="text" id="address" name="delivery_address" class="address" placeholder="주소">
                  </div>
                  <div id="add_phone">
                     <img alt="name" src="../images/address_phone.png" width="30px"
                        height="30px" style="float: left; margin: 10px 0px 0px 20px;">
                     <input type="text" name="delivery_address_phone"
                        id="address_phone" placeholder="휴대폰번호">
                  </div>
                  <div id="add_class">
                     <img alt="name" src="../images/address_class.png" width="30px"
                        height="30px" style="float: left; margin: 10px 0px 0px 20px;">
                     <input type="text" name="delivery_class" id="address_class"
                        placeholder="기본배송지">
                  </div>
                  <input type="submit" id="address_submit" value="배송지 추가"> <input
                     type="button" id="address_cancle" onclick="addressCancle()" value="취소">
               </form>
            </div>
            <!-- 배송지 조회 -->
            <div id="delivery_list"></div>

         </div>


      </div>
   </div>
</body>
<%@ include file="../homeFooter.jsp" %> <!-- footer -->
</html>
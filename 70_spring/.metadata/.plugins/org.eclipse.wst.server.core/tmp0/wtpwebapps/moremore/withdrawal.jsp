<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 </title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1, user-scalable=yes,initial-scale=1.0" />
   	<link rel="stylesheet" href="resources/css/styles.css" type="text/css" />
   	<script src = "http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
			
		var passwdCheck = RegExp(/^(?=.*[A-Za-z])(?=.*[0-9]).{8,16}$/);
		
			$("#ok").click(function(){
				
				if($("#user_withdrawal_reason").val() === ""){
					alert("탈퇴 사유를 입력해주세요.");
					$("#user_withdrawal_reason").focus();
					return;
				}
				
				if(passwdCheck.test($("#user_pwd").val())){ //비밀번호 검증
				}else{
					alert("비밀번호는 영문과 숫자를 포함하여 8~16자로 입력해주세요");
					$("#user_pwd").focus();
					return;
				}
				if($("#user_pwd").val()==($("#user_pwd_check").val())){ //비밀번호확인 검증
				}else{
					alert("비밀번호를 다시 확인해주세요.");
					$("#user_pwd_check").focus();
					return;
				}
				
				if(confirm("정말로 탈퇴 하시겠습니까?")){
					//검증에 이상이 없으면 submit
					$("#withdrawalUsers").submit();
				}else{
				$("#user_pwd_check").focus();
				return;
				}
				
		});
	});
	
	</script>
</head>
<body>
	<%@include file="homeHeader.jsp" %>
	<div class="adminContainerWrapper">
		<div class="myPageContainerLeft">
			<ul class="myPageLeftMenu">
				<li class="myPageMenuItem"><a href="userInfo.jsp">메인</a></li>
				<li class="myPageMenuItem"><a href="userInfoValidate.jsp">My 회원 정보</a></li>
				<li class="myPageMenuItem"><a href="myPage.jsp">관심 프로젝트</a></li>
				<li class="myPageMenuItem"><a href="withdrawal.jsp">회원 탈퇴</a></li>
				<c:if test="${loginUsers.user_type == '펀딩 판매자'}">
					<li class="myPageMenuItem"><a href="fundingAdminHome.jsp">펀딩 관리 페이지</a></li>
				</c:if>
				<c:if test="${loginUsers.user_type == '상품 판매자'}">
					<li class="myPageMenuItem"><a href="productAdminHome.jsp">상품 관리 페이지</a></li>
				</c:if>
				<c:if test="${loginUsers.user_type == '관리자'}">
					<li class="myPageMenuItem"><a href="siteAdminHome.jsp">관리자 페이지</a></li>
				</c:if>
			</ul>
		</div>
		<div class="adminContainerRightWrapper">
			<div class="adminContainerRight">
				<div class="myPageLocationArea"">
					<h8>마이페이지</h8>
				</div>
				<div class="adminContainerContentArea">
					<div >
						<form action="withdrawalUsers.do" method="post" id="withdrawalUsers" name="withdrawalUsers">
						  <div class="modifyMmeberForm"">
						      <table id="prodItems"  style="position: relative; top : 10px; left:50px; width:80%;">
						        <tr>
						        	<td colspan="2"><h2 class="myPageUserInfo" style="text-align: center;">${loginUsers.user_name }님.</h2></td>
						        </tr>
						        <tr>
						       		<td colspan="2" style="font-size: 16px; text-align: center; padding-bottom: 30px; color: #FF6767;">회원탈퇴사유를 입력해 주시면 앞으로 더욱더 개선해 나가는 <br> 모아모아가 되도록 하겠습니다.</td>
						        </tr>
						        <tr>
						          <td colspan="2" style="padding-bottom: 10px;"><label>탈퇴사유<span style="color: red">*</span></label></td>
						        </tr>
						        <tr>
						          <td colspan="2">
						          	<select id="withdrawalSelect" style="width: 100%;">
						          		<option value="탈퇴 사유 선택" selected>탈퇴 사유를 선택하세요.</option>
						          		<option value="재가입을 위해">재가입을 위해</option>
						          		<option value="컨텐츠 품질과 서비스 정보 부족" >컨텐츠 품질과 서비스 정보 부족</option>
						          		<option value="고객 서비스 불만">고객 서비스 불만</option>
						          		<option value="시스템 장애">시스템 장애</option>
						          		<option value="개인정보 노출 우려">개인정보 노출 우려</option>
						          		<option id="etc" value="">기타(직접입력)</option>
						          	</select>
						          	
						          </td>
						        </tr>
						        <tr>
						          <td colspan="2">
						       		<textarea id="user_withdrawal_reason" name="user_withdrawal_reason" rows=3 style="width: 96%;" readonly>
						          	</textarea>
						          </td>
						        </tr>
						        
						        <%-- <tr>
							     <td>
							          <label>생년월일<span style="color: red">*</span></label>
							     </td>
							    <td> 
						          <input type="text" name="mjumin" id="mjumin" class="formControl"  required="required" value=${loginUsers.user_birthday } readonly>
						        </td>
						        </tr> --%>
						         <tr>
						        <td colspan="2" style="padding-top: 10px; text-align: center;"><h2 class="myPageUserInfo">본인 확인</h2></td>
						        </tr>
						        
						        <tr>
						        <td>
						          <label>아이디<span style="color: red"></span></label></td>
						        <td>
						          <input type="text" name="user_id" id="user_id" class="addr_box" required="required" value="${loginUsers.user_id }" readonly >
						        </td>
						        </tr>
						        <tr>
						        <td>
						          <label>비밀번호<span style="color: red">*</span></label>
						        </td>
						        <td>
						        <input type="password" name="user_pwd" id="user_pwd" class="addr_box" required="required"  maxlength="12" placeholder="비밀번호(5~20자리)">
						        </td>
						         </tr>
						         <tr>
						         <td>
						          <label>비밀번호확인<span style="color: red">*</span></label></td>
						          <td><input  type="password" name="user_pwd_check" id="user_pwd_check" class="addr_box" required="required" onclick="confirm_pw()"  maxlength="12" placeholder="비밀번호 확인"></td>
						        </tr>
							    </table>
						    </div>
						    <div class="modifyMmeberEnd">
							    <input type="button" id="ok" class="d_btn" value="회원탈퇴" onclick="modify_btn()">
					        </div>
						    <input type="hidden" name="mpoint" id="mpoint" value="0">
					        <input type="hidden" name="mcumulative_buy" id="mcumulative_buy" value="0">
					        <input type="hidden" name="mjoindate" id="mjoindate"value="SYSDATE"> 
					        <input type="hidden" name="mclass" id="mclass" value="0">
					    </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="homeFooter.jsp" %>
	 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	var text = document.querySelector("#user_withdrawal_reason");
	var drop = document.querySelector("#withdrawalSelect");
	var etc = document.querySelector("#etc");
	
	drop.addEventListener("change", function(e){
		text.value = e.target.value;
	});
	
	drop.addEventListener("change", function(){
        if(drop.value === ""){
        	text.removeAttribute("readonly");
        } else {
        	text.setAttribute("readonly", true);
        }
	});
	
	// 다음 주소 api
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
	            document.getElementById('userPostcode').value = data.zonecode;
	            document.getElementById("userAddress").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("userDetailAddress").focus();
	        }
	    }).open();
	}
	</script>
</body>
</html>
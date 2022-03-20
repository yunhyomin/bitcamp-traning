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
				
				if(passwdCheck.test($("#user_pwd").val())){ //비밀번호 검증
				}else{
					alert("비밀번호는 영문과 숫자를 포함하여 8~16자로 입력해주세요");
					$("#user_pwd").focus();
					return;
				}
				
				if(confirm("본인 확인을 진행 하시겠습니까?")){
					//검증에 이상이 없으면 submit
					$("#userInfoValidate").submit();
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
						<form action="userInfoValidate.do" method="post" id="userInfoValidate" name="userInfoValidate">
						  <div class="modifyMmeberForm" style="padding-bottom: 50px;">
						      <table id="prodItems"  style="position: relative; top : 10px; left:50px; width:80%;">
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
							    </table>
						    </div>
						    <div class="modifyMmeberEnd">
							    <input type="button" id="ok" class="d_btn" value="확인" onclick="modify_btn()">
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

</body>
</html>
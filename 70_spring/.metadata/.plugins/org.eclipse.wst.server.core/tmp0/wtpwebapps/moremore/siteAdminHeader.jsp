<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<header class="adminHeaderWrapper">
			<div class="adminHeaderContaniner">
				<h4 class="headerLogo">
					<a href="home.jsp" class="headerLogo purple">
					<span ><img src="resources/images/logo1.png"></span>
					</a>
				</h4>
				<h8 class="adminHeaderTitle">사이트 관리자</h8>
			</div>
			<div class="headerUtil">
	            <button type="button" class="myPageBtn" onclick="javascript:location.href='siteAdminHome.jsp'">${ loginUsers.user_name }님</button>
				<button type="button" class="noneBtn" onclick="javascript:location.href='logout.do'">로그아웃</button>
			</div>
		</header>
	
		
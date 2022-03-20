<%@page import="com.spring.more.users.service.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
	<header class="header-wrapper greenColor">
		<div class="header-contaniner" id="headerContainerId">
			<h4 class="headerLogo">
				<a href="home.jsp" class="headerLogo purple">
				<span ><img src="resources/images/logo1.png"></span>
				</a>
			</h4>
			<div class="headerMenuArea">
				<ul class="headerMenu">
					<li class="headerMenuItem middleSize" id="headerMenuFunding"><a href="fundingProjectList.jsp">펀딩하기</a></li>
					<!-- <li class="headerMenuItem middleSize" id="headerMenuBuy"><a href=#>구매하기</a></li> -->
					<li class="headerMenuItem middleSize" id="headerMenuGuide"><a href="notice.do" class="headerMenuHidden">이용가이드</a></li>
					<li class="headerMenuItem moreItem" id="headerMenuMoreItem"><a href=# class="headerMenuHidden">더보기</a></li>
					<li class="headerMenuItem middleSize" id="headerMenuProjectBtnList"><a href="fromHomeToAdmin.jsp" id="headerMenuProjectBtn" class="purple">프로젝트 신청</a></li>
				</ul>
			</div>
			<div class="headerUtil">
				<form name="headerSearch" action="searchFunding.do" method="get">
					<input type="search" name="pro_stitle" class="searchBar" placeholder="프로젝트 검색하기"/>
				</form>
				<!-- 비로그인 시 출력 -->
				<c:if test="${ empty sessionScope.loginUsers }">
					<button type="button" class="noneBtn" onclick="javascript:location.href='login.jsp'">로그인</button>
					<button type="button" class="noneBtn" onclick="javascript:location.href='joinMembership.jsp'">회원가입</button>
				</c:if>  
				<!-- 로그인 시 출력 -->
				<c:if test="${ !empty sessionScope.loginUsers }">
		            <button type="button" class="myPageBtn" onclick="javascript:location.href='userInfo.jsp'">${ loginUsers.user_name }님</button>
					<button type="button" class="noneBtn" onclick="javascript:location.href='logout.do'">로그아웃</button>
				</c:if>
			</div>
		</div>
	</header>
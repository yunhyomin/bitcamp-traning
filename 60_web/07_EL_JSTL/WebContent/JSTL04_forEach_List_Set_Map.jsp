<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="com.mystudy.PersonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : Array, List, Set, Map</h1>
	<h2>Array 출력</h2>
	<p>출력대상 : {"a","ab","abc","abcd" }</p>
<%
	String[] strs = {"a","ab","abc","abcd" };
	pageContext.setAttribute("arr",strs);
%>
	<c:forEach var="str" items="${arr }">
		<p>${str }</p>
	</c:forEach>
	
	<h3>배열(Array)일부데이터만 사용(2,3번째 : 1,2번 인덱스 )</h3>
	<ul>
	<c:forEach var="str" items="${arr }" begin="1" end="2">
		<li>${str }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- ========List출력========= --%>
	<h2>List출력</h2>
<%
	List<Integer> list = new ArrayList<>();
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("alist",list);
%>
	<ul>
	<c:forEach var="listItem" items="${alist }">
		<li>${listItem }</li>
	</c:forEach>
	</ul>
	<hr><hr>
	
	<%-- ======== Set 출력 ========= --%>
	<h2>Set 사용</h2>
<%
	Set<String> set = new HashSet<>();
	set.add("홍길동");
	set.add("을지문덕");
	set.add("강감찬");
	set.add("김구");
	set.add("고길동");
	pageContext.setAttribute("hset",set);
	System.out.println("set.size() : "+ set.size());
	System.out.println("set.contains(\"홍길동\") : "+ set.contains("홍길동"));
%>
	<p>hset.size() : ${hset.size() })</p>
	<p>hset.contains("홍길동") : ${hset.contains("홍길동") }</p>
	<p>hset.toString() : ${hset.toString() }</p>
	<ol>
		<c:forEach var="name" items="${hset }">
			<li>${name }</li>
		</c:forEach>
	</ol>	
	<hr><hr>
	
	<%--===========Map key-value 데이터 출력 ===========--%>
	<h1>Map key-value 데이터 출력</h1>
<%
	Map<String, String> map = new HashMap<>();
	map.put("k1","a");
	map.put("k2","ab");
	map.put("k3","abc");
	map.put("k4","abcd");
	map.put("k5","abcdef~~");
	map.put("k6","aaaaaa");
	pageContext.setAttribute("hmap",map);
	System.out.println("hmap : "+ map);
%>
	<c:forEach var="mapDate" items="${hmap }">
		<p>${mapDate.key }::::${mapDate.value }</p>
	</c:forEach>
	<hr><hr>
	
	<%--==============================================--%>
	<h1>VO가 담긴 List사용</h1>
<%
	List<PersonVO> listBean = new ArrayList<>();
	listBean.add(new PersonVO("홍길동","28"));
	listBean.add(new PersonVO("을지문덕","38"));
	listBean.add(new PersonVO("강감찬","26"));
	listBean.add(new PersonVO("세종대왕","40"));
	pageContext.setAttribute("persons",listBean);
%>
	<%--person에 있는 personVO객체의 이름, 나이를 화면 출력 --%>
	<c:forEach var="person" items="${persons }">
		<p>이름: ${person.name }, 나이:${person.age }</p> 
	</c:forEach>
	<hr>
	
	<%------------%>
	<c:forEach var="person" items="${persons }">
		<p>이름: ${person.getName() }- 나이:${person.getAge() }</p> 
	</c:forEach>




</body>
</html>
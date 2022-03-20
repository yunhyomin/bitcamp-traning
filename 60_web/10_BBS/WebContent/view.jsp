<%@page import="com.bc.bbs.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.bbs.vo.BBSVO"%>
<%@page import="com.bc.bbs.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값 b_idx 
	1. 게시글 조회수 1증가(실습)
	2. 게시글(b_idx) 데이터 조회 후 화면 표시
	3. 게시글(b_idx)에 딸린 댓글이 있으면 화면 표시 
--%>
<%
	//파라미터 값 추출(확인)
	String b_idx = request.getParameter("b_idx");

	//1. 게시글 조회수 1증가(실습)
	
	//2. 게시글(b_idx) 데이터 조회
	int bIdx = Integer.parseInt(b_idx);
	BBSVO bvo = DAO.selectOne(bIdx);
	System.out.println("> bvo : " + bvo);
	
	//3. 게시글(b_idx)에 딸린 댓글이 있으면 가져오기
	List<CommentVO> list =  DAO.getCommList(bIdx);
	System.out.println("> list : " + list);
	
	// EL, JSTL 사용을 위한 scope상에 속성 등록하기
	
	//DB데이터 화면출력
	pageContext.setAttribute("c_list", list); //댓글 목록
	session.setAttribute("bvo", bvo); //게시글 하나
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<body>

<div id="bbs">

<%-- 게시글 내용 표시 --%>
<table>
	<caption>상세보기</caption>
	<tbody>
		<tr>
			<th>제목</th>
			<td>${bvo.subject }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bvo.writer }</td>
		</tr>
	</tbody>
</table>

<hr>

<%-- 게시글에 대한 댓글 작성 영역 --%>

<hr>
<%-- 게시글에 작성된 댓글 표시 영역 --%>


</div>


</body>
</html>
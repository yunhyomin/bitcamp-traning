<%@page import="com.spring.more.users.service.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	UsersVO q_user = (UsersVO) session.getAttribute("loginUsers");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#qna_container {
	position: relative;
	width: 100%;
	font-size: 0.7em;
}

#qna_list>table {
	position: relative;
	/* left: 50%; */
	/* left : 65%; */
	/* width: 800px; */
	width: 100%;
	/* margin-left: -400px; */
	border: 1px solid #dfdfdf;
	border-spacing: 0;
	border-bottom: none;
	border-collapse: collapse;
	font-size: 0.9em;
}

#qna_list>table thead th {
	background-color: #eee;
}

#qna_list>table th, td {
	border-bottom: 1px solid silver;
	margin: 0;
	/* height: 15px; */
	padding: 10px 6px;
}

/* 문의글 조회 테이블 크기 설정  */
#qna_list>table .q_no {
	width: 10%;
}

#qna_list>table .q_name {
	width: 45%;
}

#qna_list>table .q_writer {
	width: 15%;
}

#qna_list>table .q_attr {
	width: 15%;
}

#qna_list>table .q_regdate {
	width: 15%;
}

.paging {
	list-style: none;
}

.paging>li {
	float: left;
	margin-left: 10px;
}
/*-------------------------------1118-------------------------------------*/
#popup_insert {
	width: 535px;
	height: 585px;
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -308px;
	margin-top: -250px;
	background-color: white;
	border: 1px solid silver;
	display: none;
	padding: 40px;
	text-align: left;
	z-index: 2;
}


#popup_insert>div>table td {
	padding: 7px 0 7px 16px;
	border: 1px solid #eee;
}

#popup_insert_table {
	border-collapse: collapse;
}

/* 팝업 폼 닫기 버튼 */
#popup_insert_close {
	width: 15px;
	position: absolute;
	top : -15px;
	right: 16px;
}

/* 팝업 폼 */
#insert_q_form {
	border: 1px solid #aeb3bb;
	width: 535px;
}

/* 팝업폼 보내기버튼 */
#pop_up_submit {
	position: absolute;
	left: 50%;
	margin-left: -20px;
	bottom: 25px;
}

/*--------------------------------------------------------------------*/

#popup_insert table th {
	width: 200px;
	background-color: #dcdcdc;
	padding-left: 10px;
	pagging-top: 5px;
	color: #282828;
	border: 1px sloid #eee;
	font-size: 0.9em;
	font-weight: bold;
}

#popup_insert table td {
	font-size: 0.8em;
}

.input {
	width: 148px;
	height: 18px;
	padding: 6px 10px;
	line-height: 1.1em;
	border: 1px solid #aeb3bb;
} 
#popup_insert table tbody td textarea {
	width: 400px;
	height: 300px;
	padding: 10px;
	line-height: 1.5em;
	border: 1px solid #aeb3bb;
	overflow-y: auto;
	resize: none;
}

#bbcInqContCount {
	padding-bottom: 50px;
}

/* 상세보기 화면 */
.q_detail {
	position: relative;
	/* width: 100%; */
	width: 800px;
	height: auto;
	background-color: #f7f7f7;
	padding: 100px 100px;
	/* display: none; */
}

.q_detail td {
	padding: 20px 0 20px 0;
	text-align: left;
}
/*------------------------======수======정=======------------------------------*/
#show_qna_name {
	padding: 0 20px 0 20px;
	/* margin-bottom: 15px; */
	font-weight: bold;
}
#show_pro_title {
	padding: 0 20px 10px 22px;
	/* font-weight: bold; */
	font-size: 0.8em;
	color: #787878;
	/* border: 1px solid #787878; */
	text-overflow: ellipsis;
	overflow: hidden;
 	hite-space: nowrap;

}
#name_date {
	padding-right:20px;
	color: #7e7e7e;
	padding: 8px 20px 15px 22px;
}
#show_user_name {
	padding:0 10px 20px 0;
	color: #7e7e7e;
	font-size: 0.9em;
}

#show_qna_regdate {
	padding-left: 10px;
	color: #7e7e7e;
	font-size: 0.9em;
}
#show_qna_content {
	width: 600px;
	padding:10px 0 20px 0;
	white-space: normal;
	word-break: break-all;
}

#qna_answer_name {
	display: inline-block;
	margin-right: 10px;
}
#qna_answer_regdate {
	display: inline-block;
}
#qna_answer_content {
	margin-top: 10px; 
	font-size: 1.1em;
}




/*----------------==================------------------*/

#dele_btn {
	margin-left: 10px;	
}
hr {
	boder-top: 0.5px solid #eee;
	opacity: 50%;
	width: 100%;
}

#modi_qna_form {
	position: relative;
	background-color: #f7f7f7;
	
}

#modi_frm_tr {
	position: relative;
	/* width: 100%; */
	width: 800px;
	height: 200px;
	background-color: #f7f7f7;
	/* text-align: center; */
	margin-left: 20px;
}
#modi_frm_tr td {
	padding-left: 20px;
	border-bottom: none;
}
/* #modi_frm_tr form {
	 width: 1000px;
} */

#modi_qna_name {
	width: 610px;
	height: 25px;
	margin-bottom: 10px;
}
#modi_qna_content {
	width: 610px;
	margin-bottom: 10px;
}
#modi_frm_tr div {
	position: absolute;
	left:50%;
	margin-left: -40px;
}
/* #q_detail_btn {
padding-left: 20px;
} */

/************** 페이지 표시 영역 스타일(시작) ***************/
.paging {
	list-style: none;
}

.paging li { /* 페이지넘버 리스트 한줄로 나오게 */
	float: left;
	margin-right: 8px;
}

.paging li a { /* 페이지넘버 */
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: none;
	font-weight: bold;
	color: black;
	background-color: white;
}

.paging li a:hover {
	color: #10C0D5;
} /* 페이지넘버 호버 됐을떼 */
.paging .disable { /* 처음으로,다음으로 비활성화 처리 */
	border-radius: 5px;
	padding: 3px 7px;
	color: silver;
}

.paging  .now { /* 현재 페이지 일때 페이지번호 처리 */
	padding: 3px 7px;
	background-color: #d3d3d3;
	/* border-radius: 5px;  */
	color: black;
}

#pagingBOX { /* 하단 페이징 영역 */
	display: inline-block;
	left: 5px;
	width: 100%;
	font-size: 0.8em;
	text-align: center;
	position: relative;
}

#write_btn { /* 글쓰기 버튼 */
	width: 60px;
	height: 25px;
	border-radius: 7px;
	border: none;
	font-weight: bold;
	background-color: #4FBAEA;
	color: white;
	font-size: 1em;
	position: absolute;
	top: 13px;
	right: 77px;
}


/* 목록 제목 왼쪽 정렬 */
.align-left {
	text-align: left;
}
.align-left img {
	margin-top: 0px;
	magin-left: 10px;
	padding-left: 7px;
	padding-bottom: -5px;
	opacity: 80%;
	
}



</style>
<script>
//alert("유저의 세션확인 : " + "${sessionScope.loginUsers.user_no}");
	/* var q_user_no = "${sessionScope.loginUsers.user_no}"; */
	var q_getUser_no = "${sessionScope.loginUsers.user_no}";
	
	$(function() {
		/* getJsonQnaList();//리스트 불러오기 */
		hidden_btn();
		
		//인서트 폼 극자수 세기
		$("#imput_qna_content").on('keyup', function() {
			$("#bbcInqContCount").html("(" + $("#imput_qna_content").val().length + " / 1000)");
			
			if($("#imput_qna_content").val().length > 1000) {
				$("#imput_qna_content").val($("#imput_qna_content").val().substring(0, 1000));
				$("#bbcInqContCount").html("(1000 / 1000)");
			}
		});
	});
	
	function popup() {
		$("#popup_insert").css("display", "block");
	}
	
	function popup_close() {
		$("#popup_insert").css("display", "none");
	}
	
	/* function insertQ(frm) {
		frm.action = "insertQna.do";
		frm.submit();
	} */

	/* //팝업창 스크롤 따라오기
	$(function() {
		$(window).scroll(function() {
			var q_top = $(window).scrollTop();
			$("#popup_insert").animate({
				"q_top" : q_top + 50 + "px"
			}, 50);
		});
		$("#popup_insert").click(function() {
			$("html,body").animate({
				scrollTop : 0
			}, 50);
		});
	}); */
	
///비밀글 처리-----------------=======-------------------=======================-----------
	
	//qna 조회시 내가쓴 글만 수정,삭제 버튼 보이게 하기
	function hidden_btn() {
		<%-- q_user_no = '<%=q_user.getUser_no()%>'; --%>		
		for (var i = 0; i <= $(".hidden").length; i++) {
				if ($(".hidden").eq(i).val() != q_getUser_no) {
					$(".hidden").eq(i).css("display", "none");
				}
		}	
	}	
	
	//비밀글 작성자만 보게
	function show_q_detail_secret(q_qna_no, q_qna_secret, q_user_no) {
		if (q_qna_secret == "비공개") {
			if(q_getUser_no != q_user_no) {
				alert("비밀글은 작성한 회원만 볼 수있습니다 ");
			} else {
				show_q_detail(q_qna_no, q_qna_secret, q_user_no);
			}
		} else {
			show_q_detail(q_qna_no, q_qna_secret, q_user_no);
		}
	}
	
	function show_q_detail(q_qna_no, q_qna_secret, q_user_no) {
		//만약 상세보기가 되어 있으면 안보이게, 안되어 있으면 보이게
		if ($("#q_detail" + q_qna_no).next().hasClass("q_detail")){
			$(".q_detail").remove();
			/* $("#modi_frm_tr").remove(); */
		} else {
			/* alert("show_q_detail() 실행~~~"); */
			let q_vo = {};
			q_vo.qna_no = q_qna_no;
			/* alert("vo.qna_no : " + vo.qna_no); */
			
			$(".q_detail").remove();
			//$.ajax("project/getOneQna.do", {
			$.ajax("getOneQna.do", {
				type: "post",
				data: JSON.stringify(q_vo),
				dataType: "json",
				contentType: "application/json",
				success: function(data){
					/* alert("성공~~~"); */
					console.log(data);
					let q_dispHtml = "";
					q_dispHtml += '<tr class="q_detail">';
					q_dispHtml += '<td colspan="5">';
					q_dispHtml += '<div id="show_pro_title">상품명 : ' + data.pro_title + "</div>"; 
					/* q_dispHtml += '<div id="show_qna_secret">문의글 번호 : ' + data.qna_no + "</span>"; */
					q_dispHtml += '<span id="show_qna_name">' + data.qna_name + "</span>";
					q_dispHtml += '<div id="name_date"><span id="show_user_name">' + data.user_name + "</span>";
					q_dispHtml += '<span id="show_qna_regdate">' + data.qna_regdate  + "</span</div><hr>";
					q_dispHtml += '<div id="show_qna_content">' + data.qna_content + "</div>";
					/* q_dispHtml += '<span id="show_qna_secret">' + data.qna_secret + "</span>"; */
					/* q_dispHtml += '<span id="show_qna_status">' + data.qna_status + "</span>"; */
					
					if (data.qna_answer_regdate != null) { //답변이 있는경우 답변 불러오기
						q_dispHtml += '<div id="qna_answer_name">[ 판매자 ]</div>';
						q_dispHtml += '<div id="qna_answer_regdate">' + data.qna_answer_regdate.substring(0,10) + "</div>";
						q_dispHtml += '<div id="qna_answer_content">' + data.qna_answer_content + "</div>";
					}
					
					if (data.qna_status != '답변완료'){ //답변이 완료된 경우 수정 삭제 버튼 안보이게
					q_dispHtml += '<div id="q_detail_btn">';
					q_dispHtml += '<button id="modi_btn" onclick="modi_qna_frm(\'' + data.qna_no + '\', \'' + data.qna_name + '\', \'' + data.qna_content + '\')" value="' + data.user_no + '" class="hidden d_btn">수정</button>';
					q_dispHtml += '<button id="dele_btn" onclick="dele_qna(\'' + data.qna_no + '\')" value="' + data.user_no + '" class="hidden d_btn">삭제</button>';
					q_dispHtml += "</div>";
					q_dispHtml += '<div id="modi_qna_form">';
					q_dispHtml += "</div>";
					}
					
					q_dispHtml += "</td>";
					q_dispHtml += "</tr>";
					
					$("#q_detail" + data.qna_no).after(q_dispHtml);
					/* $('"#q_detail' + 'data.qna_no"').after(q_dispHtml); */
					/* hide_q_detail(data.qna_no); */
					/* $(this).after(dispHtml); */
					/* alert("this.qna_no : " + data.qna_no); */
					hidden_btn();
				},
				error : function() {
					alert("실패~~~");
				}
			});
		}
	}
	
	///비밀글 처리-----------------=======-------------------=======================-----------
	
	
	//문의글 수정폼 넣기
	function modi_qna_frm(q_qna_no, q_qna_name, q_qna_content) {
		/* alert("modi_qna_frm 나오기"); */
		$("#q_detail_btn").hide();
		var q_modi_frm = '<tr id="modi_frm_tr">';		
		q_modi_frm += '<td colspan="5">';
		q_modi_frm += '<form>';		
		q_modi_frm += '<input type="text" id="modi_qna_name" name="qna_name" title="제목" value="' + q_qna_name + '">';
		q_modi_frm += '<textarea style="resize: none" id="modi_qna_content" name="qna_content" rows="17" cols="50" title="내용">' + q_qna_content + '</textarea>';
		q_modi_frm += '<div>';
		q_modi_frm += '<input id="modi_frm_submit" class="modi_qna d_btn" type="button" onclick="modi_qna(\'' + q_qna_no + '\')" value="수정">';
		
		q_modi_frm += '<button id="modi_frm_cancel" onclick="modi_cancel()" class="d_btn">취소</button>';
		q_modi_frm += '</div>';
		q_modi_frm += '</form>';	
		q_modi_frm += '</td>';
		q_modi_frm += '</tr>';
		
		/* $(".q_detail").after(q_modi_frm); */ 
		$("#modi_qna_form").html(q_modi_frm); 
	}
	
	
	//문의글 수정 취소
	function modi_cancel() {
		alert("댓글 작성을 취소합니다.");                                                                             
		$("#q_detail_btn").show();
		$("#modi_frm_tr").remove();
		
	}
	
	/* //문의글 수정
	function modi_qna(frm){
		frm.action = "modifyQna.do";
		frm.submit();
	}	 */
	
	//문의글 수정
	function modi_qna(q_qna_no) {
		let q_vo = {};		
		q_vo.qna_name = $("#modi_qna_name").val();
		q_vo.qna_content = $("#modi_qna_content").val();		
		q_vo.qna_no = q_qna_no;
		
		var answer = confirm("댓글을 수정 하시겠습니까?");
		if (answer) {
			$.ajax("modifyQna.do", {
				type: "post",
				data: JSON.stringify(q_vo),
				dataType: "text",
				contentType: "application/json",
				success: function(data){
					alert("수정이 완료되었습니다");
					console.log(data);
					location.href = "getQnaList.do";
				},
				error : function() {
					alert("실패~~~");
				}
			});
		} else {
			alert ("댓글 수정이 취소되었습니다.");
		} 
	}
	
	
	
	//문의글 삭제
	function dele_qna(q_qna_no) {
		let q_vo = {};
		q_vo.qna_no = q_qna_no;
		var answer = confirm("댓글을 삭제 하시겠습니까?");
		if (answer) {
			$.ajax("deleteQna.do", {
				type: "post",
				data: JSON.stringify(q_vo),
				dataType: "text",
				contentType: "application/json",
				success: function(data){
					alert("삭제가 완료되었습니다");
					console.log(data);
					location.href = "getQnaList.do";
				},
				error : function() {
					alert("실패~~~");
				}
			});
		} else {
			alert ("댓글 삭제가 취소되었습니다.");
		} 
	}
	
	
	
	
</script>
</head>
<body>
	<div id="qna_container">
		<h2>고객 문의</h2>
		<%-- <h1>${pro_no }</h1> --%>
		<div id="qna_list">
			<table>
				<%-- <caption>QnA</caption> --%>
				<thead>
					<th class="q_no">번호</th>
					<!-- <th class="q_name">제목</th> -->
					<th class="align-left">제목</th>
					<th class="q_writer">작성자</th>
					<th class="q_attr">답변여부</th>
					<th class="q_regdate">등록일자</th>

				</thead>
				<c:choose>
					<c:when test="${empty qnaList }">
						<tr>
							<td colspan="5">
								<h2>현재 등록된 게시글이 없습니다.</h2>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${qnaList }">
							<tr id="q_detail${vo.qna_no }"  onclick="show_q_detail_secret('${vo.qna_no }', '${vo.qna_secret }', '${vo.user_no }')">
								<%-- onclick="q_secret(${vo.qna_no}, ${vo.user_no }, ${vo.qna_secret })"> --%>
								
								<td>${vo.rnum }</td>
								
								<c:choose>
								<c:when test="${vo.qna_secret == '공개' }">
									<td class="align-left"><span>${vo.qna_name }</span></td>
								</c:when>
								<c:otherwise>
									<td class="align-left"><span>${vo.qna_name }</span><img src="secret4.png" width="15px" /></td>
<%-- 									<td class="align-left"><span>${vo.qna_name }</span><img src="../images.secret.png" /></td> --%>
								</c:otherwise>
								</c:choose>
								
								<td>${vo.user_name }</td>
								<td>${vo.qna_status }</td>
								<td>${vo.qna_regdate.substring(0,10) }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tfoot>
					<tr>
						<td colspan="4">
							<ol class="paging">
								<c:choose>
									<%-- [이전으로]에 대한 사용 여부 처리 --%>
									<c:when test="${pvo.beginPage == 1 }">
										<li class="disable">이전으로</li>
									</c:when>
									<c:otherwise>
										<li><a href="getQnaList.do?cPage=${pvo.beginPage - 1 }">이전으로</a>
										</li>
									</c:otherwise>
								</c:choose>

								<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
								<c:forEach var="pageNo" begin="${pvo.beginPage }"
									end="${pvo.endPage }">
									<c:choose>
										<c:when test="${pageNo == pvo.nowPage }">
											<li class="now">${pageNo }</li>
										</c:when>
										<c:otherwise>
											<li><a href="getQnaList.do?cPage=${pageNo }">${pageNo }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<%-- [다음으로]에 대한 사용 여부 처리 --%>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li><a href="getQnaList.do?cPage=${pvo.endPage + 1 }">다음으로</a></li>
								</c:if>
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">다음으로</li>
								</c:if>
							</ol>
						</td>
						<td><input type="button" value="글쓰기" onclick="popup()">
						</td>
					</tr>
				</tfoot>
			</table>
		</div>


		<%----==================================== 입력창  =============================================---%>
		<div id="popup_insert">
			<img alt="close" src="../images/xxx.png" onclick="popup_close()" id="popup_insert_close">
			<div>
				<form action="insertQna.do" method="post" id="insert_q_form">
					<!-- <form> -->
					<table>
						<tbody>
							<tr>
								<th><label for="user_name">이름</label></th>
								<td><input type="text" id="input_user_name"
									<%-- name="user_name" value="${user.user_name }" class="input" /></td> --%>
									name="user_name" value="${sessionScope.loginUsers.user_name}" class="input" /></td>
							</tr>
							<tr>
								<th>상품 이름</th>
								<td>${pro_no }번상품</td>
							</tr>
							<tr>
								<th>비밀 여부</th>
								<td><input type="radio" name="qna_secret" id="noSecret"
									value="공개" checked><label for="noSecret">공개</label> <input
									type="radio" name="qna_secret" id="Secret" value="비공개"><label
									for="Secret">비공개</label></td>
							</tr>
							<tr>
								<th><label for="imput_qna_name">문의 제목</label></th>
								<td><input type="text" id="imput_qna_name" name="qna_name"
									class="input" /></td>
							</tr>
							<tr>
								<th><label for="imput_qna_content">문의 내용</label><span></th>
								<td><textarea cols="" rows="" id="imput_qna_content"
										name="qna_content"></textarea>
									<div class="">
										<span id="bbcInqContCount">(0 / 1000)</span></td>
							</tr>

						</tbody>
						<tfoot>
							<input type="submit" value="보내기" class="submit d_btn" id="pop_up_submit" >
							<input type="hidden" name="user_no" value="${sessionScope.loginUsers.user_no}">
							<input type="hidden" name="pro_no" value="${pro_no }">
						</tfoot>
					</table>
				</form>
			</div>

		</div>

	</div>

</body>
</html>
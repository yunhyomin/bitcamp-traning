<%@page import="com.spring.more.project.service.GoodsVO"%>
<%@page import="com.spring.more.project.service.ProjectVO"%>
<%@page import="com.spring.more.users.service.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	UsersVO user = (UsersVO) session.getAttribute("user");
%> --%>
<%
	ProjectVO pro = (ProjectVO) session.getAttribute("pro");
	System.out.println(">>>>>>>>>>>>> : " + pro);
%>
<%
	GoodsVO goodsvo = (GoodsVO) session.getAttribute("goodsvo");
	System.out.println(">>>>>>>>>>>>> : " + goodsvo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 상세페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* ======= 별 style ======= */
/* 별 색, 위치 지정 */
.star_style {
	color: #551A8B;
	padding: 15px;
	margin: 0px auto;
	font-size: 20px;
}

#review_score a {
	text-decoration: none;
	color: gray;
	font-size: 20px;
}

#review_score a.on {
	color: #551A8B;
	font-size: 20px;
}
#review_container {
	position: relative;
	width: 700px;
	height: 600px;
	margin-top: 30px;
}

/* ======= 댓글 form 보이지 않게 설정 ======= */
#displayReview {
	display: none;
}

#displayUpdate {
	display: none;
}
/* ======= 수정 데이터를 가져오기 위해서 생성한 div 가리기 ======= */
#hidden {
	display: none;
}

/* ======= 댓글 css 적용 ======= */

/* --- 댓글 목록 ---*/
/* 	#overflowSelect {
		height: 1000px;
		overflow-y: scroll;
	} */
#review_select {
	position: relative;
	width: 700px;
	padding: 30px 0px;
	margin: 10px 0px;
	border-top: 1px solid #d9d9d9;
}

#nameRegdateStar {
	display: flex;
	align-items: center;
	margin-bottom: 12px;
	margin-left: 120px;
}

#user_name {
	font-size: 22px;
	line-height: 28px;
	letter-spacing: -.3px;
	font-weight: 700;
}

#review_regdate {
	padding-left: 10px;
	font-size: 12px;
	color: #495057;
}

#contentBtn {
	position: relative;
	width: 700px;
	display: flex;
	align-items: center;
	margin-bottom: 12px;
	margin-left: 120px;
}

#review_content {
	color: #495057;
	font-size: 18px;
	float: left;
}

#updateDelete {
    display: flex;
    align-items: center;
    position: absolute;
    right: 0px;
    padding-right: 200px;
}

/* 버튼 사이즈 조절*/
.hidden {
	zoom: 0.9;
}

/* 댓글 등록 form */
#reviewConfirmUser {
	padding-bottom: 20px;
}

/* 입력 form 전체 */
#displayReviewIn, #displayReviewUp {
	padding: 10px 0px;
	margin: auto;
	width: 80%;
	border-top: 1px solid #719E71;
	border-bottom: 1px solid #719E71;
	display: inline-block;
	vertical-align: middle;
	height: 100%
}

/* 수정 form 전체 */
#displayReviewUp {
	padding: 10px 0px;
	margin: auto;
	width: 80%;
	border-top: 1px solid #719E71;
	border-bottom: 0px solid #719E71;
	display: inline-block;
	vertical-align: middle;
	height: 100%
}

#nameScoreInsert, #nameScoreUpdate {
	display: flex;
	padding-bottom: 10px;
}

#review_score {
	text-align: left;
	padding-left: 100px;
	font-size: 17px;
	letter-spacing: -.3px;
	font-weight: 500;
}

#insert_name_form, #update_name_form {
	text-align: left;
	padding-left: 80px;
	font-size: 17px;
	letter-spacing: -.3px;
	font-weight: 500;
}

#insertBtn, #updateBtn {
    display: flex;
    padding-left: 200px;
    zoom: 0.9;
}

textarea {
	width: 81%;
	border: 1px solid gray;
	border-radius: 5px; /* 둥근 모서리 */
	padding-bottom: 10px;
}
</style>
<script>
	/* 변수 */
	<%-- var r_user_name = '<%=user.getUser_name()%>';// user 이름
	//var user_no = '${user.user_no}';  // user_no 변수
	var r_user_no = '<%=user.getUser_no()%>';   // user_no 변수
	var r_user_id = '<%=user.getUser_id()%>'; 
	var r_user_pwd = '<%=user.getUser_pwd()%>'; --%>
	//alert("${sessionScope.loginUsers.user_name}");
	var r_user_name = "${sessionScope.loginUsers.user_name}";// user 이름
	var r_user_no = "${sessionScope.loginUsers.user_no}";  // user_no 변수
	<%-- var r_user_no = '<%=user.getUser_no()%>';   // user_no 변수 --%>
	var r_user_id = "${sessionScope.loginUsers.user_id}"; 
	var r_user_pwd = "${sessionScope.loginUsers.user_pwd}";
	
	var r_review_content = ""; // 리뷰 내용
	var r_review_score = ""; // 리뷰 점수
	var r_review_regdate = ""; // 작성일
	var r_pro_no = '<%=pro.getPro_no()%>'; 
	var r_user_no_update;
	var r_pro_no_update;
	var r_review_no_update;
	
	$(document).ready(function(){
		reviewAvg(); // review 평점 평균 추력
		getReviewList(); // review 목록 출력	
		reviewConfirmUser(); // 주문내역 데이터 확인용 
		$("#review_insert").click(reviewInsert); // 댓글 등록
		$("#review_update").click(review_update); // 댓글 수정
		$("#review_delete").click(review_delete); // 댓글 삭제
		$('#review_score a').click(star); // 별점구현
 	});
	
	
	// ============= 리뷰 조회(Select) =============
	// - 리뷰목록
	function getReviewList() {
		/* alert(r_pro_no); */
		let r_vo = {}; 
		r_vo.pro_no = r_pro_no;
		r_vo.user_no = r_user_no;	
		
		$.ajax("getReviewList.do", {
			type: "post",
			data: JSON.stringify(r_vo),
			dataType: "json",
			contentType: "application/json",
			success: function(data){
				let dispHtml = '';
				
				if(data.length < 1) {
					dispHtml += "<p>";
					dispHtml += "댓글이 없습니다.";
					dispHtml += "</p>" ;
				} else {
					dispHtml += '<div id="overflowSelect">'
					$.each(data, function(index, review) {
						dispHtml += '<div id="review_select">';
						dispHtml += '<div id="nameRegdateStar">'; 
						dispHtml += '<span id="user_name">' + review.user_name + '</span>';
						dispHtml += '<span id="review_regdate">' + (review.review_regdate).substring(0, 10) + '</span>';
						dispHtml += '<span class="star_style">' + starView(review.review_score)  + '</span>';
						dispHtml += '<br>';
						dispHtml += '</div>';
							
						dispHtml += '<div id="contentBtn">';
						dispHtml += '<div id="review_content">' + review.review_content + '</div>';
						dispHtml += '<div id="updateDelete">';
						dispHtml += '<button id="review_btn_update" class="hidden d_btn" value="'+ review.user_no + '" onclick="displayUpdate('
									+ review.user_no + ',\'' + review.pro_no + '\',\'' + review.review_no+ '\')">';
						dispHtml += '수정</button>&nbsp'
						dispHtml += '<button id="review_btn_delete" class="hidden d_btn" value="'+ review.user_no + '" onclick="review_delete('
									+ review.user_no + ',\'' + review.pro_no + '\',\'' + review.review_no+ '\')">';
						dispHtml += '삭제</button>'
						dispHtml += '</div>';
						dispHtml += '</div>';
						
						dispHtml += '</div>';
 						dispHtml += '<div id="divid' + review.review_no + '">';
						dispHtml += '</div>'; 
					});
					dispHtml += '</div>';
				}
				$("#reviewList").html(dispHtml);
				hidden_btn(); //로그인 한 사람 댓글만 수정/삭제버튼 보이게
			},
			error : function(jqXHR, textStatus, errorThrown, data) {
				alert("getReviewList() Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
				/* alert(data); */
			}
		});
	}
	
	// - 리뷰 조회 후 로그인한 사람 댓글 수정, 삭제 버튼 생성
	function hidden_btn() {
		<%-- user_no = '<%=user.getUser_no() %>'; --%> 
		user_no = r_user_no;
		for (var i=0; i <= $(".hidden").length; i++) {
			if ($(".hidden").eq(i).val() != user_no) {
				$(".hidden").eq(i).css("display", "none");
			}
		}
	}

	// ============= 리뷰 등록(Insert) =============
	// - 로그인한 회원이 펀딩페이지 펀딩상품에 대하여 주문정보가 있는지 확인
	function reviewConfirmUser() {
		//alert("reviewConfirmUser() 확인용");
		
		let r_vo = {}; 
		r_vo.pro_no = r_pro_no;
		r_vo.user_no = r_user_no;
		
		$.ajax("reviewConfirmUser.do", {
			type: "post",
			data: JSON.stringify(r_vo),
			dataType: "json",
			contentType: "application/json",
			success: function(data){
				
				//alert(data);
				
				let dispHtml = "";
				 
				 if(0 < data.length) {
					 
					 dispHtml += '<div id="reviewConfirmUser">'
					 dispHtml += '<button type="button" id="review_btn_insert" class="review_btn_insert d_btn" onclick="display()")>';
					 dispHtml += '리뷰작성';
					 dispHtml += '</button>';
					 dispHtml += '</div>'
				 } else {} 
				 $("#reviewInsert").html(dispHtml);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("reviewConfirmUser() Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});
	}

	// - 숨겨져 있던 댓글 입력창 생성
	function display() {
		$("#displayReview").css("display", "block");
	}
	
	// - 입력 취소
	function reviewInsertCancle(review_no_update) {
		
		/* review_no_update = $("#review_no_update").val();
		$('#divid'+review_no_update).html(""); */
		
		getReviewList();
		
	}
	
	// - 댓글 입력 
	function reviewInsert() {

		$.ajax("reviewInsert.do", {
			type : "post",
			data : JSON.stringify({
				user_no : r_user_no,
				pro_no : r_pro_no,
				review_content : $('#review_content_insert').val(),
				review_score : r_review_score
			}),
			dataType : "text",
			contentType : "application/json",
			success : function(data) {
				$("#displayReview").css("display", "none");
				getReviewList(); // review 목록 출력
			},
			error : function(jqXHR, textStatus, errorThrown, data) {
				alert("reviewInsert() Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
				/* alert("리뷰인서트 : " + data); */
			}
		});
	}

	// ============= 리뷰 수정(Update) =============
	// - 숨겨져 있던 수정 댓글창 생성
	function displayUpdate(r_user_no, r_pro_no, r_review_no) {

		var displayUpdate = document.getElementById('displayUpdate');
		
		// 수정 ajax 함수에 전달해줄 파라미터값
		r_user_no_update = r_user_no;
		r_pro_no_update = r_pro_no;
		r_review_no_update = r_review_no;
		
		$("#r_user_no_update").val(r_user_no); 
		$("#r_pro_no_update").val(r_pro_no);
		$("#r_review_no_update").val(r_review_no);
		
		$('#divid'+r_review_no).html(displayUpdate); // 수정 버튼 클릭시 수정 form 바로 아래 생성
		$("#displayUpdate").css("display", "block");
	}
	
	// - 댓글 수정
	function review_update(r_user_no_update, r_pro_no_update, r_review_no_update) {
		
		r_user_no_update = $("#r_user_no_update").val();		
		r_pro_no_update = $("#r_pro_no_update").val();
		r_review_no_update = $("#r_review_no_update").val();
		
		//alert(r_user_no_update);
		//alert(r_pro_no_update);
		//alert(r_review_no_update);
		
		$.ajax("reviewUpdate.do", {
			type : "post",
			data : JSON.stringify({
				user_no : r_user_no_update,
				pro_no : r_pro_no_update,
				review_content : $('#review_content_update').val(),
				review_score : r_review_score,
				review_no : r_review_no_update
			}),
			dataType : "text",
			contentType : "application/json",
			success : function(data) {
				$("#displayReview").css("display", "none");
				getReviewList(); // review 목록 출력
				alert("수정이 완료되었습니다");
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("reviewUpdate() Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});
	}
	
	// - 수정 취소
	function reviewUpdateCancle(r_review_no_update) {
		
		review_no_update = $("#r_review_no_update").val();
		$('#divid'+r_review_no_update).html(""); 
		
	}
	
	// ============= 리뷰 삭제(Delete) =============
	// - 댓글 삭제
	function review_delete(r_user_no, r_pro_no, r_review_no) {

		var delConfirm = confirm('정말 삭제하시겠습니까?');

		let r_vo = {}; 
		r_vo.pro_no = r_pro_no;
		r_vo.user_no = r_user_no;
		r_vo.review_no = r_review_no;
		
		if (delConfirm) {
			$.ajax("reviewDelete.do", {
				type : "post",
				data: JSON.stringify(r_vo),
				dataType : "text",
				contentType : "application/json",
				success : function(data) {
					getReviewList(); // review 목록 출력	
					alert("삭제가 완료 되었습니다");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("review_delete() Ajax 처리 실패 : \n"
							+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
							+ "textStatus : " + textStatus + "\n"
							+ "errorThrown : " + errorThrown);
				}
			});
		} else {
			alert("삭제 취소가 완료되었습니다");
		}
	}

	// ============= 평점 구현 =============
	// - 숫자로 넘어온 평점을 별모양 형식으로 변경해서 내보내기 
	function starView(r_review_score) {
		var star = "";

		if (r_review_score == 1) {
			star += "★☆☆☆☆";
		} else if (r_review_score == 2) {
			star += "★★☆☆☆";
		} else if (r_review_score == 3) {
			star += "★★★☆☆";
		} else if (r_review_score == 4) {
			star += "★★★★☆";
		} else if (r_review_score == 5) {
			star += "★★★★★";
		}
		return star;
	}

	// - 리뷰 입력 및 수정 : 별 갯수에 맞춰 끄고 키고 반복
	function star() {
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		r_review_score = $(this).attr("value");
	}
	
	// 펀딩 평점 평균 ajax
	
	function reviewAvg() {
	
		$.ajax("reviewAvg.do", {
			type : "post",
			data : JSON.stringify({
				pro_no : r_pro_no
			}),
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				let dispHtml = '';
				$.each(data, function(index, review) {
					dispHtml += '<span class="star_style">' + starView(review.review_score)  + '</span>';
				});
				$("#reviewAvg").html(dispHtml);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("getReviewList() Ajax 처리 실패 : \n" + "jqXHR.readyState : "
						+ jqXHR.readyState + "\n" + "textStatus : "
						+ textStatus + "\n" + "errorThrown : " + errorThrown);
			}
		});

	} 
</script>
</head>
<body>
	<h4>펀딩 만족도</h4>
	<div id="reviewAvg"></div>
	<div id="reviewList"></div>
	<div id="reviewInsert"></div>

	<!-- 댓글 등록 -->
	<div id="displayReview">
		<div id="displayReviewIn">
			<form method="post" name="form" id="form">
				<div id="nameScoreInsert">
					<span id="insert_name_form"> 이 름 : ${sessionScope.loginUsers.user_name }
					</span> <span id="review_score"> 평 점 : <a class="star" value="1">★</a>
						<a class="star" value="2">★</a> <a class="star" value="3">★</a> <a
						class="star" value="4">★</a> <a class="star" value="5">★</a>
					</span>
				</div>
				<textarea rows="3" cols="100" id="review_content_insert"
					class="review_content_insert" placeholder="댓글을 입력해주세요"></textarea>
				<div id="insertBtn">
					<button type="submit" id="review_insert" class="review_insert d_btn">입력</button>
					&nbsp;
					<button type="submit" id="reviewInsertCancle"
						class="reviewInsertCancle d_btn">취소</button>
				</div>
			</form>
		</div>
	</div>

	<div id="hidden">
		<input type="text" id="r_user_no_update"> <input type="text"
			id="r_pro_no_update"> <input type="text"
			id="r_review_no_update">
	</div>

	<!-- 댓글 수정 -->
	<div id="displayUpdate">
		<div id="displayReviewUp">
			<form method="post" name="form" id="form">
				<div id="nameScoreUpdate">
					<span id="update_name_form"> 이 름 : ${sessionScope.loginUsers.user_name }
					</span> <span id="review_score"> 평 점 : <a class="star" value="1">★</a>
						<a class="star" value="2">★</a> <a class="star" value="3">★</a> <a
						class="star" value="4">★</a> <a class="star" value="5">★</a>
					</span>
				</div>
				<textarea rows="3" cols="100" id="review_content_update"
					class="review_content_update" placeholder="댓글을 입력해주세요"></textarea>
				<div id="updateBtn">
					<button type="submit" id="review_update" class="review_update d_btn">수정</button>
					&nbsp;
					<button type="submit" id="reviewUpdateCancle"
						class="reviewUpdateCancle d_btn">취소</button>
				</div>
			</form>
		</div>

	</div>

</body>

</html>
















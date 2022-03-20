<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	getBoardListData = () => {
		$.ajax("getJsonBoardList.do",{
			type: "get",
			dataType: "JSON",
			success: function (data) {
				alert("성공~");
				let dispHTML = "<ul>";
				$.each(data, function (index, e) {
					dispHTML += "<li>";
					dispHTML += e.seq + ", ";
					dispHTML += e.title + ", ";
					dispHTML += e.writer + ", ";
					dispHTML += e.content + ", ";
					dispHTML += e.regdate + ", ";
					dispHTML += e.cnt + ", ";
					dispHTML += "</li>";
				});
				dispHTML += "</ul>";
				$("#listDisp").html(dispHTML);
			},
			error: function () {
				alert("실패~~");
			}
			
		});
	}
	let choice = 1;
	window.onload = () => {
		document.getElementById("num").onkeyup = changeNum;
	}
	changeNum = () => {
		choice = document.getElementById("num").value;	
	}
	
	
	getOneOfBoardListDatas = () => {
		let vo = {seq:choice};
		
		$.ajax("getJsonBoard.do",{
			type: "post",
			data: JSON.stringify(vo), // 제이슨 문자열로 처리해주는 스트링잉파이
			// data: vo, ->get방식으로 할 때에만. 
			dataType: "JSON",
			contentType: "application/json",
			success: (data) => {
				alert("성공~~");
				console.log(data);
			},
			error: () => {
				alert("실패~~");
			}
			
		});
	}
</script>
</head>
<body>

<div id="container">
	<h1>게시판 프로그램</h1>
	<hr>
	<p>
		<a href="login.do">로그인 페이지로 이동(GET)</a>
	</p>
	<hr><hr>
	<h2>Ajax 요청 처리</h2>
	<p><a href="javascript:getBoardListData()">json데이터 가져오기.</a></p>
	<p><a href="javascript:getOneOfBoardListDatas()">json데이터 한개 가져오기.</a></p>
	<input type="number" id="num">
	<hr>
	<div id="listDisp">
		
	</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<meta charset="UTF-8">
<title>공지작성</title>
<link rel="stylesheet" href="resources/css/styles.css" type="text/css"/>
</head>
<script>
	function viewimg(e){
		let html = "";
		for(let i=0; i<e.files.length; i++){
			let file = new FileReader();
			console.log(e.files[i]);
			file.readAsDataURL(e.files[i],"UTF-8");
			
			file.onload = function(){
				html = "<div class='view'><img class='views' src='"+this.result+"'></div>'";
				document.querySelector("#allimg").innerHTML += html;
				/* document.querySelector(".views").src = this.result; */
				console.log(this.result);
				console.log(e.value);
				/* console.log(e.value.slice(e.files[i].lastIndexOf("\\"))); */
				
			}
			
		}
	}
</script>
<style>
	.listOne li {
		list-style: none;
	}
	.listOne a{
		text-decoration: none;
		color: black;
	}
	.imgBox { 
		float: right;
	}
	#headerSlide { 
		background-color: #e9f1e77d;
		boder-bottom: 1px solid color:rgb(230,230,230);
		boder-bottom: 1px;
		boder-bottom: solid;
		boder-bottom-color: rgb(230,230,230);
		padding: 100px 1px 20px;
		margin-bottom: 40px;
	}
	.select{
		 width:100px;
	     padding:10px;
	     border:1px solid #999;
	     font-family:'Nanumgothic';
	     border-radius:6px;
	     -webkit-appearance: none;
	     -moz-appearance: none;
	     appearance : none;
	     margin-bottom: 50px;
		 margin-top: 40px;
		 cursor: pointer;
	}	 
	.noticeForm{
		padding: 0px 30px 88px;
		border-radius: 4px;
		border: 1px solid rgb(230,230,230);
	}
	#helpCenter{
		font-size: 40px;
	   align-items: center;
		padding: 32px 50px 60px;
		tranform: translate(10px, 800px);
		    color: slategray;
	}
	input[type="text" i]{
		width: 1139px;
		height: 50px;
		border-radius: 10px;
		font-size: 20px; 
	}
	textarea{
		width: 1139px;
		height: 521px;
		border-radius: 10px;
		font-size: smaller;
	}
	#allimg{
		
	}
	.veiws{
		margin-top: 30px;
		position: relative;
		width: 600px;
		
	}
	
	.submit input{
		display: flex;
    	height: 50px;
	    font-size: 14px;
	    color: rgb(61,61,61);
	    border: 1px solid rgb(228, 228, 228);
	    justify-content: center;
	    align-items: center;
	    border-radius: 4px;
	    cursor: pointer;
	    float: right;
	    width: 100px;
	    margin-bottom: 70px;
	    margin-right: 70px;
	    transform: translate(-500%, 6px);
	    position:relative;

	}
</style>
<body>
<%@include file="homeHeader.jsp" %>

	<div id="headerSlide">
		<div id="helpCenter">HelpCenter</div>
		
	</div>
		
	
	<div class="mainContainer">
	<div class="noticeForm">
		<form action="insertNotice.do" method="post" enctype="multipart/form-data">
			<div class="selectBox">
				<select class="select" name="customer_category">
					<option value="공지사항">공지사항</option>
					<option value="FAQ">FAQ</option>
				</select>
			</div>
			<div class="board">
				제목<p><input type="text" name="customer_subject"></p>
				내용<p><textarea name="customer_content"></textarea></p>
				이미지<p ><input type="file" id="real-input" name="customer_imagee" onchange="viewimg(this)" required multiple ></p>
				<p id="allimg"/></p>
			</div>
			<div class="submit">
				<input type="submit" value="새글등록">
				<input type="button" onclick="location.href='notice.do'" value="취소">
			</div>
		</form>	
	</div>
	</div>
	
<%@include file="homeFooter.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="resources/css/styles.css" type="text/css"/>
</head>
<script>
	let no = {"customer_no" : "${param.customer_no}"}
	//alert("${param.customer_no}");
	$.ajax("detailNotice.do",{
		type: "get",
		data: no,
		success: function(data){
			console.log(data);
			
			let imgname = data.customer_image.split("^");
			for(let i of imgname){
				console.log(i);
				if(i.trim() == ""){
					
				}else{
					//img태그 생성 
					let imgs = document.createElement("img");
					imgs.setAttribute("src",  i);
					console.log(imgs);
					document.querySelector("#imgBox").appendChild(imgs);
						
 					document.querySelector(".category").innerText = data.customer_category;
 					document.querySelector(".subject").innerText = data.customer_subject;
 					document.querySelector(".content").innerText = data.customer_content;
 					document.querySelector(".date").innerText = (data.customer_regdate).substring(0,10);
				}
			}
		},
		error: function(){
			alert("상세보기 실패!");
		}
		
		
	}); 
	//사진미리보기 
	function viewimg(e){
		let html = "";/* 
		for(let i of document.querySelector("board").getElementsByClassName("view")){
			i.remove();
		} */
			console.log(e.files.length);
			
		for(let i=0; i<e.files.length; i++){
			let file = new FileReader();
			console.log(e.files[i]);
			file.readAsDataURL(e.files[i],"UTF-8");
			document.querySelector(".view").innerHTML ="";
			
			
			file.onload = function(){
				
				html = "<div class='imgs'><img class='views' src='"+this.result+"'></div>";
				console.log("html:"+html);
				document.querySelector("#allimg").innerHTML += html;
				
				/* 
				document.querySelector(".views").src = this.result; */
				console.log("this.result:"+this.result);
				console.log(e.value);
				/* /* console.log(e.value.slice(e.files[i].lastIndexOf("\\"))); */
				
			}
		}
	}
	
	//update 실행
	function update(){
		$.ajax("detailNotice.do",{
			type: "get",
			data: no,
			success: function(data){
				console.log(data);
				let html = "";
				let imgname = data.customer_image.split("^");
					html = "<form action='updateNotice.do' method='post' enctype='multipart/form-data'>"
							+"<div class='selectBox'><select class='select' name='customer_category'>"
							+"<option value='"+data.customer_category+"'>"+data.customer_category+"</option></select>"
							+"</div>"
							+"<input type='hidden' name='customer_no' value='"+data.customer_no+"'>"
							+"<div class='board'>제목<p><input type='text' name='customer_subject' value='"+data.customer_subject+"'></p>"
							+"내용<p><textarea name='customer_content'>"+data.customer_content+"</textarea></p>"
							+"이미지<p><input type='file' name='customer_imagee' multiple='multiple' onchange='viewimg(this)'></p><p id='allimg'>";
				for(let i of imgname){
							html += "<div class='view'><img class='views' src='"+i+"'></div>";
				}
							html += "</p><div class='submit'>"
									+"<input type='submit' value='수정'>"
									+"<input type='button' onclick='back()' value='취소'></div></form>";
				    	
					
					document.querySelector(".mainContainer").innerHTML = html;
			},
			error: function(){
				alert("수정창불러오기 실패!");
			}
			
		});
	}
</script>
<style>
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
	.views{
		position: relative;
	    width: 500px;
	    height: -webkit-fill-available;
	}
	.mainContainer{
		
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
		 background-color: #dde2e6;
	}
</style>
<script>
	
	function back(){
		location.href="notice.do";
	}
	
	function deleteNotice(){
		Swal.fire({
			  title: '게시글을 삭제하시겠습니까?',
			  text: "삭제하시면 다시 복구시킬 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
	              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
				location.href=`deleteNotice.do?customer_no=${param.customer_no}`;
			  }
			})
			
	}
</script>
<style>
	.listOne li {
		list-style: none;
   		 padding: 0px 30px 88px;
    	border-radius: 4px;
   	 	border: 1px solid rgb(230, 230, 230);
}
	.listOne a{
		text-decoration: none;
		color: black;
	}
	#imgBox img{ 
		width:700px;
		hight:700px;
		positon: relative;
		tranform: translate(500px,40px);
	}
	#headerSlide { 
		background-color: #e9f1e77d;
		boder-bottom: 1px solid color:rgb(230,230,230);
		boder-bottom: 1px;
		boder-bottom: solid;
		boder-bottom-color: rgb(230,230,230);
		padding: 40px 40px 18px;
		height: 200px;
	}
	#helpCenter{
	   font-size: 40px;
	   align-items: center;
		padding: 32px 50px 60px;
		tranform: translate(10px, 800px);
		    color: slategray;
		    
	}
	.category{
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		font-size: 20px;
		font-weight: bold;
		color: rgb(161,161,161);
		transform: translate(0,40%);
		padding-bottom: 100px;
		
	}
	.subject{
		font-size: 30px;
		font-weight: bolder;
    	margin-bottom: 30px;
    	color: rgb(61, 61, 61);
	}
	.date{
	transform: translate(0,-50%);
	font-size: 15px;
	display: block;
	color: rgb(109,109,109);
}
	.content{
		font-size: 20px;
		letter-spacing: -0.02em;
		margin-top: 60px;
		margin-right: 70px;
	}
	.submit{
		z-index: 1;
		position: relative;
	}
	
	.submit input{
		display:flex;
		height: 50px;
		font-size: 14px;
		color: rgb(61,61,61);
		border: 1px solid rgb(228, 228, 228);
		justify-content: center;
		align-items: center;
		border-radius: 4px;
		cursor: pointer;
		float:right;
		width: 100px;
    	margin-bottom: 40px;
    	margin-right: 70px;
    	transform: translate(-450%, 10px);
	}
</style>
<body>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<%@include file="homeHeader.jsp" %>

	<div id="headerSlide">
		<div id="helpCenter">HelpCenter</div>
	
	</div>
	<div class="mainContainer">
		<div class="listWrapper">
			<ul class="listOne">
				<li>
						<div class="detailBox">
							<div class="category"></div>
							<div class="subject"></div>
							<div class="date"></div>
							<hr>
							<div class="content"></div>
							<div id="imgBox"></div>
						</div>
				</li>
			</ul>
		<div class="submit">
			<input type="button" onclick="update()" value="수정">
			<input type="button" onclick="deleteNotice()" value="삭제">
			<input type="button" onclick="notice()" value="목록">
		</div>	
		</div>
	</div>
	<script>
	function notice(){
		location.href="notice.do";
	}
	</script>
	
<%@include file="homeFooter.jsp" %>
</body>
</html>
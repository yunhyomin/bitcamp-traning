<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>open</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script>
	
</script>
</head>
<style>
	
</style>
<script>
	function logIn(frm){
		//location.href="controller?type=logIn";
		frm.action = "controller?type=logIn";
		frm.submit();
	}
	function membership(){
		location.href="membership";
	}
</script>
<body>
	<h1>LogIn</h1>
	<form method="post">
		<h2>ID : <input type="text" name="id"></h2>
		<h2>PW : <input type="password" name="pw"></h2>
		<input type="button" onclick="logIn(this.form)" value="로그인">
		<button onclick="membership()">회원가입</button>
	</form>
</body>
</html>
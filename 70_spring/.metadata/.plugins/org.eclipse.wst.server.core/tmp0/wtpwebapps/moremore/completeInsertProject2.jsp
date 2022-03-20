<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 성공</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:100);

body { margin-top: 100px; background-color: #137b85; color: #fff; text-align:center; }

h1 {
  font: 2em 'Roboto', sans-serif;
  margin-bottom: 40px;
}

#loading {
  display: inline-block;
  width: 50px;
  height: 50px;
  border: 3px solid rgba(255,255,255,.3);
  border-radius: 50%;
  border-top-color: #fff;
  animation: spin 1s ease-in-out infinite;
  -webkit-animation: spin 1s ease-in-out infinite;
}

@keyframes spin {
  to { -webkit-transform: rotate(360deg); }
}
@-webkit-keyframes spin {
  to { -webkit-transform: rotate(360deg); }
}
</style>
</head>
<body>
	<h1>수정이 완료되었습니다!</h1>
	<div id="loading"></div>
<script>
	setTimeout(() => {
		location.href="fundingAdminHome.jsp";
	}, 1500);
</script>
</body>
</html>
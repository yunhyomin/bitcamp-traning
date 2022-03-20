<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	let i = 0;
	setInterval(()=>{
	    let date = new Date();
	
	    if (date.getHours() === 0 && i === 0) {
	        console.log("12시");
	        i++;
	    } else if (date.getHours() === 23) {
	        console.log("23시");
	        i = 0;
	    }
	},60000);
</script>
<body>

</body>
</html>
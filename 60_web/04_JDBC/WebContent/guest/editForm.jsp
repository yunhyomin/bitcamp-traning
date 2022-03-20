<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 데이터 수정 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>정보수정</h1>
	<form action="update.jsp">
		<table>
			<tr>
				<th>사번</th>
				<td>
					<input type="text" name = "sabun" value="<%=request.getParameter("sabun") %>" readonly>
				
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name = "name" value="<%=request.getParameter("name") %>">
				
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="text" name = "pay" value="<%=request.getParameter("pay") %>">
				
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정">
					<input type="reset" value="초기">
				
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
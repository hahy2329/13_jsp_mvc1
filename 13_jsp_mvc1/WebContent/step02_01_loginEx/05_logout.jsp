<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<%
		session.invalidate(); //유효하지 않은
		// session.removeAttribute("memberId"); ->이렇게 해두 됨 그래도 위에가 나음..
		
	%>
	
	<script>
		alert("You ar logged out.");
		location.href="00_main.jsp";
	</script>
</body>
</html>
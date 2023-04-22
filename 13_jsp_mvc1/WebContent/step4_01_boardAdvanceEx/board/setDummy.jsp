<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setDummy</title>
</head>
<body>

	<%
		BoardAdvanceDAO.getInstance().setDummy();
	%>
	
	<script>
		alert("테스트 데이터가 생성되었습니다.");
		location.href = "boardList.jsp";
	</script>
	
</body>
</html>
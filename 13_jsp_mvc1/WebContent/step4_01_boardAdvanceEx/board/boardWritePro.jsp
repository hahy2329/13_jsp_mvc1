<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWritePro</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	
		<jsp:useBean id="mainBoardDTO" class="step4_00_boardAdvanceEx.MainBoardDTO">		
			<jsp:setProperty name="mainBoardDTO" property="*"/>
		</jsp:useBean>
	
	<%
		BoardAdvanceDAO.getInstance().insertBoard(mainBoardDTO);
	%>
	
	<script>
		alert("등록되었습니다.");
		location.href = "boardList.jsp";
	</script>
	
</body>
</html>
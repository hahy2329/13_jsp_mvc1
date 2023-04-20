<%@page import="step3_00_boardEx.BoardDAO"%>
<%@page import="step3_00_boardEx.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bWritePro</title>
</head>
<body>
	<%
	
		request.setCharacterEncoding("utf-8");
		//BoardDTO boardDTO = new BoardDTO();
		//boardDTO.setWriter(request.getParameter("writer"));
		//boardDTO.setSubject(request.getParameter("subject"));
		//boardDTO.setEmail(request.getParameter("email"));
		
		
		
	%>
	<jsp:useBean id="boardDTO" class="step3_00_boardEx.BoardDTO">
		<jsp:setProperty property="*" name="boardDTO"/>
	</jsp:useBean>
	
	<%
		BoardDAO.getInstance().insertBoard(boardDTO);
		//response.sendRedirect("bWrite.jsp");
	%>
	
	<script>
		alert("등록되었습니다.");
		location.href="bList.jsp";
	</script>
	
	
</body>
</html>
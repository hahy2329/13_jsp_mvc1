<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdatePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
	%>
	
	
	<jsp:useBean id="boardDTO" class="step3_00_boardEx.BoardDTO">
		<jsp:setProperty property="*" name="boardDTO"/>
	</jsp:useBean>
	
	<%
		boolean isUpdate =BoardDAO.getInstance().updateBoard(boardDTO);
		
		if(isUpdate){
	%>		
		<script>
			alert("수정되었습니다.");
			location.href="bList.jsp";
		</script>	
			
	<% 		
		}else{
			
	%>			
		<script>
			alert("패스워드를 확인하세요.")
			history.go(-1);
		</script>
		
			
	<% 		
		}
	
	
	%>
</body>
</html>
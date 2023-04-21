<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bDeletePro</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
	%>
		<jsp:useBean id="boardDTO" class="step3_00_boardEx.BoardDTO">
			<jsp:setProperty name="boardDTO" property="*"/>
		</jsp:useBean>
	<%
		if (BoardDAO.getInstance().deleteBoard(boardDTO)) {
	%>
			<script>
				alert("삭제 되었습니다.");
				location.href = "bList.jsp";
			</script>
	<%				
		}
		else {
	%>
			<script>
				alert("패스워드를 확인하세요.");
				history.go(-1);
			</script>
	<%				
		}
	%>	
</body>
</html>
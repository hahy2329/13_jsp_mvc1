<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDeletePro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
		<jsp:useBean id="mainBoardDTO" class="step4_00_boardAdvanceEx.MainBoardDTO">
			<jsp:setProperty name="mainBoardDTO" property="*"/>
		</jsp:useBean>
	<%
		if (BoardAdvanceDAO.getInstance().deleteBoard(mainBoardDTO)) {
	%>
			<script>
				alert("삭제 되었습니다.");
				location.href = "boardList.jsp";
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
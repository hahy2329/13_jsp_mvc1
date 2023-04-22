<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyUpdatePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	%>
	
		<jsp:useBean id="replyDTO" class="step4_00_boardAdvanceEx.ReplyDTO">
			<jsp:setProperty name="replyDTO" property="*" />
		</jsp:useBean>
	
	<%
		if (BoardAdvanceDAO.getInstance().updateReply(replyDTO)) {
	%>
			<script>
				alert('수정 되었습니다.');
				location.href = "../board/boardDetail.jsp?boardId=<%=replyDTO.getBoardId()%>";
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
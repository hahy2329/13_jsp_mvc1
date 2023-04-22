<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyWritePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
	%>
		<jsp:useBean id="replyDTO" class="step4_00_boardAdvanceEx.ReplyDTO">
			<jsp:setProperty name="replyDTO" property="*" />
		</jsp:useBean>
	<%
		BoardAdvanceDAO.getInstance().insertReply(replyDTO);
	%>

	<script>
		alert("댓글이 입력되었습니다.");
		location.href = "../board/boardDetail.jsp?boardId=<%=replyDTO.getBoardId()%>";
	</script>

</body>
</html>
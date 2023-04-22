<%@page import="step4_00_boardAdvanceEx.ReplyDTO"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyDelete</title>
</head>
<body>

	<%
		long replyId = Long.parseLong(request.getParameter("replyId"));
		ReplyDTO replyDTO =  BoardAdvanceDAO.getInstance().getReplyDetail(replyId);
	%>

	<div align="center" style="padding-top: 100px">
		<form action="replyDeletePro.jsp" method="post">
			<h1>게시글 삭제</h1>
			<br>
			<table style="width: 700px" border="1">
				<tr>
					<td>작성자</td>
					<td><%=replyDTO.getWriter()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=replyDTO.getEnrollDt()%></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="passwd" size="60"></td>
				</tr>
				<tr align="right">
					<td colspan="2" align="right">
						<input type="hidden" name="replyId" value="<%=replyDTO.getReplyId()%>">
						<input type="hidden" name="boardId" value="<%=replyDTO.getBoardId() %>" /> 
						<input type="submit" value="댓글삭제">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>
<%@page import="step4_00_boardAdvanceEx.ReplyDTO"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyUpdate</title>
<script src="../../ckeditor/ckeditor.js"></script>
</head>
<body>

	<%
		long replyId = Long.parseLong(request.getParameter("replyId"));	
		ReplyDTO replyDTO = BoardAdvanceDAO.getInstance().getReplyDetail(replyId);
	%>
	
	<div align="center" style="padding-top: 100px">
		<h1>댓글 수정</h1>
		<br>
		<form action="replyUpdatePro.jsp" method="post">
			<table style="width: 700px;" border="1">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
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
					<td><input type="password" name="passwd" size="70"/></td>
				</tr>
				<tr>
					<td>댓글</td>
					<td>
						<textarea rows="10" cols="60" name="content"><%=replyDTO.getContent()%></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="hidden" name="boardId" value="<%=replyDTO.getBoardId() %>" /> 
						<input type="hidden" name="replyId" value="<%=replyDTO.getReplyId() %>" /> 
						<input type="submit" value="댓글수정" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
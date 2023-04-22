<%@page import="step4_00_boardAdvanceEx.ReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail</title>
</head>
</head>
<body>

	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));
		MainBoardDTO mainBoardDTO = BoardAdvanceDAO.getInstance().getBoardDetail(boardId , true);
	%>
	
	<div align="center" style="padding-top: 100px">
		<h2>게시글 상세</h2>
		<table style="width: 700px; text-align: center" border="1">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tr>
				<td>제목</td>
				<td><%=mainBoardDTO.getSubject()%></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><%=mainBoardDTO.getReadCnt()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=mainBoardDTO.getWriter()%></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=mainBoardDTO.getEnrollDt()%></td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td><%=mainBoardDTO.getContent()%></td>
			</tr>
			<tr align="right">
				<td colspan="2">
					<input type="button" value="수정"  onclick="location.href='boardUpdate.jsp?boardId=<%=mainBoardDTO.getBoardId()%>'">
					<input type="button" value="삭제"  onclick="location.href='boardDelete.jsp?boardId=<%=mainBoardDTO.getBoardId()%>'">
					<input type="button" value="목록보기"  onclick="location.href='boardList.jsp'">
				</td>
			</tr>
		</table>
		
		<br>
		<hr>
		<br>
		
		<h4>댓글 리스트 (<%=BoardAdvanceDAO.getInstance().getAllReplyCnt(boardId) %>)</h4>
		<table style="width: 700px;" border="1">
			<% 
				ArrayList<ReplyDTO> replyList = BoardAdvanceDAO.getInstance().getReplyList(boardId);
				for (ReplyDTO replyDTO : replyList) {
			%>
				<tr>
					<td>
						작성자 : <%=replyDTO.getWriter() %> / 작성일 : <%=replyDTO.getEnrollDt() %> <br>
						<%=replyDTO.getContent() %>
						<input type="button" value="수정" onclick="location.href='../reply/replyUpdate.jsp?replyId=<%=replyDTO.getReplyId()%>'">
						<input type="button" value="삭제" onclick="location.href='../reply/replyDelete.jsp?replyId=<%=replyDTO.getReplyId()%>'">
					</td>
				</tr>			
			<% 		
				}
			%>
			<tr>
				<td align="right">
					<input type="button" value="댓글작성"  onclick="location.href='../reply/replyWrite.jsp?boardId=<%=mainBoardDTO.getBoardId()%>'">
				</td>
			</tr>
		</table>
		
	</div>
</body>
</html>
<%@page import="step4_00_boardAdvanceEx.BoardAdvanceDAO"%>
<%@page import="step4_00_boardAdvanceEx.MainBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdate</title>
<script src="../../ckeditor/ckeditor.js"></script>
</head>
<body>

	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));	
		MainBoardDTO mainBoardDTO = BoardAdvanceDAO.getInstance().getBoardDetail(boardId , false);
	%>
	
	<div align="center" style="padding-top: 100px">
		<h1>게시글 수정</h1>
		<br>
		<form action="boardUpdatePro.jsp" method="post">
			<table style="width: 700px;" border="1">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>작성자</td>
					<td><%=mainBoardDTO.getWriter()%></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=mainBoardDTO.getEnrollDt()%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" value="<%=mainBoardDTO.getSubject()%>" size="70"/></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="passwd" size="70"/></td>
				</tr>
				<tr>
					<td>글내용</td>
					<td>
						<textarea rows="10" cols="60" name="content"><%=mainBoardDTO.getContent()%></textarea>
						<script>CKEDITOR.replace("content")</script>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="boardId" value="<%=mainBoardDTO.getBoardId() %>" /> 
						<input type="submit" value="글수정" />
						<input type="button" onclick="location.href='boardList.jsp'" value="전체글보기" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
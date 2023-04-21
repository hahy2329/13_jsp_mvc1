<%@page import="step3_00_boardEx.BoardDTO"%>
<%@page import="step3_00_boardEx.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bDetail</title>
</head>
<body>
	
	<%
		long boardId = Long.parseLong(request.getParameter("boardId"));
		
		BoardDTO boardDTO = BoardDAO.getInstance().getBoardDetail(boardId, true);
		
		
	%>
	
	<h3>게시글 보기</h3>
	<table border="1">
		<tr>
			<td>조회수</td>
			<td><%=boardDTO.getReadCnt()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=boardDTO.getWriter()%></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=boardDTO.getEnrollDt()%></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=boardDTO.getEmail()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=boardDTO.getSubject()%></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><%=boardDTO.getContent()%></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정하기" onclick="location.href='bUpdate.jsp?boardId=<%=boardDTO.getBoardId()%>'">
				<input type="button" value="삭제하기" onclick="location.href='bDelete.jsp?boardId=<%=boardDTO.getBoardId()%>'">
				<input type="button" value="목록보기" onclick="location.href='bList.jsp'">
			</td>
		</tr>
	</table>
	
	
</body>
</html>